Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C1CD13D2
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A005E10E444;
	Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="katmLJNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80D010E463
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816833; x=1794352833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bojuKwowGBbKnNgCttmEIBs/bZmSk41Xih553R/Mz0Y=;
 b=katmLJNoRywu6xgfPOV1knIho7vi8ZddPQm1hp8i9R5W/beQxEZxyhXo
 s/NXN9VhUcL8uReQQR6as07eDV+aynVxOmx4kFZdAlNKLb1XddhGXCSFW
 auwn2u8ImbE2a6R2o4j/qZxHAUKb9z7a1phji5cYlRnRetwovwvPa62FM
 JQtwrEkivpoi5rsf0bDw57Ds7ngbRhe/FBrBBYjV7tT1j1hjWHPADsKYb
 /jW/mX0M1ibyIRmeg7zEmEqCR0ALgFrD1A/U0UR1U60MaBE1eeySo2asH
 rv99ZSFwTc5Mea/mTxD7L6qwp7GAR+oOakym/HZuoCRDp0OedT78CzDCP A==;
X-CSE-ConnectionGUID: s26brdAzS6q0RGqpe2+L+A==
X-CSE-MsgGUID: Li/EpxckT/6MGfONCkvZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486444"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486444"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: RBQvcpu2TiKxPDG9w4nSOg==
X-CSE-MsgGUID: 8J0KyxJBSQCHD6PcC/RAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243971"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 08/30] drm/xe/guc: Use scope-based cleanup
Date: Mon, 10 Nov 2025 15:20:26 -0800
Message-ID: <20251110232017.1475869-40-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime PM.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c           | 13 ++++---------
 drivers/gpu/drm/xe/xe_guc_log.c       | 10 ++++------
 drivers/gpu/drm/xe/xe_guc_submit.c    | 11 +++--------
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  4 +---
 4 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e..e47292b2aab0 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -658,11 +658,9 @@ static void guc_fini_hw(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
-	unsigned int fw_ref;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
+		xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
 
 	guc_g2g_fini(guc);
 }
@@ -1610,15 +1608,14 @@ int xe_guc_start(struct xe_guc *guc)
 void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	unsigned int fw_ref;
 	u32 status;
 	int i;
 
 	xe_uc_fw_print(&guc->fw, p);
 
 	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (!fw_ref)
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref.domains)
 			return;
 
 		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
@@ -1638,8 +1635,6 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 			drm_printf(p, "\t%2d: \t0x%x\n",
 				   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
 		}
-
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	drm_puts(p, "\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..0c704a11078a 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -145,7 +145,6 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 	struct xe_device *xe = log_to_xe(log);
 	struct xe_guc *guc = log_to_guc(log);
 	struct xe_gt *gt = log_to_gt(log);
-	unsigned int fw_ref;
 	size_t remain;
 	int i;
 
@@ -165,13 +164,12 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 		remain -= size;
 	}
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref) {
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		snapshot->stamp = ~0ULL;
-	} else {
+	else
 		snapshot->stamp = xe_mmio_read64_2x32(&gt->mmio, GUC_PMTIMESTAMP_LO);
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	}
+
 	snapshot->ktime = ktime_get_boottime_ns();
 	snapshot->level = log->level;
 	snapshot->ver_found = guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4ffdb71ef3d..7e0882074a99 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1225,7 +1225,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
 	struct xe_device *xe = guc_to_xe(guc);
-	unsigned int fw_ref;
 	int err = -ETIME;
 	pid_t pid = -1;
 	int i = 0;
@@ -1258,13 +1257,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
 	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
-		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
-		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
 			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
 
 		xe_engine_snapshot_capture_for_queue(q);
-
-		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	}
 
 	/*
@@ -1455,7 +1452,7 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
-	xe_pm_runtime_get(guc_to_xe(guc));
+	guard(xe_pm_runtime)(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
 	if (xe_exec_queue_is_lr(q))
@@ -1464,8 +1461,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 
 	xe_exec_queue_fini(q);
-
-	xe_pm_runtime_put(guc_to_xe(guc));
 }
 
 static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index a80175c7c478..848d3493df10 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -71,12 +71,11 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
-		unsigned int fw_ref;
 
 		if (IS_SRIOV_VF(xe))
 			return -ECANCELED;
 
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
@@ -86,7 +85,6 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	return -ECANCELED;
-- 
2.51.1

