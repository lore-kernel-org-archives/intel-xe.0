Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73825606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPPAduAO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3506310E529;
	Fri, 23 Oct 2026 06:08:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF03112964
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792735716; x=1824271716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NtwDwENJnBPOg1tDGqO3NgdGkxq4qNEvFuJV3y0bON8=;
 b=kPPAduAOzw5DK3hVHNfu/k9bjZvxEKAE4/dzPDXjuiN2Ip8ItqpOx9Rz
 l2bvejdkuXAS++zSHmEogfZNIw3t2gUFbgTMaf6x1lnU9d03IUaGQQCG8
 kXH1suU95y6FydlHFP+9kuznGEgqw8wXUnrJFQQaRI/oXlepZ2im/5Z9+
 pWPr3gL9F8EgvbqiU8nJVQQK85/81wAFzp8modc8RgseftosIaZQqcelD
 MFWAGRGpcMP9Kbs0/Kja+Tg66/iYEVj/OQh4eav7TrQ4si1eqe6Wild1s
 aj3FxlFcDgrY0/1gnUlQasg6TH9igKZZptup+wEwp2TUZ1aqDHXJcIKoq g==;
X-CSE-ConnectionGUID: xqEM7Lm1TnmqJYh2ThdzOg==
X-CSE-MsgGUID: /gV56ExGSqyJFSxA4P4xrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1386729"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1386729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:08:33 -0700
X-CSE-ConnectionGUID: y8P5uMFHTPyBxFAvCANy4g==
X-CSE-MsgGUID: kTi4UFMsS2+1E0ZFYjqcfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3646552"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2026 23:08:31 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v5 7/7] drm/xe/guc: capture additional engine state registers
Date: Fri, 23 Oct 2026 11:35:54 +0530
Message-ID: <20261023060554.2643515-8-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a wider set of engine state registers to GuC error capture to improve
post-mortem debugging of engine hangs and reset-related failures.

Define the missing register offsets in xe_engine_regs.h and include them in
the GuC capture list. The additional registers cover reset state, front-end
and back-end FSM state, power state, batch buffer state, instruction state,
preemption status, and related chicken/debug controls.

This provides more complete engine context in capture dumps, which should
help root-cause analysis when investigating GuC-reported engine failures.

v3:(Sashiko)
- Move FF_SLICE_CS_CHICKEN1/2 out of COMMON_BASE_ENGINE_INSTANCE
- Add XE3P_RC_SLICE_INSTANCE and include it only in xe3p_rc_inst_regs[]
- Add XE_BCS_RCS_ENGINE_INSTANCE for registers shared only by
  BCS/RCS paths
- Include XE_BCS_RCS_ENGINE_INSTANCE only in
  xe_blt_inst_regs[] and xe3p_rc_inst_regs[]
- Keep COMMON_BASE_ENGINE_INSTANCE limited to registers
  valid across all engine classes

v5:(Sashiko)
- Keep RING_EXECLIST_* in COMMON_BASE_ENGINE_INSTANCE
- Drop XE_BCS_RCS_ENGINE_INSTANCE
- BCS_SWCTRL only on xe3p_blt_inst_regs
- CS_DEBUG_MODE1/CS_CHICKEN1/CS_PREEMPTION_STATUS only on xe3p_rc_inst_regs

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 22 +++++++++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 57 ++++++++++++++++++++++--
 2 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 94033982e694..9f328b1b18f5 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -60,6 +60,8 @@
 
 #define RING_START_UDW(base)			XE_REG((base) + 0x48)
 
+#define RING_CSFE_GLB_CHICKEN3(base)		XE_REG((base) + 0x4c)
+
 #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
 #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
 #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
@@ -72,6 +74,7 @@
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
 #define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
+#define RING_INSTPS(base)			XE_REG((base) + 0x70)
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
@@ -102,6 +105,8 @@
 #define   SELECTIVE_READ_GROUP			REG_GENMASK(29, 23)
 #define   SELECTIVE_READ_INSTANCE		REG_GENMASK(22, 16)
 
