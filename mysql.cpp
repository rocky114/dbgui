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

QStringList MySQL::getDatabases()
{
    return QStringList{"mysql", "information_schema", "performance_schema", "test"};
}

QStringList MySQL::getTables()
{
    return QStringList{"user", "user_group", "user_group_user"};
}
