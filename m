Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B557FCDB484
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 07:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4782D10E3B9;
	Wed, 18 Oct 2023 07:46:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B2D10E3B3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697615191; x=1729151191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wmppbcqfpVqnikfx4qDhaTXYjXARR3Lbbt1N9sYrTXs=;
 b=JJk5MG1wSi/DPmjPM035N0X3aE8dO2rVp6hsCaluVIctpvIf0XhNVAqU
 Xv3nDKO4p2b7xJxFHO7P4b5YWJAtYtf7WSS8RATEsU2qhxFGI7BdripNs
 9qJjyR4d18mUOOnRvFkG35tk9xD3l62q5UrmeOvD6XvaNorG6/0XUi1P0
 9kYZCtRJUERDhU3QK64VOlQbmjS1sHNHT7ey5IB3jlvtdc0px0nlEDiLA
 okA4tLWIsMPI/f3B3etiwVNOvpcqUMnJerbHtUeA7OHEUqGrjBsem5IAK
 CQNBRIdOklPBezXOrWlQ1cbja82HWiAgomut4i0DLAAemmO5ChR9Fh2Od A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="383182506"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="383182506"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 00:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="930073404"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="930073404"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 18 Oct 2023 00:46:29 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 13:24:56 +0530
Message-Id: <20231018075457.1806599-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018075457.1806599-1-tejas.upadhyay@intel.com>
References: <20231018075457.1806599-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V7 1/2] drm/xe: Introduce low level driver error
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
Cc: Vishwanathapura@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Low level driver error that might have power or performance
impact on the system, we are adding a new error counter to GT
and tile and increment on each occurrence. Lets introduce APIs
to define and increment each error type counter.

v6:
  - dont redefine err max - Michal
  - Fix assert conditions - Michal
V5:
  - Fix MAX enum issue
  - Use kernel doc for enum - Niranjana
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
 drivers/gpu/drm/xe/xe_device_types.h | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c           | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h           |  3 +++
 drivers/gpu/drm/xe/xe_gt_types.h     | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.c         | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h         |  2 ++
 6 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 44d622d4cc3a..da88e69beeaf 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -61,6 +61,18 @@ struct xe_pat_ops;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
+/** @enum xe_tile_drv_err_type
+ *  enum for different types of tile level errors in driver
+ */
+enum xe_tile_drv_err_type {
+	/* Error type for all PPGTT and GTT errors */
+	XE_TILE_DRV_ERR_GTT,
+	/* Interrupt errors */
+	XE_TILE_DRV_ERR_INTR,
+	/* Max defined error types, keep this last */
+	__XE_TILE_DRV_ERR_MAX
+};
+
 /**
  * struct xe_mem_region - memory region structure
  * This is used to describe a memory region in xe
@@ -190,6 +202,9 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @drv_err_cnt: driver error counter for this tile */
+	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 74e1f47bd401..3c13f41ec21a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -48,6 +48,25 @@
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
+	xe_gt_assert(gt, err >= 0);
+	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
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
index d3f2793684e2..6a6609162b3d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,6 +24,20 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
+/** @enum xe_gt_drv_err_type
+ *  enum for different types of gt level errors in driver
+ */
+enum xe_gt_drv_err_type {
+	/* Driver guc communication errors */
+	XE_GT_DRV_ERR_GUC_COMM,
+	/* Engine execution errors */
+	XE_GT_DRV_ERR_ENGINE,
+	/* Other errors like error during save/restore registers */
+	XE_GT_DRV_ERR_OTHERS,
+	/* Max defined error types, keep this last */
+	__XE_GT_DRV_ERR_MAX
+};
+
 #define XE_MAX_DSS_FUSE_REGS	3
 #define XE_MAX_EU_FUSE_REGS	1
 
@@ -347,6 +361,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @drv_err_cnt: driver error counter for this GT */
+	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 131752a57f65..b31dc63ea7c2 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -71,6 +71,25 @@
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
+	xe_assert(tile_to_xe(tile), err >= 0);
+	xe_assert(tile_to_xe(tile), err < __XE_TILE_DRV_ERR_MAX);
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

