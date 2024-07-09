#include "mysql.h"
#include <QDebug>

QString MySQL::dbType()
{
    return QStringLiteral("MySQL");
}

void MySQL::setDbType(const QString &name)
{
}