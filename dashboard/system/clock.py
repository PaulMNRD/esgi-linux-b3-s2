import time

def get_clock_info():
    local_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
    timezone = time.tzname[time.daylight]
    return f"Horloge système : {local_time} ({timezone})"
