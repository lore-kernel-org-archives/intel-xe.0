Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DCFCD13DD
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6531310E4B9;
	Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMAbCnih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D00E10E47D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/yXBDuxm1h0P8ZVWNOCyoiJkI1BSZlKZaNg/5AeDO4U=;
 b=GMAbCnihv5VkxBYhI9Djoveq8Ywk51dkc61GGN3aQjrz3iL3kWTSO2+O
 gqMuFI/R4+N50DG7wpOFzUWFBLQCF/EPhmJfU5lCIgEYjmjGE6W9r4ZXZ
 zSDfEyaYAa2O5noIqcrVFIk3Xt1Qg9v61QPElrlJIUThIWKp3a/Xn9Uus
 jASRx++BwSvPrBgkYRDS7hC7afbujQgUwwANEEYZRixajaJPaUHw4cj16
 N3mXyMEdsWTfMS4v2Ee8kbhu43M7/LPCvdPJE4Gsn4pdv29cvTamS31s3
 toyLyxpuyVhyN3jnBj3Ci7Kk2ezeqj693tAFYPTnNkt0UEJ9r+29DtuLm w==;
X-CSE-ConnectionGUID: 6JjldPO0SMqKv4E3SlaXXg==
X-CSE-MsgGUID: uaoSCwIiSC2bJjVyl3yQTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486451"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486451"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: C1oJBiMYQDWEVawuSkx1sA==
X-CSE-MsgGUID: aCerNiA3R0uYyZ1W8Hg44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243992"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 15/30] drm/xe/devcoredump: Use scope-based cleanup
Date: Mon, 10 Nov 2025 15:20:33 -0800
Message-ID: <20251110232017.1475869-47-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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
index 203e3038cc81..599c886c865b 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -276,7 +276,6 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
 	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
 
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
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+	xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
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
-	unsigned int fw_ref;
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
 
-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.51.1

