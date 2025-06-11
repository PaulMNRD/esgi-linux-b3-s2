from system.clock import get_clock_info
from system.load import get_system_load
from system.logs import get_failed_logins
from system.postfix import get_postfix_events

import threading
import tkinter as tk

def start_dashboard():
    root = tk.Tk()
    root.title("System Dashboard")
    root.geometry("800x600")

    clock_label = tk.Label(root, font=("Helvetica", 16))
    clock_label.pack(pady=10)

    load_label = tk.Label(root, font=("Courier", 12), justify="left")
    load_label.pack(pady=10)

    logs_text = tk.Text(root, height=10, width=100)
    logs_text.pack(pady=10)

    postfix_text = tk.Text(root, height=10, width=100)
    postfix_text.pack(pady=10)

    def update():
        while True:
            clock_label.config(text=get_clock_info())
            load_label.config(text=get_system_load())

            logs_text.delete(1.0, tk.END)
            logs_text.insert(tk.END, get_failed_logins())

            postfix_text.delete(1.0, tk.END)
            postfix_text.insert(tk.END, get_postfix_events())

    threading.Thread(target=update, daemon=True).start()
    root.mainloop()
