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
    Q_PROPERTY(QSqlQueryModel *databases READ getDatabases NOTIFY databasesChanged)
    Q_PROPERTY(QStringList tables READ getTables NOTIFY tablesChanged)
public:
    MySQL();
    ~MySQL();

    QString getDSN();
    void setDSN(QString dsn);
    QSqlQueryModel *getDatabases();
    QStringList getTables();
    QString getDatabase();
    void setDatabase(const QString &database);

public:
    // Q_INVOKABLE QStringList getDatabases();

public slots:
    void connect();
    void disconnect();

signals:
    void dsnChanged();
    void databasesChanged();
    void databaseChanged();
    void tablesChanged();

private:
    QString m_database{};
    QString m_dsn{};

    QSqlQueryModel *m_databases;
    QSqlDatabase m_connection;
    QStringList m_tables{};
};

#endif // LOGINSERVICE_H