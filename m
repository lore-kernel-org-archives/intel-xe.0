Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DFAEDA687
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6858B10E072;
	Tue,  3 Mar 2026 15:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQbakCUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5040610E072
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551238; x=1804087238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vZFcYr6AlJs5zFgvZoBgaZR4NRkwhn95WJCJa5UlfNs=;
 b=JQbakCUw/h16u56/YvbzavXDQjyfnTqr/7vGw67ZdDUYT8P7i4O6XNuV
 u//p4bJ7iMezYP0sn2UjBmnIj2qK5F9j95f3lFDZgRo3mdKIQiFj2jKER
 nWGHoV+TuUPVLAvkc9CAtOJ1WHJ0kDr2nNyKRTdIAgYgaXnGDHZbS5jGC
 r/oJrPsybfx3iCQoDx5IAPWUvHH0olZ8v17Vq8CHoxT8wnpOd++DNpDh/
 dn3Wvc93q79UWGF5u/qu+jouQXV6j6sT4KJ4u8eZd61YnNywlYYJ2SLaU
 4UbqnWVW8o1GQBplYCaSXs9LtCMfD/kK55FYNewJMU7TFwqjOjTsG4RgX Q==;
X-CSE-ConnectionGUID: BHPUWy3cQ12DxUwD9rCTJA==
X-CSE-MsgGUID: rZ8KssXBSiS7RUssT2PAkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73655899"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73655899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:38 -0800
X-CSE-ConnectionGUID: ew/7mFueQ4KEQQp68M42BQ==
X-CSE-MsgGUID: TKgfD+wcTeam/vJ/BhaB4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222506784"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:37 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 00/12] drm/xe/madvise: Add support for purgeable buffer
 objects
Date: Tue,  3 Mar 2026 20:49:56 +0530
Message-ID: <20260303152015.3499248-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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
  - Multiple protection layers: Validation in madvise, VM bind, mmap, CPU
    and GPU fault handlers. GPU page faults on DONTNEED BOs are rejected in
    xe_pagefault_begin() to preserve the GPU PTE invalidation done at madvise
    time; without this the rebind path would re-map real pages and undo the
    PTE zap, preventing the shrinker from ever reclaiming the BO.
  - Correct GPU PTE zapping: madvise_purgeable() explicitly sets
    skip_invalidation per VMA (false for DONTNEED, true for WILLNEED, purged
    and dmabuf-shared BOs) so DONTNEED always triggers a GPU PTE zap
    regardless of prior madvise state.
  - Scratch PTE support: Fault-mode VMs use scratch pages for safe zero reads
    on purged BO access.
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

v5 Changes (addressing Matt and Thomas Hellström feedback):
  - Add locking documentation to madv_purgeable field comment (Matt)
  - Introduce xe_bo_set_purgeable_state() helper (void return) to centralize
    madv_purgeable updates with xe_bo_assert_held() and state transition
    validation using explicit enum checks (no transition out of PURGED) (Matt)
  - Make xe_ttm_bo_purge() return int and propagate failures from
    xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g. no_wait_gpu
    paths) rather than silently ignoring (Matt)
  - Replace drm_WARN_ON with xe_assert for better Xe-specific assertions (Matt)
  - Hook purgeable handling into madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
    instead of special-case path in xe_vm_madvise_ioctl() (Matt)
  - Track purgeable retained return via xe_madvise_details and perform
    copy_to_user() from xe_madvise_details_fini() after locks are dropped (Matt)
  - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
    __maybe_unused on madvise_purgeable() to maintain bisectability until
    shrinker integration is complete in final patch (Matt)
  - Call xe_bo_recheck_purgeable_on_vma_unbind() from xe_vma_destroy()
    right after drm_gpuva_unlink() where we already hold the BO lock,
    drop the trylock-based late destroy path (Matt)
  - Move purgeable_state into xe_vma_mem_attr with the other madvise
    attributes (Matt)
  - Drop READ_ONCE since the BO lock already protects us (Matt)
  - Keep returning false when there are no VMAs - otherwise we'd mark
    BOs purgeable without any user hint (Matt)
  -  Use struct xe_vma_lock_and_validate_flags instead of multiple bool
    parameters to improve readability and prevent argument transposition (Matt)
  - Fix LRU crash while running shrink test
  - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
  - Split ghost BO and zero-refcount handling in xe_bo_shrink() (Thomas)

v6 Changes (addressing Jose Souza, Thomas Hellström and Matt Brost feedback):
  - Document DONTNEED blocking behavior in uAPI: Clearly describe which
    operations are blocked and with what error codes. (Thomas, Matt)
  - Block VM_BIND to DONTNEED BOs: Return -EBUSY to prevent creating new
    VMAs to purgeable BOs (undefined behavior). (Thomas, Matt)
  - Block CPU faults to DONTNEED BOs: Return VM_FAULT_SIGBUS in both fastpath
    and slowpath to prevent undefined behavior. (Thomas, Matt)
  - Block new mmap() to DONTNEED/purged BOs: Return -EBUSY for DONTNEED,
    -EINVAL for PURGED. (Thomas, Matt)
  - Block dma-buf export of DONTNEED/purged BOs: Return -EBUSY for DONTNEED,
    -EINVAL for PURGED. (Thomas, Matt)
  - Fix state transition bug: xe_bo_all_vmas_dontneed() now returns enum to
    distinguish NO_VMAS (preserve state) from WILLNEED (has active VMAs),
    preventing incorrect DONTNEED → WILLNEED flip on last VMA unmap (Matt)
  - Set skip_invalidation explicitly in madvise_purgeable() to ensure
    DONTNEED always zaps GPU PTEs regardless of prior madvise state.
  - Add DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for userspace
    feature detection. (Jose)

Arvind Yadav (11):
  drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
  drm/xe/madvise: Implement purgeable buffer object support
  drm/xe/bo: Block CPU faults to purgeable buffer objects
  drm/xe/vm: Prevent binding of purged buffer objects
  drm/xe/madvise: Implement per-VMA purgeable state tracking
  drm/xe/madvise: Block imported and exported dma-bufs
  drm/xe/bo: Block mmap of DONTNEED/purged BOs
  drm/xe/dma_buf: Block export of DONTNEED/purged BOs
  drm/xe/bo: Add purgeable shrinker state helpers
  drm/xe/madvise: Enable purgeable buffer object IOCTL support
  drm/xe/bo: Skip zero-refcount BOs in shrinker

Himal Prasad Ghimiray (1):
  drm/xe/uapi: Add UAPI support for purgeable buffer objects

 drivers/gpu/drm/xe/xe_bo.c         | 223 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h         |  60 ++++++
 drivers/gpu/drm/xe/xe_bo_types.h   |   6 +
 drivers/gpu/drm/xe/xe_dma_buf.c    |  21 +++
 drivers/gpu/drm/xe/xe_pagefault.c  |  19 ++
 drivers/gpu/drm/xe/xe_pt.c         |  40 +++-
 drivers/gpu/drm/xe/xe_query.c      |   2 +
 drivers/gpu/drm/xe/xe_svm.c        |   1 +
 drivers/gpu/drm/xe/xe_vm.c         | 100 ++++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 283 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  11 ++
 include/uapi/drm/xe_drm.h          |  60 ++++++
 13 files changed, 793 insertions(+), 36 deletions(-)

-- 
2.43.0

