Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9D5CCFA1F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF07510EB97;
	Fri,  7 Nov 2025 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0q5fL+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D864A10EB84
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5dMhNeKLH954EbScjXMsWKD6AoSs7rmfV8sk9wcGaI4=;
 b=O0q5fL+q/mFUKydJRmvFVdv5byjJSan1+ZEj2qR4ltPUYneWoN/udyBU
 uQgvmpKB66CvjsycY9Oki6mgVERRMcpbvkn1ptP0jFx+u64mAcn9JFoqg
 Q5DhRGafg/7CEWwCJXr3xCzeOZNb0kyM4W12CMyKG9gOh56mhDiD7A71V
 a7adY7CB5PvKhvnFU5uaW9U32zNpYnfzZWW9xFydv56xr5G7ozqPzM/nE
 UAJ7GhG/H0kEMYKKiTPxuqyZPuCFMCPC3Oqs0sIGzP+p40iaXClJJiL5q
 VNPdi7bMlqEAEjqYFJQiEIxxDUaTrASZMtbsB+Um1ZhZn3+aVcHhmxLOw g==;
X-CSE-ConnectionGUID: TNHllGWeRKWp4VSaePpmYg==
X-CSE-MsgGUID: O95J4OEJQOm5pMUaj5rzfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733151"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: KNKiKoQDSFC2ouFxzyFwTg==
X-CSE-MsgGUID: xJFHrm4fQCWZuzIKktAJCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271204"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 18/33] drm/xe/devcoredump: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:34 -0800
Message-ID: <20251107181315.631642-53-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime PM in the devcoredump
code.  This eliminates some goto-based error handling and slightly
simplifies other functions.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index eb0b40ffffaa..3f58ee4b7c0f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -276,7 +276,6 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
 	struct xe_device *xe = coredump_to_xe(coredump);
-	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
@@ -287,15 +286,15 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 			      xe_devcoredump_read, xe_devcoredump_free,
 			      XE_COREDUMP_TIMEOUT_JIFFIES);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(fw_ref);
+	xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
+		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+			xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+		xe_vm_snapshot_capture_delayed(ss->vm);
+		xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	}
 
 	ss->read.chunk_position = 0;
 
@@ -306,7 +305,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
 					   GFP_USER);
 		if (!ss->read.buffer)
-			goto put_pm;
+			return;
 
 		__xe_devcoredump_read(ss->read.buffer,
 				      XE_DEVCOREDUMP_CHUNK_MAX,
@@ -314,15 +313,12 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	} else {
 		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
 		if (!ss->read.buffer)
-			goto put_pm;
+			return;
 
 		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
 				      coredump);
 		xe_devcoredump_snapshot_free(ss);
 	}
-
-put_pm:
-	xe_pm_runtime_put(xe);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -332,7 +328,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
-	struct xe_force_wake_ref fw_ref;
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
@@ -351,7 +346,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	cookie = dma_fence_begin_signalling();
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
@@ -364,7 +359,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.51.1

