Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D05C5B552
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 23:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E920C10E790;
	Thu, 29 May 2025 23:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/sKyIP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2827410E0CF
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 23:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748563131; x=1780099131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+DJVOJQCYKI5C5DdmdHTLlAeS10zw++2d130N2aRU38=;
 b=h/sKyIP3VX7XbxLcyzxvu6KqJ3ZmOcUFZF+vXUfBdAx1SIHJ4sGQXMeH
 o1o9AHCDqH0M2U5OGxTOnAesu+Joa4u51uzV4AC4QL6LvjJgJsFEBFJ+n
 aSwB1RszPyj0lBjYw9M0bGT4tUCk7ucTauid/utSHcLwRVZL3etapqGgL
 mtwM75+nesunrYKwLggsBp1UoA4QjERmB5EcvmPZuND9JC7/DnC9M0tyk
 mSeLZ/3InZdCfVtZ9pt5ks0y/X4tUyUGdXeIhabltt/YoRQBf7aaK/YUZ
 9rjJCAIlxLAcOjrjwoqHOrGhPCXAvrBKqSwSg6Y6pYlYonmG66hUDeyEl Q==;
X-CSE-ConnectionGUID: Rp1YmF1yTiG2z3h9UKiEfg==
X-CSE-MsgGUID: MxONFMsjSqu2V8XMOv2j9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49764991"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="49764991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:48 -0700
X-CSE-ConnectionGUID: paLUuJXST2CDbzRP2LsTVw==
X-CSE-MsgGUID: qYYMnctWQuSqX2aITR1Z7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="166889407"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/4] drm/xe/oa: Expose media OA units
Date: Thu, 29 May 2025 16:58:33 -0700
Message-ID: <20250529235836.145097-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250529235836.145097-1-ashutosh.dixit@intel.com>
References: <20250529235836.145097-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 64 ++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fb842fa0552e5..5c9d7ac82e7e4 100644
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
@@ -2448,20 +2454,38 @@ int xe_oa_register(struct xe_device *xe)
 
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
@@ -2475,6 +2499,7 @@ static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
 
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+	case XE_ENGINE_CLASS_OTHER:
 		return __hwe_oam_unit(hwe);
 
 	default:
@@ -2514,17 +2539,23 @@ static struct xe_oa_regs __oag_regs(void)
 
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
+		} else {
+			xe_gt_assert(gt, GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270);
+			u->regs = __oam_regs(oam_base_addr[i]);
 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
@@ -2560,10 +2591,6 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 		}
 	}
 
-	/*
-	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
-	 * will appear in OA unit query, but no OA streams can be opened on them.
-	 */
 	gt->oa.num_oa_units = num_oa_units;
 	gt->oa.oa_unit = u;
 
@@ -2579,6 +2606,11 @@ static int xe_oa_init_oa_units(struct xe_oa *oa)
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
-- 
2.48.1

