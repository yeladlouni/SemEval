from scrapy.spiders import SitemapSpider
import html2text
import time

class MySpider(SitemapSpider):
    name = 'altibbi'
    allowed_domains = ['altibbi.com']

    sitemap_urls = ['https://www.altibbi.com/sitemap/index-sitemap.xml']

    def parse(self, response):
        
        print(response.url)

        converter = html2text.HTML2Text()
        converter.ignore_links = True
        converter.ignore_images = True

        content_article =  ' '.join(response.xpath("//div[@class = 'article-description']").extract()) 
        content_vocabulary = ' '.join(response.xpath("//div[@id = 'termPages']//div[contains(@class, 'row')]").extract())
        content_definition = ' '.join(response.xpath("//span[@itemprop = 'description']").extract())
        content_qa = ' '.join(response.xpath("//div[contains(@class, 'answer-question') or contains(@class, 'answer-content') or contains(@class, 'text-bold mt question-body')]").extract())
        content_qa2 = ' '.join(response.xpath("//span[@itemprop = 'text']").extract())

        if content_article:
            content = content_article
        elif content_definition:
            content = content_definition
        elif content_vocabulary:
            content = content_vocabulary
        elif content_qa:
            content = content_qa
        else:
            content = content_qa2

        if content:

            content = ' '.join(response.xpath("//h1[contains(@class, 'fn-h1') or contains(@class, 'fn-xl')]").extract())  + content

            file_path = "data/" + str(int(time.time())) + ".txt"

            with open(file_path, "w", encoding="utf-8") as f:
                    f.write(converter.handle(content))