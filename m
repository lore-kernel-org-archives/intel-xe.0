Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E57DC79F81
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F08810ECCE;
	Thu,  3 Sep 2026 23:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGPvDF2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EECB10E198
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479929; x=1820015929;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K+lBxwuktgEm/Qf0dUt07kGDFoIAgFq+iTjlK0nSBrs=;
 b=RGPvDF2jqUe5aTpjFqdn6oaAJwFwr/rt9dbU3uOFC3vOCv47K0LiTQg5
 +jUTMne/J2uc9XzwKpMvSe9TUdLdvuih0DYIC4O15fuNqNCDa+9xf3N/U
 3+nxHGZmgGYs6UVpkXYf8+DuMmzeqv+YFa6qjmqdMKGyi++uhU74T0j29
 4coTPF524h7xNpizLmQtTeR9vaa8Os9B3//ZXGtKtMsetwuOT+nT9e7tW
 G2E0tNWYo3uo6NoBDibifaDT8oWZ3AuuU0rW4oS5lZ1IwXatQvrqx269u
 /SxsQgvFQ3T9N6K+4WoOp2AuaXMXswQNGh9CTAD4p3nKbNgeqN4ejxAo+ Q==;
X-CSE-ConnectionGUID: 7NOf2s9kSSqbc28uh+5NtQ==
X-CSE-MsgGUID: cyvcjI3FR1WKHGiBMd2T6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637800"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
X-CSE-ConnectionGUID: hej1R/5WShGNrjV5PVAkJg==
X-CSE-MsgGUID: w8Hr2qEDS121QOkJJk37pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029027"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 00/25] CPU binds and ULLS on migration queue
Date: Thu,  3 Sep 2026 16:58:17 -0700
Message-Id: <20260903235842.3401722-1-matthew.brost@intel.com>
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
Phase 3: ULLS on the migration execution queue (patches 18–25)

v2:
 - Use delayed worker to exit ULLS mode in an effort to save on power
 - Various other cleanups
v3:
 - CPU bind component, multi-tile relayer
 - Split CPU bind patches in many small patches
v4:
 - Rebase, address feedback, add ULLS doc patch

Matt

[1] https://patchwork.freedesktop.org/series/149811/

Matthew Brost (25):
  drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear
    vfuns
  drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
  drm/xe: Decouple exec queue idle check from LRC
  drm/xe: Add job count to GuC exec queue snapshot
  drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
  drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
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
  drm/xe: Add xe_hw_engine_write_ring_tail
  drm/xe: Add ULLS support to LRC
  drm/xe: Add ULLS migration job support to migration layer
  drm/xe: Add ULLS migration job support to ring ops
  drm/xe: Add ULLS migration job support to GuC submission
  drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
  drm/xe: Add modparam to enable / disable ULLS on migrate queue
  drm/xe: Document ULLS for migration jobs

 Documentation/gpu/xe/xe_migrate.rst      |   3 +
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_bo.c               |   8 +-
 drivers/gpu/drm/xe/xe_bo.h               |  11 +-
 drivers/gpu/drm/xe/xe_bo_types.h         |   2 -
 drivers/gpu/drm/xe/xe_cpu_bind.c         | 295 +++++++++
 drivers/gpu/drm/xe/xe_cpu_bind.h         | 118 ++++
 drivers/gpu/drm/xe/xe_debugfs.c          |   1 +
 drivers/gpu/drm/xe/xe_defaults.h         |   1 +
 drivers/gpu/drm/xe/xe_device.c           |   6 +
 drivers/gpu/drm/xe/xe_device_types.h     |  11 +
 drivers/gpu/drm/xe/xe_drm_client.c       |   2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 164 ++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |  16 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  20 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |  78 ++-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  20 +
 drivers/gpu/drm/xe/xe_hw_engine.h        |   1 +
 drivers/gpu/drm/xe/xe_lrc.c              |  51 ++
 drivers/gpu/drm/xe/xe_lrc.h              |   3 +
 drivers/gpu/drm/xe/xe_lrc_types.h        |   4 +
 drivers/gpu/drm/xe/xe_migrate.c          | 694 +++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h          |  94 +--
 drivers/gpu/drm/xe/xe_module.c           |   4 +
 drivers/gpu/drm/xe/xe_module.h           |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c        |   3 +
 drivers/gpu/drm/xe/xe_pci.c              |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   3 +-
 drivers/gpu/drm/xe/xe_pt.c               | 782 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h               |  12 +-
 drivers/gpu/drm/xe/xe_pt_types.h         |  49 +-
 drivers/gpu/drm/xe/xe_ring_ops.c         |  32 +
 drivers/gpu/drm/xe/xe_sched_job.c        | 101 ++-
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  36 +-
 drivers/gpu/drm/xe/xe_sync.c             |  20 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  28 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   4 +-
 drivers/gpu/drm/xe/xe_vm.c               | 240 +++----
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  12 +-
 41 files changed, 1751 insertions(+), 1187 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.c
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.h

-- 
2.34.1

