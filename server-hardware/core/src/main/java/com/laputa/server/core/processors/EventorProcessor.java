package com.laputa.server.core.processors;

import com.laputa.server.core.BlockingIOProcessor;
import com.laputa.server.core.model.DashBoard;
import com.laputa.server.core.model.auth.Session;
import com.laputa.server.core.model.enums.PinType;

import com.laputa.server.core.model.widgets.others.eventor.Eventor;
import com.laputa.server.core.model.widgets.others.eventor.Rule;
import com.laputa.server.core.model.widgets.others.eventor.model.action.BaseAction;
import com.laputa.server.core.model.widgets.others.eventor.model.action.SetPinAction;
import com.laputa.server.core.model.widgets.others.eventor.model.action.notification.MailAction;
import com.laputa.server.core.model.widgets.others.eventor.model.action.notification.NotificationAction;
import com.laputa.server.core.model.widgets.others.eventor.model.action.notification.NotifyAction;
import com.laputa.server.core.model.widgets.others.eventor.model.action.notification.TwitAction;
import com.laputa.server.core.stats.GlobalStats;

import com.laputa.utils.NumberUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import static com.laputa.server.core.protocol.enums.Command.EVENTOR;
import static com.laputa.server.core.protocol.enums.Command.HARDWARE;
import static com.laputa.utils.StringUtils.PIN_PATTERN;

/**
 * Class responsible for handling eventor logic.
 *
 * The Laputa Project.
 * Created by Sommer
 * Created on 24.08.16.
 */
public class EventorProcessor {

    private static final Logger log = LogManager.getLogger(EventorProcessor.class);


    private final BlockingIOProcessor blockingIOProcessor;
    private final GlobalStats globalStats;

    public EventorProcessor( BlockingIOProcessor blockingIOProcessor, GlobalStats stats) {

        this.blockingIOProcessor = blockingIOProcessor;
        this.globalStats = stats;
    }

    public void process(Session session, DashBoard dash, int deviceId, byte pin, PinType type, String triggerValue, long now) {
        Eventor eventor = dash.getWidgetByType(Eventor.class);
        if (eventor == null || eventor.rules == null || eventor.deviceId != deviceId) {
            return;
        }

        double valueParsed = NumberUtil.parseDouble(triggerValue);
        if (valueParsed == NumberUtil.NO_RESULT) {
            return;
        }

        for (Rule rule : eventor.rules) {
            if (rule.isReady(pin, type)) {
                if (rule.isValid(valueParsed)) {
                    if (!rule.isProcessed) {
                        for (BaseAction action : rule.actions) {
                            if (action.isValid()) {
                                if (action instanceof SetPinAction) {
                                    execute(session, dash, deviceId, (SetPinAction) action, now);
                                } else if (action instanceof NotificationAction) {
                                    execute(dash, triggerValue, (NotificationAction) action);
                                }
                            }
                        }
                        rule.isProcessed = true;
                    }
                } else {
                    rule.isProcessed = false;
                }
            }
        }
    }

    private void execute(DashBoard dash, String triggerValue, NotificationAction notificationAction) {
        String body = PIN_PATTERN.matcher(notificationAction.message).replaceAll(triggerValue);
        if (notificationAction instanceof NotifyAction) {
            push( dash, body);
        } else if (notificationAction instanceof TwitAction) {
            twit(dash, body);
        } else if (notificationAction instanceof MailAction) {
            //email(dash, body);
        }
        globalStats.mark(EVENTOR);
    }

    private void twit(DashBoard dash, String body) {



    }

    public static void push( DashBoard dash, String body) {

        if (!dash.isActive) {
            log.debug("Project not active.");
            return;
        }


    }

    private void execute(Session session, DashBoard dash, int deviceId, SetPinAction action, long now) {
        final String body = action.makeHardwareBody();
        session.sendMessageToHardware(dash.id, HARDWARE, 888, body, deviceId);
        if (dash.isActive) {
            session.sendToApps(HARDWARE, 888, dash.id, deviceId, body);
        }

        dash.update(deviceId, action.pin.pin, action.pin.pinType, action.value, now);

        globalStats.mark(EVENTOR);
    }
}
