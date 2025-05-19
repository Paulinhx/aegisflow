import json, re, os

def summarize_semgrep():
    print("🔍 Semgrep MITRE Findings:\n")
    try:
        with open("reports/semgrep.json") as f:
            data = json.load(f)
        for result in data.get("results", []):
            check_id = result["check_id"]
            line = result["start"]["line"]
            path = result["path"]
            msg = result["extra"]["message"]
            mitre = result["extra"].get("metadata", {}).get("mitre_attack", {})
            print(f"❗ {check_id} at {path}:{line}")
            print(f"   ↪ {msg}")
            print(f"   ↪ Tactic: {mitre.get('tactic')} | Technique: {mitre.get('technique')}\n")
    except Exception as e:
        print(f"[!] Could not parse Semgrep: {e}")

def summarize_trivy():
    print("\n🧨 Trivy High/Critical CVEs:\n")
    try:
        with open("reports/trivy.txt") as f:
            for line in f:
                if re.search(r"(HIGH|CRITICAL)", line):
                    print(f"❗ {line.strip()}")
    except Exception as e:
        print(f"[!] Could not read Trivy: {e}")

def summarize_otx():
    print("\n🚨 OTX IOC Matches:\n")
    if not os.path.exists("reports/otx_hits.json"):
        print("✅ No IOC matches found.")
        return
    try:
        with open("reports/otx_hits.json") as f:
            data = json.load(f)
        print(f"🔴 Indicator: {data.get('indicator')}")
        print(f"↪ Pulses: {data.get('pulse_info', {}).get('count', 0)}")
        for pulse in data.get("pulse_info", {}).get("pulses", []):
            print(f" - {pulse.get('name')} | Malware: {pulse.get('malware_family', 'N/A')}")
    except Exception as e:
        print(f"[!] Could not parse OTX: {e}")

if __name__ == "__main__":
    summarize_semgrep()
    summarize_trivy()
    summarize_otx()
