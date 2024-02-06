Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A30C4829B
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B54112F66;
	Tue,  6 Feb 2024 23:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6QMut/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C630B112F64
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262614; x=1738798614;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=imv3dgKLHcK6g7RaPnLbYCvnU3QkJA3PAkl9yb1h1LE=;
 b=f6QMut/ISW/iF3Sm/YqRCRusNmwJ3KP4VXwfaLkGd9p4Hnueuo+ExjGl
 sJJ0zlk30rdLY4Io7wwuhjO0y6RTg76WEc5eMfB4fuwN/nvBouf//g65p
 Dp/4f+6IBhMJ3Zc/CD6R0kMoyDQz6cUow75JovOnhK1nanV3YbB6WbvZ3
 nfUmy7ffgAxM3Wi40kKFf2jmYo6i+cK3CNb6uA8RT/L3o5Zt5mnXUi+KU
 9sCWHd1/DyvnDZQGJ/uMKi3AKL0vbpHxhuP3CFVcV5qMnxR8IhrCQnACM
 KhFcB/BCQe6lPYij+/jfy2bTpdrhti20/p41EBgWYlwNHEyLqgzXXkBJI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776782"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776782"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793771"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 00/22] Refactor VM bind code
Date: Tue,  6 Feb 2024 15:37:07 -0800
Message-Id: <20240206233729.3173206-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Implement proper error handling for VM bind IOCTL by allowing failures
of GPU memory allocation (either system or VRAM) to be propagated to
user without corrupting VM state. Mainly implemented by converting VM
bind IOCTL to 1 job per IOCTL rather than potential many jobs.

Broken into roughly 4 parts:
Part 1: Prep patches, patches 1-11
Part 2: 1 jobs per VM bind IOCTL and error handling, patches 12-17
Part 3: CPU binds, patches 18-21
Part 4: Error injection for testing, patch 22

For reviewing, let's focus on part 1 for now and see if patches from
that part can start to get merged.

Tested with [1] and new error handling appears to be working. Also
tested with existing tests at every patch in the series and should be
working at every patch in the series.

Matt

[1] https://patchwork.freedesktop.org/series/129606/

Matthew Brost (22):
  drm/xe: Lock all gpuva ops during VM bind IOCTL
  drm/xe: Add ops_execute function which returns a fence
  drm/xe: Move migrate to prefetch to op_lock funtion
  drm/xe: Add struct xe_vma_ops abstraction
  drm/xe: Update xe_vm_rebind to use dummy VMA operations
  drm/xe: Simplify VM bind IOCTL error handling and cleanup
  drm/xe: Update pagefaults to use dummy VMA operations
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add vm_bind_ioctl_ops_install_fences helper
  drm/xe: Move setting last fence to vm_bind_ioctl_ops_install_fences
  drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use
    this
  drm/xe: Add some members to xe_vma_ops
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Remove old functions defs in xe_pt.h
  drm/xe: Update PT layer with better error handling
  drm/xe: Update VM trace events
  drm/xe: Update clear / populate arguments
  drm/xe: Add __xe_migrate_update_pgtables_cpu helper
  drm/xe: CPU binds for jobs
  drm/xe: Don't use migrate exec queue for page fault binds
  drm/xe: Add VM bind IOCTL error injection

 drivers/gpu/drm/xe/xe_bo.c                  |    7 +-
 drivers/gpu/drm/xe/xe_bo.h                  |    4 +-
 drivers/gpu/drm/xe/xe_device.c              |   35 +
 drivers/gpu/drm/xe/xe_device.h              |    2 +
 drivers/gpu/drm/xe/xe_device_types.h        |   16 +
 drivers/gpu/drm/xe/xe_exec.c                |   25 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   10 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   60 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    3 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |   47 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  387 ++----
 drivers/gpu/drm/xe/xe_migrate.h             |   46 +-
 drivers/gpu/drm/xe/xe_pt.c                  | 1223 ++++++++++++-------
 drivers/gpu/drm/xe/xe_pt.h                  |   15 +-
 drivers/gpu/drm/xe/xe_pt_types.h            |   53 +
 drivers/gpu/drm/xe/xe_sched_job.c           |   24 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h     |   31 +-
 drivers/gpu/drm/xe/xe_trace.h               |   10 +-
 drivers/gpu/drm/xe/xe_vm.c                  |  980 +++++++--------
 drivers/gpu/drm/xe/xe_vm.h                  |    7 +
 drivers/gpu/drm/xe/xe_vm_types.h            |  198 +--
 21 files changed, 1773 insertions(+), 1410 deletions(-)

-- 
2.34.1

