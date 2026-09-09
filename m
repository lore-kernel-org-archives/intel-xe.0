Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F4CC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FE510F0F7;
	Wed,  9 Sep 2026 12:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bv/5fOj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C342810F0F7
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957711; x=1820493711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mv9ZGYiPytjuSYmiIXv8vRXpb+WzHmGmx+L6b20f12A=;
 b=Bv/5fOj1NQ0q0hp6+Ouz5amddRicsGwqJx8McRdBjjc/FZWIWgDxfklz
 tbXzboX/0ZP44xqf6UbJAtDebwYLaUbhGUilMXCO0fC1uzrbz+R1IpSNg
 xvHmohXhwFBFiShaT8k7Q0iogHoRIT8lxD9gmnSLyu5LuPATX+tYmo9dM
 86BRrzLptNcQ2SSU0wXs/f1VTnqTkrjbAuErNeE1gmCbd5i79QJCLfMzY
 dWjSQA/h/5HfLqPmfgsrIrwUWTXDiwzUmm/N+tEGYv67EDui4oJx8aHw8
 uBjixKZOi38iyME7l7HvYVuu4PRE0oze/BJWiCDuEd4cV5XSKhUWrA5dJ g==;
X-CSE-ConnectionGUID: 7NsryuU3RL6z9abTWYkMzg==
X-CSE-MsgGUID: KeHuJwloRde0IH37L/DdPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715455"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715455"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:41:50 -0700
X-CSE-ConnectionGUID: fTuhf8p2Qq6YmjuksOqsvg==
X-CSE-MsgGUID: HwzdzGEkT7W1T3qTukZuYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246508"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 00/21] drm/xe: Access counter support for migration hints
Date: Wed,  9 Sep 2026 18:14:54 +0530
Message-ID: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds access counter support to the Xe driver. Access counters
are a hardware mechanism that tracks how frequently the GPU accesses
memory regions over time. When a virtual-address (VA) window accumulates
enough accesses, the hardware notifies the driver, which can then take
advisory action -- typically migrating the hot region from system memory
to device-local VRAM so subsequent GPU accesses avoid costly PCIe traffic.

Access counter handling is entirely transparent to userspace: workloads
run identically with or without it. The only observable effect is
potentially improved performance when the kernel succeeds in migrating
memory closer to the GPU. Notifications never reach userspace; the driver
emits ftrace events (trace_xe_vma_acc) for observability instead.

Design
======

The feature is structured as two layers with one-way communication:

  - Producer layer (xe_guc_access_counter.c): interacts with the GuC to
    receive and parse access counter notifications from hardware into a
    common struct xe_access_counter, then forwards them to the consumer.

  - Consumer layer (xe_access_counter.c): services notifications (memory
    migration and rebind decisions). It uses a generic circular queue
    (xe_usm_queue) sized to absorb all potential notifications and a
    multi-threaded worker pool to process them. The workers run on the
    same workqueue as the page-fault handler, so access counter servicing
    is scheduled alongside (and at lower priority than) fault handling.

Each notification covers a VA window sized by the hardware granularity
field (128K / 2M / 16M / 64M) that may span multiple VMAs or SVM ranges.
To avoid starving higher-priority page-fault work that shares the same
workqueue, the consumer services exactly one VMA or SVM range per work
item and re-queues a continuation event for the remainder of the window.

Both BO-backed VMAs and SVM (cpu_addr_mirror) ranges are supported. A VMA
is only migrated when it is actually eligible (DGFX, multi-placement, not
already resident in the target VRAM); see xe_vma_supports_access_ctr().
For SVM ranges a MIGRATE_ON_ACCESS_COUNTER policy governs the migration.
userptr VMAs are not yet migrated on an access counter event (see the TODO
in xe_access_counter_vma_setup()); userptr-to-VRAM migration is planned as
follow-up work.

Userspace interface
===================

Access counters are configured per exec queue at creation time via a new
DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension, which carries the
trigger threshold, notify threshold and granularity. The parameters are
programmed into the engine LRC (CTX_ACC_CTR_THOLD / CTX_ASID) and remain
active for the lifetime of the exec queue. On hardware without access
counter support the extension returns -EINVAL. See the kernel-doc on
struct drm_xe_exec_queue_set_acc_param for the full description.

For SVM ranges, userspace can additionally opt into access-counter-driven
first placement via a new DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER
bind flag (valid only together with DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR on
a MAP op). With this flag the eager first-touch migration is skipped: the
range stays where the CPU placed it on the initial GPU page fault and is
migrated to a GPU's local VRAM only once that GPU's access counter reports
it hot, avoiding unnecessary early migrations.

Trigger, notify and granularity
===============================

Three parameters control hardware access counter behaviour, all configured
per exec queue via the extension above:

  - granularity selects the size of the VA window the hardware groups
    together when counting accesses (128K / 2M / 16M / 64M). Each
    notification covers one aligned window of this size. Finer granularity
    is more precise but generates more events; coarser granularity is
    cheaper but less precise.

  - trigger is the access-count threshold for a high-priority "trigger"
    notification. The hardware keeps a finite pool of counters, each
    tracking one granularity-aligned window. When a counter reaches
    trigger, the hardware immediately reports the window as hot and the
    driver acts on it promptly (migrate to VRAM).

  - notify is the threshold checked when a counter is de-allocated from the
    finite pool under LRU pressure before it ever reached trigger. If the
    de-allocated counter's count >= notify, the hardware reports a
    lower-priority "notify" notification; otherwise the de-allocation is
    silent. notify must be <= trigger, since a counter never accumulates
    beyond trigger.

