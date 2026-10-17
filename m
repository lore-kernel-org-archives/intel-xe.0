Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56413CCA463
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDDE10E31C;
	Sat, 17 Oct 2026 03:49:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F0310E28A
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 03:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792208981; x=1823744981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=INiPjHojhKJ6kgGoZV0RCKsiJB3iYPUZAihuZ1CCSPI=;
 b=nJ23IMHZYKWgF5C7kHaAadg5r2BluG48WhzNdlDpk40pk/Lh51PsBDWm
 vT//2WTYYH3IoM2zlrMIFdLsLkChY3zlhDFvM2mX9F+F84BcZkZQ7r5Nu
 01XYyLb+r8gfjFr+7ep5z1d2cpSjzNhnYIspUCltobAPiwLKmJr1jUY69
 VmpJT3fC3crDQM48kNkJDgVsEgv2itpM9lfK7U66KvjhNLeKP532OK5K8
 1b+VzcPaAmficMtBSNSzlO59wWPHSiscFJgjepmlS05JnHBKzp806WDVh
 WacVYw7Vzl29GwE+mdtYylpngj/eBupuZFfwhJnlrRI2k5WdmBfR37hve Q==;
X-CSE-ConnectionGUID: G8kboNw+QdKc1SBiMZWx9Q==
X-CSE-MsgGUID: 4QdmtBNMSGeUqR+dyPc/VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1011712"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1011712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 20:49:41 -0700
X-CSE-ConnectionGUID: CM1C5CHbQyaxpz+0mpdKsA==
X-CSE-MsgGUID: AAA5EEKKSwi17AH27RQwaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2154325"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2026 20:49:38 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 1/9] drm/xe/gt: Use GT ordered workqueue for wedging
Date: Sat, 17 Oct 2026 09:17:38 +0530
Message-ID: <20261017034842.67054-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017034842.67054-1-raag.jadav@intel.com>
References: <20261017034842.67054-1-raag.jadav@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c   |  2 +-
 drivers/gpu/drm/xe/xe_device.h   |  4 ++++
 drivers/gpu/drm/xe/xe_gt.c       | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
 4 files changed, 36 insertions(+), 4 deletions(-)

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
index bc9bf6f0b5a7..f084efbb1fcf 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
 }
 
 static void gt_reset_worker(struct work_struct *w);
+static void gt_wedge_worker(struct work_struct *w);
 
 static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
 			 long timeout_jiffies, bool force_reset)
@@ -546,6 +547,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
 
+	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
 	return 0;
 }
 
@@ -724,6 +726,9 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
+	if (disable_work_sync(&gt->wedge.worker))
+		xe_pm_runtime_put(gt_to_xe(gt));
+
 	gt_reset_worker_disable(gt);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
@@ -784,6 +789,8 @@ int xe_gt_init(struct xe_gt *gt)
 			return err;
 	}
 
+	/* Must be last */
+	WRITE_ONCE(gt->initialized, true);
 	return 0;
 }
 
@@ -1204,6 +1211,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
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
@@ -1213,8 +1229,11 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
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

