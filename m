Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EEBCA9EC0
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 09:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5D410E115;
	Sat, 10 Oct 2026 09:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtXG7mZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC0110E115
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791623306; x=1823159306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KppQyKaz+LRs/yPPKeBE3cmxzXPiWFRbwboU+wEx8Yc=;
 b=EtXG7mZvMbKDejOGAiDq7jVwqX3elWesKFautvsLPInY6LeRc11F3XeD
 gGwUQeKP5uWpEgHkU/EPNYESb5mC81S4oLPI8WykjAMS+bDEPyBPuASgP
 cxp3mnG1+AXGFcD8DmSLfHWhsA4hdH8soFeyKDtc+ZSBQ7XR7MDqWAaac
 XewVMQtJR6lFk9gOubh+Lt4dT5RZrPlPOaV7bGr+ZKikhsfwSGysfV4bw
 AtZ/wCnm2h1gz8ejniZT5lnbfRK31QfAYhseyxj1F2bcMJbBpOdmN+X2X
 ECP+qDs4r7UXT5sOTYS+vo9+rEonZ7Etv+XXukaHGIYUiOL93yys+0MkQ w==;
X-CSE-ConnectionGUID: Px1YVDU+RzuocC+NLNn7jg==
X-CSE-MsgGUID: cEOz1P51QdyQ1iUCUYKnmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="290825"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="290825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2026 02:08:26 -0700
X-CSE-ConnectionGUID: 3E1zP7gqT3uEFWJoDbIIJQ==
X-CSE-MsgGUID: iz7mlHS5Tke0DgrKZQHZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="427716"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 10 Oct 2026 02:08:24 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Date: Sat, 10 Oct 2026 14:36:18 +0530
Message-ID: <20261010090718.68308-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010090718.68308-1-raag.jadav@intel.com>
References: <20261010090718.68308-1-raag.jadav@intel.com>
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

Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
teardown synchronously. This can result in tdr timeout in cases where
the device is declared wedged while jobs are still in-flight.

Introduce a worker for GT specific wedge handling and queue the teardown
on GT ordered workqueue, so we don't disrupt the scheduler while jobs
are still in-flight.

While at it, introduce for_each_initialized_gt() macro and use it for
wedging GT. This helps avoid races in case the device is declared wedged
in probe sequence before GT is initialized.

Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Split fixes into separate patches (Rodrigo, Michal)
v4: Introduce for_each_initialized_gt() (Michal)
---
 drivers/gpu/drm/xe/xe_device.c   |  2 +-
 drivers/gpu/drm/xe/xe_device.h   |  4 ++++
 drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c4..22ae10958d7f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1432,7 +1432,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			    WEDGED_URL, XE_BUG_URL);
 	}
 
-	for_each_gt(gt, xe, id)
+	for_each_initialized_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
 	if (xe_device_wedged(xe)) {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 83d6dafab53c..9b09e627af8c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for_each_gt((gt__), (tile__)->xe, (id__)) \
 		for_each_if((gt__)->tile == (tile__))
 
+#define for_each_initialized_gt(gt__, xe__, id__) \
+	for_each_gt((gt__), (xe__), (id__)) \
+		for_each_if((gt__)->initialized)
+
 static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 {
 	return &gt->pm.fw;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 775c826b68b4..d762158c0777 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
 }
 
 static void gt_reset_worker(struct work_struct *w);
+static void gt_wedge_worker(struct work_struct *w);
 
 static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
 			 long timeout_jiffies, bool force_reset)
@@ -706,6 +707,8 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
+	disable_work_sync(&gt->wedge.worker);
+
 	if (disable_work_sync(&gt->reset.worker))
 		/*
 		 * If gt_reset_worker was halted from executing, take care of
@@ -725,6 +728,7 @@ int xe_gt_init(struct xe_gt *gt)
 	int i;
 
 	INIT_WORK(&gt->reset.worker, gt_reset_worker);
+	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
 		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
@@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
 			return err;
 	}
 
+	/* Must be last */
+	gt->initialized = true;
 	return 0;
 }
 
@@ -1010,6 +1016,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		xe_pm_runtime_put(xe);
 }
 
+static void gt_wedge_worker(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
+
+	xe_uc_declare_wedged(&gt->uc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
+}
+
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	xe_uc_suspend_prepare(&gt->uc);
@@ -1200,6 +1214,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
 
-	xe_uc_declare_wedged(&gt->uc);
-	xe_tlb_inval_reset(&gt->tlb_inval);
+	queue_work(gt->ordered_wq, &gt->wedge.worker);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 628911346455..c00a7c171f80 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -233,6 +233,12 @@ struct xe_gt {
 		struct work_struct worker;
 	} reset;
 
+	/** @wedge: state for GT wedge */
+	struct {
+		/** @wedge.worker: worker for GT wedge to be done async */
+		struct work_struct worker;
+	} wedge;
+
 	/** @tlb_inval: TLB invalidation state */
 	struct xe_tlb_inval tlb_inval;
 
@@ -419,6 +425,9 @@ struct xe_gt {
 
 	/** @eu_stall: EU stall counters subsystem per gt info */
 	struct xe_eu_stall_gt *eu_stall;
+
+	/** @initialized: GT is initialized */
+	bool initialized;
 };
 
 #endif
-- 
2.43.0

