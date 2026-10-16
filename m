Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF46CCA463
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769A910E3F9;
	Fri, 16 Oct 2026 03:16:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B117910E292
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792120575; x=1823656575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gGYOm6W6oUpG/kach9Ln3ZfHEdIc5MvJmhm9ru8CdTM=;
 b=iSRVnjZ37l5XuecyVW5dQ3xfmiGGXM3FPA+CmDM2ogKXWzJrWHqGvIGN
 8V5u6LWv6ocIaH5+n974QdZW8/fkctFYa9Ylc4p1A8vI39LWYPSFSU/KD
 yTfbJ8l2paElas3jXLIGnEtZceQc3PJXGRcgxRIqBNkJ8+mi7YrvOJfKz
 hNV90lg41GPwWLD1Qs8yxzGND1F4qSp1VGD2iu0iwyEsYlyDPiwxvU9Fh
 dVy6f5VMgrETElvtZ3gGoRC++pYzGkzN1XqORHUN8mZHL9QMRcstVsGZa
 Yam27yO42wTpXwk/ciY1Ldb/FyhFvTJPZsnKEeZv+ETqTLy6iNoya2W/y Q==;
X-CSE-ConnectionGUID: yb/aoluXS8CPuFtrtsetgw==
X-CSE-MsgGUID: xsWymz0xTTGs25KOVySpjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="933501"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="933501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 20:16:15 -0700
X-CSE-ConnectionGUID: J6xWzNb7RW6O1R6RuvpkEQ==
X-CSE-MsgGUID: gvF+UicOQ6+fMxVnPAAIwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1854074"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 20:16:11 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 1/7] drm/xe/gt: Use GT ordered workqueue for wedging
Date: Fri, 16 Oct 2026 08:45:14 +0530
Message-ID: <20261016031559.427941-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016031559.427941-1-raag.jadav@intel.com>
References: <20261016031559.427941-1-raag.jadav@intel.com>
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
v9: Drop runtime PM guard as callers already hold a reference (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_device.c   |  2 +-
 drivers/gpu/drm/xe/xe_device.h   |  4 ++++
 drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
 4 files changed, 29 insertions(+), 3 deletions(-)

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
index bc9bf6f0b5a7..27f32627a1f9 100644
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
 
@@ -724,6 +726,7 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
+	disable_work_sync(&gt->wedge.worker);
 	gt_reset_worker_disable(gt);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
@@ -784,6 +787,8 @@ int xe_gt_init(struct xe_gt *gt)
 			return err;
 	}
 
+	/* Must be last */
+	WRITE_ONCE(gt->initialized, true);
 	return 0;
 }
 
@@ -1204,6 +1209,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
 	return NULL;
 }
 
+static void gt_wedge_worker(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
+
+	xe_device_assert_mem_access(gt_to_xe(gt));
+	xe_uc_declare_wedged(&gt->uc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
+}
+
 /**
  * xe_gt_declare_wedged() - Declare GT wedged
  * @gt: the GT object
@@ -1215,6 +1229,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
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

