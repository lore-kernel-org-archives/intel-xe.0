Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE02CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B681910E697;
	Wed, 24 Sep 2025 01:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOYVY3uJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F60E10E690
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676568; x=1790212568;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4c48A7P0jOOPX51815bKlMWdrcTKQP+XBlj5gsO3w8U=;
 b=MOYVY3uJpoLtbTb3LrnuRyqPSmvIyCOEFUeKhqPyfsromdR0oEAcqOQ1
 zoC5ngXLu8m3zJsSHXUeUZVI/pO0llQVjRES4U/+Kcg+iyYzVraouIb+D
 YPjztzItZjgsWUvP4BzGPbvxvlDeqX3aZyiGSlpWkFIywfQyqAybTQCDf
 BanA3zD5qr3KSNfC2L9vN7v1DiJ6A8z9kJtsw6dNMAnypQudJw+4EW8++
 7tjXi8gQlD/Z7rrtEncW6VFjWckFInYuWGiNFtusbCnB9Qy+zCE9mATgg
 EIx+dyulBfdIyZRTefSpYBP0WmUFttSji1kdQRl3ceaN4tDKSGBPNaFVc A==;
X-CSE-ConnectionGUID: vdYPMdYcTTioPT+k+K24ng==
X-CSE-MsgGUID: nM5uS4XhS9ansMKfL8Ztqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908245"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908245"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:07 -0700
X-CSE-ConnectionGUID: QWjC2HkkRtSfYjDzOPTdhg==
X-CSE-MsgGUID: zR+YNiCATrSTjeewGZbNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841779"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/34] VF migration redesign
Date: Tue, 23 Sep 2025 18:15:27 -0700
Message-Id: <20250924011601.888293-1-matthew.brost@intel.com>
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

Matt

[1] https://patchwork.freedesktop.org/series/154616/ 
[2] https://patchwork.freedesktop.org/series/154931/
[3] https://patchwork.freedesktop.org/series/154682/

Matthew Brost (31):
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
  drm/xe/vf: Add xe_gt_sriov_vf_recovery_inprogress helper
  drm/xe/vf: Make VF recovery run on per-GT worker
  drm/xe/vf: Abort H2G sends during VF post-migration recovery
  drm/xe/vf: Remove memory allocations from VF post migration recovery
  drm/xe/vf: Close multi-GT GGTT shift race
  drm/xe/vf: Teardown VF post migration worker on driver unload
  drm/xe/vf: Don't allow GT reset to be queued during VF post migration
    recovery
  drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
  drm/xe/vf: Extra debug on GGTT shift
  drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
  drm/xe/vf: Stop and flush CTs in VF post migration recovery
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

Tomasz Lis (1):
  drm/xe/vf: Lock querying GGTT config during driver init

 Documentation/gpu/xe/index.rst               |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h     |   8 -
 drivers/gpu/drm/xe/xe_device_types.h         |   2 +
 drivers/gpu/drm/xe/xe_exec.c                 |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  86 +-
 drivers/gpu/drm/xe/xe_exec_queue.h           |   5 +-
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
 drivers/gpu/drm/xe/xe_gt.c                   |  25 +-
 drivers/gpu/drm/xe/xe_gt.h                   |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          | 417 ++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h          |  10 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h    |  36 +-
 drivers/gpu/drm/xe/xe_guc.c                  |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c               | 284 ++-----
 drivers/gpu/drm/xe/xe_guc_ct.h               |   4 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 790 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h           |   7 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |   2 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |  10 +
 drivers/gpu/drm/xe/xe_map.h                  |  18 -
 drivers/gpu/drm/xe/xe_memirq.c               |  48 +-
 drivers/gpu/drm/xe/xe_memirq.h               |   3 +
 drivers/gpu/drm/xe/xe_migrate.c              |  28 +-
 drivers/gpu/drm/xe/xe_pci.c                  |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h            |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c             |  23 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   9 +
 drivers/gpu/drm/xe/xe_sriov.c                |   8 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c             | 243 +-----
 drivers/gpu/drm/xe/xe_sriov_vf.h             |   3 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c         |  24 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h         |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_types.h       |   4 -
 drivers/gpu/drm/xe/xe_tile.c                 |   2 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c        |   6 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h        |   1 -
 39 files changed, 1369 insertions(+), 797 deletions(-)

-- 
2.34.1

