---
rto_minutes: 60
rpo_minutes: 15
last_reviewed: 2026-05-01
approver: carlos@pantalasa.org
---

# Disaster Recovery Plan

## Overview

This document describes the disaster recovery (DR) strategy for this service,
including recovery objectives, roles, and procedures.

## Recovery Objectives

- Recovery Time Objective (RTO): 60 minutes
- Recovery Point Objective (RPO): 15 minutes

## Roles and Responsibilities

- Incident Commander: on-call engineer
- Communications Lead: engineering manager
- Recovery Operators: platform team

## Recovery Procedures

1. Declare the incident and assemble the response team.
2. Restore the most recent verified backup.
3. Validate data integrity and service health.
4. Fail traffic back once steady-state is confirmed.

## Backup and Restore

Backups run continuously with point-in-time recovery. Restores are validated in
the staging environment during scheduled exercises.

## Communication Plan

Stakeholders are notified via the incident channel and status page at each phase.
