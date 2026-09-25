Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216BDC9832E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828DD10FC5A;
	Fri, 25 Sep 2026 20:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPowoA2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913EE10FC3B
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367332; x=1821903332;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fClb5MYA46BYRscYdQ4SA4w/l+2RHWV8jOst7TF1uSY=;
 b=bPowoA2Dcnq+cPsvEWGswURuwRR1ed+AsRHn+SQjjpJTeo1iD2Xw4hlU
 7pvd+EnZxhJSJE+Go+w/zbWsBpysjjXA5eciSxkKB79CxmjzCtDf07ISg
 NqsTH7ZaV7g+E1j5GPis3sOhHKBjKzgO/WGC50FqwQ53xZ8E02WO8eaFQ
 fRJ4Agr9pJch73DuO0aJwB+xtda5KBgQENYWih2sg9pC/OpPZ5PYJfXsK
 aYecC5uDG1RmukeWTlYjYky9TNm0u/oKPmguoTzTiBcyGno4tIC5X9kjQ
 xT0qPyf3Q+sn2u1pEsOhFOFwn8S3nRR+/4Ynlh1lgG2vpSBbEygdV6pJ3 g==;
X-CSE-ConnectionGUID: iPATR4VPTgO2TGbi3iz0/g==
X-CSE-MsgGUID: 3a0Z56u6Q8mLDK2rob1TMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377933"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377933"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:31 -0700
X-CSE-ConnectionGUID: inRAQvSkTXy9kJXeQq/XqQ==
X-CSE-MsgGUID: nPkRetIYRzSWTfww6I//Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509837"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 00/24] CPU binds and ULLS on migration queue
Date: Fri, 25 Sep 2026 13:15:02 -0700
Message-Id: <20260925201526.1355279-1-matthew.brost@intel.com>
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

We now have data demonstrating the need for CPU binds and ULLS on the
migration queue, based on results generated from [1].

On BMG, measurements show that when the GPU is continuously processing
faults, copy jobs run approximately 30–40µs faster (depending on the
test case) with ULLS compared to traditional GuC submission with SLPC
enabled on the migration queue. Startup from a cold GPU shows an even
larger speedup. Given the critical nature of fault performance, ULLS
appears to be a worthwhile feature.

In addition to driver telemetry, UMD compute benchmarks consistently
show multiple GB/s improvement in pagefault benchmarks with ULLS enabled.

ULLS will consume more power (not yet measured) due to a continuously
running batch on the paging engine. However, compute UMDs already do
this on engines exposed to users, so this seems like a worthwhile
tradeoff. To mitigate power concerns, ULLS will exit after a period of
time in which no faults have been processed.

CPU binds are required for ULLS to function, as the migration queue
needs exclusive access to the paging hardware engine. Thus, CPU binds
are included here.

Beyond being a requirement for ULLS, CPU binds should also reduce
VM-bind latency, provide clearer multi-tile and TLB-invalidation
layering, reduce pressure on GuC during fault storms as it is bypassed,
and decouple kernel binds from unrelated copy/clear jobs—especially
beneficial when faults are serviced in parallel. In a parallel-faulting
test case, average bind time was reduced by approximately 15µs. In the
worst case, 2MB copy time (~60–140µs) × (number of pagefault threads −
1) of latency would otherwise be added to a single fault. Reducing this
latency increases overall throughput of the fault handler.

This series can be merged in phases:

Phase 1: CPU binds (patches 1–13)
Phase 2: CPU-bind components and multi-tile relayers (patches 14–17)
Phase 3: ULLS on the migration execution queue (patches 18–24)

v2:
 - Use delayed worker to exit ULLS mode in an effort to save on power
 - Various other cleanups
v3:
 - CPU bind component, multi-tile relayer
 - Split CPU bind patches in many small patches
v4:
 - Rebase, address feedback, add ULLS doc patch
v5:
 - Address Sashiko feedback, fix checkpatch issues
