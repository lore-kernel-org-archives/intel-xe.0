Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD958C55171
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 23:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900F710E271;
	Fri, 31 Jul 2026 23:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SomoHl21";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EF410E271
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785540392; x=1817076392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXAYCFPsruel9OIoS+Kt7fOv3m6RkdN1DG937/q8HqE=;
 b=SomoHl218wHYYG7eb/4KjJij/P5EsCkH0HzI/2mg1OrF1phpGvdI4QMt
 /QT4qfv14njRKJZ/TYUl+njxKwUxCmfX78ulGZYD/jn2nITo7exeZR4is
 M0Q7kHLWYMzEOVZAT/vdl6xJXF+cRIBbJCZrIdrI98LJ/G5YFdJGAPeyS
 fITPFbMNB/Nv5p6/iNQa1lAf8NSsCE1WIDs++Yz8eFv0X6DwyZ5PXKL4D
 TcYzB/lQ3nmS5YESatwXuMpN6uSo7l5Q19p/AzS0MtdSdbp9BG5L+/lLZ
 f6iEJaR8pe39PzOxknfZwFE9Nrlvl6lEchz6zDcH3PrzpWX0EwGGp59zu w==;
X-CSE-ConnectionGUID: Ly6VOZr8SyaDnzXljW6SiQ==
X-CSE-MsgGUID: y+d9fvTPShy0UhV8L4azCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86120834"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="86120834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:31 -0700
X-CSE-ConnectionGUID: 5rIlvql1TIioL9KJNfgN5A==
X-CSE-MsgGUID: zNq5svWgR32RJsnNpr//7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="260112410"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 1/4] drm/xe: split VF pause into prepare and revert phases
Date: Fri, 31 Jul 2026 16:26:24 -0700
Message-ID: <20260731232625.3313657-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
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

Extract xe_sched_submission_stop() + cancel_delayed_work_sync() into a
new guc_exec_queue_pause_prepare() helper, then call it in a first pass
over all queues before the existing revert loop in
xe_guc_submit_pause_vf().

In a multi-queue group a secondary's run_job() can register the primary
queue, which must not race an in-progress revert of a sibling queue.
Stopping every scheduler before reverting any queue prevents that race.

No functional change outside the VF migration path.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8aaed4fd13ea..314747336fb9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2737,17 +2737,24 @@ static void lrc_parallel_clear(struct xe_lrc *lrc)
  * during VF resume flows. The function scans the queue state, make adjustments
  * as needed, and queues jobs / messages which replayed upon unpause.
  */
-static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
+static void guc_exec_queue_pause_prepare(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_job *job;
-	int i;
 
 	lockdep_assert_held(&guc->submission_state.lock);
 
 	/* Stop scheduling + flush any DRM scheduler operations */
 	xe_sched_submission_stop(sched);
 	cancel_delayed_work_sync(&sched->base.work_tdr);
+}
+
+static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_job *job;
+	int i;
+
+	lockdep_assert_held(&guc->submission_state.lock);
 
 	guc_exec_queue_revert_pending_state_change(guc, q);
 
@@ -2806,6 +2813,19 @@ void xe_guc_submit_pause_vf(struct xe_guc *guc)
 	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
 
 	mutex_lock(&guc->submission_state.lock);
+	/*
+	 * Stop all schedulers before reverting any queue: in a multi-queue
+	 * group a secondary's run_job() can register the primary, which must
+	 * not race an in-progress revert.
+	 */
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		/* Prevent redundant attempts to stop parallel queues */
+		if (q->guc->id != index)
+			continue;
+
+		guc_exec_queue_pause_prepare(guc, q);
+	}
+
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
 		/* Prevent redundant attempts to stop parallel queues */
 		if (q->guc->id != index)
-- 
2.43.0

