#ifndef EVENTDISPATCHER_LIBEV_H
#define EVENTDISPATCHER_LIBEV_H

#include <QtCore/QAbstractEventDispatcher>

class EventDispatcherLibEvPrivate;

class EventDispatcherLibEv : public QAbstractEventDispatcher {
	Q_OBJECT
public:
	explicit EventDispatcherLibEv(QObject* parent = 0);
	virtual ~EventDispatcherLibEv(void);

	virtual bool processEvents(QEventLoop::ProcessEventsFlags flags);
	virtual bool hasPendingEvents(void);

	virtual void registerSocketNotifier(QSocketNotifier* notifier);
	virtual void unregisterSocketNotifier(QSocketNotifier* notifier);

	virtual void registerTimer(
		int timerId,
		int interval,
#if QT_VERSION >= 0x050000
		Qt::TimerType timerType,
#endif
		QObject* object
	);

	virtual bool unregisterTimer(int timerId);
	virtual bool unregisterTimers(QObject* object);
	virtual QList<QAbstractEventDispatcher::TimerInfo> registeredTimers(QObject* object) const;
#if QT_VERSION >= 0x050000
	virtual int remainingTime(int timerId);
#endif

#if defined(Q_OS_WIN) && QT_VERSION >= 0x050000
	virtual bool registerEventNotifier(QWinEventNotifier* notifier);
	virtual void unregisterEventNotifier(QWinEventNotifier* notifier);
#endif

	virtual void wakeUp(void);
	virtual void interrupt(void);
	virtual void flush(void);

protected:
	EventDispatcherLibEv(EventDispatcherLibEvPrivate& dd, QObject* parent = 0);

private:
	Q_DISABLE_COPY(EventDispatcherLibEv)
	Q_DECLARE_PRIVATE(EventDispatcherLibEv)
#if QT_VERSION >= 0x040600
	QScopedPointer<EventDispatcherLibEvPrivate> d_ptr;
#else
	EventDispatcherLibEvPrivate* d_ptr;
#endif
};

#endif // EVENTDISPATCHER_LIBEV_H
