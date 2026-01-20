Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28ECD2ECF7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 06:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A028F10E4C9;
	Tue, 20 Jan 2026 06:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gr6CEXKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C9A10E074
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 06:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768889354; x=1800425354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DLYPblQJcy1LVLMjpX367nSegzc4NDe/VBcmCjTZ5H0=;
 b=gr6CEXKCIuMA3BmrFrcsTe73WIa2IFehYS0M2gjtkAvHXp+yB40eKwge
 q8aNgEwdlXyzVS3i4Qg+L2cHHh4zbKI+nG2sJXWQYVQ+yKuGuOk89a8Jt
 ZzQkM6GKpJqzIvzEswT7lMS+PpFBLI/g1R/TnSYWsVWY0tJxJ8shZ7e+D
 drVcyWjyk4MoHBXv7TkCgcL5tmWoZHLvoG0aMDKBrw5Djbb5F0QmeVbTT
 TyRIgcC+8L27FdVhDLT/nrxL9X185EtNsmaR4ZXk31xFrl2ijH9movSwZ
 9B05GNWPi1aU9fUbSLIK5QYiVhho310bGkk3+1r4nmWWo7qmUxY0A8fmU w==;
X-CSE-ConnectionGUID: U5lwiZNeTeKlhixLmEbtqA==
X-CSE-MsgGUID: nk0BcZ5FRuyXESC8btcfGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72676974"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="72676974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:14 -0800
X-CSE-ConnectionGUID: 9yTXe/ANSTOp2MpKeihgyw==
X-CSE-MsgGUID: eYMkibaHRuyXaXIMRbkZgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205658591"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:13 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v4 0/8] drm/xe/madvise: Add support for purgeable buffer
 objects
Date: Tue, 20 Jan 2026 11:38:46 +0530
Message-ID: <20260120060900.3137984-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

This patch series introduces comprehensive support for purgeable buffer objects
in the Xe driver, enabling userspace to provide memory usage hints for better
memory management under system pressure.

Overview:

Purgeable memory allows applications to mark buffer objects as "not currently
needed" (DONTNEED), making them eligible for kernel reclamation during memory
pressure. This helps prevent OOM conditions and enables more efficient GPU
memory utilization for workloads with temporary or regeneratable data (caches,
intermediate results, decoded frames, etc.).

Purgeable BO Lifecycle:
1. WILLNEED (default): BO actively needed, kernel preserves backing store
2. DONTNEED (user hint): BO contents discardable, eligible for purging
3. PURGED (kernel action): Backing store reclaimed during memory pressure

Key Design Principles:
  - i915 compatibility: "Once purged, always purged" semantics - purged BOs
    remain permanently invalid and must be destroyed/recreated
  - Per-VMA state tracking: Each VMA tracks its own purgeable state, BO is
    only marked DONTNEED when ALL VMAs across ALL VMs agree (Thomas Hellström)
  - Safety first: Imported/exported dma-bufs blocked from purgeable state -
    no visibility into external device usage (Matt Roper)
  - Multiple protection layers: Validation in madvise, VM bind, mmap, and
    fault handlers
  - Async TLB invalidation: Uses xe_bo_trigger_rebind() for non-blocking
    GPU mapping invalidation
  - Scratch PTE support: Fault-mode VMs use scratch pages for safe zero reads
    on purged BO access.
  - Purgeable state is not applied to imported/exported dma-bufs,
    those BOs always behave as WILLNEED.
  - TTM shrinker integration: Encapsulated helpers manage xe_ttm_tt->purgeable
    flag and shrinker page accounting (shrinkable vs purgeable buckets)

v2 Changes:
  - Reordered patches: Moved shared BO helper before main implementation for
    proper dependency order
  - Fixed reference counting in mmap offset validation (use drm_gem_object_put)
  - Removed incorrect claims about madvise(WILLNEED) restoring purged BOs
  - Fixed error code documentation inconsistencies
  - Initialize purge_state_val fields to prevent kernel memory leaks
  - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
  - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
  - Implement i915-compatible retained field logic (Thomas Hellström)
  - Skip BO validation for purged BOs in page fault handler (crash fix)
  - Add scratch VM check in page fault path (non-scratch VMs fail fault)

v3 Changes (addressing Matt and Thomas Hellström feedback):
  - Per-VMA purgeable state tracking: Added xe_vma->purgeable_state field
  - Complete VMA check: xe_bo_all_vmas_dontneed() walks all VMAs across all
    VMs to ensure unanimous DONTNEED before marking BO purgeable
  - VMA unbind recheck: Added xe_bo_recheck_purgeable_on_vma_unbind() to
    re-evaluate BO state when VMAs are destroyed
  - Block external dma-bufs: Added xe_bo_is_external_dmabuf() check using
    drm_gem_is_imported() and obj->dma_buf to prevent purging imported/exported BOs
  - Consistent lockdep enforcement: Added xe_bo_assert_held() to all helpers
    that access madv_purgeable state
  - Simplified page table logic: Renamed is_null to is_null_or_purged in
    xe_pt_stage_bind_entry() - purged BOs treated identically to null VMAs
  - Removed unnecessary checks: Dropped redundant "&& bo" check in xe_ttm_bo_purge()
  - Xe-specific warnings: Changed drm_warn() to XE_WARN_ON() in purge path
  - Moved purge checks under locks: Purge state validation now done after
    acquiring dma-resv lock in vma_lock_and_validate() and xe_pagefault_begin()
  - Race-free fault handling: Removed unlocked purge check from
    xe_pagefault_handle_vma(), moved to locked xe_pagefault_begin()
  - Shrinker helper functions: Added xe_bo_set_purgeable_shrinker() and
    xe_bo_clear_purgeable_shrinker() to encapsulate TTM purgeable flag updates
    and shrinker page accounting, improving code clarity and maintainability

v4 Changes (addressing Matt and Thomas Hellström feedback):
  - UAPI: Removed '__u64 reserved' field from purge_state_val union to fit
    16-byte size constraint (Matt)
  - Changed madv_purgeable from atomic_t to u32 across all patches (Matt)
  - CPU fault handling: Added purged check to fastpath (xe_bo_cpu_fault_fastpath)
    to prevent hang when accessing existing mmap of purged BO

Arvind Yadav (7):
  drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
  drm/xe/madvise: Implement purgeable buffer object support
  drm/xe/bo: Handle CPU faults on purged buffer objects
  drm/xe/vm: Prevent binding of purged buffer objects
  drm/xe/madvise: Implement per-VMA purgeable state tracking
  drm/xe/madvise: Block imported and exported dma-bufs
  drm/xe/bo: Add purgeable shrinker state helpers

Himal Prasad Ghimiray (1):
  drm/xe/uapi: Add UAPI support for purgeable buffer objects

 drivers/gpu/drm/xe/xe_bo.c         | 127 +++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h         |  59 ++++++++
 drivers/gpu/drm/xe/xe_bo_types.h   |   3 +
 drivers/gpu/drm/xe/xe_pagefault.c  |  12 ++
 drivers/gpu/drm/xe/xe_pt.c         |  38 +++++-
 drivers/gpu/drm/xe/xe_vm.c         |  46 +++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 210 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  11 ++
 include/uapi/drm/xe_drm.h          |  37 +++++
 10 files changed, 519 insertions(+), 27 deletions(-)

-- 
2.43.0

