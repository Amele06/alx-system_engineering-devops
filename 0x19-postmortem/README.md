#Postmortem for Webstack Debugging Task #1

# Issue Summary
* Outage Duration: 09:45 AM to 16:15 PM West African Time
# Impact: The website was inaccessible due to Nginx not listening on port 80, preventing all users from accessing the site.
# Root Cause
* The root cause of the outage was an incomplete Nginx configuration. The configuration file in sites-available was not properly linked to sites-enabled, causing the correct configuration to remain inactive despite no syntax errors in the Nginx files.

# Timeline
* 09:45 AM: ALX platform detected the website was unresponsive.
* 10:50 AM: Monitoring alerts confirmed that the site was down and escalated the issue.
* 11:55 AM: Initial investigation began, focusing on Nginx configuration files. No issues were detected in the configuration syntax.
* 12:15 PM: Upon further investigation, it was discovered that the Nginx service was not listening on port 80 due to the missing symbolic link between sites-available and sites-enabled.
* 14:30 PM: The configuration was correctly linked, and the Nginx service was restarted to activate the changes.
* 16:15 PM: The site was fully restored and functioning properly.
# Root Cause and Resolution
#Root Cause: Nginx configuration files were not properly activated because sites-available was not linked to sites-enabled.

# Resolution: The Nginx default configuration from sites-available was linked to sites-enabled, and the Nginx service was restarted to apply the changes.

# Corrective and Preventative Measures
# Improvements
* Implement an automated script or process to verify that the correct configuration is active after any changes.
* Enhance monitoring systems to detect issues with Nginx earlier, specifically checking if the service is listening on the correct port (80).

# Task List
 Create and implement a script to automatically link the configuration in sites-available to sites-enabled after every configuration change.
 Add a monitoring check to ensure that Nginx is properly listening on port 80.

# Example Script
This script ensures that Nginx is properly configured and restarts the service to apply changes:

#!/usr/bin/env bash
# Ensure Nginx is properly configured and listening on port 80

cat /etc/nginx/sites-available/default > /etc/nginx/sites-enabled/default
sudo service nginx restart

This will ensure that the proper configuration is always enabled and that Nginx is restarted to apply changes
