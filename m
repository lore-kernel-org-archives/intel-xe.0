Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367DFCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1110E6AB;
	Tue, 26 May 2026 14:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkfX9G/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD0510E6A2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805159; x=1811341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah87iO2aVCWv95W1fFmaLFnOuWbGbVwu4SENDxgUyBY=;
 b=DkfX9G/6xkBNnF5HeJZFspPCk4dnrxuTvCNcHd8ff8Txczkipd9j6Q7S
 BkIoTEC23jSNFOmlnky2k05tMDHdrqMy04F4L9KZO9ChTzorU+7vrSVDz
 KozJsWc2jfudVxhibJgt39o5Mn6x58nJyjzACQamT6Snsgw0uiGQKzaxy
 1pts9vh31/ub1X2eU0YHkC1kyICT4BDFye820/cpYEbcpgkeF6RkFLgYz
 GgaT7U2RRkuN4s4nN+neODmqYv5h0NWeAhboWALf05dUfp7DYTaGvzEyn
 GHuznK8+prz2d2qcbEKe2BmCOtaXKYUXjxQrQ2ZTbkB+LveCmFpmWyTfo g==;
X-CSE-ConnectionGUID: AXKO8Xf+QDObVxn6Ic0XkA==
X-CSE-MsgGUID: U6MMEDEETWuE4poAXT9nbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84505743"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84505743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:18 -0700
X-CSE-ConnectionGUID: phKNg5XNReyp/85FRCWsSQ==
X-CSE-MsgGUID: tMhKHkq5QzazWfQPvQp9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="247015713"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 03/10] drm/xe/guc: add the plumbing for GUC_PAGING_CLASS
Date: Tue, 26 May 2026 15:19:05 +0100
Message-ID: <20260526141901.62207-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526141901.62207-12-matthew.auld@intel.com>
References: <20260526141901.62207-12-matthew.auld@intel.com>
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

On newer platforms, the GuC has a new engine class which we need to use
to refer to the dedicated/reserved KMD BCS engine. With that, add the
plumbing in the GuC backend to support GUC_PAGING_CLASS and
GUC_CAPTURE_LIST_CLASS_PAGING.

Currently this is still turned off.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_capture_abi.h   |  3 ++-
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h |  3 ++-
 drivers/gpu/drm/xe/xe_guc.c                | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h                |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c            | 19 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_capture.c        |  7 +++++++
 drivers/gpu/drm/xe/xe_guc_capture.h        |  2 ++
 7 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_capture_abi.h b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
index dd4117553739..ff9c0ae34a28 100644
--- a/drivers/gpu/drm/xe/abi/guc_capture_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
@@ -32,9 +32,10 @@ enum guc_capture_list_class_type {
 	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
 	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
 	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
+	GUC_CAPTURE_LIST_CLASS_PAGING = 5,
 };
 
-#define GUC_CAPTURE_LIST_CLASS_MAX	(GUC_CAPTURE_LIST_CLASS_GSC_OTHER + 1)
+#define GUC_CAPTURE_LIST_CLASS_MAX	(GUC_CAPTURE_LIST_CLASS_PAGING + 1)
 
 /**
  * struct guc_mmio_reg - GuC MMIO reg state struct
diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
index 19ec89bf39c5..85bba34277ed 100644
--- a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
@@ -21,7 +21,8 @@
 #define GUC_BLITTER_CLASS		3
 #define GUC_COMPUTE_CLASS		4
 #define GUC_GSC_OTHER_CLASS		5
-#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
+#define GUC_PAGING_CLASS		6
+#define GUC_LAST_ENGINE_CLASS		GUC_PAGING_CLASS
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4023700ff2a9..2bc9fa5fb393 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1846,6 +1846,21 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 	return GT_VER(gt) >= 35;
 }
 
+bool xe_guc_has_paging_engine(struct xe_guc *guc)
+{
+	/*
+	 * On newer platforms the GuC now has a dedicated engine class for the
+	 * special PAGING engine, which is the driver reserved BCS engine used
+	 * for KMD paging/binding operations. GuC requires KMD to refer to this
+	 * using the special PAGING engine class. Note that there is no new hw
+	 * engine here, this is purely a sw view in the GuC itself, which we
+	 * need to respect.
+	 */
+
+	/* TODO: Have some way to query this from the GuC? */
+	return false;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_guc_g2g_test.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 12faf0ba7229..0934927e8254 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -62,6 +62,7 @@ void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
 void xe_guc_declare_wedged(struct xe_guc *guc);
 bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
+bool xe_guc_has_paging_engine(struct xe_guc *guc);
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index c84b98828981..cedab0e1f798 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -261,6 +261,7 @@ static inline enum xe_engine_class guc_class_to_engine_class(u16 guc_class)
 	case GUC_VIDEOENHANCE_CLASS:
 		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
 	case GUC_BLITTER_CLASS:
+	case GUC_PAGING_CLASS:
 		return XE_ENGINE_CLASS_COPY;
 	case GUC_COMPUTE_CLASS:
 		return XE_ENGINE_CLASS_COMPUTE;
@@ -489,13 +490,24 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
 	struct xe_device *xe = gt_to_xe(gt);
 	u16 guc_class;
 
-	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class)
+	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
+		u32 mask = engine_enable_mask(gt, guc_class);
+
 		info_map_write(xe, info_map, engine_enabled_masks[guc_class],
-			       engine_enable_mask(gt, guc_class));
+			       mask);
+
+		/* We expect at most one paging engine per GuC instance, for now */
+		if (guc_class == GUC_PAGING_CLASS)
+			xe_gt_assert(gt, !mask || is_power_of_2(mask));
+	}
 }
 
 u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
 {
+	if (xe_guc_has_paging_engine(&hwe->gt->uc.guc) &&
+	    xe_gt_is_usm_hwe(hwe->gt, hwe))
+		return GUC_PAGING_CLASS;
+
 	switch (hwe->class) {
 	case XE_ENGINE_CLASS_RENDER:
 		return GUC_RENDER_CLASS;
@@ -615,6 +627,9 @@ static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_
 	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
 		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
 		break;
+	case GUC_CAPTURE_LIST_CLASS_PAGING:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_PAGING_CLASS]);
+		break;
 	default:
 		mask = 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 50c6b9466c14..c13b23c45aac 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -265,6 +265,8 @@ static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
 	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
 	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_PAGING),
+	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_PAGING),
 	{}
 };
 static const char * const capture_list_type_names[] = {
@@ -279,6 +281,7 @@ static const char * const capture_engine_class_names[] = {
 	"VideoEnhance",
 	"Blitter",
 	"GSC-Other",
+	"Paging",
 };
 
 struct __guc_capture_ads_cache {
@@ -766,6 +769,10 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
 		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
+			if (!xe_guc_has_paging_engine(guc) &&
+			    j == GUC_CAPTURE_LIST_CLASS_PAGING)
+				continue;
+
 			if (xe_guc_capture_getlistsize(guc, i,
 						       GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
 						       j, &class_size) < 0)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index eb954f4d1ffd..fcd4f1298536 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -28,6 +28,8 @@ static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16
 	case GUC_VIDEOENHANCE_CLASS:
 	case GUC_BLITTER_CLASS:
 		return class;
+	case GUC_PAGING_CLASS:
+		return GUC_CAPTURE_LIST_CLASS_PAGING;
 	default:
 		XE_WARN_ON(class);
 		return GUC_CAPTURE_LIST_CLASS_MAX;
-- 
2.54.0

