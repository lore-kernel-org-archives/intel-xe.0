Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BFDE80AB0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 14:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DA110E540;
	Wed, 27 Sep 2023 14:21:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F0610E540
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695824479; x=1727360479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v8GY8dYG0RhzzlZCY5GQBZOut/aHkWAYi32Qo30OdWM=;
 b=lDBcvwDF9gkbEmDUE7hcrxpxfGAjy6+RSgOiK/f6lLaFTp+j+Iu7TFPe
 E2zlJQLzM/6Lz+QijnCgfckZbFSFs2mve/CWhE58k/CZbTfMNe5exadBg
 VBjWi4GSmXMwP5T1MAhXw0/AoBNgs7l7rtmYt4lm5zJUKPHiSasnEPz/G
 mxoG+ZT/LmchqlPVPr6lfaaeIJK5AEreTIr8OtImwSoIM1wgKXWhfoOGB
 2LnImLGo5GmGGQhee88713C+X6p8A5xOJHFndm54oMX+e3UOwKDd21o3U
 xv4cD9plToWTKrLa+N/JtXmwJkMFdFEM+7anXgNN/4SPEwVwtshPO35Iq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372178011"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="372178011"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 07:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080184774"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="1080184774"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2023 07:21:17 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 19:59:18 +0530
Message-Id: <20230927142919.272895-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927142919.272895-1-tejas.upadhyay@intel.com>
References: <20230927142919.272895-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 1/2] drm/xe: Introduce low level driver error
 counting APIs
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

Low level driver error that might have power or performance
impact on the system, we are adding a new error counter to GT
and tile and increment on each occurrance. Lets introduce APIs
to define and increment each error type counter.

V4:
  - Move API declaration under tile.h - Jani
  - Typos
V3:
  - correct #define max value
V2:
  - Move some code to its related patch - Michal
  - Renaming if API and enum - Michal
  - GUC errors are moved per GT - Michal
  - Some nits - Michal

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h           |  3 +++
 drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++++++++
 drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h         |  2 ++
 6 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32ab0fea04ee..a28e140f9e64 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -57,6 +57,12 @@ struct xe_ggtt;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
+#define XE_TILE_DRV_ERR_MAX	2
+enum xe_tile_drv_err_type {
+	XE_TILE_DRV_ERR_GGTT,
+	XE_TILE_DRV_ERR_INTR
+};
+
 /**
  * struct xe_mem_region - memory region structure
  * This is used to describe a memory region in xe
@@ -173,6 +179,9 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @drv_err_cnt: driver error counter for this tile */
+	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1aa44d4f9ac1..a30d8e0ae986 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -47,6 +47,24 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+/**
+ * xe_gt_report_driver_error - Count driver error for gt
+ * @gt: GT to count error for
+ * @err: enum error type
+ *
+ * Increment the driver error counter in respective error
+ * category for this GT.
+ *
+ * Returns void.
+ */
+void xe_gt_report_driver_error(struct xe_gt *gt,
+			       const enum xe_gt_drv_err_type err)
+{
+	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));
+	WRITE_ONCE(gt->drv_err_cnt[err],
+		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
+}
+
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a0..9442d615042f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+void xe_gt_report_driver_error(struct xe_gt *gt,
+			       const enum xe_gt_drv_err_type err);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7..4645ea9b7893 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,6 +24,13 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
+#define XE_GT_DRV_ERR_MAX	3
+enum xe_gt_drv_err_type {
+	XE_GT_DRV_ERR_GUC_COMM,
+	XE_GT_DRV_ERR_ENGINE,
+	XE_GT_DRV_ERR_OTHERS
+};
+
 #define XE_MAX_DSS_FUSE_REGS	3
 #define XE_MAX_EU_FUSE_REGS	1
 
@@ -347,6 +354,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @drv_err_cnt: driver error counter for this GT */
+	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 131752a57f65..708dd385f2b1 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -71,6 +71,24 @@
  *  - MOCS and PAT programming
  */
 
+/**
+ * xe_tile_report_driver_error - Count driver error for tile
+ * @tile: Tile to count error for
+ * @err: enum error type
+ *
+ * Increment the driver error counter in respective error
+ * category for this tile.
+ *
+ * Returns void.
+ */
+void xe_tile_report_driver_error(struct xe_tile *tile,
+				 const enum xe_tile_drv_err_type err)
+{
+	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));
+	WRITE_ONCE(tile->drv_err_cnt[err],
+		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
+}
+
 /**
  * xe_tile_alloc - Perform per-tile memory allocation
  * @tile: Tile to perform allocations for
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 782c47f8bd45..092a6b17a97e 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,5 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
+void xe_tile_report_driver_error(struct xe_tile *tile,
+				 const enum xe_tile_drv_err_type err);
 
 #endif
-- 
2.25.1

