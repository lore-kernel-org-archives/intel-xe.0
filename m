Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4886EE743ED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B4010E0E0;
	Fri, 29 Sep 2023 06:16:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5254410E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695968178; x=1727504178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s7eiTNfSSctZVJDs9P62KfwE4bBc+Lp2EThG+JpyOSQ=;
 b=RKn7ZutSy4CmJDVwNNCGnSus3Hh3EMWD2T1RtkcZdckcJZUjHIdT3Us6
 rcHWMEbGOgBUoSVC2ROd6UjKKFQ+ri/P6WXweWSS0CYkdw0b1xbg3WMbd
 8QL1KNYPkuaGB1UrJNkiiA9o/WlJ/M9ae9sQjycCWEizkNq+JTl2L3Vlz
 a7NGMtNBQhzvGHg7jeNwMJFrzM8E8EMaFAayEnHamxScC6qWJ3QGhHory
 gNOtGQVoodIUE9AoOFSySOcQL/x1ZF0kct6+f70UEmpoJulGNsMzTxaQX
 ITvthJqVTz53X0H0EkKTifakD0EAVWhgDZp9kUpHEeuZOF0PgNsTfxuAQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386104573"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="386104573"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923521141"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="923521141"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 23:16:16 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 11:54:19 +0530
Message-Id: <20230929062420.394375-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929062420.394375-1-tejas.upadhyay@intel.com>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver error
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
Cc: Roper@freedesktop.org, Wajdeczko@freedesktop.org,
	Matthew D <matthew.d.roper@intel.com>
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
index 0717839ae964..dc57b38d7e63 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -59,6 +59,12 @@ struct xe_pat_ops;
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
@@ -175,6 +181,9 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @drv_err_cnt: driver error counter for this tile */
+	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 68cd9a7ee087..a8b5f012588b 100644
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