+#define RESET_CTRL(base)			XE_REG((base) + 0xd0)
+
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
@@ -123,15 +128,21 @@
 #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
+#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4, XE_REG_OPTION_MASKED)
+
 #define CS_DEBUG_MODE1(base)			XE_REG((base) + 0xec, XE_REG_OPTION_MASKED)
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
 #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
 
 #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
 
+#define RING_BB_STATE(base)			XE_REG((base) + 0x110)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
+#define RING_BB_ADDR_DIFF(base)			XE_REG((base) + 0x154)
+
 #define PR_CTR_CTRL(base)			XE_REG((base) + 0x178)
 #define   CTR_COUNT_SELECT_FF			REG_BIT(31)
 #define   CTR_LOGIC_OP_MASK			REG_GENMASK(30, 0)
@@ -148,6 +159,8 @@
 #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
 #define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
 
+#define RING_CSBEFSM3(base)			XE_REG((base) + 0x224)
+
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
@@ -169,9 +182,16 @@
 #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 
+#define RING_CSFESM(base)			XE_REG((base) + 0x2a0)
+#define RING_CSFESM2(base)			XE_REG((base) + 0x2a4)
+#define RING_CSFESM3(base)			XE_REG((base) + 0x2a8)
+#define RING_CSPWRFSM(base)			XE_REG((base) + 0x2ac)
+
 #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
 #define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
 
+#define RING_CSBEFSM(base)			XE_REG((base) + 0x2bc)
+
 #define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
 #define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
 
@@ -217,6 +237,8 @@
 #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
 #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
 
+#define CS_PREEMPTION_STATUS(base)		XE_REG((base) + 0x5ac)
+
 #define CS_GPR_DATA(base, n)			XE_REG((base) + 0x600 + (n) * 4)
 #define CS_GPR_REG(base, n)			CS_GPR_DATA((base), (n) * 2)
 #define CS_GPR_REG_UDW(base, n)			CS_GPR_DATA((base), (n) * 2 + 1)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 6a20eab0f820..2e13df97e106 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -150,6 +150,33 @@ struct __guc_capture_parsed_output {
 #define XE3P_BASE_ENGINE_INSTANCE \
 	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
 
