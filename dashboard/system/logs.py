import subprocess

def get_failed_logins():
    try:
        output = subprocess.check_output(
            ["journalctl", "-u", "systemd-logind.service", "-p", "warning", "--no-pager", "-n", "10"],
            stderr=subprocess.DEVNULL,
        )
        return output.decode(errors="ignore")
    except Exception as e:
        return f"Erreur récupération logs PAM : {e}"
