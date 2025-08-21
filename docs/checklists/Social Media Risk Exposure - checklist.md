# OSINT SOP: Social Media Account Discovery via Phone Numbers

## 1. Preparation
- [ ] Normalize target phone number(s):  
  - International (+1-555-123-4567)  
  - Local (555-123-4567)  
  - Digits only (15551234567)  
- [ ] Note any additional identifiers (emails, aliases, usernames, photos).

---

## 2. Direct & Indirect Phone Number Lookups
- [ ] Test number in **reverse lookup/data enrichment tools**:  
  - Spokeo, TruePeopleSearch, SocialCatfish, Radaris, Pipl.  
  - Paid enrichment APIs: PeopleDataLabs, FullContact.  

- [ ] Try phone number in **“forgot password/account recovery”** flows.  
  - Look for masked confirmations (e.g., “sending code to +1 ●●●●5678”).  

---

## 3. Messaging & Contact-Sync Apps
- [ ] Add number into **Signal / WhatsApp / Telegram**:  
  - Check for profile photos, display names, or usernames.  

- [ ] Use a **burner mobile account** to enable **contact syncing** in:  
  - Facebook, Instagram, Twitter/X, TikTok, Snapchat, LinkedIn.  
  - Record “suggested friends” and direct matches.  

---

## 4. Username & Handle Discovery
- [ ] Extract discovered handles/usernames.  
- [ ] Feed them into automated search tools:  
  - WhatsMyName  
  - Sherlock  
  - Maigret  
  - Profil3r  

- [ ] Check for consistency: naming patterns, reuse of birth year, nicknames, or job titles.

---

## 5. Secret/Secondary Account Pivoting
- [ ] Review known accounts’ **friends/followers/following** lists.  
- [ ] Watch for suspiciously similar naming patterns (e.g., `john.doe`, `johnnydoe123`, `j_doe_alt`).  
- [ ] Run **reverse image search** on profile pictures across Google/Yandex/TinEye.  
- [ ] Search for **unique bio text, emoji strings, hashtags**.  
- [ ] Map **interaction bubbles**: likes, comments, shares often betray hidden alts.  

---

## 6. Cross-Verification
- [ ] Correlate findings against:  
  - Breached credential dumps (phone/email → username/password).  
  - Public posts tying alias to phone/email (Pastebin, forums, leaks).  
  - Other OSINT signals (location, employer, hobbies).  

---

## 7. Reporting
- [ ] For each discovered account:  
  - Platform  
  - Username/handle  
  - Profile URL  
  - Discovery method (direct match, friend-of-friend, reverse lookup, etc.)  
  - Confidence level (High/Medium/Low)  

- [ ] Summarize risk exposure:  
  - Personally identifiable info revealed  
  - Relationship mapping (friends, relatives, colleagues)  
  - Behavioral indicators (political, financial, lifestyle)  
  - Attack surface vectors (phishing, impersonation, extortion)  