+#define XE3P_CS_DEBUG_INSTANCE \
+	{ RESET_CTRL(0),		REG_32BIT,	0,	0,	0,	"RESET_CTRL"}, \
+	{ RING_CSBEFSM3(0),		REG_32BIT,	0,	0,	0,	"RING_CSBEFSM3"}, \
+	{ RING_CSFESM(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM"}, \
+	{ RING_CSFESM2(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM2"}, \
+	{ RING_CSFESM3(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM3"}, \
+	{ RING_CSPWRFSM(0),		REG_32BIT,	0,	0,	0,	"RING_CSPWRFSM"}, \
+	{ RING_CSBEFSM(0),		REG_32BIT,	0,	0,	0,	"RING_CSBEFSM"}, \
+	{ RING_CSFE_GLB_CHICKEN3(0),	REG_32BIT,	0,	0,	0,	"RING_CSFE_GLB_CHICKEN3"}, \
+	{ RING_PSMI_CTL(0),		REG_32BIT,	0,	0,	0,	"RING_PSMI_CTL"}, \
+	{ RING_INSTPS(0),		REG_32BIT,	0,	0,	0,	"RING_INSTPS"}, \
+	{ RING_BB_ADDR_DIFF(0),		REG_32BIT,	0,	0,	0,	"RING_BB_ADDR_DIFF"}, \
+	{ RING_BB_STATE(0),		REG_32BIT,	0,	0,	0,	"RING_BB_STATE"}
+
+/*
+ * CS_CHICKEN1 has GPGPU/3D preempt bits; keep with RCS/CCS only.
+ * RCS+CCS share GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE, so these cannot
+ * be RCS-only.
+ */
+#define XE3P_RC_CS_PREEMPT_INSTANCE \
+	{ CS_DEBUG_MODE1(0),		REG_32BIT,	0,	0,	0,	"CS_DEBUG_MODE1"}, \
+	{ CS_CHICKEN1(0),		REG_32BIT,	0,	0,	0,	"CS_CHICKEN1"}, \
+	{ CS_PREEMPTION_STATUS(0),	REG_32BIT,	0,	0,	0,	"CS_PREEMPTION_STATUS"}
+
+#define XE3P_BCS_ONLY_INSTANCE \
+	{ BCS_SWCTRL(0),		REG_32BIT,	0,	0,	0,	"BCS_SWCTRL"}
+
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 	COMMON_XELP_BASE_GLOBAL,
@@ -186,9 +213,12 @@ static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
+#define XE_BLT_INST_REGS \
+	COMMON_BASE_ENGINE_INSTANCE
+
 /* Blitter Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
-	COMMON_BASE_ENGINE_INSTANCE,
+	XE_BLT_INST_REGS,
 };
 
 /* XE_LP - GSC Per-Engine-Instance */
@@ -200,6 +230,15 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
 static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 	XE3P_BASE_ENGINE_INSTANCE,
+	XE3P_CS_DEBUG_INSTANCE,
+	XE3P_RC_CS_PREEMPT_INSTANCE,
+};
+
+/* Xe3p Blitter Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] = {
+	XE_BLT_INST_REGS,
+	XE3P_CS_DEBUG_INSTANCE,
+	XE3P_BCS_ONLY_INSTANCE,
 };
 
 /*
@@ -264,7 +303,7 @@ static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
 	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
-	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
 	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_PAGING),
@@ -377,9 +416,12 @@ static const struct __ext_steer_reg xehpg_extregs[] = {
 	{"SC_INSTDONE_EXTRA",		XEHPG_SC_INSTDONE_EXTRA},
 	{"SC_INSTDONE_EXTRA2",		XEHPG_SC_INSTDONE_EXTRA2},
 	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT},
+};
+
+static const struct __ext_steer_reg xe2_extregs[] = {
 	{"ROW_INSTDONE_TDL_GFX",	ROW_INSTDONE_TDL_GFX},
 	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX},
-	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS}
+	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS},
 };
 
 static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
@@ -422,6 +464,8 @@ static int guc_capture_get_steer_reg_num(struct xe_device *xe)
 
 	if (GRAPHICS_VERx100(xe) >= 1255)
 		num += ARRAY_SIZE(xehpg_extregs);
+	if (GRAPHICS_VER(xe) >= 20)
+		num += ARRAY_SIZE(xe2_extregs);
 
 	return num;
 }
@@ -434,6 +478,7 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
 	const struct __guc_mmio_reg_descr_group *lists = guc->capture->reglists;
 	const struct __guc_mmio_reg_descr_group *list;
 	struct __guc_mmio_reg_descr_group *extlists;
+	bool has_xe2_extregs = GRAPHICS_VER(gt_to_xe(gt)) >= 20;
 	struct __guc_mmio_reg_descr *extarray;
 	bool has_xehpg_extregs = GRAPHICS_VERx100(gt_to_xe(gt)) >= 1255;
 	struct drm_device *drm = &gt_to_xe(gt)->drm;
@@ -504,6 +549,12 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
 				__fill_ext_reg(extarray, &xehpg_extregs[i], dss, slice, subslice);
 				++extarray;
 			}
+
+		if (has_xe2_extregs)
+			for (i = 0; i < ARRAY_SIZE(xe2_extregs); ++i) {
+				__fill_ext_reg(extarray, &xe2_extregs[i], dss, slice, subslice);
+				++extarray;
+			}
 	}
 
 	extlists[0].num_regs = total;
-- 
2.43.0

