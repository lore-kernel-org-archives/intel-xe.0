Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AC9C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D301710E6F8;
	Thu, 13 Jul 2023 15:06:33 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C235A10E6FA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260790; x=1720796790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LKOcvirmlioTFFOOFAyJ98WN3nwG2ca9cUMu9oLOcZY=;
 b=Y87/JE2wW6T7X4RCn2I7Z0CyI5yBlMzZBbmbtExqBujEmL+7qOO+1dsc
 zVBqe4+E3fSQeSzCndWwTG6pNJgJk48mCCPKcI9yyhjbxRd/UvE9SkPoH
 UACo7hwgwQKFTvBRLsav1AM8yrIaHwCN8wtOg7NIpOERN7RgVfO3FS1TH
 yE73f6FtZSTLJBcex9ov834fxeSwOasKrWqOgpTeTW+qN9EX1OI+p4Hzy
 IOWs1pPJmzGeczb7cPLIselkzQg6vXzbbStlDly/C66coWzVPgFL7N5Pq
 /kBE/U1fRXl6VCUrNI429GZmWVBOUrHvS23wkhygFIFqH6TuvDUGlsibN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856889"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856889"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285523"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285523"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:29 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:05 +0000
Message-Id: <20230713150611.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe: Cleanup SPACING style issues
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove almost all existing style issues of type SPACING reported
by checkpatch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 ++--
 drivers/gpu/drm/xe/xe_device.h                    |  4 ++--
 drivers/gpu/drm/xe/xe_device_types.h              |  4 ++--
 drivers/gpu/drm/xe/xe_force_wake.c                |  2 +-
 drivers/gpu/drm/xe/xe_gt.h                        |  2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                  |  8 ++++----
 drivers/gpu/drm/xe/xe_gt_types.h                  |  8 ++++----
 drivers/gpu/drm/xe/xe_rtp.h                       |  4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h               | 10 +++++-----
 drivers/gpu/drm/xe/xe_sched_job.c                 |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                     |  4 ++--
 11 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index a51889af7c23..234df629af8d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -94,8 +94,8 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define HAS_LLC(xe) (!IS_DGFX((xe)))
 
 /* Workarounds not handled yet */
-#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last;})
-#define IS_GRAPHICS_STEP(xe, first, last) ({u8 __step = (xe)->info.step.graphics; first <= __step && __step <= last;})
+#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last; })
+#define IS_GRAPHICS_STEP(xe, first, last) ({u8 __step = (xe)->info.step.graphics; first <= __step && __step <= last; })
 #define IS_LP(xe) (0)
 
 #define IS_TGL_UY(xe) (xe && 0)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 8e01bbadb149..5c827beaea28 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -122,7 +122,7 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
 
 #define for_each_tile(tile__, xe__, id__) \
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
-		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
 /*
  * FIXME: This only works for now since multi-tile and standalone media
@@ -130,7 +130,7 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
  */
 #define for_each_gt(gt__, xe__, id__) \
 	for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
-		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
+		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
 
 static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 26a8de77138a..5267ae02785d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -54,8 +54,8 @@ struct xe_ggtt;
 
 #define tile_to_xe(tile__)								\
 	_Generic(tile__,								\
-		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
-		 struct xe_tile *: (tile__)->xe)
+		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
+		 struct xe_tile * : (tile__)->xe)
 
 /**
  * struct xe_tile - hardware tile structure
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index f0f0592fc598..7403673d532d 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -87,7 +87,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    BIT(0), BIT(16));
 	}
 
-	for (i = XE_HW_ENGINE_VECS0, j =0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
+	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 21d9044088de..a523d7941afe 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -13,7 +13,7 @@
 
 #define for_each_hw_engine(hwe__, gt__, id__) \
 	for ((id__) = 0; (id__) < ARRAY_SIZE((gt__)->hw_engines); (id__)++) \
-	     for_each_if (((hwe__) = (gt__)->hw_engines + (id__)) && \
+	     for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 7cf11078ff57..932b61e0cf67 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -38,13 +38,13 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 					  rpm_config_reg);
 
 	switch (crystal_clock) {
-	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
 		return f24_mhz;
-	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ :
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
 		return f19_2_mhz;
-	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ :
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
 		return f38_4_mhz;
-	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ :
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
 		return f25_mhz;
 	default:
 		XE_BUG_ON("NOT_POSSIBLE");
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 28b8e8a86fc9..78a9fe9f0bd3 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -75,13 +75,13 @@ enum xe_steering_type {
 
 #define gt_to_tile(gt__)							\
 	_Generic(gt__,								\
-		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
-		 struct xe_gt *: (gt__)->tile)
+		 const struct xe_gt * : (const struct xe_tile *)((gt__)->tile),	\
+		 struct xe_gt * : (gt__)->tile)
 
 #define gt_to_xe(gt__)										\
 	_Generic(gt__,										\
-		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
-		 struct xe_gt *: gt_to_tile(gt__)->xe)
+		 const struct xe_gt * : (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
+		 struct xe_gt * : gt_to_tile(gt__)->xe)
 
 /**
  * struct xe_gt - A "Graphics Technology" unit of the GPU
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 8581bd9b1426..04ccb26452ad 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -373,8 +373,8 @@ struct xe_reg_sr;
 	}
 
 #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
-	struct xe_hw_engine *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
-	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
+	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
 
 void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 					       unsigned long *active_entries,
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index 1beea434d52d..181b6290fac3 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -14,13 +14,13 @@
  * Helper macros - not to be used outside this header.
  */
 #define _XE_ESC(...) __VA_ARGS__
-#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
-#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
+#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__, 5, 4, 3, 2, 1,))
+#define __XE_COUNT_ARGS(_, _5, _4, _3, _2, X_, ...) X_
 
 #define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
-#define __XE_FIRST(x_,...) x_
+#define __XE_FIRST(x_, ...) x_
 #define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
-#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
+#define __XE_TUPLE_TAIL(x_, ...) (__VA_ARGS__)
 
 #define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
 
@@ -59,7 +59,7 @@
  *
  *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
  */
-#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))
 #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
 #define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index ed0b69ef449c..f581472cb391 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -35,7 +35,7 @@ int __init xe_sched_job_module_init(void)
 		kmem_cache_create("xe_sched_job_parallel",
 				  sizeof(struct xe_sched_job) +
 				  sizeof(u64) *
-				  XE_HW_ENGINE_MAX_INSTANCE , 0,
+				  XE_HW_ENGINE_MAX_INSTANCE, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_parallel_slab) {
 		kmem_cache_destroy(xe_sched_job_slab);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 1aa9a4925574..23ea40b52c24 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -100,8 +100,8 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(METEORLAKE,	mmp_ver(  i915,	guc,	mtl,	70, 6, 4))	\
-	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))	\
+	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
-- 
2.34.1

