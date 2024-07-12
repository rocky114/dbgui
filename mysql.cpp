#include "mysql.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QSqlError>

void MySQL::connect()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setDatabaseName("test");
    db.setUserName("root");
    db.setPassword("123456");

    if (!db.open())
    {
        qDebug() << "Cannot open database: " << db.lastError().text();
        return;
    }

    qInfo() << "connect successfully";
}

void MySQL::disconnect()
{
}

QString MySQL::getDatabase()
{
    return m_database;
}

void MySQL::setDatabase(const QString &database)
{
    m_database = database;
}

QStringList MySQL::getDatabases()
{
    this->connect();

    return QStringList{"mysql", "information_schema", "performance_schema", "test"};
}

QStringList MySQL::getTables()
{
    return QStringList{"user", "user_group", "user_group_user"};
}
