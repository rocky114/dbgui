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
    AbstractDatabase() {}

public:
    virtual QString dbType() = 0;
    virtual void setDbType(const QString &dbType) = 0;

public slots:
    virtual void connect() = 0;
    virtual void disconnect() = 0;

signals:
    void typeChanged();

public:
    QString m_type{};
};

#endif // DATABASE_H