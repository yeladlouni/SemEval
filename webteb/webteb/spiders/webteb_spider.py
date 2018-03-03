# -*- coding: utf-8 -*-
"""
Created on Tue Aug 22 22:41:57 2017

@author: Yassine EL ADLOUNI
"""
from scrapy.spiders import SitemapSpider
from scrapy.selector import HtmlXPathSelector
import html2text
import os
import time
import re

class WebTeb(SitemapSpider):
    name = "webteb"
    #allowed_domains = ["webteb.com"]
    #start_urls = ["https://www.webteb.com"]

    #rules = (
    #    Rule(LinkExtractor(allow=()), callback="parse_article", follow= True),
    #)

    sitemap_urls = ['https://www.webteb.com/subdomains/www/sitemap.xml']
    
    def parse(self, response):
        hxs = HtmlXPathSelector(response)
        sample = " ".join(hxs.xpath("//article").extract())
        
        if sample.strip():
            title_en1 = hxs.xpath("//span[contains(@class,'en-name')]/text()").extract_first()
            title_en2 = hxs.xpath("//span[contains(@lang, 'en')]/text()").extract_first()
            title_ar = re.sub('[:\/.;]', ' ', hxs.xpath("//header/h1/text()").extract_first())
            
            
            converter = html2text.HTML2Text()
            converter.ignore_links = True
            converter.ignore_images = True
            
            directory = "/".join(response.url.split("/")[3:-1][::-1])
            if (directory) and (not os.path.exists(directory)):
                os.makedirs(directory)
            elif not directory:
                directory = 'others'
                    
            if title_en1:    
                file_path = directory + "/" + title_en1.strip() + ".txt"
            elif title_en2:
                file_path = directory + "/" + title_en2.strip() + ".txt"
            elif title_ar:
                file_path = directory + "/" + title_ar.strip() + ".txt"
            else:
                file_path = directory + "/" + int(time.time()) + ".txt"
                    
            with open(file_path, "w", encoding="utf-8") as f:
                f.write(converter.handle(sample))
        