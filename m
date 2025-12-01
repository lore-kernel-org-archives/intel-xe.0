Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD20D116E2
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E0010E116;
	Mon,  1 Dec 2025 05:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMa/oq5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D2910E116
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568426; x=1796104426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O6DbZ95TGWw6M+Zwv47AuuiPuHILIwLi7BHVKFe12S8=;
 b=XMa/oq5r5luDn89q3WjVUXfLBkk1OZ/B4jsfQEQ5jfvvk5FRrUQSFHD4
 7aW3Hyxd7u8331XllV5PM6nU5ntdCROVt7ouD7bAKVCBRkXCUhTQqqsKa
 /TUKITG6ynjnczbF5xRZDM3rxUq91KX4mymyn+jhFgjgtfmvUE057FCdC
 erAenrCYedDnTi6xg9DR2Kq7mdbpq4ykt/7Sh+7NRj5knQDQynCEFBxP+
 aD5nCGydmxUkRy81BeBQByfQRuLHfdvfMnuRUDkbmV6AJ+C3oqrV7CP4P
 yDAAw/yKWCwVr2Gov25R05vC7ndLBSPRKhNygr0TlM/YpO+b0wnBV5shk A==;
X-CSE-ConnectionGUID: rMA7rhxnRCmj2UErvaRCBQ==
X-CSE-MsgGUID: HH+sVfSbSCOL793r4+ikjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457377"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:45 -0800
X-CSE-ConnectionGUID: 9ii+9hO8TlCihuNIvz6HOA==
X-CSE-MsgGUID: OCFmlpn6SbCFc0cWciJjvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950814"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:43 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 0/9] drm/xe/madvise: Add support for purgeable buffer objects
Date: Mon,  1 Dec 2025 11:20:10 +0530
Message-ID: <20251201055309.854074-1-arvind.yadav@intel.com>
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
  - Safety first: Only non-shared BOs can be marked DONTNEED to prevent
    multi-process data corruption
  - Multiple protection layers: Validation in madvise, VM bind, mmap, and
    fault handlers
  - Async TLB invalidation: Uses xe_bo_trigger_rebind() for non-blocking
    GPU mapping invalidation
  - Scratch PTE support: Fault-mode VMs use scratch pages for safe zero reads
    on purged BO access

Error Handling:
  - CPU access (mmap): Returns VM_FAULT_SIGBUS (SIGBUS signal to process)
  - GPU access (non-scratch VM): Page fault fails with -EACCES, GPU context reset
  - GPU access (scratch VM): Page fault succeeds, rebinds with scratch PTEs
  - VM_BIND operations: MAP/PREFETCH rejected with -EINVAL
  - Mmap offset ioctl: Rejected with -EINVAL for early error detection

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
 

Arvind Yadav (7):
  drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
  drm/xe/bo: Prevent purging of shared buffer objects
  drm/xe/madvise: Implement purgeable buffer object support
  drm/xe/bo: Handle CPU faults on purged buffer objects
  drm/xe/bo: Prevent mmap of purged buffer objects
  drm/xe/vm: Prevent binding of purged buffer objects
  drm/xe: Add support for querying purgeable BO states

Himal Prasad Ghimiray (2):
  drm/xe/uapi: Add UAPI support for purgeable buffer objects
  drm/xe/uapi: Add UAPI for purgeable bo state to madvise query response

 drivers/gpu/drm/xe/xe_bo.c           | 92 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h           | 57 +++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h     |  3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 19 ++++++
 drivers/gpu/drm/xe/xe_pt.c           | 13 +++-
 drivers/gpu/drm/xe/xe_vm.c           | 12 ++++
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 76 +++++++++++++++++++++++
 include/uapi/drm/xe_drm.h            | 50 ++++++++++++++-
 8 files changed, 308 insertions(+), 14 deletions(-)

-- 
2.43.0

