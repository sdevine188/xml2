library(tidyverse)
library(xml2)

# https://blog.rstudio.com/2015/04/21/xml2/

# xpath for querying xml
# https://www.w3schools.com/xml/xpath_syntax.asp

x <- read_xml("
        <foo>
                <bar>text <baz id = 'a' /></bar>
                <bar>2</bar>
                <baz id = 'b' />
        </foo>")
x

# inspect
xml_name(x)
xml_structure(x)
xml_children(x)

# Find all baz nodes anywhere in the document
baz_nodes <- xml_find_all(x, xpath = ".//baz")
xml_find_all(x, xpath = ".//baz[@id='a']")
xml_name(x = baz_nodes)
xml_siblings(x = baz_nodes)
xml_children(x = baz_nodes)

# find path to node(s)
xml_path(baz_nodes)

# logical to see if nodes have attributes
xml_has_attr(x = x, attr = "id")
xml_has_attr(x = baz_nodes, attr = "id")
# note that chaining doesn't seem to work as easily as with rvest - below code throws error
# xml_find_all(x, xpath = ".//baz") %>% xml_has_attr(x = baz_nodes, attr = "id")

# pull values for attributes
xml_attr(x = baz_nodes, attr = "id")

# extract text from nodes
xml_find_all(x = x, xpath = ".//bar") %>% xml_text()

