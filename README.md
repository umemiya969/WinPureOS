# WinPureOS

**Make Windows a pure operating system — no ads, no AI, minimal telemetry.**

WinPureOS is a security‑ and privacy‑focused hardening project that strips Windows 11 down to what an operating system should be: a kernel, drivers, and a user interface — **not a marketing platform, not an AI client, not a data collection agent**.

> This project is opinionated by design.

---

## 🧭 Project Philosophy

Modern Windows blends OS functionality with:

* advertising & persuasion layers
* cloud‑first AI features
* behavioral telemetry
* consumer growth mechanisms

WinPureOS exists to **systematically remove those layers** using documented, reversible, and auditable mechanisms.

**What WinPureOS is:**

* policy‑first (Group Policy & registry)
* modular & auditable
* reversible (restore mode)
* designed for power users

**What WinPureOS is NOT:**

* a piracy or activation bypass tool
* a binary patcher
* a "one‑click magic optimizer"

---

## 🎯 Goals

* Disable all Microsoft marketing & persuasion surfaces
* Disable Copilot, AI hooks, and cloud cognitive features
* Reduce telemetry to enterprise‑minimal level
* Silence background network exfiltration
* Preserve system stability & Windows Update

---

## ❌ Non‑Goals (Important)

WinPureOS does **not** attempt to:

* achieve literal zero telemetry on Home/Pro editions
* bypass DRM, licensing, or activation
* break Windows security mechanisms

If you need absolute zero telemetry:

* Windows Enterprise LTSC
* network‑level firewalls (Pi‑hole)
* or a non‑Windows OS

---

## 🧱 Architecture Overview

```
WinPureOS/
├── core/        # Entry points (pure, restore, verify)
├── modules/     # Isolated hardening units
├── profiles/    # Mode definitions (default: paranoid)
├── docs/        # Threat model & limitations
└── README.md
```

### Single Entry Point

Users apply WinPureOS **only** via:

```powershell
core/pure.ps1
```

Modules are internal and not intended to be run manually.

---

## 🔥 What WinPureOS Removes

### Marketing & Ads

* Start Menu promotions
* Lock Screen ads
* App & feature suggestions
* Content Delivery Manager

### AI & Cloud Intelligence

* Windows Copilot
* Bing AI search integration
* Cortana remnants
* Online speech & typing personalization

### Telemetry & Profiling

* Diagnostic tracking services
* Advertising ID
* App usage tracking
* Automatic feedback uploads

### Consumer Bloat

* Xbox stack
* Bing & news apps
* Feedback Hub
* Consumer media apps

---

## ⚠️ What Will Break

WinPureOS is intentionally aggressive.

| Feature               | Status   |
| --------------------- | -------- |
| Copilot               | Disabled |
| Online search         | Disabled |
| Voice typing          | Disabled |
| Store recommendations | Disabled |
| "Smart" suggestions   | Disabled |

Windows becomes **less intelligent but more predictable**.

---

## 🔍 Transparency & Auditability

* All changes are policy‑ or service‑based
* No system binaries are modified
* `core/verify.ps1` audits applied changes
* `core/restore.ps1` reverts to Microsoft defaults

---

## 🚀 Quick Start

> **Run as Administrator**

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
./core/pure.ps1
```

Reboot after execution.

---

## 🛡️ Threat Model (Summary)

WinPureOS defends against:

* behavioral telemetry
* cloud AI data ingestion
* persuasion & nudging mechanisms

It does **not** defend against:

* kernel‑level backdoors
* firmware‑level surveillance
* third‑party application tracking

See `docs/threat-model.md` for details.

---

## 📜 License

MIT License.

Fork it. Modify it. Audit it.

---

## ⚖️ Disclaimer

This project is not affiliated with Microsoft.
Use at your own risk.

---

**WinPureOS**

Reclaim your operating system.
