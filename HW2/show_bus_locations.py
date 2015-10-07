import json
import sys
import urllib2

if __name__ == '__main__':
    url= "http://api.prod.obanyc.com/api/siri/vehicle-monitoring.json?key=%s&VehicleMonitoringDetailLevel=calls&LineRef=%s" %(sys.argv[1],sys.argv[2])
        
    request = urllib2.urlopen(url)
    jsonfile = json.load(request)
    
    VehicleActivity = jsonfile['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity']
    number = len(VehicleActivity)
    
    print 'Bus Line : %s' %sys.argv[2]
    print 'Number of Active Buses : %s' %number
    
    for i in range(number):
        latitude = VehicleActivity[i]['MonitoredVehicleJourney']['VehicleLocation']['Latitude']
        longitude = VehicleActivity[i]['MonitoredVehicleJourney']['VehicleLocation']['Longitude']
        
        print 'Bus %s is at latitude %s and longitude %s' % (i,latitude,longitude)