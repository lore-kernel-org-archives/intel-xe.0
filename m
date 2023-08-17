Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6B2C2FC14
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 11:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DD710E44A;
	Thu, 17 Aug 2023 11:04:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC11E10E44B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692270238; x=1723806238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8y5gTgvkkZrDmwVekfFcIeR0V+97jzukOzI2OiFe20k=;
 b=i9NXeuMxplcjRjvWuubwudbY1Z3tzApHEuEdauxXi+qYyNVZ4BMiGbw2
 AB+0y85HMgRf7JhJ8qbQGx2/nUclZvauFPnOafAD9bGKK8jreKkZQRyxO
 jcVe/amSz5M17tUHwidxRXqEThunTwvo9eE1nY78cvWBLb84l/DoAvnff
 lIe5tvuP4VX/6ISRAzSqfXbtvfhGCNPCq1atMng5j1syb2CmW02biAefm
 yYRWfaU4yKx9b6YReuAOdDPWotqYyfLULaX8ss5etuSyHaOZ7RiY1IYs7
 +cyZ50x3dpUCVWCSkc+Coe6Iz8jLkD7tujBzN5383L0UTWL9pKS68ZmtG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376516679"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="376516679"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="728099953"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="728099953"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:57 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 04:03:52 -0700
Message-Id: <20230817110352.7601-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some copy hardware engine instances are faster than others on PVC.
Use a virtual engine of these plus the reserved instance for the migrate
engine on PVC. The idea being if a fast instance is available it will be
used and the throughput of kernel copies, clears, and pagefault
servicing will be higher.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4c812d04e182..00329efbd968 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -791,3 +791,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
+
+/**
+ * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
+ * @gt: gt instance
+ *
+ * On PVC, due to workaround 16017236439, odd instance hardware copy engines
+ * are faster than even instance ones.
+ * This function returns the mask involving all faster copy engines and the
+ * reserved copy engine to be used as logical mask for migrate engine.
+ * Including the reserved copy engine is required to avoid deadlocks due to
+ * migrate jobs servicing the faults gets stuck behind the job that faulted.
+ */
+u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 logical_mask = 0;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	/* Only support this function on PVC for now */
+	if (XE_WARN_ON(xe->info.platform != XE_PVC))
+		return 0;
+
+	for_each_hw_engine(hwe, gt, id) {
+		if (hwe->class == XE_ENGINE_CLASS_COPY &&
+		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
+			logical_mask |= BIT(hwe->logical_instance);
+	}
+
+	return logical_mask;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..edee71e26c57 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -52,6 +52,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
 
 struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 956a96b38346..cb9a82d13089 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -338,11 +338,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 							   XE_ENGINE_CLASS_COPY,
 							   primary_gt->usm.reserved_bcs_instance,
 							   false);
-		if (!hwe)
+		u32 logical_mask = xe_hw_engine_migrate_logical_mask(primary_gt);
+
+		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
-		m->q = xe_exec_queue_create(xe, vm,
-					    BIT(hwe->logical_instance), 1,
+		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
 					    hwe, EXEC_QUEUE_FLAG_KERNEL);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
-- 
2.21.0.rc0.32.g243a4c7e27

