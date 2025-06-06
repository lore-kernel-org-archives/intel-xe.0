Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B134C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB1D10EBD6;
	Fri,  6 Jun 2025 19:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT2dJRH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ABB10EBEA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749237981; x=1780773981;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xint7W2YgyI/W39rQE0fuPd1IgP/IHEcgoifojc861c=;
 b=IT2dJRH4pEUB1mSDXuwlpgfgWsXrqQY5oO4iA50XmiHFb6up75ATTt9V
 +q0/3tmNtstbB397JRxJWjwtD9wGyK8etj9kcYdpYRcIkCYGJpD73y4lb
 EgpgAw0wjR4SlQay0Ob4K90y5LWtCeaf3lCb14esXr+Pt3WwXK5Fy4zh6
 3F92cwA67UnXuKb8FhuhSUkCtNwZiUJAWxNgyKNqbTtsUywm/KWhY92cC
 PGmUkD2O6WAQwYZdMxIYfZh+dfWqAmwaxQavtJ6R4KkYXebgV+sPnqnHR
 TYL5GviBvdGJN4YR104O7p6AfhCaVSPSzk3kHiZ7duZP2A1Sck80C1948 A==;
X-CSE-ConnectionGUID: JfIJiFKJSrmHcW0TJrDQpQ==
X-CSE-MsgGUID: awXklCCMSLK/ifc2kFoOCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61663143"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="61663143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
X-CSE-ConnectionGUID: 0hesGbYlTEC7steT46vHpg==
X-CSE-MsgGUID: p7XQMuTETj+Xh1F+6lQvSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="150742749"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/xe/oa/uapi: Expose media OA units
Date: Fri,  6 Jun 2025 12:26:13 -0700
Message-ID: <20250606192618.4133817-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
References: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
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

On Xe2+ platforms, media engines are attached to "SCMI" OA media (OAM)
units. One or more SCMI OAM units might be present on a platform. In
addition there is another OAM unit for global events, called
OAM-SAG. Performance metrics for media workloads can be obtained from these
OAM units, similar to OAG.

Expose these OAM units for userspace to use. OAM-SAG is exposed as an OA
unit without any attached engines.

Bspec: 70819, 67103, 63844, 72572, 74476, 61284

v2: Fix xe_gt_WARN_ON in __hwe_oam_unit for < 12.7 platforms
v3: Return XE_OA_UNIT_INVALID for < 12.7 to indicate no OAM units
v4: Move xe_oa_print_oa_units() to separate patch
v5: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
v6: Introduce DRM_XE_OA_CAPS_OAM

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c    | 68 ++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_query.c |  4 +--
 include/uapi/drm/xe_drm.h     |  4 +++
 3 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fb842fa0552e5..0de0d5a18df74 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -43,6 +43,12 @@
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 #define XE_OA_UNIT_INVALID U32_MAX
 
+enum xe_oam_unit_type {
+	XE_OAM_UNIT_SAG,
+	XE_OAM_UNIT_SCMI_0,
+	XE_OAM_UNIT_SCMI_1,
+};
+
 enum xe_oa_submit_deps {
 	XE_OA_SUBMIT_NO_DEPS,
 	XE_OA_SUBMIT_ADD_DEPS,
@@ -1881,6 +1887,7 @@ static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
 		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
 	case DRM_XE_OA_UNIT_TYPE_OAM:
+	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
 		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
 	default:
 		return false;
@@ -2448,20 +2455,38 @@ int xe_oa_register(struct xe_device *xe)
 
 static u32 num_oa_units_per_gt(struct xe_gt *gt)
 {
-	return 1;
+	if (!xe_gt_is_media_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
+		return 1;
+	else if (!IS_DGFX(gt_to_xe(gt)))
+		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
+	else
+		return XE_OAM_UNIT_SCMI_1 + 1; /* SAG + SCMI_0 + SCMI_1 */
 }
 
 static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
 {
-	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
-		/*
-		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
-		 * within the gt use the same OAM. All MTL/LNL SKUs list 1 SA MEDIA
-		 */
-		xe_gt_WARN_ON(hwe->gt, hwe->gt->info.type != XE_GT_TYPE_MEDIA);
+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) < 1270)
+		return XE_OA_UNIT_INVALID;
 
+	xe_gt_WARN_ON(hwe->gt, !xe_gt_is_media_type(hwe->gt));
+
+	if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20)
 		return 0;
