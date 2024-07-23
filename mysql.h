#ifndef MYSQL_H
#define MYSQL_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <QSqlQueryModel>

class MySQL : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString dsn READ getDSN WRITE setDSN NOTIFY dsnChanged)
    Q_PROPERTY(QString database READ getDatabase WRITE setDatabase NOTIFY databaseChanged)
public:
    MySQL();
    ~MySQL();

    QString getDSN();
    void setDSN(QString dsn);

    QString getDatabase();
    void setDatabase(const QString &database);

public:
    Q_INVOKABLE QStringList getDatabases();
    Q_INVOKABLE QStringList getTables();

public slots:
    void connect();
    void disconnect();

signals:
    void dsnChanged();
    void databaseChanged();

private:
    QString m_database{};
    QString m_dsn{};

    QSqlDatabase m_connection;
};

#endif // LOGINSERVICE_H