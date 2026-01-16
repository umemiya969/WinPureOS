# WinPureOS

Make Windows a **Pure Operating System** — no ads, no AI push, minimal telemetry.

> Windows as an OS, not a marketing platform.

---

## 🎯 Project Goals

* Disable Microsoft marketing & ads
* Disable Copilot, AI hooks, cloud suggestions
* Reduce telemetry to enterprise-minimal level
* Preserve system stability & Windows Update
* Reversible and transparent changes

---

## 📂 Repository Structure

```
WinPureOS/
├── scripts/
│   ├── winpureos.ps1          # Main PURE mode script
│   ├── restore-default.ps1    # Restore Microsoft defaults
│   └── firewall-block.ps1     # Optional telemetry IP/domain block
│
├── profiles/
│   ├── standard.json          # Safe privacy profile
│   ├── strict.json            # Aggressive debloat
│   └── paranoid.json          # Near-LTSC behavior
│
├── docs/
│   ├── what-we-disable.md
│   ├── limitations.md
│   └── faq.md
│
├── LICENSE
└── README.md
```

---

## 🚀 Quick Start

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
./scripts/winpureos.ps1
```

Reboot after execution.

---

## 🧠 What WinPureOS Disables

### Marketing & Ads

* Start Menu ads
* Lock Screen promotions
* App suggestions
* Content Delivery Manager

### AI & Cloud

* Windows Copilot
* Bing AI Search
* Cortana remnants
* Online personalization

### Telemetry

* Diagnostic tracking
* Advertising ID
* App launch tracking
* Feedback auto-upload

---

## 🔄 Restore Mode

```powershell
./scripts/restore-default.ps1
```

Restores Microsoft default behavior.

---

## ⚠️ Known Limitations

* Not possible to reach true zero telemetry on Home/Pro
* Some cloud features will stop working
* Windows Store recommendations removed

For full isolation consider:

* Windows Enterprise LTSC
* Network-level firewall (Pi-hole)

---

## 🛡️ Security Philosophy

* No binary patching
* No system file deletion
* Registry & policy based only
* All changes documented

---

## 📜 License

MIT License — use, modify, fork freely.

---

## 🙌 Contributing

Pull requests welcome.
Focus areas:

* New profiles
* Better rollback
* GUI frontend
* ISO automation

---

## 🧩 Disclaimer

This project is not affiliated with Microsoft.
Use at your own risk.

---

**WinPureOS** — reclaim your operating system.
