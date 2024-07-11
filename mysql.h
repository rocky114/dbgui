#ifndef MYSQL_H
#define MYSQL_H

#include "abstractdatabase.h"

class MySQL : public AbstractDatabase
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString database READ getDatabase WRITE setDatabase NOTIFY databaseChanged)
public:
    QString dbType() override;
    void setDbType(const QString &type) override;

    Q_INVOKABLE QString getDatabase();
    Q_INVOKABLE void setDatabase(const QString &database);
    Q_INVOKABLE QVector<QString> getDatabases();
    Q_INVOKABLE QVector<QString> getTables();

public slots:
    void connect() override;
    void disconnect() override;

signals:
    void databaseChanged();

private:
    QString m_database{};
};

#endif // LOGINSERVICE_H