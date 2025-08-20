# Legal & Insurance Considerations

1. **Signed Authorization & SOW**  
   - Must explicitly cover *home networks* and *physical premises*.  
   - Identify scope (devices, time‑window, techniques) and exclusions.

2. **Liability Insurance**  
   - Professional indemnity covering data loss and physical damage.  
   - Verify homeowner policy does **not** conflict with testing.

3. **Privacy / Surveillance Laws**  
   - Some jurisdictions restrict capturing CCTV or voice recordings.  
   - Obtain written consent before recording inside premises.

4. **CFAA & State Equivalents**  
   - Pen‑testing remains illegal without authorization *from each owner*.  
   - Ensure intermediary contract includes indemnity clause.

5. **Data Handling & Retention**  
   - Encrypt at rest (**GnuPG** with dedicated key per exec).  
   - Retain raw logs ≤ 90 days, reports ≤ 5 years (per contract).

6. **Chain‑of‑Custody**  
   - Unique asset tag per Pi; custody log in `docs/asset_log.xlsx`.  
   - Photo evidence of placement/removal.

7. **Incident Safety‑Net**  
   - 24/7 contact details for halting test on client request.  
   - Rapid rollback procedure (`scripts/rescue_and_recovery.sh`).

