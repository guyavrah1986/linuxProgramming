## Cron jobs

- `cron` is a time based job scheduling service that starts when the system boots. It checks, repeatedly, every minute if there 
are any jobs ("tasks") to run - and runs them if so.

- `crontab` is a commad (configuration) that is used to set a job that needs to be automated by the `cron` service.
    * an example of a "cron job" that is set using the `crontab`:
    * Runs every Monday at 07:00.
        * 0  7  *  *  1  /opt/sales/bin/weekly-report
        * |  |  |  |  |
        * |  |  |  |  +-- Day of the Week (0-6)
        * |  |  |  +---- Month of the Year (1-12)
        * |  |  +------ Day of the Month (1-31)
        * |  +-------- Hour (0-23)
        * +---------- Minute (0-59)