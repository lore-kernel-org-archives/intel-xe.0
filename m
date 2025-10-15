Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4430BCCD1A1
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48EC10E905;
	Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R217qjPS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B0110E903
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUaOxyrwO0e58jrBORAC5dynyzYtg/oO8lCzZAmVULg=;
 b=R217qjPS007IKrNl+hIwDUGvHLHksAswDwgIeMmSZIMsYG0WVF9Wvc5U
 imm2DmUAmYqiUmN7lBL2MZnY61Oy0AhsPfXJon78WqwGaaIMxfimHVQin
 V4fDfnGY2ooKQJuduKFImWOguG7jXd29SQbCzFPLV6aDsE6Wol7ie9TJv
 P5tovO/KabXyfwzB8r5T30xxkit/gPmWu9YCSg1RmcVX5V1ezjpzW7K0p
 DecqNnxtf9cbonwitMnGaRmpH0npqwgKGXS3JaDlx4jrFTK9t+qFIIqEN
 R3UATFPjPM7OxYIkT33Kzb83NXcPyT9wgMTncu3XEm2glAjZRPOfndHKv A==;
X-CSE-ConnectionGUID: rzPrJ+YNR9q4o6Jtw9m+cQ==
X-CSE-MsgGUID: yhJQdWXkQ96J08H5SgAIgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794055"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: CMIKZgHiT1CtG0M6MuCtww==
X-CSE-MsgGUID: SlmHXNGcQP2V4fvMqk8T3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298290"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 10/22] drm/xe/xe3p: Dump CSMQDEBUG register
Date: Wed, 15 Oct 2025 15:06:25 -0700
Message-ID: <20251015-xe3p-v2-10-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 48 +++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 3c05d85902c69..7b6ec0cf78c85 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -156,6 +156,8 @@
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 
+#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
+
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
 #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 8d1bfa2cdb151..035b9b6c0df58 100644
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
@@ -196,6 +199,32 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
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
+};
+
+/* Video Enhancement Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_vec_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* Blitter Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* XE3P - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe3p_gsc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
 /*
  * Empty list to prevent warnings about unknown class/instance types
  * as not all class/instance types have entries on all platforms.
@@ -246,6 +275,21 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
 	{}
 };
 
+ /* List of lists for Xe3p and beyond */
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
@@ -293,7 +337,9 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
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

