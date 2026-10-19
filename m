Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4182FCCA490
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 02:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD64E10E76A;
	Mon, 19 Oct 2026 02:37:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B450810E1A1
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 02:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792377453; x=1823913453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0szNcXRzW4r99bFhN4okouv+64nFeM0HtaeImkLbW/I=;
 b=mwMsmHz8omXD15uofcbX4PVMCKjek2QWNLSEsdSZWYB1h9y+HTb2C70M
 Ra3NEhEDLxhBQI/UskwyOpAPlgTiYS0UV50TF82j1/opuh9h/PrGjNgJp
 l8EJaOD8GLclOnOSB5xnT6O2DdPIEvHEDBNkB3gnYXy6qBH490gjDkB6a
 74hvMcAk4b4LoGbsXDNIc+ejbVgDbtDg3gRt0rznWKoHOxk2j5thpFtkp
 bYMpFdL2RWY1KJjIcIgc2bYOEJ5PF3TWIeCIczCvjjcFFav32WegFzxcs
 6aO8rH8l7omPD0lwZ3k8AgUgKmxpRX8JFRjGlm4ts4cVLQYrfGv/Yf4ci w==;
X-CSE-ConnectionGUID: kfo3i+UsSi+TyAZV79bRKw==
X-CSE-MsgGUID: d0MIhLKYQOSnUJIDwsnbAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="943658"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="943658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 19:37:33 -0700
X-CSE-ConnectionGUID: JKLGyFdlSguS+udmbbHxVA==
X-CSE-MsgGUID: vIfVv9/VT266uAYiMk0fMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2526446"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 19:37:30 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 1/9] drm/xe/gt: Use GT ordered workqueue for wedging
Date: Mon, 19 Oct 2026 08:06:32 +0530
Message-ID: <20261019023708.128835-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019023708.128835-1-raag.jadav@intel.com>
References: <20261019023708.128835-1-raag.jadav@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 v2: Split fixes into separate patches (Rodrigo, Michal)
 v4: Introduce for_each_initialized_gt() (Michal)
 v5: Flush GT wedge worker to avoid races (Sashiko)
 v6: Move wedge worker initialization to xe_gt_init_early() (Rodrigo)
     Don't flush GT wedge worker to avoid deadlock (Sashiko)
 v7: Guard GT wedge worker with runtime PM (Rodrigo)
 v9: Drop runtime PM guard from GT wedge worker (Matthew Brost)
v12: Teardown GT wedge worker alongside GT reset worker (Sashiko)
---
 drivers/gpu/drm/xe/xe_device.c   |  2 +-
 drivers/gpu/drm/xe/xe_device.h   |  4 ++++
 drivers/gpu/drm/xe/xe_gt.c       | 38 ++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_types.h |  9 ++++++++
 4 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index db0b883322ef..c7d8aea56f58 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1436,7 +1436,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			    WEDGED_URL, XE_BUG_URL);
 	}
 
-	for_each_gt(gt, xe, id)
+	for_each_initialized_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
 	if (xe_device_wedged(xe)) {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 83d6dafab53c..80bda9b548d5 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for_each_gt((gt__), (tile__)->xe, (id__)) \
 		for_each_if((gt__)->tile == (tile__))
 
+#define for_each_initialized_gt(gt__, xe__, id__) \
+	for_each_gt((gt__), (xe__), (id__)) \
+		for_each_if(READ_ONCE((gt__)->initialized))
+
 static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 {
 	return &gt->pm.fw;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc9bf6f0b5a7..2ed67fe929e3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
 }
 
 static void gt_reset_worker(struct work_struct *w);
+static void gt_wedge_worker(struct work_struct *w);
 
 static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
 			 long timeout_jiffies, bool force_reset)
@@ -546,6 +547,8 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
 
+	INIT_WORK(&gt->reset.worker, gt_reset_worker);
+	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
 	return 0;
 }
 
@@ -630,16 +633,21 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	return 0;
 }
 
-static void gt_reset_worker_disable(void *arg)
+static void gt_worker_disable(void *arg)
 {
 	struct xe_gt *gt = arg;
 
+	WRITE_ONCE(gt->initialized, false);
+
 	if (disable_work_sync(&gt->reset.worker))
 		/*
 		 * If gt_reset_worker was halted from executing, take care of
 		 * releasing the rpm reference here.
 		 */
 		xe_pm_runtime_put(gt_to_xe(gt));
+
+	if (disable_work_sync(&gt->wedge.worker))
+		xe_pm_runtime_put(gt_to_xe(gt));
 }
 
 static int gt_init_with_all_forcewake(struct xe_gt *gt)
@@ -712,7 +720,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 		xe_gt_sriov_pf_init_hw(gt);
 
 	/* Last action registered here so devres drains resets before teardown */
-	err = devm_add_action_or_reset(xe->drm.dev, gt_reset_worker_disable, gt);
+	err = devm_add_action_or_reset(xe->drm.dev, gt_worker_disable, gt);
 	if (err)
 		return err;
 
@@ -724,7 +732,7 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
-	gt_reset_worker_disable(gt);
+	gt_worker_disable(gt);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -737,8 +745,6 @@ int xe_gt_init(struct xe_gt *gt)
 	int err;
 	int i;
 
-	INIT_WORK(&gt->reset.worker, gt_reset_worker);
-
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
 		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
@@ -768,7 +774,7 @@ int xe_gt_init(struct xe_gt *gt)
 
 	err = gt_init_with_all_forcewake(gt);
 	if (err) {
-		gt_reset_worker_disable(gt);
+		gt_worker_disable(gt);
 		return err;
 	}
 
@@ -784,6 +790,8 @@ int xe_gt_init(struct xe_gt *gt)
 			return err;
 	}
 
+	/* Must be last */
+	WRITE_ONCE(gt->initialized, true);
 	return 0;
 }
 
@@ -1204,6 +1212,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
 	return NULL;
 }
 
+static void gt_wedge_worker(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
+
+	xe_uc_declare_wedged(&gt->uc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
+	xe_pm_runtime_put(gt_to_xe(gt));
+}
+
 /**
  * xe_gt_declare_wedged() - Declare GT wedged
  * @gt: the GT object
@@ -1213,8 +1230,11 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
  */
 void xe_gt_declare_wedged(struct xe_gt *gt)
 {
-	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
+	struct xe_device *xe = gt_to_xe(gt);
 
-	xe_uc_declare_wedged(&gt->uc);
-	xe_tlb_inval_reset(&gt->tlb_inval);
+	xe_gt_assert(gt, xe->wedged.mode);
+
+	xe_pm_runtime_get_noresume(xe);
+	if (!queue_work(gt->ordered_wq, &gt->wedge.worker))
+		xe_pm_runtime_put(xe);
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

