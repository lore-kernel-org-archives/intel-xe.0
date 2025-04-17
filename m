Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A1CC369CB
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 19:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA6C10E3B2;
	Thu, 17 Apr 2025 19:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBc5dLRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574EF10E3B1
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 19:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744919536; x=1776455536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zdq1wH3qrbCX8+k59Ssh38nCWqk5E7TDW7jgTwXJgIA=;
 b=jBc5dLRK2dtrnweT9rnpc7M95Np4qKuDiJHx8YeDlGYsmjhoUwDtLSrs
 6RFrYEb/3rT19FI4L0o4FtJgz22jM4xpJMppUt9Zrbb2KZxOTt7Y0kNH4
 OnRbk0qNzz1zxafjG24Ug4zALO/CBV5tPxzW46y7sBFheYJ/BpLBXNuot
 WDD0Toh6vfnE+QlY6ySz3v9ok0OO7obilMRxAstN1gA0zgzBQBCJo1Z15
 7D/dA0dyffbm0IpHLu+3Zjlbi2CTtZLZlrfHr+dUh8iRhMsDGcijYnPvL
 +LsgmYYEleEHoHDTwCDYS7s/gY9fpbB7AIIFFkD32Y5tGjPKBxy3RRwRP A==;
X-CSE-ConnectionGUID: 1pyYKAfqRRqgV7i0LeDVaw==
X-CSE-MsgGUID: kZqJV4biTlOYUtlVlnOPPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46456368"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46456368"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:52:16 -0700
X-CSE-ConnectionGUID: 77D8Ys42RvyGANX5yWp7dg==
X-CSE-MsgGUID: gdO84/pNROWip0licPED/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135765218"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 17 Apr 2025 12:52:16 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Cache DSS info when creating capture register
 list
Date: Thu, 17 Apr 2025 12:52:14 -0700
Message-ID: <20250417195215.3002210-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Calculating the DSS id (index of a steered register) currently
requires reading state from the hwconfig table and that currently
requires dynamically allocating memory. The GuC based register capture
(for dev core dumps) includes this index as part of the register name
in the dump. However, it was calculating said index at the time of the
dump for every dump. That is wasteful. It also breaks anyone trying to
do the dump at a time when memory allocations are not allowed.

So rather than calculating on every print, just calculate at start of
day when creating the register list in the first place.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c       | 92 +++++++++++------------
 drivers/gpu/drm/xe/xe_guc_capture_types.h |  2 +
 2 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f4b08136e472..139e4e3bcc32 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -105,49 +105,49 @@ struct __guc_capture_parsed_output {
  *     3. Incorrect order will trigger XE_WARN.
  */
 #define COMMON_XELP_BASE_GLOBAL \
-	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
+	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	0,	"FORCEWAKE_GT"}
 
 #define COMMON_BASE_ENGINE_INSTANCE \
-	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	"HWSTAM"}, \
-	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	"RING_HWS_PGA"}, \
-	{ RING_HEAD(0),			REG_32BIT,	0,	0,	"RING_HEAD"}, \
-	{ RING_TAIL(0),			REG_32BIT,	0,	0,	"RING_TAIL"}, \
-	{ RING_CTL(0),			REG_32BIT,	0,	0,	"RING_CTL"}, \
-	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	"RING_MI_MODE"}, \
-	{ RING_MODE(0),			REG_32BIT,	0,	0,	"RING_MODE"}, \
-	{ RING_ESR(0),			REG_32BIT,	0,	0,	"RING_ESR"}, \
-	{ RING_EMR(0),			REG_32BIT,	0,	0,	"RING_EMR"}, \
-	{ RING_EIR(0),			REG_32BIT,	0,	0,	"RING_EIR"}, \
-	{ RING_IMR(0),			REG_32BIT,	0,	0,	"RING_IMR"}, \
-	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	"IPEHR"}, \
-	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	"RING_INSTDONE"}, \
-	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	"INDIRECT_RING_STATE"}, \
-	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
-	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"ACTHD"}, \
-	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
-	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_BBADDR"}, \
-	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
-	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_START"}, \
-	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
-	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_DMA_FADD"}, \
-	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	NULL}, \
-	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_STATUS"}, \
-	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	NULL}, \
-	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
+	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	0,	"HWSTAM"}, \
+	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	0,	"RING_HWS_PGA"}, \
+	{ RING_HEAD(0),			REG_32BIT,	0,	0,	0,	"RING_HEAD"}, \
+	{ RING_TAIL(0),			REG_32BIT,	0,	0,	0,	"RING_TAIL"}, \
+	{ RING_CTL(0),			REG_32BIT,	0,	0,	0,	"RING_CTL"}, \
+	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	0,	"RING_MI_MODE"}, \
+	{ RING_MODE(0),			REG_32BIT,	0,	0,	0,	"RING_MODE"}, \
+	{ RING_ESR(0),			REG_32BIT,	0,	0,	0,	"RING_ESR"}, \
+	{ RING_EMR(0),			REG_32BIT,	0,	0,	0,	"RING_EMR"}, \
+	{ RING_EIR(0),			REG_32BIT,	0,	0,	0,	"RING_EIR"}, \
+	{ RING_IMR(0),			REG_32BIT,	0,	0,	0,	"RING_IMR"}, \
+	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
+	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
+	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
+	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
+	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
+	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
+	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_BBADDR"}, \
+	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
+	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_START"}, \
+	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
+	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_DMA_FADD"}, \
+	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
+	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_STATUS"}, \
+	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
 
 #define COMMON_XELP_RC_CLASS \
