Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83BECD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 20:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C5110EB70;
	Fri, 12 Jun 2026 20:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWHERxJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2836810EB70
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781297603; x=1812833603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mk/GGUfDigXWrLM9O5smpZtyHAqb0Jk3l2ANZjsl1vs=;
 b=cWHERxJwq6+eQOdChQa+aeCAAszZVNhGoYGUHoTwouLAKnTrv9h/+ibv
 sSHAfmyLHLAjHyivRh7Z7dSj+vlwl31xYir+QCE5lank7ICTwqOyPdnpq
 WCIH7SBQt6p7ev0e3j64XC73ALAmry+/rC4HYnAR6Cdm91SK/OmPzTm+O
 B3QR+EIE+XNqZho9ggeEmcWMxSZR1cohIgeeC4mXdYhE54gILAJjT5g3g
 nmBvaerU4hZnfjqsoyA9Q3WHyPplHf/l7/nEV/SdPom5XRecutyJZ5d+m
 i1xv7lLAG0+7l1ifBFIM9gXFISyaj9Bnsbj1axLeicSxht8ZbO79KzPEe A==;
X-CSE-ConnectionGUID: qL4LknQWRFedb+Xz9ZRpwA==
X-CSE-MsgGUID: 3q2bvl4WSXas24CpahNKHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85767641"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="85767641"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 13:53:23 -0700
X-CSE-ConnectionGUID: tb0+qkRtTuud8164l/fYNg==
X-CSE-MsgGUID: XwfUD4OHSSKJk78c7nZg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="285016460"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 13:53:20 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 stuart.summers@intel.com, matthew.brost@intel.com, ayaz.siddiqui@intel.com,
 daniele.ceraolospurio@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, niranjana.vishwanathapura@intel.com
Subject: [PATCH] drm/xe/guc: Suppress Memory CAT error messages on race
 condition
Date: Sat, 13 Jun 2026 04:53:17 +0800
Message-ID: <20260612205317.269228-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

There is a brief window of time between queue group start and stop where
if the KMD issues a page fault response to GuC, the GuC will be unable
to respond properly because the queue will have been evicted from
hardware.  This is expected, as multi queue groups run asynchronously
and thus offer no strict ordering guarantees.

Temporarily prevent this message from being sent while a multi queue is
being evicted.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_types.h  |  5 +++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afe5d99cdd8b..5468bcc940f2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -602,6 +602,8 @@ static void xe_guc_exec_queue_group_stop(struct xe_exec_queue *q)
 	list_for_each_entry(eq, &tmp, multi_queue.link)
 		xe_sched_submission_stop(&eq->guc->sched);
 
+	atomic_inc(&exec_queue_to_guc(q)->submission_state.multi_queue_evicted);
+
 	mutex_lock(&group->list_lock);
 	list_for_each_entry_safe(eq, next, &tmp, multi_queue.link) {
 		/*
@@ -633,6 +635,8 @@ static void xe_guc_exec_queue_group_start(struct xe_exec_queue *q)
 	list_for_each_entry(eq, &group->list, multi_queue.link)
 		xe_sched_submission_start(&eq->guc->sched);
 	mutex_unlock(&group->list_lock);
+
+	atomic_dec(&exec_queue_to_guc(q)->submission_state.multi_queue_evicted);
 }
 
 static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
@@ -1677,7 +1681,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		xe_guc_exec_queue_group_start(q);
 	else
 		xe_sched_submission_start(sched);
+	return DRM_GPU_SCHED_STAT_NO_HANG;
+
 handle_vf_resume:
+	/*
+	 * multi_queue_evicted is normally decremented by
+	 * xe_guc_exec_queue_group_start, but since we aren't running that in
+	 * this error path, we need to decrement it separately here.
+	 */
+	if (xe_exec_queue_is_multi_queue(q))
+		atomic_dec(&guc->submission_state.multi_queue_evicted);
+
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
@@ -2990,8 +3004,12 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 		/*
 		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
 		 * context. In such case only PF will be notified about that fault.
+		 *
+		 * This fault may be expected if it comes from a multi queue post
+		 * eviction, so don't report those.
 		 */
-		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
+		if (!atomic_read(&guc->submission_state.multi_queue_evicted))
+			xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index c7b9642b41ba..d19e9a899e61 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -91,6 +91,11 @@ struct xe_guc {
 		 * an operation which is sensitive to resets.
 		 */
 		atomic_t reset_blocked;
+		/**
+		 * @submission_state.multi_queue_evicted: A multi queue exec queue
+		 * is currently in the process of being evicted.
+		 */
+		atomic_t multi_queue_evicted;
 		/** @submission_state.lock: protects submission state */
 		struct mutex lock;
 		/** @submission_state.enabled: submission is enabled */
-- 
2.53.0

