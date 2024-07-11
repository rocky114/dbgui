#include "mysql.h"
#include <QDebug>

QString MySQL::dbType()
{
    return QStringLiteral("MySQL");
}

void MySQL::setDbType(const QString &name)
{
}

void MySQL::connect()
{
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

QVector<QString> MySQL::getDatabases()
{
    return QVector<QString>{"mysql", "information_schema", "performance_schema", "test"};
}

QVector<QString> MySQL::getTables()
{
    return QVector<QString>{"user", "user_group", "user_group_user"};
}