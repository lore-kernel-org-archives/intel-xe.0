Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F763C5518F
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 23:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5E010E471;
	Mon,  3 Aug 2026 23:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VICV36+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E4C10E3C7
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785798339; x=1817334339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5N/uctwRCnT5T7RvdARjy86dCABzWs/esRtooP318HU=;
 b=VICV36+nNnCDfeT8jJHd5GJz9PshXRK8DogCVixEAR+Dr45XkAqFs/lM
 fBdVlFNCQK68xVg2ntIoB+mS9Zqdhr+erYCF4x1sqY1JYTEWwnxZvtHV8
 t5yqNuvNV66KzOacUBOgareCpphMrx3TalaARAHPMgxtbXVMRKJCWx5KU
 LsuuU9EmgKadT+Bx5dQpWAi6wDHyUjTClOAI0usABCgnj46icHwLBHsME
 rKV8elbT0qDJHEfQb/NgKsETE0WwXChNgqPwv2PbHhoDwSAG/wVOrQ5oV
 XYIt3MWlFaV9SPzobo7AU3zaWj45yhOHZzXtmWw23JdhlNXPnywIkEB7i w==;
X-CSE-ConnectionGUID: bmS2dvDCTsKrsUTspYsGTQ==
X-CSE-MsgGUID: Fr8sGKmmTGWza2l3UL0oEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111899766"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="111899766"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:38 -0700
X-CSE-ConnectionGUID: 1J+qeER7SIqg1ZkVidvt7w==
X-CSE-MsgGUID: JQ01QKCvRZigOeSzwMNoBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="255054428"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 1/4] drm/xe: split VF pause into prepare and revert phases
Date: Mon,  3 Aug 2026 16:05:30 -0700
Message-ID: <20260803230528.3428029-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803230528.3428029-6-niranjana.vishwanathapura@intel.com>
References: <20260803230528.3428029-6-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

