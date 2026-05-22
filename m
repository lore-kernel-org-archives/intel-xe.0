Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF055CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 16:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731FD10E24F;
	Fri, 22 May 2026 16:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLJF5buY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5441110E036
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 16:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779468261; x=1811004261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mL0q2+8xcM2XmaZ4gVzQ+mHxSQofkHueecGAcJlZjm4=;
 b=GLJF5buY7G8Ds5kRo8h+y3DOEKXjCdPliHEPqX3ep5AiVAVFxL5OTNdx
 lzGm84yxeRf2lhDzjC+Oae4PgLB6kI39AChG+5dRngKdCrlAhnWiR8P9c
 EAYQbtKse3unDBlXHbhVKIGXB7nZ3vkAFbc3w1eC3LKCB5n5Nb/nKVW6J
 3ULnqhgeJyzA+L85zE90nb4JfxJR2whTUgio8e7n+ch6WWoLD+ilrmVaI
 Z+wGi8dNch3u7ZyQ0rBJDHKAm/3XF+XSGvE5iiflFBbY+OrLCrqcbZQRK
 5Azj4CvoBwhYx6fLq8amZVAd7qJBtVvPyBoQnutJHphCMr4AJVugKpbrO Q==;
X-CSE-ConnectionGUID: H6wJf0wSSdajRgYNTJSntQ==
X-CSE-MsgGUID: ZzZPQCYyQ8i4eKY++9oyhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80453387"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80453387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:21 -0700
X-CSE-ConnectionGUID: CFAGw7TdTVK0MesLIeZA+A==
X-CSE-MsgGUID: eG6tVPiuT4CdqchPvA1Fxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238370088"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.219])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/5] drm/xe: Fix LR exec queue suspend/resume for S3/S4
Date: Fri, 22 May 2026 18:43:50 +0200
Message-ID: <20260522164355.2773-1-thomas.hellstrom@linux.intel.com>
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
suspend/resume correctly.  Five distinct problems are addressed:

1. Exec queue scheduler start during resume was not deferred: user exec
   queue schedulers were started before page table BOs and LRC BOs were
   restored.  A job in this window would cause GuC to load a context
   from stale or invalid VRAM.  User exec queue schedulers are now
   deferred until after page tables and LRC BOs are restored.  Migrate
   and kernel VM queues are still started immediately as they are
   required by the restore process itself.

2. Exec queue suspend/resume lacked coordination when multiple paths
   (PM, mode switching, preempt fences) needed to hold the queue
   suspended simultaneously.  A resume from one path could prematurely
   re-enable a queue still held suspended by another.  Each caller can
   now independently hold a suspend; the queue resumes only when all
   callers have released it.

3. During PM suspend, any user exec queue with a started-but-incomplete
   job was banned.  For LR queues this is always true — their jobs are
   designed to run indefinitely — so every PM suspend permanently
   banned the queue.  The ban is now suppressed for LR VM exec queues
   during PM suspend or hibernation while being preserved for GT reset
   (legitimate hang detection).

4. The execution mode constant EXEC_MODE_LR in xe_hw_engine_group was
   misleading since not all long-running queues use fault mode.  It is
   renamed to EXEC_MODE_FAULT.  No functional change.

5. Fault-mode (SVM) VMs use GPU page faults to access memory.  A
   running fault-mode job can re-fault pages torn down by VRAM
   eviction, racing with the eviction.  Fault-mode exec queues are now
   suspended and drained before any VRAM eviction begins.  On resume,
   they are re-registered and restarted once hardware is restored.
   Exec queues created concurrently with PM suspend are immediately
   suspended so the resume path picks them up.

Note: A prerequisite revert ("Revert drm/xe: Skip exec queue schedule
toggle if queue is idle during suspend") was already sent as a separate
patch and is not included here.

v2:
 - Dropped "Restore userspace LRC BOs early on resume": replaced by
   patch 1/5 which defers user exec queue scheduler start until after
   page tables are restored, achieving the same ordering guarantee.
 - Added patch 1/5: Defer user exec queue scheduler start until after
   page table restore.
 - Added patch 4/5: Rename EXEC_MODE_LR to EXEC_MODE_FAULT.
 - Patch 5/5: see per-patch v2 changelog.

Thomas Hellström (5):
  drm/xe/guc: Defer user exec queue scheduler start until after page
    table restore
  drm/xe/guc: Don't ban LR VM exec queues on PM suspend
  drm/xe/guc: Add suspend refcount to exec queue ops
  drm/xe: Rename EXEC_MODE_LR to EXEC_MODE_FAULT in hw engine group
  drm/xe: Suspend fault-mode LR jobs before VRAM eviction on S3/S4

 drivers/gpu/drm/xe/xe_device_types.h          |   8 +
 drivers/gpu/drm/xe/xe_exec.c                  |   2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   7 +
 drivers/gpu/drm/xe/xe_gt.c                    |  16 ++
 drivers/gpu/drm/xe/xe_gt.h                    |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |  13 ++
 drivers/gpu/drm/xe/xe_guc.h                   |   1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h  |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 103 ++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 171 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  11 +-
 drivers/gpu/drm/xe/xe_pm.c                    |  26 ++-
 drivers/gpu/drm/xe/xe_uc.c                    |  16 ++
 drivers/gpu/drm/xe/xe_uc.h                    |   1 +
 16 files changed, 357 insertions(+), 32 deletions(-)

-- 
2.54.0

