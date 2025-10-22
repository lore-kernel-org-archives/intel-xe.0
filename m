Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76F9CCD1BF
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D47910E6AC;
	Wed, 22 Oct 2025 05:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sqyh4+CY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5F310E6AB
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BrWff0cWu1rdy/VSHJGsGGR7T0vfyvQaqMzezRvoKkA=;
 b=Sqyh4+CY2EjhIvZhoU7z7jfTeKHqsQRmQ+G4mrbhZuflXDwARUwz/YUD
 7fkiCJ+3Wkn+zdcrYqvrW9guF90UFjQVx7y4gX8LHTejVjyXmh1D4+tET
 iGXmwNSMNLJVljUTk3+j3iHd9MFwW8sXHjgM0kibd0p0kv3UHrDpt5+pw
 GjehtBh4l9nWLbpi7pnrK0PfJM8/1MIYlL/Qc1ih+C3Kx6faZb9JApHSU
 UHvizQSgr4U3USdWFLsqmakCczra5YhIOuvWt8bvh5LVV/KcwrfhTSbCU
 hUEkjcV41EjGX/Mes9Z3cWa4H2Yxubuqg8XBUDGabwFZdGKeIdXuY1S+f A==;
X-CSE-ConnectionGUID: X38w4C7xSzSQuiTqKcLqYg==
X-CSE-MsgGUID: /FyooTMVThyKbi/vcLP6sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083978"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: ON9vRh2+R0aZ9qU6SRd/Cw==
X-CSE-MsgGUID: 7HIlA0bmTlmvlqxQm7VnkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959704"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 08/12] drm/xe/oa/uapi: Expose MERT OA unit
Date: Tue, 21 Oct 2025 22:17:40 -0700
Message-ID: <20251021-cri-v1-8-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

A MERT OA unit is available in the SoC on some platforms. Add support
for this OA unit and expose it to userspace. The MERT OA unit does not
have any HW engines attached, but is otherwise similar to an OAM unit.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_oa.c           | 36 +++++++++++++++++++++++++++++++++---
 include/uapi/drm/xe_drm.h            |  3 +++
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index e693a50706f84..72334bd660751 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -100,4 +100,13 @@
 #define OAM_COMPRESSION_T3_CONTROL		XE_REG(0x1c2e00)
 #define  OAM_LAT_MEASURE_ENABLE			REG_BIT(4)
 
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
index f901ba52b4032..4aea94d438d40 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1915,6 +1915,7 @@ static bool oa_unit_supports_oa_format(struct xe_oa_open_param *param, int type)
 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
 	case DRM_XE_OA_UNIT_TYPE_OAM:
 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
+	case DRM_XE_OA_UNIT_TYPE_MERT:
 		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
 	default:
 		return false;
@@ -2206,6 +2207,8 @@ static const struct xe_mmio_range xe2_oa_mux_regs[] = {
 	{ .start = 0xE18C, .end = 0xE18C },	/* SAMPLER_MODE */
 	{ .start = 0xE590, .end = 0xE590 },	/* TDL_LSC_LAT_MEASURE_TDL_GFX */
 	{ .start = 0x13000, .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
+	{ .start = 0x145194, .end = 0x145194 },	/* SYS_MEM_LAT_MEASURE */
+	{ .start = 0x145340, .end = 0x14537C },	/* MERTSS_PES_0 - MERTSS_PES_7 */
 	{},
 };
 
@@ -2495,7 +2498,12 @@ int xe_oa_register(struct xe_device *xe)
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
@@ -2577,6 +2585,21 @@ static struct xe_oa_regs __oag_regs(void)
 	};
 }
 
+static struct xe_oa_regs __oamert_regs(void)
+{
+	return (struct xe_oa_regs) {
+		0,
+		OAMERT_HEAD_POINTER,
+		OAMERT_TAIL_POINTER,
+		OAMERT_BUFFER,
+		OAMERT_CONTEXT_CONTROL,
+		OAMERT_CONTROL,
+		OAMERT_DEBUG,
+		OAMERT_STATUS,
+		OAM_CONTROL_COUNTER_SEL_MASK,
+	};
+}
+
 static void __xe_oa_init_oa_units(struct xe_gt *gt)
 {
 	/* Actual address is MEDIA_GT_GSI_OFFSET + oam_base_addr[i] */
@@ -2591,8 +2614,15 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
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
index 47853659a705e..09599dcc816d6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1654,6 +1654,9 @@ enum drm_xe_oa_unit_type {
 
 	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
 	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
+
+	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
+	DRM_XE_OA_UNIT_TYPE_MERT,
 };
 
 /**

-- 
2.51.0

