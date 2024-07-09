#ifndef MYSQL_H
#define MYSQL_H

#include "abstractdatabase.h"

class MySQL : public AbstractDatabase
{
public:
    QString dbType() override;
    void setDbType(const QString &name) override;

signals:

private:
    QString m_name;
};

#endif // LOGINSERVICE_H