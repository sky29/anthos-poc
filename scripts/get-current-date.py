import json, datetime

def get_current_date_in_utc():
  utc_time = datetime.datetime.utcnow() 
  return utc_time.strftime('%Y-%m-%d')

result = {
  "current_date": get_current_date_in_utc(),
}

print(json.dumps(result))