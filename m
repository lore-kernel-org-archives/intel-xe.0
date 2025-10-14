Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB122CCD195
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9523910E539;
	Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/QRjlNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCCB10E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4fUfFIoasASvBQi0O+9yZzAuw5ZJKeY6TuzNaS+cSKo=;
 b=J/QRjlNJjbIHd/p8lRT2gLXiJ3mrcMMbJ7kg24DHzHzsajvce4wE3kr3
 rs5ytWtIEhz5+wPpoZ6JX0EO6ryXH0IziA03uSVIEhfSTPqn+lE5N5Wsu
 RE5y3V8kUufECA4Mkpb/+IQZ+Zy9iUgFBtzFe2iCG091Ca4anft6Dvr6U
 1ja97PxgQLweCSe+94dskMjcrxjIu2nrnE83afHEQZBhdvkUSAaoTmLI+
 rhNbq+5Z8pn9eDTXpDV6JJJu82ZYix8l7odXQdmUPTe3lE2ns2zirwpoR
 1BE7MjAs+3JCmJ4/h5O6ZNEOaMgrMD5vN5iGRESPPuKiJxKFXjJ3qeTAW w==;
X-CSE-ConnectionGUID: ePpNTghlRYe8eHKTehNp1Q==
X-CSE-MsgGUID: dpfptRV+RyGOdYwbsPx7VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414877"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: 5oP55DcaQVK5/9UuDVS/BQ==
X-CSE-MsgGUID: GWa1EMj7SEub80VThYGuaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567305"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 13/23] drm/xe: Dump CURRENT_LRCA and CSMQDEBUG registers
Date: Mon, 13 Oct 2025 20:24:45 -0700
Message-ID: <20251013-xe3p-v1-13-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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

Add CURRENT_LRCA and CSMQDEBUG to register dump to help debugging.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Wang Xin <x.wang@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  5 +++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 53 +++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index f4c3e1187a00a..7b6ec0cf78c85 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -141,6 +141,9 @@
 #define   INHIBIT_SWITCH_UNTIL_PREEMPTED	REG_BIT(31)
 #define   IDLE_DELAY				REG_GENMASK(20, 0)
 
+#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
+#define   CURRENT_LRCA_VALID			REG_BIT(0)
+
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
@@ -153,6 +156,8 @@
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 
+#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
+
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
 #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 243dad3e24185..265aa7b7614ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -122,6 +122,7 @@ struct __guc_capture_parsed_output {
 	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
 	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
 	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
+	{ RING_CURRENT_LRCA(0),		REG_32BIT,	0,	0,	0,	"CURRENT_LRCA"}, \
 	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
 	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
 	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
@@ -149,6 +150,9 @@ struct __guc_capture_parsed_output {
 	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
 	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
 
+#define XE3P_BASE_ENGINE_INSTANCE \
+	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
+
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 	COMMON_XELP_BASE_GLOBAL,
@@ -195,6 +199,36 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
+/* Render / Compute Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+	XE3P_BASE_ENGINE_INSTANCE,
+};
+
+/* Media Decode/Encode Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_vd_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+	XE3P_BASE_ENGINE_INSTANCE,
+};
+
+/* Video Enhancement Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_vec_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+	XE3P_BASE_ENGINE_INSTANCE,
+};
+
+/* Blitter Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+	XE3P_BASE_ENGINE_INSTANCE,
+};
+
+/* XE3P - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_gsc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+	XE3P_BASE_ENGINE_INSTANCE,
+};
+
 /*
  * Empty list to prevent warnings about unknown class/instance types
  * as not all class/instance types have entries on all platforms.
@@ -245,6 +279,21 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
 	{}
 };
 
+ /* List of lists for graphic product version >= 3500 */
+static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
+	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(xe_hpg_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(xe3p_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe3p_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(xe3p_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(xe3p_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	{}
+};
 static const char * const capture_list_type_names[] = {
 	"Global",
 	"Class",
@@ -292,7 +341,9 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct xe_device *xe)
 {
-	if (GRAPHICS_VERx100(xe) >= 1255)
+	if (GRAPHICS_VERx100(xe) >= 3500)
+		return xe3p_lists;
+	else if (GRAPHICS_VERx100(xe) >= 1255)
 		return xe_hpg_lists;
 	else
 		return xe_lp_lists;

-- 
2.51.0

