import matplotlib
import matplotlib.pyplot as plt
plt.rcdefaults()
import csv
from matplotlib.dates import MONDAY
from matplotlib.dates import MonthLocator, WeekdayLocator, DateFormatter

bitcoin_path ='/home/diego/bitcoin_price'

datelist = []
pricelist = []

with open(bitcoin_path, "r") as f:
    reader = csv.reader(f)
    next(reader, None)  # skip the headers
    for row in reader:
        # print row
        price = float(row[1])
        date = matplotlib.dates.datestr2num(row[0])
        datelist.append(date)
        pricelist.append(price)

print len(datelist), datelist
print len(pricelist), pricelist

mondays = WeekdayLocator(MONDAY)

# every 3rd month
months = MonthLocator(range(1, 13), bymonthday=1, interval=2)
monthsFmt = DateFormatter("%b '%y")

fig, ax = plt.subplots()

ax.plot_date(datelist, pricelist, '-')
ax.xaxis.set_major_locator(months)
ax.xaxis.set_major_formatter(monthsFmt)
ax.xaxis.set_minor_locator(mondays)
ax.autoscale_view()
ax.grid(True)

fig.autofmt_xdate()
plt.show()        
        