v6:
 - Reworked ULLS to drop KMD MMIO ring tail write, move this to ring
   instruction(s)
 - Several other small cleanups based on Sashiko feedback
v7:
 - Drop XE_BO_FLAG_PUT_VM_ASYNC in favor PT BOs holding a VM ref
 - configfs to ULLS enable and period
 - Migrate ULLS implementation style cleanups
 - Address various feedback
v8:
 - s/%d/%u
 - One last CI / Sashiko run before merging

Matt

[1] https://patchwork.freedesktop.org/series/149811/

Matthew Brost (24):
  drm/xe: reference VM from PT BOs
  drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear
    vfuns
  drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
  drm/xe: Decouple exec queue idle check from LRC
  drm/xe: Add job count to GuC exec queue snapshot
  drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
  drm/xe: Update scheduler job layer to support PT jobs
  drm/xe: Add helpers to access PT ops
  drm/xe: Add struct xe_pt_job_ops
  drm/xe: Update GuC submission backend to run PT jobs
  drm/xe: Store level in struct xe_vm_pgtable_update
  drm/xe: Don't use migrate exec queue for page fault binds
  drm/xe: Enable CPU binds for jobs
  drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
  drm/xe: Make bind queues operate cross-tile
  drm/xe: Add CPU bind layer
  drm/xe: Add device flag to enable PT mirroring across tiles
  drm/xe: Add ULLS support to LRC
  drm/xe: Add ULLS migration job support to migration layer
  drm/xe: Add ULLS migration job support to ring ops
  drm/xe: Add ULLS migration job support to GuC submission
  drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
  drm/xe: add migrate ULLS period configfs attribute
  drm/xe: Document ULLS for migration jobs

 Documentation/gpu/xe/xe_migrate.rst      |   3 +
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_bo.c               |   4 +-
 drivers/gpu/drm/xe/xe_bo.h               |  10 +-
 drivers/gpu/drm/xe/xe_bo_types.h         |   2 -
 drivers/gpu/drm/xe/xe_configfs.c         |  67 ++
 drivers/gpu/drm/xe/xe_configfs.h         |   2 +
 drivers/gpu/drm/xe/xe_cpu_bind.c         | 296 +++++++++
 drivers/gpu/drm/xe/xe_cpu_bind.h         | 111 ++++
 drivers/gpu/drm/xe/xe_device.c           |   5 +
 drivers/gpu/drm/xe/xe_device_types.h     |   6 +
 drivers/gpu/drm/xe/xe_drm_client.c       |   2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 163 ++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |  16 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  20 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |  76 ++-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |   2 +
 drivers/gpu/drm/xe/xe_lrc.c              |  73 +++
 drivers/gpu/drm/xe/xe_lrc.h              |   4 +
 drivers/gpu/drm/xe/xe_lrc_types.h        |   4 +
 drivers/gpu/drm/xe/xe_migrate.c          | 769 ++++++++++------------
 drivers/gpu/drm/xe/xe_migrate.h          |  95 +--
 drivers/gpu/drm/xe/xe_pagefault.c        |   3 +
 drivers/gpu/drm/xe/xe_pci.c              |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   3 +-
 drivers/gpu/drm/xe/xe_pt.c               | 781 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h               |  12 +-
 drivers/gpu/drm/xe/xe_pt_types.h         |  49 +-
 drivers/gpu/drm/xe/xe_ring_ops.c         |  75 +++
 drivers/gpu/drm/xe/xe_ring_ops_types.h   |  24 +
 drivers/gpu/drm/xe/xe_sched_job.c        | 103 ++-
 drivers/gpu/drm/xe/xe_sched_job.h        |  56 ++
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  49 +-
 drivers/gpu/drm/xe/xe_sync.c             |  20 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  28 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   4 +-
 drivers/gpu/drm/xe/xe_trace.h            |   2 +-
 drivers/gpu/drm/xe/xe_vm.c               | 242 +++----
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  12 +-
 40 files changed, 1988 insertions(+), 1211 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.c
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.h

-- 
2.34.1

