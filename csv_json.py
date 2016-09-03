import csv
import json

csvfile = open('buffalo-average-processing-time.csv', 'r')
jsonfile = open('buffalo.json', 'w')

fieldnames = ("id", "city_slug", "region_slug", "field_type_slug", "field_type_name", "date", "value", "national_avg")
reader = csv.DictReader( csvfile, fieldnames)
for row in reader:
    json.dump(row, jsonfile)
    jsonfile.write('\n')