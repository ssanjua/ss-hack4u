
---
- Tags: #recon #tools #subdominios 
---

Link : - **Sublist3r** (Herramienta pasiva): [https://github.com/huntergregal/Sublist3r](https://github.com/huntergregal/Sublist3r)

**Function Usage:**

- **domain**: The domain you want to enumerate subdomains of.
- **savefile**: save the output into text file.
- **ports**: specify a comma-sperated list of the tcp ports to scan.
- **silent**: set sublist3r to work in silent mode during the execution (helpful when you don't need a lot of noise).
- **verbose**: display the found subdomains in real time.
- **enable_bruteforce**: enable the bruteforce module.
- **engines**: (Optional) to choose specific engines.

Example to enumerate subdomains of Yahoo.com:

```python
import sublist3r 
subdomains = sublist3r.main('yahoo.com', 40, 'yahoo_subdomains.txt', ports= None, silent=False, verbose= False, enable_bruteforce= False, engines=None)
```

### Examples

[github](https://github.com/huntergregal/Sublist3r#examples)

- To list all the basic options and switches use -h switch:

`python sublist3r.py -h`

- To enumerate subdomains of specific domain:

`python sublist3r.py -d example.com`

- To enumerate subdomains of specific domain and show only subdomains which have open ports 80 and 443 :

`python sublist3r.py -d example.com -p 80,443`

- To enumerate subdomains of specific domain and show the results in realtime:

`python sublist3r.py -v -d example.com`

- To enumerate subdomains and enable the bruteforce module:

`python sublist3r.py -b -d example.com`

- To enumerate subdomains and use specific engines such Google, Yahoo and Virustotal engines

`python sublist3r.py -e google,yahoo,virustotal -d example.com`