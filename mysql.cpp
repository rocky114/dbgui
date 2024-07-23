#include "mysql.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlQueryModel>
#include <QDebug>
#include <QSqlError>
#include <QSqlRecord>

MySQL::MySQL()
{
    this->connect();
}

MySQL::~MySQL()
{
    this->disconnect();
}

QString MySQL::getDSN()
{
    return m_dsn;
}

void MySQL::setDSN(QString dsn)
{
    this->m_dsn = dsn;
}

void MySQL::connect()
{
    QSqlDatabase m_connection = QSqlDatabase::addDatabase("QMYSQL");
    m_connection.setHostName("127.0.0.1");
    // db.setDatabaseName("test");
    m_connection.setUserName("root");
    m_connection.setPassword("123456");

    if (!m_connection.open())
    {
        qDebug() << "Cannot open database: " << m_connection.lastError().text();
        return;
    }

    qInfo() << "connect successfully";
}

void MySQL::disconnect()
{
    m_connection.close();
}

QString MySQL::getDatabase()
{
    return m_database;
}

void MySQL::setDatabase(const QString &database)
{
    m_database = database;

    return;
}

QStringList MySQL::getDatabases()
{
    QStringList ret{};

    QSqlQuery query;

    if (!query.exec("SHOW DATABASES"))
    {
        qDebug() << "Failed to execute query";

        return ret;
    }

    while (query.next())
    {
        ret.append(query.record().value("Database").toString());
    }

    // qDebug() << "databases" << ret;

    return ret;
}

QStringList MySQL::getTables()
{
    QStringList ret{};

    QSqlQuery query;
    query.prepare("SELECT TABLE_NAME FROM information_schema.tables WHERE table_schema = :database");
    query.bindValue(":database", m_database);

    if (!query.exec())
    {
        qDebug() << "Failed to execute query";
        return ret;
    }

    while (query.next())
    {
        ret.append(query.record().value("TABLE_NAME").toString());
    }

    return ret;
}
