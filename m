Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC9BD374A6
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 21:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEC310EBBA;
	Fri,  5 Dec 2025 21:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoPPa907";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43AD10EBBA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764969981; x=1796505981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QekDQguGAeMNVyXOsYPyK3LAK8QeUuL1c4Yec4d6Bd0=;
 b=PoPPa9075Wg8gUdUQ5dytLYze2UM/mXtQLyOp7LuzcsBww8Ck2vdBEjz
 XiLPMmxuDP1+yse3lITog3g0JUu5T0HURlQlKmCOh5FO2LhzZgLlJE3Bs
 9AFk6DJWW8YZ5DGdWkQ69+a/8hxx8oO0jT9Qtwlz4vOoWhymj+5D3HmUg
 k/ZRz3z4+Y6MfPU7SyHCznseVx6oohB5y8RtUjJDzfn+Gk+2fpdVZbVYs
 PCYEYvKBR1vBYt0t2Lz+9hx1LdkjVN8Vl60T302xFwRXuNM/engVOJlVB
 1UGVbs06X1Ky6mbqegi9A9FzIISuKCsgTRZlNltr5KtvBSkWc1bG0egdM w==;
X-CSE-ConnectionGUID: dDrd0BgwQl+D5GTWjCprag==
X-CSE-MsgGUID: +OvlyUFYRo6u4H1GI2Joyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66893793"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66893793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
X-CSE-ConnectionGUID: VsHbGbLTTZOspbbnjxeawA==
X-CSE-MsgGUID: TBOup/+DSdu2q5AbPpdZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195202137"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/3] drm/xe/oa/uapi: Expose MERT OA unit
Date: Fri,  5 Dec 2025 13:26:11 -0800
Message-ID: <20251205212613.826224-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205212613.826224-1-ashutosh.dixit@intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
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

A MERT OA unit is available in the SoC on some platforms. Add support
for this OA unit and expose it to userspace. The MERT OA unit does not
have any HW engines attached, but is otherwise similar to an OAM unit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  9 +++++++
 drivers/gpu/drm/xe/xe_oa.c           | 37 +++++++++++++++++++++++++---
 include/uapi/drm/xe_drm.h            |  3 +++
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 638ab3b99eb0b..04a729e610aa9 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -108,4 +108,13 @@
 #define XE_OAM_SCMI_0_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + XE_OAM_SCMI_0_BASE)
 #define XE_OAM_SCMI_1_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + XE_OAM_SCMI_1_BASE)
 
+#define OAMERT_CONTROL				XE_REG(0x1453a0)
+#define OAMERT_DEBUG				XE_REG(0x1453a4)
+#define OAMERT_STATUS				XE_REG(0x1453a8)
+#define OAMERT_HEAD_POINTER			XE_REG(0x1453ac)
+#define OAMERT_TAIL_POINTER			XE_REG(0x1453b0)
+#define OAMERT_BUFFER				XE_REG(0x1453b4)
+#define OAMERT_CONTEXT_CONTROL			XE_REG(0x1453c8)
+#define OAMERT_MMIO_TRG				XE_REG(0x1453cc)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cc48663c2b48f..7846dbc32542e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1937,6 +1937,7 @@ static bool oa_unit_supports_oa_format(struct xe_oa_open_param *param, int type)
 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
 	case DRM_XE_OA_UNIT_TYPE_OAM:
 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
+	case DRM_XE_OA_UNIT_TYPE_MERT:
 		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
 	default:
 		return false;
@@ -2224,6 +2225,8 @@ static const struct xe_mmio_range xe2_oa_mux_regs[] = {
 	{ .start = 0xE18C, .end = 0xE18C },	/* SAMPLER_MODE */
 	{ .start = 0xE590, .end = 0xE590 },	/* TDL_LSC_LAT_MEASURE_TDL_GFX */
 	{ .start = 0x13000, .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
+	{ .start = 0x145194, .end = 0x145194 },	/* SYS_MEM_LAT_MEASURE */
+	{ .start = 0x145340, .end = 0x14537C },	/* MERTSS_PES_0 - MERTSS_PES_7 */
 	{},
 };
 
@@ -2515,7 +2518,12 @@ int xe_oa_register(struct xe_device *xe)
 static u32 num_oa_units_per_gt(struct xe_gt *gt)
 {
 	if (xe_gt_is_main_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
-		return 1;
+		/*
+		 * Mert OA unit belongs to the SoC, not a gt, so should be accessed using
+		 * xe_root_tile_mmio(). However, for all known platforms this is the same as
+		 * accessing via xe_root_mmio_gt()->mmio.
+		 */
+		return xe_device_has_mert(gt_to_xe(gt)) ? 2 : 1;
 	else if (!IS_DGFX(gt_to_xe(gt)))
 		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
 	else
@@ -2599,6 +2607,22 @@ static struct xe_oa_regs __oag_regs(void)
 	};
 }
 
+static struct xe_oa_regs __oamert_regs(void)
+{
+	return (struct xe_oa_regs) {
+		.base		= 0,
+		.oa_head_ptr	= OAMERT_HEAD_POINTER,
+		.oa_tail_ptr	= OAMERT_TAIL_POINTER,
+		.oa_buffer	= OAMERT_BUFFER,
+		.oa_ctx_ctrl	= OAMERT_CONTEXT_CONTROL,
+		.oa_ctrl	= OAMERT_CONTROL,
+		.oa_debug	= OAMERT_DEBUG,
+		.oa_status	= OAMERT_STATUS,
+		.oa_mmio_trg	= OAMERT_MMIO_TRG,
+		.oa_ctrl_counter_select_mask = OAM_CONTROL_COUNTER_SEL_MASK,
+	};
+}
+
 static void __xe_oa_init_oa_units(struct xe_gt *gt)
 {
 	const u32 oam_base_addr[] = {
@@ -2612,8 +2636,15 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
 
 		if (xe_gt_is_main_type(gt)) {
-			u->regs = __oag_regs();
-			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
+			if (!i) {
+				u->regs = __oag_regs();
+				u->type = DRM_XE_OA_UNIT_TYPE_OAG;
+			} else {
+				xe_gt_assert(gt, xe_device_has_mert(gt_to_xe(gt)));
+				xe_gt_assert(gt, gt == xe_root_mmio_gt(gt_to_xe(gt)));
+				u->regs = __oamert_regs();
+				u->type = DRM_XE_OA_UNIT_TYPE_MERT;
+			}
 		} else {
 			xe_gt_assert(gt, GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270);
 			u->regs = __oam_regs(oam_base_addr[i]);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 876a076fa6c0c..f520462c28643 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1675,6 +1675,9 @@ enum drm_xe_oa_unit_type {
 
 	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
 	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
+
+	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
+	DRM_XE_OA_UNIT_TYPE_MERT,
 };
 
 /**
-- 
2.48.1

