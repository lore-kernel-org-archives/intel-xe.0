Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC247CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999A910E78F;
	Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGL6y6cW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21010E787
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384447; x=1790920447;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vOE5WMlgE8dou72ESlW2eewVoJJV8MbfueB2gEU4PTE=;
 b=cGL6y6cWyaLnV+6zxjSTzq6B4qDDKQpj6NOJPaqBK6fl45uxxuuitNVC
 YZlVHLT5LkDCy01kSMWXxfYkl5LwEjRe1u5ZwUXw3xTiGWjd4ca3hf70j
 zTjS6oxXavTf4iFqxnNhlcajkgyNhsX0XNa2QrY0tH04PaM0VbaQBg9AV
 Hhmc3atjuDE/5QSDIqVFJDgXpt9bmQkyCN7RRGf53sldikf9dfy/nLBaj
 LQX0rCydqk7iebKxfs2JCLWe/a6jVTSwStYaUdyiDID1KGrGXlusdhA+C
 hve23HWYfy0BnF8wprXfl2BxfjvJLSwLUUAU0cuHRXL/rxtQUzf42z5FG g==;
X-CSE-ConnectionGUID: dOaAnw3dRS6AFbT/WSRing==
X-CSE-MsgGUID: AACkqFsPR+mLk+d870A/uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304493"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304493"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:06 -0700
X-CSE-ConnectionGUID: 2vRDTRIYRMKwiu7KzcAEUQ==
X-CSE-MsgGUID: LIo7o6xVS+KdMBnI8D27QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083522"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 00/34] VF migration redesign
Date: Wed,  1 Oct 2025 22:53:28 -0700
Message-Id: <20251002055402.1865880-1-matthew.brost@intel.com>
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

Matt

[1] https://patchwork.freedesktop.org/series/154616/ 
[2] https://patchwork.freedesktop.org/series/154931/
[3] https://patchwork.freedesktop.org/series/154682/

Matthew Brost (32):
  drm/xe: Add NULL checks to scratch LRC allocation
  Revert "drm/xe/vf: Rebase exec queue parallel commands during
    migration recovery"
  Revert "drm/xe/vf: Post migration, repopulate ring area for pending
    request"
  Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"
  drm/xe: Save off position in ring in which a job was programmed
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list
  drm/xe: Don't change LRC ring head on job resubmission
  drm/xe: Make LRC W/A scratch buffer usage consistent
  drm/xe/guc: Document GuC submission backend
  drm/xe/vf: Add xe_gt_recovery_inprogress helper
  drm/xe/vf: Make VF recovery run on per-GT worker
  drm/xe/vf: Abort H2G sends during VF post-migration recovery
  drm/xe/vf: Remove memory allocations from VF post migration recovery
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

 Documentation/gpu/xe/index.rst               |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h     |   8 -
 drivers/gpu/drm/xe/xe_device_types.h         |   5 +
 drivers/gpu/drm/xe/xe_exec.c                 |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  86 +-
 drivers/gpu/drm/xe/xe_exec_queue.h           |   5 +-
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
 drivers/gpu/drm/xe/xe_gt.c                   |  37 +-
 drivers/gpu/drm/xe/xe_gt.h                   |  15 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          | 465 ++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h    |  33 +-
 drivers/gpu/drm/xe/xe_guc.c                  |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c               | 304 +++----
 drivers/gpu/drm/xe/xe_guc_ct.h               |   4 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 834 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h           |   7 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |  12 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |  10 +
 drivers/gpu/drm/xe/xe_map.h                  |  18 -
 drivers/gpu/drm/xe/xe_memirq.c               |  48 +-
 drivers/gpu/drm/xe/xe_memirq.h               |   2 +
 drivers/gpu/drm/xe/xe_migrate.c              |  28 +-
 drivers/gpu/drm/xe/xe_pci.c                  |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h            |   1 +
 drivers/gpu/drm/xe/xe_preempt_fence.c        |  11 +
 drivers/gpu/drm/xe/xe_ring_ops.c             |  23 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   9 +
 drivers/gpu/drm/xe/xe_sriov_vf.c             | 243 ------
 drivers/gpu/drm/xe/xe_sriov_vf.h             |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c         |  28 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h         |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_types.h       |   4 -
 drivers/gpu/drm/xe/xe_tile.c                 |   2 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c        |  30 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h        |   2 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h  |  23 +
 drivers/gpu/drm/xe/xe_vm.c                   |  26 +-
 drivers/gpu/drm/xe/xe_vram.c                 |   6 +-
 42 files changed, 1513 insertions(+), 887 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h

-- 
2.34.1

