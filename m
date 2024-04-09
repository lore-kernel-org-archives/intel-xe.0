Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570C0CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954D112F14;
	Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEJC/KWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D505B10E96D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693093; x=1744229093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=suqEkyZKPMS1cY2n8XwskxZpNI9tXsGXx/986Y3rmjA=;
 b=FEJC/KWctOwD0iMbw3B/AwHR0UNcpNZp53aWIyifBwpydtHsl9DIdSxS
 EdGFx5WS4HS4S27P8G/72d8YpI1Ok06ODDwPKbCU6Wc3gZ4rzQ6/Q2s6D
 iAeTpgxrUvBslaL0j0RKU1K3dk11m74v0uNuLcSHeIRhzOFUaLKF9bomu
 nwKemaCe/k4JVLT55CvrWjTbcIWaCRJ3EirYQWIoP25AKdmYyIfgi+KzI
 1Pn/ff7NLX0d3NCwjaJAJg5cFGOgT90DO2aRCA5T9N2P4rcXxqUP4oOmW
 JEggSENQ5mazTzYg/aCs60cRExesA376+Ro16LkEnfyQchTIT/+S51Wbg Q==;
X-CSE-ConnectionGUID: 6cqAHaQDT+iCvhorws7A7Q==
X-CSE-MsgGUID: VwMh0btbTDe+qlB0tiK7xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803740"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
X-CSE-ConnectionGUID: SdpYDAiKR2ifDHrSqXEuwQ==
X-CSE-MsgGUID: Hm6uXfYWT7aw6ezjkTqcjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773710"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:51 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 00/31] Basic system allocator support in xe driver
Date: Tue,  9 Apr 2024 16:17:11 -0400
Message-Id: <20240409201742.3042626-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This is the v2 of basic system allocator support in xe kmd driver.
v1 is here: https://lore.kernel.org/dri-devel/20240117221223.18540-1-oak.zeng@intel.com/

Significant design changes were made since v1, based on drm community
review feedback:

1) Introduce vm_bind uAPI for system allocator. With this uAPI, user can
optionally bind CPU virtual address range A..B to GPU virtual address
range C..D. Right now we force A..B == C..D since we don't have
a valid use case where A..B != C..D. But the interface is built so we
can extend easily in the future if valid use case come out. See patch
3 to 8 for this work.

2) Unify system allocator and user ptr code. Now system allocator and
userptr share the same codes for gpu page table programming, mmu
interval notifier and vma invalidation, page fault handling and lock
design. The codes are more unified.

This work is built on top of Matt Brost's huge vm_bind refactor series.
The first patch is a squash of Matt's 30 patch series for reference
purpose.

This work is still at its early stage. It is sent out so we can get some
early eyes on it. We are open to any comments and suggestions.

The work that are planned in our bucket are:

*Virtual address range based memory attributes and hints: We plan to
expose uAPI for user to set memory attributes such as preferred location
or migration granularity etc to a virtual address range. This is
important to tune SVM performance.

*GPU vram eviction: One key design choice of this series is, SVM
layer allocate GPU memory directly from drm buddy allocator, instead
of from xe vram manager. There is no BO (buffer object) concept
in this implementation. The key benefit of this approach is we can
migrate memory at page granularity easily. This also means SVM bypasses
TTM's memory eviction logic. But we want the SVM memory and BO driver
memory can mutually evicted each other. We have some prove of concept
work to rework TTM resource manager for this purpose, see
https://lore.kernel.org/dri-devel/20231102043306.2931989-1-oak.zeng@intel.com/
We will continue work on that series then implement SVM's eviction
function based on the concept of shared drm LRU list b/t SVM and TTM/BO
driver.

* Try 1 vma with N PT_state for system allocator and userptr. One
gigantic vma to hold address space initial default constant state
and N PT_state to hold mutable page table state. Also try to register
only one mmu interval notifier for the whole address range.

* Multiple GPU device support

Matthew Brost (7):
  drm/xe: Refactor vm_bind
  drm/xe: Invalidate userptr VMA on page pin fault
  drm/xe: Drop unused arguments from vm_bind_ioctl_ops_parse
  drm/xe: Fix op->tile_mask for fault mode
  drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag
  drm/xe: Create userptr if page fault occurs on system_allocator VMA
  drm/xe: Add faulted userptr VMA garbage collector

