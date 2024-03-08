Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64946C54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9EB10FB99;
	Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lThPalJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41310F966
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874473; x=1741410473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=teMtPc6nk2Rpm9sQXq93DG7MUjnpoGi0q9srsOXXD2c=;
 b=lThPalJ75twO238VoJ/HypjVvNO4wG3qF6BvR3LrYXuJrpc2I1nMINAC
 ITc5yHd4wdFVd/UlOgf3++JY5frZNRXWQhqX4Ys1iMtFikerxS0RJ6/Q+
 xZ4+f9MlfN5WHs4tJMLMs2GgPLViGAlUuydd8O7bX144BNzb6iXZyL2Qp
 RBYhYrX1Fbl5Dxf8bo9z4l9GvXeytrjNuu50R1yNiSAz5FU5r5rlfQydd
 5+I/SodAxFS8AKiApGsAARuHO+28G1FluW/F2gaq7mB/DaVYaminwPAxo
 Biwo6TAHpFLioX6Hb+cpFOWSM0PPIbx2twigqpqbopnXLXdyEp/4Jtgo5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761952"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761952"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10402965"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 00/30] Refactor VM bind code
Date: Thu,  7 Mar 2024 21:07:36 -0800
Message-Id: <20240308050806.577176-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Broken into roughly 5 parts:
Part 1: Prep patches, patches 1-14
Part 2: 1 jobs per VM bind IOCTL and error handling, patches 15-23
Part 3: CPU binds, patches 24-27
Part 4: Error injection for testing, patch 28
Part 5: PT exec queues 29-30

For reviewing, let's focus on part 1 for now and see if patches from
that part can start to get merged.

Tested with [1] and new error handling appears to be working. Also
tested with existing tests at every patch in the series and should be
working at every patch in the series.

Latest version includes some of Thomas's patches too [2].

Matt

[1] https://patchwork.freedesktop.org/series/129606/
[2] https://patchwork.freedesktop.org/series/130871/

Matthew Brost (28):
  drm/xe: Lock all gpuva ops during VM bind IOCTL
  drm/xe: Add ops_execute function which returns a fence
  drm/xe: Move migrate to prefetch to op_lock function
  drm/xe: Add struct xe_vma_ops abstraction
  drm/xe: Update xe_vm_rebind to use dummy VMA operations
  drm/xe: Simplify VM bind IOCTL error handling and cleanup
  drm/xe: Update pagefaults to use dummy VMA operations
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add some members to xe_vma_ops
  drm/xe: Add vm_bind_ioctl_ops_install_fences helper
  drm/xe: Move setting last fence to vm_bind_ioctl_ops_install_fences
  drm/xe: Move ufence check to op_lock
  drm/xe: Move ufence add to vm_bind_ioctl_ops_install_fences
  drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use
    this
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Use ordered WQ for TLB invalidation fences
  drm/xe: Delete PT update selftest
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Remove old functions defs in xe_pt.h
  drm/xe: Update PT layer with better error handling
  drm/xe: Update VM trace events
  drm/xe: Update clear / populate arguments
  drm/xe: Add __xe_migrate_update_pgtables_cpu helper
  drm/xe: CPU binds for jobs
  drm/xe: Don't use migrate exec queue for page fault binds
  drm/xe: Add VM bind IOCTL error injection
  drm/xe/guc: Assert time'd out jobs are not from a VM exec queue
  drm/xe: Add PT exec queues

Thomas Hellström (2):
  drm/xe: Update xe_vm_rebind to return int
  drm/xe: Move vma rebinding to the drm_exec locking loop

 drivers/gpu/drm/xe/Makefile                 |    1 +
 drivers/gpu/drm/xe/tests/xe_migrate.c       |   86 --
 drivers/gpu/drm/xe/xe_bo.c                  |    7 +-
 drivers/gpu/drm/xe/xe_bo.h                  |    4 +-
 drivers/gpu/drm/xe/xe_device.c              |   35 +
 drivers/gpu/drm/xe/xe_device.h              |    2 +
 drivers/gpu/drm/xe/xe_device_types.h        |   16 +
 drivers/gpu/drm/xe/xe_exec.c                |   41 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |  120 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   20 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   10 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   59 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    3 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |   22 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  385 ++----
 drivers/gpu/drm/xe/xe_migrate.h             |   46 +-
 drivers/gpu/drm/xe/xe_pt.c                  | 1236 ++++++++++++-------
 drivers/gpu/drm/xe/xe_pt.h                  |   15 +-
 drivers/gpu/drm/xe/xe_pt_exec_queue.c       |  180 +++
 drivers/gpu/drm/xe/xe_pt_exec_queue.h       |   14 +
 drivers/gpu/drm/xe/xe_pt_types.h            |   53 +
 drivers/gpu/drm/xe/xe_sched_job.c           |   68 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h     |   31 +-
 drivers/gpu/drm/xe/xe_sync.c                |   15 +
 drivers/gpu/drm/xe/xe_sync.h                |    1 +
 drivers/gpu/drm/xe/xe_trace.h               |   21 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 1124 ++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                  |    9 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  198 +--
 29 files changed, 2118 insertions(+), 1704 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.h

-- 
2.34.1

