Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE43CD4959
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 05:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E9110E0B6;
	Thu, 21 Sep 2023 05:55:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B70110E06B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 05:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695275722; x=1726811722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LORVHV3ReNEFLAbltJR0os+c0WkH9XTnggR3SUHMP6U=;
 b=kynDvdtIyNUyvmjl5wpDhErWH6Dc4W519+Vl98oATGDxpuTk5f+PlsXk
 nNyHxmqAA08wLeOi2A24DEVqaL6gWU8S0ZpXkLpePIkoSUXKFtCbdEbFm
 m/jO665DZeE+BJ9m7FyQlmTWrjz1zgxKs8NIIbq+mheMoyPKOkLVyXlW8
 hPY4D1qVjHCKyE6cezUPILLrScnieh8wUDTbUku2QGrguC+8YQ54ZA67c
 YSJRRvwEZEM24uREQNxt0RbQCUor3cq1yQf2tyj66K9RohmqGTPBZgNkA
 O8TGukBUpB58RYYjclo10K/QsIwYNZebUDOITJSvIzIZRMstE9WUYcJ5b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444528068"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="444528068"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 22:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993939376"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="993939376"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2023 22:55:20 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 11:33:13 +0530
Message-Id: <20230921060314.5933-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921060314.5933-1-tejas.upadhyay@intel.com>
References: <20230921060314.5933-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Indroduce low level driver error
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Low level driver error that might have power or performance
impact on the system, we are adding a new error counter to GT
and tile and increment on each occurrance. Lets introcuce APIs
to define and increment each error type counter.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_tile.c         | 25 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a82f28c6a3a0..14f477412581 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -57,6 +57,13 @@ struct xe_ggtt;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
+enum xe_tile_err_type {
+	XE_TILE_DRV_ERR_GGTT = 0,
+	XE_TILE_DRV_ERR_GUC_COMM,
+	XE_TILE_DRV_ERR_INTR,
+	XE_TILE_DRV_ERR_MAX
+};
+
 /**
  * struct xe_mem_region - memory region structure
  * This is used to describe a memory region in xe
@@ -173,8 +180,14 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @drv_err_cnt: driver error counter for this tile */
+	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
 };
 
+void xe_tile_cnt_drv_err(struct xe_tile *tile,
+			 const enum xe_tile_err_type err);
+
 /**
  * struct xe_device - Top level struct of XE device
  */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1aa44d4f9ac1..61e4d0222836 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -47,6 +47,30 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+static const char *const xe_gt_drv_err_to_str[] = {
+	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
+	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
+};
+
+/**
+ * xe_gt_cnt_drv_err - Count driver err for gt
+ * @gt: GT to count error for
+ * @err: enum error type
+ *
+ * Increment the driver error counter in respective error
+ * category for this GT.
+ *
+ * Returns void.
+ */
+void xe_gt_cnt_drv_err(struct xe_gt *gt,
+		       const enum xe_gt_err_type err)
+{
+	if (err >= ARRAY_SIZE(gt->drv_err_cnt))
+		return;
+	WRITE_ONCE(gt->drv_err_cnt[err],
+		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
+}
+
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7..cb71aff16a0b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,6 +24,12 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
+enum xe_gt_err_type {
+	XE_GT_DRV_ERR_ENGINE = 0,
+	XE_GT_DRV_ERR_OTHERS,
+	XE_GT_DRV_ERR_MAX
+};
+
 #define XE_MAX_DSS_FUSE_REGS	3
 #define XE_MAX_EU_FUSE_REGS	1
 
@@ -347,6 +353,12 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @drv_err_cnt: driver error counter for this GT */
+	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
 };
 
+void xe_gt_cnt_drv_err(struct xe_gt *gt,
+		       const enum xe_gt_err_type err);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 131752a57f65..c6dfcb4431f0 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -71,6 +71,31 @@
  *  - MOCS and PAT programming
  */
 
+static const char *const xe_tile_drv_err_to_str[] = {
+	[XE_TILE_DRV_ERR_GGTT] = "GGTT",
+	[XE_TILE_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
+	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
+};
+
+/**
+ * xe_tile_cnt_drv_err - Count driver err for tile
+ * @tile: Tile to count error for
+ * @err: enum error type
+ *
+ * Increment the driver error counter in respective error
+ * category for this tile.
+ *
+ * Returns void.
+ */
+void xe_tile_cnt_drv_err(struct xe_tile *tile,
+			 const enum xe_tile_err_type err)
+{
+	if (err >= ARRAY_SIZE(tile->drv_err_cnt))
+		return;
+	WRITE_ONCE(tile->drv_err_cnt[err],
+		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
+}
+
 /**
  * xe_tile_alloc - Perform per-tile memory allocation
  * @tile: Tile to perform allocations for
-- 
2.25.1