-	}
+	/*
+	 * XE_OAM_UNIT_SAG has only GSCCS attached to it, but only on some platforms. Also
+	 * GSCCS cannot be used to submit batches to program the OAM unit. Therefore we don't
+	 * assign an OA unit to GSCCS. This means that XE_OAM_UNIT_SAG is exposed as an OA
+	 * unit without attached engines. Fused off engines can also result in oa_unit's with
+	 * num_engines == 0. OA streams can be opened on all OA units.
+	 */
+	else if (hwe->engine_id == XE_HW_ENGINE_GSCCS0)
+		return XE_OA_UNIT_INVALID;
+	else if (!IS_DGFX(gt_to_xe(hwe->gt)))
+		return XE_OAM_UNIT_SCMI_0;
+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE)
+		return (hwe->instance / 2 & 0x1) + 1;
+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
+		return (hwe->instance & 0x1) + 1;
 
 	return XE_OA_UNIT_INVALID;
 }
@@ -2475,6 +2500,7 @@ static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
 
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+	case XE_ENGINE_CLASS_OTHER:
 		return __hwe_oam_unit(hwe);
 
 	default:
@@ -2514,18 +2540,25 @@ static struct xe_oa_regs __oag_regs(void)
 
 static void __xe_oa_init_oa_units(struct xe_gt *gt)
 {
-	const u32 mtl_oa_base[] = { 0x13000 };
+	/* Actual address is MEDIA_GT_GSI_OFFSET + oam_base_addr[i] */
+	const u32 oam_base_addr[] = {
+		[XE_OAM_UNIT_SAG]    = 0x13000,
+		[XE_OAM_UNIT_SCMI_0] = 0x14000,
+		[XE_OAM_UNIT_SCMI_1] = 0x14800,
+	};
 	int i, num_units = gt->oa.num_oa_units;
 
 	for (i = 0; i < num_units; i++) {
 		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
 
-		if (gt->info.type != XE_GT_TYPE_MEDIA) {
+		if (!xe_gt_is_media_type(gt)) {
 			u->regs = __oag_regs();
 			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
-		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
-			u->regs = __oam_regs(mtl_oa_base[i]);
-			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
+		} else {
+			xe_gt_assert(gt, GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270);
+			u->regs = __oam_regs(oam_base_addr[i]);
+			u->type = i == XE_OAM_UNIT_SAG && GRAPHICS_VER(gt_to_xe(gt)) >= 20 ?
+				DRM_XE_OA_UNIT_TYPE_OAM_SAG : DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
 		xe_mmio_write32(&gt->mmio, u->regs.oa_ctrl, 0);
@@ -2560,10 +2593,6 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 		}
 	}
 
-	/*
-	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
-	 * will appear in OA unit query, but no OA streams can be opened on them.
-	 */
 	gt->oa.num_oa_units = num_oa_units;
 	gt->oa.oa_unit = u;
 
@@ -2579,6 +2608,11 @@ static int xe_oa_init_oa_units(struct xe_oa *oa)
 	struct xe_gt *gt;
 	int i, ret;
 
+	/* Needed for OAM implementation here */
+	BUILD_BUG_ON(XE_OAM_UNIT_SAG != 0);
+	BUILD_BUG_ON(XE_OAM_UNIT_SCMI_0 != 1);
+	BUILD_BUG_ON(XE_OAM_UNIT_SCMI_1 != 2);
+
 	for_each_gt(gt, oa->xe, i) {
 		ret = xe_oa_init_gt(gt);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2dbf4066d86ff..e8e1743dcb1e0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -683,8 +683,8 @@ static int query_oa_units(struct xe_device *xe,
 			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
 			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
 					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE |
-					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS;
-
+					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS |
+					   DRM_XE_OA_CAPS_OAM;
 			j = 0;
 			for_each_hw_engine(hwe, gt, hwe_id) {
 				if (!xe_hw_engine_is_reserved(hwe) &&
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6a702ba7817c3..8e8bbdec8c5ca 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1617,6 +1617,9 @@ enum drm_xe_oa_unit_type {
 
 	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
 	DRM_XE_OA_UNIT_TYPE_OAM,
+
+	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
+	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
 };
 
 /**
@@ -1638,6 +1641,7 @@ struct drm_xe_oa_unit {
 #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
 #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
 #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
+#define DRM_XE_OA_CAPS_OAM		(1 << 4)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
-- 
2.48.1