Oak Zeng (24):
  drm/xe/svm: Add SVM document
  drm/xe: Introduce helper to populate userptr
  drm/xe: Introduce a helper to free sg table
  drm/xe: Use hmm_range_fault to populate user pages
  drm/xe/svm: Remap and provide memmap backing for GPU vram
  drm/xe/svm: Introduce DRM_XE_SVM kernel config
  drm/xe: Introduce helper to get tile from memory region
  drm/xe: Introduce a helper to get dpa from pfn
  drm/xe/svm: Get xe memory region from page
  drm/xe: Get xe_vma from xe_userptr
  drm/xe/svm: Build userptr sg table for device pages
  drm/xe/svm: Determine a vma is backed by device memory
  drm/xe: add xe lock document
  drm/xe/svm: Introduce svm migration function
  drm/xe/svm: implement functions to allocate and free device memory
  drm/xe/svm: Trace buddy block allocation and free
  drm/xe/svm: Create and destroy xe svm
  drm/xe/svm: Add vm to xe_svm process
  drm/xe: Make function lookup_vma public
  drm/xe/svm: Handle CPU page fault
  drm/xe/svm: Introduce helper to migrate vma to vram
  drm/xe/svm: trace svm migration
  drm/xe/svm: Add a helper to determine a vma is fault userptr
  drm/xe/svm: Migration from sram to vram for system allocator

 Documentation/gpu/xe/index.rst              |    2 +
 Documentation/gpu/xe/xe_lock.rst            |    8 +
 Documentation/gpu/xe/xe_svm.rst             |    8 +
 drivers/gpu/drm/xe/Kconfig                  |   22 +
 drivers/gpu/drm/xe/Makefile                 |    6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c       |   86 -
 drivers/gpu/drm/xe/xe_bo.c                  |    7 +-
 drivers/gpu/drm/xe/xe_bo.h                  |    4 +-
 drivers/gpu/drm/xe/xe_device.c              |   35 +
 drivers/gpu/drm/xe/xe_device.h              |   10 +
 drivers/gpu/drm/xe/xe_device_types.h        |   24 +
 drivers/gpu/drm/xe/xe_exec.c                |   41 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |  120 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   20 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   52 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   59 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    3 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |   22 +-
 drivers/gpu/drm/xe/xe_hmm.c                 |  329 ++++
 drivers/gpu/drm/xe/xe_hmm.h                 |   18 +
 drivers/gpu/drm/xe/xe_lock_doc.h            |  113 ++
 drivers/gpu/drm/xe/xe_migrate.c             |  602 ++++---
 drivers/gpu/drm/xe/xe_migrate.h             |   53 +-
 drivers/gpu/drm/xe/xe_mmio.c                |    6 +
 drivers/gpu/drm/xe/xe_pci.c                 |    1 +
 drivers/gpu/drm/xe/xe_pt.c                  | 1301 +++++++++-----
 drivers/gpu/drm/xe/xe_pt.h                  |   15 +-
 drivers/gpu/drm/xe/xe_pt_exec_queue.c       |  180 ++
 drivers/gpu/drm/xe/xe_pt_exec_queue.h       |   14 +
 drivers/gpu/drm/xe/xe_pt_types.h            |   53 +
 drivers/gpu/drm/xe/xe_sched_job.c           |   68 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h     |   31 +-
 drivers/gpu/drm/xe/xe_svm.c                 |  122 ++
 drivers/gpu/drm/xe/xe_svm.h                 |   88 +
 drivers/gpu/drm/xe/xe_svm_devmem.c          |  231 +++
 drivers/gpu/drm/xe/xe_svm_doc.h             |  121 ++
 drivers/gpu/drm/xe/xe_svm_migrate.c         |  340 ++++
 drivers/gpu/drm/xe/xe_sync.c                |   15 +
 drivers/gpu/drm/xe/xe_sync.h                |    1 +
 drivers/gpu/drm/xe/xe_tile.c                |    7 +
 drivers/gpu/drm/xe/xe_trace.h               |   69 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |    1 +
 drivers/gpu/drm/xe/xe_vm.c                  | 1768 ++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                  |   40 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  229 ++-
 include/drm/xe_pciids.h                     |   16 +
 include/uapi/drm/xe_drm.h                   |   15 +-
 47 files changed, 4432 insertions(+), 1944 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_lock.rst
 create mode 100644 Documentation/gpu/xe/xe_svm.rst
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
 create mode 100644 drivers/gpu/drm/xe/xe_lock_doc.h
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm_doc.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c

-- 
2.26.3

