import subprocess

def get_postfix_events():
    try:
        output = subprocess.check_output(
            ["journalctl", "-u", "postfix", "--no-pager", "-n", "10"],
            stderr=subprocess.DEVNULL,
        )
        return output.decode(errors="ignore")
    except Exception as e:
        return f"Erreur récupération logs Postfix : {e}"
