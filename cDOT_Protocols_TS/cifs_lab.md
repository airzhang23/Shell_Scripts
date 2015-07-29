**For CIFS lab 2 :**

When we do the CIFS labs, no one can access the cifs share `\\studentX` or `\\studentX_cifs`.

Use studentX data lif's ip address instead, it works.

The DNS servers of the Windows are set to 10.61.77.164 and 161, and the DC we are using is 10.61.94.101.
The nslookup on the windows box can give correct ip addresses of studentX.


run "joindomain.bat" on the DC before the class.
See if it can be fixed.