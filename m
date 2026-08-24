Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF99C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82F210E834;
	Mon, 24 Aug 2026 18:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQej73KP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2E410E834
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597101; x=1819133101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fwr5CEGmFL/ZNCcFp/vivo58ibvH6aQR0oFGba54JKE=;
 b=lQej73KP0tmIxZhgt6lGbv5dxlxgLTj7uuSkdOn/4l99s8PRDfiZyG4o
 X4gT7Oh0MFhAwvfsGPSsIPgeEzpwq3vvZtOjAxk8rUl9tOBycIEb8vtXS
 QNI8DQt/Oc6aUpDdg43wRvTWn9krOciZnmKNVxyXBUYDkPpnWTn4PgGn9
 azjPMfLtbu5mT2azGwaW47Lei07x4+cX0BzaqZbD+batLWbNUGhgDRkUG
 U/y+POpkv5knRtXqbIj2LpUPW2PaH/ysfcgWHHqlPCyEkC6uOcvApAyRc
 MlJtCNhN3VjBKFFDFTYhAkK0cowdGMfxtsj15Dc8y028uLl8KmGgX796Y w==;
X-CSE-ConnectionGUID: Ny0HlyseRXCNPIHAUlAcJw==
X-CSE-MsgGUID: nuY5Vo1FSnungRfqCLQVbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75592768"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="75592768"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:45:00 -0700
X-CSE-ConnectionGUID: TgIMC4mVQvKOZiiUzsGLRQ==
X-CSE-MsgGUID: 60Mj6urOTzSqrqKj8Vu2EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263351770"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 11:44:59 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 7/7] drm/xe/guc: capture additional engine state registers
Date: Tue, 25 Aug 2026 00:13:56 +0530
Message-ID: <20260824184356.1960708-8-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
References: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
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

Add a wider set of engine state registers to GuC error capture to improve
post-mortem debugging of engine hangs and reset-related failures.

Define the missing register offsets in xe_engine_regs.h and include them in
the GuC capture list. The additional registers cover reset state, front-end
and back-end FSM state, power state, batch buffer state, instruction state,
preemption status, and related chicken/debug controls.

This provides more complete engine context in capture dumps, which should
help root-cause analysis when investigating GuC-reported engine failures.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 20 +++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 94033982e694..c661abf69249 100644
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
 
+#define RING_BB_STATE(base)				XE_REG((base) + 0x110)
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
index 62832bd4af78..37e7e3d92bfc 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -131,7 +131,25 @@ struct __guc_capture_parsed_output {
 	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
 	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_STATUS"}, \
 	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
-	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0, 0, 0, "RING_EXECLIST_SQ_CONTENTS"}, \
+	{ RESET_CTRL(0),	REG_32BIT, 0, 0, 0,	"RESET_CTRL"}, \
+	{ RING_CSBEFSM3(0),	REG_32BIT,	0,	0,	0,	"RING_CSBEFSM3"}, \
+	{ RING_CSFESM(0),	REG_32BIT,	0,	0,	0,	"RING_CSFESM"}, \
+	{ RING_CSFESM2(0),	REG_32BIT,	0,	0,	0,	"RING_CSFESM2"}, \
+	{ RING_CSFESM3(0),	REG_32BIT,	0,	0,	0,	"RING_CSFESM3"}, \
+	{ RING_CSPWRFSM(0),	REG_32BIT,	0,	0,	0,	"RING_CSPWRFSM"}, \
+	{ RING_CSBEFSM(0),	REG_32BIT,	0,	0,	0,	"RING_CSBEFSM1"}, \
+	{ BCS_SWCTRL(0),	REG_32BIT,	0,	0,	0,	"BCS_SWCTRL"}, \
+	{ RING_CSFE_GLB_CHICKEN3(0), REG_32BIT, 0, 0, 0, "RING_CSFE_GLB_CHICKEN3" }, \
+	{ RING_PSMI_CTL(0),	REG_32BIT,	0,	0,	0,	"RING_PSMI_CTL"}, \
+	{ RING_INSTPS(0),	REG_32BIT,	0,	0,	0,	"RING_INSTPS"}, \
+	{ RING_BB_ADDR_DIFF(0),	REG_32BIT,	0,	0,	0,	"RING_BB_ADDR_DIFF"}, \
+	{ RING_BB_STATE(0),	REG_32BIT,	0,	0,	0,	"RING_BB_STATE"}, \
+	{ FF_SLICE_CS_CHICKEN1(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN1" }, \
+	{ CS_DEBUG_MODE1(0),	REG_32BIT,	0,	0,	0,	"CS_DEBUG_MODE1"}, \
+	{ CS_CHICKEN1(0),	REG_32BIT,	0,	0,	0,	"CS_CHICKEN1"}, \
+	{ CS_PREEMPTION_STATUS(0), REG_32BIT, 0, 0, 0, "CS_PREEMPTION_STATUS" }, \
+	{ FF_SLICE_CS_CHICKEN2(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN2" }
 
 #define COMMON_XELP_RC_CLASS \
 	{ RCU_MODE,			REG_32BIT,	0,	0,	0,	"RCU_MODE"}
-- 
2.43.0

