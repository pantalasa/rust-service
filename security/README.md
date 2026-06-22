# Security scan artifacts

## `trivy-rescan.json`

A Trivy filesystem scan result captured by the scheduled **post-release
re-scan** of this service. Release pipelines scan an artifact once at build
time and then deploy it; new advisories published (or newly matched) after that
point never re-gate the already-released commit. The re-scan closes that gap by
re-evaluating the latest released commit on a schedule.

This particular result re-scanned the released commit on `2026-06-21` and
flagged a HIGH advisory in a transitive dependency:

| Field | Value |
|-------|-------|
| Advisory | [GHSA-82j2-j2ch-gfr8](https://github.com/advisories/GHSA-82j2-j2ch-gfr8) |
| Package | `rustls-webpki@0.103.9` (transitive, via the TLS stack) |
| Severity | HIGH (CVSS 7.5) |
| Fixed in | `0.103.13` |
| Impact | Denial of service — panic on a malformed CRL BIT STRING |

The Lunar `cve-rescan` collector publishes this result to `.cve_rescan` on the
component, and the `cve-release-gate` policy reads it. Because the gate is
configured `block-release`, the Lunar release gate (`lunar policy ok-release`)
blocks the deploy until the finding is remediated (bump `rustls-webpki` to
`0.103.13`) or explicitly waived.

To clear the gate, update the dependency and refresh this artifact from a real
scan:

```bash
trivy fs --scanners vuln --format json -o security/trivy-rescan.json .
```
