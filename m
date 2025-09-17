Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D039CA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3AB10E409;
	Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izySe2Y+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B890E10E408
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080781; x=1789616781;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+yo+iGpw+xh+6+8defCb4jXMcnhQgwPfxDxzK/zTEQc=;
 b=izySe2Y+zxNJmaqXKlHRwiY3uCm+EETo7CnjilFtCgwf1UbpL9onybxq
 zeDSqthC64AwDmJ74FLzJxr9BAzVpq0/yQNfBZdBgvhbj/bTdCAfh+tt5
 HqiyJhO/FFEvbhfq7kEjuOMguXThRwfDnTFUDqFXHwhhZc0tdbP8j8rSM
 GmwlRiyCHtA39RGDT2dqu1cMcPd+lmzEW6Uq2XsFcltWVKW1xqnEkPM3j
 5I6zARMZuB6s/KlIt5szqpYaX3lPqY6VJH7fTIWlf95rbRiLruqNSLCIG
 5b+Lhmni+AO0dMpORWYzqvTFVwL0XwDbSuCloYykO1hChdPUB/SzNUR+f g==;
X-CSE-ConnectionGUID: 2Gwor7TLSLy2pl7D45+taw==
X-CSE-MsgGUID: TLqsOKXrSmKsozkgvzLM/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060781"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060781"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:20 -0700
X-CSE-ConnectionGUID: FW0xCUPrRCm4FGoH9+xYOQ==
X-CSE-MsgGUID: OBX4L4MzT5WUuPK16Kkp5Q==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/28] VF migration redesign 
Date: Tue, 16 Sep 2025 20:45:47 -0700
Message-Id: <20250917034615.3977603-1-matthew.brost@intel.com>
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

- A new series [1] that exercises active contexts and job resubmission.

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

Matt

[1] https://patchwork.freedesktop.org/series/154616/ 

Matthew Brost (27):
  Revert "drm/xe/vf: Rebase exec queue parallel commands during
    migration recovery"
  Revert "drm/xe/vf: Post migration, repopulate ring area for pending
    request"
  Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"
  drm/xe: Save off position in ring in which a job was programmed
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list
  drm/xe: Don't change LRC ring head on job resubmission
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

Tomasz Lis (1):
  drm/xe/vf: Lock querying GGTT config during driver init

 Documentation/gpu/xe/index.rst               |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h     |   8 -
 drivers/gpu/drm/xe/xe_exec.c                 |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  81 +-
 drivers/gpu/drm/xe/xe_exec_queue.h           |   5 +-
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
 drivers/gpu/drm/xe/xe_gt.c                   |   9 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          | 362 +++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h          |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h    |  31 +-
 drivers/gpu/drm/xe/xe_guc.c                  |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c               | 282 ++-----
 drivers/gpu/drm/xe/xe_guc_ct.h               |   4 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 790 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h           |   7 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |  10 +
 drivers/gpu/drm/xe/xe_map.h                  |  18 -
 drivers/gpu/drm/xe/xe_memirq.c               |  48 +-
 drivers/gpu/drm/xe/xe_memirq.h               |   3 +
 drivers/gpu/drm/xe/xe_ring_ops.c             |  23 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   9 +
 drivers/gpu/drm/xe/xe_sriov.c                |   8 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c             | 243 +-----
 drivers/gpu/drm/xe/xe_sriov_vf.h             |   3 +-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h       |   4 -
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c        |   6 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h        |   1 -
 30 files changed, 1232 insertions(+), 779 deletions(-)

-- 
2.34.1

