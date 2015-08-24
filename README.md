Redmine contacts snooze
=======================

Рассылает уведомления по сделкам. Необходим установленный плагин RedmineCRM (redmine_contacts)

Как это работает?
-----------------

Устанавливаете плагин в директорию plugins вашего Redmine

    cd plugins
    git clone git@github.com:shipiev/redmine_snooze.git
    cd ..
    bundle install
    rake redmine:plugins:migrate

После этого в Сделках для отвественных по сделке появляется новый интерфейс добавления коментариев. В нем можно
установить дату, с которой начнется рассылка напоминаний (по умолчанию через 3 дня).

Напоминания рассылаются при помощи ежедневного запуска задачи:

    rake redmine:plugins:snooze:send_daily_notify

Для этого ее желательно прописать в /etc/cron.daily, а в /etc/crontab прописать время, когда будет запускаться cron.daily.
Например, для запуска в 10 утра в будни:

0 10 * * 1-5 root run-parts /etc/cron.daily

