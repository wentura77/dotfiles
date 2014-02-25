#!/usr/bin/awk
BEGIN {fname = 1}
/-----BEGIN CERTIFICATE-----/ && nf == 0   { f[nf-1] = $0}
/./ 							{print > "file-"fname".cer"}
/-----END CERTIFICATE-----/		{
									fname = fname + 1
									nf = 0
								}

