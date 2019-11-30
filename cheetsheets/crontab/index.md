
### Basics

Edit crontab schedule: `crontab -e `

View crontab schedule:  `crontab -l `

**Crontab Format**  
```
MIN   HOUR   MDAY  MON  DOW   COMMAND
5     *      *     *    *    echo 'Hello'
```

<table cellpadding="4" cellspacing="1" style="margin-left:25px;">
<tr bgcolor="#EEEEEE">
<th>
  Position
</th>
<th>
  Range values
</th>
<th>
  Description
</th>
</tr>
<tr>
<td>
  MIN
</td>
<td>
  0-60
</td>
<td>
  Minute
</td>
</tr>
<tr>
<td>
  HOUR
</td>

<td>
  0-23
</td>
<td>
  Hour [24-hour clock]
</td>
</tr>
<tr>
<td>
  MDAY
</td>
<td>
  1-31
</td>
<td>
  Day of Month
</td>
</tr>
<tr>
<td>
  MON
</td>
<td>
  1-12 OR jan,feb,mar,apr &#8230;
</td>
<td>
  Month
</td>
</tr>
<tr>
<td>
  DOW
</td>
<td>
  0-6 OR <br>sun,mon,tue,wed,thu,fri,sat
</td>
<td>
  Day of Week
</td>
</tr>
<tr>
<td>
  COMMAND
</td>
<td>
<td>
  command to execution
</td>
  Command to be run
</td>
</tr>
</table>


### Default conf /etc/crontab
```
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/

# run-parts
01 * * * * root run-parts /etc/cron.hourly
02 4 * * * root run-parts /etc/cron.daily
22 4 * * 0 root run-parts /etc/cron.weekly
42 4 1 * * root run-parts /etc/cron.monthly
```

### Examples

Here are a few examples, to see what some entries look like.

```
# Run command at 7:00am each weekday [mon-fri]
00 07 * * 1-5  execute_script.sh

# Run command on 1st of each month, at 5:30pm
30 17 1 * *   execute_script.sh

# Run command at 8:00am,10:00am and 2:00pm every day
00 8,10,14 * * *   execute_script.sh

# Run command every 5 minutes during market hours
/5 6-13 * mon-fri   execute_script.sh

# Run command every 3-hours while awake
0 7-23/3 * * *   execute_script.sh
```

### Special Characters in Crontab

`*` in any category to mean for every item, such as every day or every month.

`,` in any category to specify multiple values. For example: `mon,wed,fri`

`-` to specify ranges. For example: `mon-fri`, or `9-17`

`/` to specify a repeating range. For example: `*/5` for every five minutes, hours, days


### Special Entries

There are several special entries, some which are just shortcuts, that you can use instead of specifying the full cron entry.

The most useful of these is probably **@reboot** which allows you to run a command each time the computer gets reboot. This could be useful if you want to start up a server or daemon under a particular user, or if you do not have access to the rc.d/init.d files.

#### Example Usage:

```
# restart freevo servers
@reboot freevo webserver start
@reboot freevo recordserver start
```

The complete list:

<table cellpadding="4" cellspacing="1" style="margin-left:25px;">
<tr bgcolor="#EEEEEE">
<th>
Entry
</th>

<th>
Description
</th>

<th>
Equivalent To
</th>
</tr>

<tr>
<td>
@reboot
</td>

<td>
Run once, at startup.
</td>

<td>
None
</td>
</tr>

<tr>
<td>
@yearly
</td>

<td>
Run once a year
</td>

<td>
0 0 1 1 *
</td>
</tr>

<tr>
<td>
@annually
</td>

<td>
(same as @yearly)
</td>

<td>
0 0 1 1 *
</td>
</tr>

<tr>
<td>
@monthly
</td>

<td>
Run once a month
</td>

<td>
0 0 1 * *
</td>
</tr>

<tr>
<td>
@weekly
</td>

<td>
Run once a week
</td>

<td>
0 0 * * 0
</td>
</tr>

<tr>
<td>
@daily
</td>

<td>
Run once a day
</td>

<td>
0 0 * * *
</td>
</tr>

<tr>
<td>
@midnight
</td>

<td>
(same as @daily)
</td>

<td>
0 0 * * *
</td>
</tr>

<tr>
<td>
@hourly
</td>

<td>
Run once an hour
</td>

<td>
0 * * * *
</td>
</tr>
</table>

### Miscelleanous Issues

**Script Output**  
If there is any output from your script or command it will be sent to that user's e-mail account, on that box. Using the default mailer which must be setup properly.

You can set the variable `MAILTO` in the crontab to specify a separate e-mail address to use. For example:  

```
MAILTO="admin@mydomain.com"
```

**Redirect Output to /dev/null**  
```
* * * * * /script/every_minute.pl > /dev/null 2>&1
```

**Timezone**
If you want to run cron at a different timezone than your system time. You can set the `TZ` parameter in `/etc/default/cron`. For example, I want it to run in Pacific Time zone, so I set:
```
TZ="Pacific/Fiji"
```

**Missed Schedule Time**  
Cron does not run a command if it was missed. Your computer must be running for cron to run the job at the time it is scheduled. For example, if you have a 1:00am scheduled job and your computer was off at that time, it will **not** run the missed job in the morning when you turn it on.
