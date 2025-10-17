Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5163CCD183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8334C10EAE3;
	Fri, 17 Oct 2025 02:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeBvQM7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0122310EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668038; x=1792204038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=goVIo301tCi1agTwINTpIrRLttf3uC6yuGvrBTzcI4o=;
 b=JeBvQM7C1WDLMzAe5q0vHmAwnDniy/74mcCf/2uG+y2a4SJGGZ4p4AaB
 L0hzObh9j2SS+mLLOJEWYnf208vp34kabD6b+H4lWa+EgGxgrgfUVO7LP
 BBZnZvFuE5YoIlgEL1ZwsoLR6RWaXI8le7iFqETPgozOTOI4w+WVi7uGF
 5joccw6mb3KxcvDsEp2yyEJPegntOIYBaGOWLI+0HsS+DqSlS189JjcrY
 g/P9nPj0O/ygjYjEeAGATjTLWXgsMrtFMUksTryfkCW55YEqZICQgG+nS
 YbDOwkXV9g9+syNjcgujhBVieYG7iFBub0YJmBlA7kbgVjLfw7ggJWdOs Q==;
X-CSE-ConnectionGUID: vtXLbtHwSdqZjrxatEchGA==
X-CSE-MsgGUID: INKMK0aMSu6mXQ71R2l2ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739213"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
X-CSE-ConnectionGUID: C+vBpH6FRJiaj7y1JZUPLQ==
X-CSE-MsgGUID: IsAjuZorQkehqLVJVPnpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089186"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v3 10/24] drm/xe/xe3p: Dump CSMQDEBUG register
Date: Thu, 16 Oct 2025 19:26:29 -0700
Message-ID: <20251016-xe3p-v3-10-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
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

From: Wang Xin <x.wang@intel.com>

The CSMQDEBUG is useful for the development of MQ feature. Start dumping
the debug register.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Wang Xin <x.wang@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
 - Extract CSMQDEBUG from other patch dumping multiple register (Matt
   Roper)
 - Simplify version check (Matt Roper)
 - Do not dump CSMQDEBUG for engines that do not support MQ (Matt Roper)
v3:
 - Drop desc structs not needed anymore, just use the one for previous
   platform (Matt Roper)
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 28 +++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 0c02d0fe55315..68172b0248a6e 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -155,6 +155,8 @@
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 
+#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
+
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
 #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 8d1bfa2cdb151..0c1fbe97b8bf2 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -150,6 +150,9 @@ struct __guc_capture_parsed_output {
 	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
 	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
 
+#define XE3P_BASE_ENGINE_INSTANCE \
+	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
+
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 	COMMON_XELP_BASE_GLOBAL,
@@ -196,6 +199,12 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
+/* Render / Compute Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+	XE3P_BASE_ENGINE_INSTANCE,
+};
+
 /*
  * Empty list to prevent warnings about unknown class/instance types
  * as not all class/instance types have entries on all platforms.
@@ -246,6 +255,21 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
 	{}
 };
 
+ /* List of lists for Xe3p and beyond */
+static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
+	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(xe_hpg_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(xe3p_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	{}
+};
 static const char * const capture_list_type_names[] = {
 	"Global",
 	"Class",
@@ -293,7 +317,9 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct xe_device *xe)
 {
-	if (GRAPHICS_VERx100(xe) >= 1255)
+	if (GRAPHICS_VER(xe) >= 35)
+		return xe3p_lists;
+	else if (GRAPHICS_VERx100(xe) >= 1255)
 		return xe_hpg_lists;
 	else
 		return xe_lp_lists;

-- 
2.51.0

