#### p80_parser
I've managed to find most of all IP ranges used by ISPs in Czechia and 
I've used masscan to scan for open port 80 on these ranges -

p80_parser files:<br>

    1. commands.txt - useful commands for filtering the result
    2. czech_ip_ranges.txt - Self explanatory
    3. get_title.sh - using cURL to get the title of the pages
    4. ips80.txt - the filtered result of the masscan with gawk -> 262 043 IPs with port 80 open
    5. port08_cz.txt - the raw result of the masscan
    6. mix of Ruby/bash code, its purpose is to filter the cURLed webpages through a set of rules that would indicate that the webpage is old or a WordPress site
    7. result.txt - result of the Ruby/bash code | format: IP / title / HTML4/XHTML/WordPress/Missing Doctype
    8. tenips.txt - the first 1000 IPs, intended for testing purposes




#### Links
https://github.com/robertdavidgraham/masscan