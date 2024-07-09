#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class AbstractDatabase : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString type READ dbType WRITE setDbType NOTIFY typeChanged)

public:
    virtual QString dbType() = 0;
    virtual void setDbType(const QString &type) = 0;

signals:
    void typeChanged();
};

#endif // DATABASE_H