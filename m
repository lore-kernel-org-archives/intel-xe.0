Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD474CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4AF10F368;
	Thu, 21 May 2026 14:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGmNo9rn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D2510F368
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374946; x=1810910946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lqfxmaRqoNBmZhWLPAwlz0AaeOhG57bz9/+e95m2Shk=;
 b=lGmNo9rnr7HFob4Mp+qDevh6tBtwxKy/ntSnRL8ykdQQtFfMV760IWoN
 ZbgelrhRq1ocGElbswHvuAkWpI1WSTA1FIF9LbxSMJ5/MmOnRjzm86dkY
 XYVwD0+35cbhvyLpUqEVFGhM6e77L5XUk0yO9sB2l8LKkaXrSNBVlkQCv
 ee6z4xhxd/UsHtMYB9ROX5fny2eu0SJCUFfmvdayAjqjqs4mRpFB4OTje
 fTWLKMrzxZO8M9brQDTxU7hinsF9Wd4QkR83GbxKlvt004VeCKbBcsMIK
 gXmvV50BMVWykb0PqEiTBzbAtA6mc6N7sx2QDBSfB7c0xdIFwFyVkCHlM A==;
X-CSE-ConnectionGUID: IAClwGBDQVm50jdDjE5hCw==
X-CSE-MsgGUID: ACyztjqVRVKHM+1aROhVLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80194432"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80194432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:05 -0700
X-CSE-ConnectionGUID: vegTjWVnSaOzoK43/jEpPg==
X-CSE-MsgGUID: /F6YQE6hSrmt1EyO/+UPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="270893334"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/4] drm/xe/guc: Don't ban LR VM exec queues on PM suspend
Date: Thu, 21 May 2026 16:48:35 +0200
Message-ID: <20260521144837.7363-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
References: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
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

When xe_guc_submit_stop() is called during an S3/S4 suspend or GT reset,
guc_exec_queue_stop() bans any user exec queue that has a job which has
started but not yet completed.  For normal (non-LR) exec queues this is
the correct behaviour: a started-but-incomplete job at reset time may
indicate a hung workload.

For exec queues attached to Long Running (LR) VMs the same condition is
always true during normal operation: LR jobs are designed to run
indefinitely and are never "completed" in the DRM scheduler sense —
they are preempted and resumed via the preempt-fence mechanism.
Banning such an exec queue on PM suspend permanently prevents the job
from restarting after resume, causing the userspace compute workload to
fail silently.

Fix this by skipping the ban for LR VM exec queues when a system
suspend or hibernation is in progress (pm_sleep_transition_in_progress()).
On GT reset the ban logic is preserved: a hung LR workload should still
be caught.

Fixes: f6375fb3aa94 ("drm/xe: Track LR jobs in DRM scheduler pending list")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.19+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  8 ++++----
 drivers/gpu/drm/xe/xe_guc_submit.c           | 11 ++++++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 8ee76f958dc2..1207d51cf770 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -50,10 +50,10 @@ struct xe_guc_exec_queue {
 	/** @suspend_pending: a suspend of the exec_queue is pending */
 	bool suspend_pending;
 	/**
-	 * @suspend_count: number of active suspend requests, protected by
-	 * @sched.msg_lock. The exec_queue is kept suspended as long as this
-	 * is non-zero. Transitions 0->1 send the SUSPEND message; transitions
-	 * 1->0 send the RESUME message.
+	 * @suspend_count: Reference count of active suspend requests. The
+	 * exec_queue remains suspended while this is non-zero, allowing
+	 * multiple concurrent callers to independently hold a suspend without
+	 * prematurely re-enabling the queue. Protected by @sched.msg_lock.
 	 */
 	int suspend_count;
 	/**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 50b622cf0c30..d1111b80fbed 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -9,6 +9,7 @@
 #include <linux/bitmap.h>
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
+#include <linux/suspend.h>
 
 #include <drm/drm_managed.h>
 
@@ -2274,8 +2275,16 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	 * Ban any engine (aside from kernel and engines used for VM ops) with a
 	 * started but not complete job or if a job has gone through a GT reset
 	 * more than twice.
+	 *
+	 * LR VM exec queues are excluded from this ban during PM suspend: their
+	 * jobs are intentionally long-running and are preempted and resumed via
+	 * the preempt-fence mechanism. Banning them on PM suspend would
+	 * permanently prevent the job from restarting after resume.
+	 * On GT reset however we do want to ban them, as that may indicate a
+	 * genuinely hung workload.
 	 */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM)) &&
+	    !(q->vm && xe_vm_in_lr_mode(q->vm) && pm_sleep_transition_in_progress())) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		bool ban = false;
 
-- 
2.54.0

