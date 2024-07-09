#include "mysql.h"
#include <QDebug>

QString MySQL::name() const
{
    return QString{"mysql"};
}

void MySQL::setName(const QString &name)
{
    this->m_name = name;
}