Both trigger and notify are absolute 16-bit access counts.

Patch overview
==============

  1      : xe_usm_queue generic circular buffer for USM notifications.
  2-4    : access counter consumer layer skeleton, init and handler.
  5-7    : refactor ASID->VM lookup into xe_device and reuse it in the
           page-fault path (no functional change).
  8-9    : consumer worker and per-notification service logic.
  10-12  : tracing, SVM-range handling and full-granularity-window
           servicing.
  13     : GuC producer layer.
  14-15  : uapi extension and LRC plumbing to program AC parameters.
  16-17  : VMA eligibility helper and NC PTE bit for ineligible VMAs.
  18-21  : SVM migration policy, MIGRATE_ON_ACCESS_COUNTER bind flag and
           logging cleanups.

Changes since v1
================

  - Single-queue / multi-worker design: reworked the consumer so all
    producers (per-GT GuC access counter sources) push into one shared
    xe_usm_queue that is drained by a pool of N workers, decoupling
    hardware/firmware parsing from range servicing.
  - Migration policy: defined and documented an explicit policy for which
    GPU owns AC-triggered migration, keyed off the VMA madvise preferred
    location (explicit-GPU / explicit-sysmem / first-touch-then-hot), and
    added the opt-in DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER
    "migrate only once hot" behaviour.
  - Whole-granularity servicing: an access counter event now services the
    entire granularity window, walking every VMA / SVM range it spans
    (one per work item, with a re-queued continuation) instead of only the
    single VMA at the hint address.
  - Non-blocking BO migration: BO-backed VMA migration/rebind is now
    pipelined via a per-VMA ac_move_fence stored on the VMA, so the
    consumer does not block under vm->lock waiting for the move; the
    page-fault handler waits on the fence only when needed.
  - Kernel-doc: added DOC sections for the access counter layering and
    the SVM migration policy, and full kernel-doc for the uapi
    (drm_xe_exec_queue_set_acc_param, granularity enum and the bind flag).
  - Assorted cleanups: NC PTE handling for ineligible VMAs, trace-event
    and debug-log tidy-ups.

Thanks to Matthew Brost for the access counter design direction and the
review suggestions incorporated into this revision.

Himal Prasad Ghimiray (21):
  drm/xe: Add xe_usm_queue generic USM circular buffer
  drm/xe: Stub out new access_counter layer
  drm/xe: Implement xe_access_counter_init
  drm/xe: Implement xe_access_counter_handler
  drm/xe: Extract xe_vma_lock_and_validate helper
  drm/xe: Move ASID to FAULT VM lookup to xe_device
  drm/xe/pf: Use xe_device_asid_to_vm in xe_pagefault_save_to_vm
  drm/xe: Implement xe_access_counter_queue_work
  drm/xe: Implement xe_access_counter_service
  drm/xe/trace: Add xe_vma_acc trace event for access counter
    notifications
  drm/xe/svm: Handle svm vma for acc_ctr trigger
  drm/xe: Service all VMAs in an access counter granularity window
  drm/xe: Add xe_guc_access_counter layer
  drm/xe/uapi: Add access counter parameter extension for exec queue
  drm/xe/lrc: Pass exec_queue to xe_lrc_create for access counter params
  drm/xe/vm: Add xe_vma_supports_access_ctr() helper
  drm/xe/pt: Set NC PTE bit for VMAs ineligible for access counting
  drm/xe/svm: Define access counter migration policy
  drm/xe/svm: Add MIGRATE_ON_ACCESS_COUNTER bind flag
  drm/xe/svm: Move EVICTED PAGES debug log to callers
  drm/xe/svm: Distinguish access-counter-triggered range setup in logs

 drivers/gpu/drm/xe/Makefile                  |   4 +-
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h        |   1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h      |  10 +
 drivers/gpu/drm/xe/xe_access_counter.c       | 366 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_access_counter.h       |  17 +
 drivers/gpu/drm/xe/xe_access_counter_types.h | 143 ++++++++
 drivers/gpu/drm/xe/xe_device.c               |  30 ++
 drivers/gpu/drm/xe/xe_device.h               |   1 +
 drivers/gpu/drm/xe/xe_device_types.h         |  12 +
 drivers/gpu/drm/xe/xe_exec_queue.c           |  35 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   9 +
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_access_counter.c   |  74 ++++
 drivers/gpu/drm/xe/xe_guc_access_counter.h   |  15 +
 drivers/gpu/drm/xe/xe_guc_ct.c               |   4 +
 drivers/gpu/drm/xe/xe_guc_fwif.h             |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                  |  35 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |   5 +-
 drivers/gpu/drm/xe/xe_pagefault.c            |  78 +---
 drivers/gpu/drm/xe/xe_pt.c                   |  23 ++
 drivers/gpu/drm/xe/xe_svm.c                  | 197 ++++++++--
 drivers/gpu/drm/xe/xe_svm.h                  |  14 +
 drivers/gpu/drm/xe/xe_trace_bo.h             |  32 +-
 drivers/gpu/drm/xe/xe_usm_queue.h            | 127 +++++++
 drivers/gpu/drm/xe/xe_vm.c                   | 130 ++++++-
 drivers/gpu/drm/xe/xe_vm.h                   |   6 +
 drivers/gpu/drm/xe/xe_vm_types.h             |  11 +
 include/uapi/drm/xe_drm.h                    | 205 +++++++++++
 28 files changed, 1472 insertions(+), 115 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h

-- 
2.43.0

