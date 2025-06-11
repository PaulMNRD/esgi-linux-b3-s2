import psutil

def get_system_load():
    cpu = psutil.cpu_percent(interval=1)
    mem = psutil.virtual_memory()
    net = psutil.net_io_counters()

    return (
        f"CPU : {cpu:.1f}%\n"
        f"RAM : {mem.percent:.1f}% ({mem.used // (1024**2)} MB used)\n"
        f"Réseau : Envoyés = {net.bytes_sent // 1024} Ko, Reçus = {net.bytes_recv // 1024} Ko"
    )
