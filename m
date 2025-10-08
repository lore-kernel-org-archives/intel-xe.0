Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DA7CCD184
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AC310E885;
	Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG9JDxlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4D610E87D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946708; x=1791482708;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2go42xWGqJYsJep3kVUzDeLM+RUj2F+t+vmeWY+kZ2U=;
 b=XG9JDxlMesqBStgsfyE0eFbEQ+EAtPfHPaFH/0oJBnLRyStVvdHY8zCJ
 47XO5L8DUXviV4rMCEkTF4+MXQGQyFiWCwrGfo/0l2poR87btQB8ojJ6Z
 EXSYjP4eoVt8cTS2PI1FEDv8/JnOERBcf79ABUQRkRirS1qkH1wHdZk6R
 /PXgJJobqcFpBixHR8+1dZXXoKqQwM//4HXF1UzXEmx/3KtjLxcdRfGZQ
 Y7o/3zN0tG/7Mu2a1zkrToQ+Ao5MbbrwSimsI+UZKOjUOP9pOH1RyyVVm
 4nWtLoL1E2wcAB9dGQ2QrFiJH+Mak4ayIZe0uUX6Vdq7iju3uuOAWWUwA A==;
X-CSE-ConnectionGUID: QLQHz+5QTqGbYLuA0tsHJg==
X-CSE-MsgGUID: 7gAifjgERU6urH+HtGva4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067510"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067510"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
X-CSE-ConnectionGUID: EGxOm7ryShi6GlYC8J5jNQ==
X-CSE-MsgGUID: 3BlwyQ3aQYeeU1GEewaqNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593715"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 00/34] VF migration redesign
Date: Wed,  8 Oct 2025 11:04:26 -0700
Message-Id: <20251008180500.3261209-1-matthew.brost@intel.com>
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

Rather than modifying buffers in place using GGTT addresses during VF
migration, this approach relies on the submission backend's stop/start
mechanism to issue fixups. The patch titled "Document GuC Submission
Backend" provides a detailed explanation of the design.

Testing was performed using an out-of-tree PF/VFIO driver with manual
triggering of VF migration while IGT test cases are running.

IGT test cases:

- A new series [1] that exercises active contexts, job resubmission, and
  compressd memory.

- A new test [2] that actively creates / destroys queue on each
  submission

- xe_exec_threads basic sections, which test context registration loss,
  schedule enable loss, and job resubmission.

- xe_exec_threads balancer sections, which follow the same flows as the 
  basic sections but include a work queue (GGTT address shift).

- xe_exec_threads compute mode user pointer invalidation sections, which
  exercise the same flow as the basic sections, plus replaying
  suspend/resume flows.

All code paths in "Replay GuC submission state on pause/unpause" that
replay state have been manually verified via debug messages "Add debug
prints for GuC replaying state during VF recovery".

v2:
 - Fix lockdep splat
 - Fix checkpatch
 - Fix PTL issue with LRC W/A buffer
 - Fix race creating / destroying queues across migration exposed by [2]
 - Include a version of Satya's patches in [3] which enable CCS save /
   restore across VF migration /w GGTT shift
v3:
 - Address feedback
 - Fix preempt fence mode deadlock /w work queues + VF recovery (Testing)
 - Add NULL checks to scratch LRC allocation
v4:
 - Fix CI failure
 - Remove config lock
v5:
 - Fix CI failures related to lockdep
 - Address various comments
v6:
 - Rebase for CI
v7:
 - Rework GGTT locking for shift
 - Address comments
 - Fix probe on non-migration VFs
v8:
 - Split a patch, address a nit
 - Fix probe on non-memirq VFs
v9:
 - Split GGTT race patch

Matt

Matthew Brost (32):
  drm/xe: Add NULL checks to scratch LRC allocation
  drm/xe: Save off position in ring in which a job was programmed
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list
  drm/xe: Return first unsignaled job first pending job helper
  drm/xe: Don't change LRC ring head on job resubmission
  drm/xe: Make LRC W/A scratch buffer usage consistent
  drm/xe/vf: Add xe_gt_recovery_pending helper
  drm/xe/vf: Make VF recovery run on per-GT worker
  drm/xe/vf: Abort H2G sends during VF post-migration recovery
  drm/xe/vf: Remove memory allocations from VF post migration recovery
  drm/xe: Move GGTT lock init to alloc
  drm/xe/vf: Move LMEM config to tile layer
  drm/xe/vf: Close multi-GT GGTT shift race
  drm/xe/vf: Teardown VF post migration worker on driver unload
  drm/xe/vf: Don't allow GT reset to be queued during VF post migration
    recovery
  drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
  drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs
    supporting migration
  drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
  drm/xe/vf: Flush and stop CTs in VF post migration recovery
  drm/xe/vf: Reset TLB invalidations during VF post migration recovery
  drm/xe/vf: Kickstart after resfix in VF post migration recovery
  drm/xe: Add CTB_H2G_BUFFER_OFFSET define
  drm/xe/vf: Start CTs before resfix VF post migration recovery
  drm/xe/vf: Abort VF post migration recovery on failure
  drm/xe/vf: Replay GuC submission state on pause / unpause
  drm/xe: Move queue init before LRC creation
  drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
  drm/xe/vf: Workaround for race condition in GuC firmware during VF
    pause
  drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
  drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
  drm/xe/vf: Rebase CCS save/restore BB GGTT addresses

Satyanarayana K V P (2):
  drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
  drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC

 drivers/gpu/drm/xe/xe_device_types.h         |   5 +
 drivers/gpu/drm/xe/xe_exec.c                 |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  64 ++-
 drivers/gpu/drm/xe/xe_exec_queue.h           |   2 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   3 +
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 |  39 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  27 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  29 +-
 drivers/gpu/drm/xe/xe_gt.c                   |  39 +-
 drivers/gpu/drm/xe/xe_gt.h                   |  13 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          | 462 ++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h          |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h    |  34 +-
 drivers/gpu/drm/xe/xe_guc.c                  |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c               | 124 ++++-
 drivers/gpu/drm/xe/xe_guc_ct.h               |  11 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 528 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.h           |   5 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |  15 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |  10 +
 drivers/gpu/drm/xe/xe_memirq.c               |  48 +-
 drivers/gpu/drm/xe/xe_memirq.h               |   2 +
 drivers/gpu/drm/xe/xe_migrate.c              |  28 +-
 drivers/gpu/drm/xe/xe_pci.c                  |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h            |   1 +
 drivers/gpu/drm/xe/xe_preempt_fence.c        |  11 +
 drivers/gpu/drm/xe/xe_ring_ops.c             |  23 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   9 +
 drivers/gpu/drm/xe/xe_sriov_vf.c             | 240 ---------
 drivers/gpu/drm/xe/xe_sriov_vf.h             |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c         |  28 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h         |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_types.h       |   4 -
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c        | 112 +++-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h        |   9 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h  |  23 +
 drivers/gpu/drm/xe/xe_vm.c                   |  26 +-
 drivers/gpu/drm/xe/xe_vram.c                 |   6 +-
 40 files changed, 1422 insertions(+), 604 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h

-- 
2.34.1