-	{ RCU_MODE,			REG_32BIT,	0,	0,	"RCU_MODE"}
+	{ RCU_MODE,			REG_32BIT,	0,	0,	0,	"RCU_MODE"}
 
 #define COMMON_XELP_RC_CLASS_INSTDONE \
-	{ SC_INSTDONE,			REG_32BIT,	0,	0,	"SC_INSTDONE"}, \
-	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA"}, \
-	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA2"}
+	{ SC_INSTDONE,			REG_32BIT,	0,	0,	0,	"SC_INSTDONE"}, \
+	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA"}, \
+	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA2"}
 
 #define XELP_VEC_CLASS_REGS \
-	{ SFC_DONE(0),			0,	0,	0,	"SFC_DONE[0]"}, \
-	{ SFC_DONE(1),			0,	0,	0,	"SFC_DONE[1]"}, \
-	{ SFC_DONE(2),			0,	0,	0,	"SFC_DONE[2]"}, \
-	{ SFC_DONE(3),			0,	0,	0,	"SFC_DONE[3]"}
+	{ SFC_DONE(0),			0,	0,	0,	0,	"SFC_DONE[0]"}, \
+	{ SFC_DONE(1),			0,	0,	0,	0,	"SFC_DONE[1]"}, \
+	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
+	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
 
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
@@ -350,7 +350,7 @@ static const struct __ext_steer_reg xehpg_extregs[] = {
 	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT}
 };
 
-static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
+static void __fill_ext_reg(struct xe_gt *gt, struct __guc_mmio_reg_descr *ext,
 			   const struct __ext_steer_reg *extlist,
 			   int slice_id, int subslice_id)
 {
@@ -361,6 +361,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
 	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_NEEDED, 1);
 	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
 	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
+	ext->dss_id = xe_gt_mcr_steering_info_to_dss_id(gt, slice_id, subslice_id);
 	ext->regname = extlist->name;
 }
 
@@ -456,13 +457,13 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
 	extarray = (struct __guc_mmio_reg_descr *)extlists[0].list;
 	for_each_dss_steering(iter, gt, slice, subslice) {
 		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
-			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
+			__fill_ext_reg(gt, extarray, &xe_extregs[i], slice, subslice);
 			++extarray;
 		}
 
 		if (has_xehpg_extregs)
 			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
-				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
+				__fill_ext_reg(gt, extarray, &xehpg_extregs[i], slice, subslice);
 				++extarray;
 			}
 	}
@@ -1747,17 +1748,12 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			 */
 			XE_WARN_ON(low32_ready);
 
-			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {
-				int dss, group, instance;
-
-				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
-				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
-				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
-
-				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
-			} else {
+			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
+				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
+					   reg_desc->dss_id, value);
+			else
 				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
-			}
+
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index ca2d390ccbee..6cb439115597 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -39,6 +39,8 @@ struct __guc_mmio_reg_descr {
 	u32 flags;
 	/** @mask: The mask to apply */
 	u32 mask;
+	/** @dss_id: Cached index for steered registers */
+	u32 dss_id;
 	/** @regname: Name of the register */
 	const char *regname;
 };
-- 
2.49.0

