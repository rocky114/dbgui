#ifndef MYSQL_H
#define MYSQL_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class MySQL : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString database READ getDatabase WRITE setDatabase NOTIFY databaseChanged)
    Q_PROPERTY(QStringList databases READ getDatabases)

public:
    // MySQL() {}

public:
    Q_INVOKABLE QString getDatabase();
    Q_INVOKABLE void setDatabase(const QString &database);
    Q_INVOKABLE QStringList getDatabases();
    Q_INVOKABLE QStringList getTables();

public slots:
    void connect();
    void disconnect();

signals:
    void databaseChanged();

private:
    QString m_database{};
};

#endif // LOGINSERVICE_H