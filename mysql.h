#ifndef MYSQL_H
#define MYSQL_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <QSqlQueryModel>

class MySQL : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString database READ getDatabase WRITE setDatabase NOTIFY databaseChanged)
    Q_PROPERTY(QString dsn READ getDSN WRITE setDSN NOTIFY dsnChanged)
    Q_PROPERTY(QSqlQueryModel *databases READ getDatabases NOTIFY databasesChanged)

public:
    MySQL();

    QString getDSN();
    void setDSN(QString dsn);
    QSqlQueryModel *getDatabases();

public:
    Q_INVOKABLE QString getDatabase();
    Q_INVOKABLE void setDatabase(const QString &database);
    // Q_INVOKABLE QStringList getDatabases();
    Q_INVOKABLE QStringList getTables();

public slots:
    void connect();
    void disconnect();

signals:
    void databaseChanged();
    void dsnChanged();
    void databasesChanged();

private:
    QString m_database{};
    QString m_dsn{};

    QSqlQueryModel *m_databases;
};

#endif // LOGINSERVICE_H