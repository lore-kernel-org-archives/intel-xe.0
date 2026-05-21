Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F69CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BE610F353;
	Thu, 21 May 2026 14:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0VK7GrJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C1B10F353
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374941; x=1810910941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LyNzqoxLQ60O27pMQFuEAr4rEdfStp2V1DQzGHRl5vs=;
 b=B0VK7GrJ2B99Pc7NT9Hu2/8Nxeeb84IcJsXUgAFTTWzPhMN4fepwmvDq
 cAgRsGWFv0GiyqRgi4iQxUs4iI73LNPajEp9EcXimKdt4/OTR0r/UrEaU
 F3tBH+OMMsuDc+YypiyYTp/daLt+hFwUAuTfO13HMgcPJUJcM5qkjsLIX
 jJ1B7CiKxHKCkOsrCUzYnuZc32eSRs4JdqZRathClelBXAEavU9kubVw3
 BoOdNgjpMjIhGzeeVRYeOihj8CUPIBQbI/J9Rc+XgnFpSHMeLnbnLxnGi
 lB2oeXnislNJLKwquv9cEINER/gPgRxH/Dz4o2HOW2FT2vB7xQmhGJzpq g==;
X-CSE-ConnectionGUID: SlY1AlMpSkebAOd7UBawSA==
X-CSE-MsgGUID: mCYWCQNfQlK10Qrw2Euf2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80194427"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80194427"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:01 -0700
X-CSE-ConnectionGUID: JaoEq+vDRySj9adaITPkYg==
X-CSE-MsgGUID: LgunHRBTSqyA46mwMvPqMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="270893321"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:48:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/4] drm/xe: Fix LR exec queue suspend/resume for S3/S4
Date: Thu, 21 May 2026 16:48:33 +0200
Message-ID: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Long Running (LR) exec queues — used by compute workloads with SVM
(fault-mode) and by preempt-fence-mode — were not surviving S3/S4
suspend/resume correctly.  Four distinct problems are addressed:

1. Exec queue ops (guc_exec_queue_suspend/resume) lacked coordination
   when multiple paths (PM, mode switching, preempt fences) needed to
   hold the queue suspended simultaneously.  A suspend refcount ensures
   the GuC SUSPEND message is only sent when the first caller suspends,
   and the RESUME message only when the last caller resumes.

2. During PM suspend, guc_exec_queue_stop() banned any user exec queue
   that had a started-but-incomplete job.  For LR queues this is always
   true — their jobs are designed to run indefinitely — so every PM
   suspend permanently banned the queue.  The ban is now suppressed for
   LR VM exec queues during PM suspend or hibernation while being
   preserved for GT reset (legitimate hang detection).

3. Userspace LRC buffer objects carried XE_BO_FLAG_PINNED_LATE_RESTORE,
   deferring their VRAM restore to after xe_gt_resume().  However,
   xe_gt_resume() drives context registration, which requires valid LRC
   VRAM.  Dropping the flag moves the restore to xe_bo_restore_early(),
   a CPU/BAR copy that runs before xe_gt_resume(), fixing the ordering.

4. Fault-mode (SVM) VMs use GPU page faults to access memory.  A
   running fault-mode job can re-fault pages torn down by VRAM eviction,
   racing with the eviction.  A new xe_suspend_all_faulting_lr_jobs()
   call in the PM notifier stops all fault-mode queues and waits for GuC
   acknowledgement before eviction begins.  On resume,
   xe_resume_all_faulting_lr_jobs() mirrors the same iteration to
   re-register and resume exactly those queues.  A per-group pm_suspended
   flag (protected by mode_sem) prevents new fault-mode exec queues from
   slipping through unsuspended while PM suspend is in progress.

Note: A prerequisite revert ("Revert drm/xe: Skip exec queue schedule
toggle if queue is idle during suspend") was already sent as a separate
patch and is not included here.

Thomas Hellström (4):
  drm/xe/guc: Add suspend refcount to exec queue ops
  drm/xe/guc: Don't ban LR VM exec queues on PM suspend
  drm/xe: Restore userspace LRC BOs early on resume
  drm/xe: Suspend fault-mode LR jobs before VRAM eviction on S3/S4

 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   7 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h  |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  60 +++++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   1 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 158 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |   7 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                    |  15 +-
 9 files changed, 239 insertions(+), 21 deletions(-)

-- 
2.54.0

