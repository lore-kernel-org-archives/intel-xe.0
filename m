Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CEAC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB7C10E835;
	Mon, 24 Aug 2026 18:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DR1dIBDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269A310E82B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597099; x=1819133099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JLY7G8QFWQi8wl92ElEd4Xow4QJofyzlHCV/Eb1evKc=;
 b=DR1dIBDRwVeFaVqJKJS5M1jqF4HNY4URFQsJ6uJfAVns/4LZ3Tno7eV9
 DxexDtnf8AAvVzZYfiLkXrx83NfTlO1qibidjPUdFo/64r64nsdNCNcwf
 PJ8zw2/vBuTS8ypn/GsaZLeiacWI0xg9/Mn71l7EuRTyQvmm94QYCZBnS
 3MIJQeIwhYAg7xjlwC4bLLQi0EH5odORxQvB6p4miZNRYaQ+GvH99b+qF
 ZXrWlmVXPnYmqIP/M+V7aYsbjj6uEsrveHfxAyZbaxq551pv3IT0uOzcY
 TsUTknBqcjpxo1X99+S5nwwaHdRRU+1duOVmh1RjkByCS+grf2+Z0OXfJ g==;
X-CSE-ConnectionGUID: O49W9K/yRhmI3RfT+WPdvw==
X-CSE-MsgGUID: tOZVY/xITn+a23uHH+oWEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75592765"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="75592765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:44:59 -0700
X-CSE-ConnectionGUID: KxpM6/qNTTGLaPcn3gGhTQ==
X-CSE-MsgGUID: 0oDVavsYQUWEOh8C7nNYvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263351761"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 11:44:58 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 6/7] drm/xe: capture L3 node status registers in devcoredump
Date: Tue, 25 Aug 2026 00:13:55 +0530
Message-ID: <20260824184356.1960708-7-naresh.kumar.g@intel.com>
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

Add L3_NODE_IDLE and L3STAT_LBCF_GFX register definitions and include
them in the devcoredump snapshot as a node status section.

Extend the register descriptor to mark MCR registers so the snapshot
code can read them through xe_gt_mcr_unicast_read_any(), then print and
free the captured node status registers alongside the existing dump
sections.

v2:(Sashiko)
- change L3 node registers as XE_REG_MCR type
- identify mcr register type from reg.mcr
- As generic capture function ensure VF check this will not execute
  on VF Mode.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 46 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index b3ce7074f7d7..213422063de3 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -426,6 +426,9 @@
 #define   L3_ESC_MASK				REG_BIT(0)
 #define   L3_ESC(value)				REG_FIELD_PREP(L3_ESC_MASK, value)
 
+#define L3_NODE_IDLE				XE_REG_MCR(0xb0b0)
+#define L3STAT_LBCF_GFX				XE_REG_MCR(0xb128)
+
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 37893d09d05e..5099d545726e 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -28,6 +28,7 @@
 #include "xe_mmio.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "xe_gt_mcr.h"
 
 /**
  * DOC: Xe device coredump
@@ -79,13 +80,18 @@
  * of the register to dump its value during coredump for debug purpose.
  */
 struct xe_reg_desc {
-	/** @reg: The register */
-	struct xe_reg reg;
+	union {
+		/** @reg: The register */
+		struct xe_reg reg;
+		/** @mcr_reg: The mcr register */
+		struct xe_reg_mcr mcr_reg;
+	};
 	/** @name: Name of the register */
 	const char *name;
 };
 
 #define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
+#define XE_REG_DESC_MCR(_reg, _name)	{ .mcr_reg = (_reg), .name = (_name) }
 
 static const struct xe_reg_desc xe3p_gt_guc_reglist[] = {
 	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
@@ -132,6 +138,11 @@ static const struct xe_reg_desc xe3p_gam_pf_reglist[] = {
 	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
 };
 
+static const struct xe_reg_desc xe3p_l3_node_reglist[] = {
+	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
+	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
+};
+
 /**
  * struct xe_reg_desc_list - Struct for register descriptor list
  *
@@ -195,6 +206,13 @@ static const struct xe_gt_regset xe_gam_pf_regset = {
 	},
 };
 
+static const struct xe_gt_regset xe_l3_node_regset = {
+	.gt[XE_GT_TYPE_MAIN] = {
+		.regs = xe3p_l3_node_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_l3_node_reglist),
+	},
+};
+
 #define XE_GT_REG_LIST(_type, _gt_type) \
 	(&xe_##_type##_regset.gt[XE_GT_TYPE_##_gt_type])
 
@@ -208,7 +226,10 @@ xe_capture_reg_desc_list(struct xe_gt *gt,
 
 	for (i = 0; i < count; i++) {
 		dst[i].reg = src[i].reg;
-		dst[i].value = xe_mmio_read32(&gt->mmio, src[i].reg);
+		if (src[i].reg.mcr)
+			dst[i].value = xe_gt_mcr_unicast_read_any(gt, src[i].mcr_reg);
+		else
+			dst[i].value = xe_mmio_read32(&gt->mmio, src[i].reg);
 		dst[i].name = src[i].name;
 	}
 }
@@ -373,6 +394,16 @@ static struct xe_dbg_reg_snapshot *xe_gam_pf_report_capture(struct xe_gt *gt)
 						  XE_GT_REG_LIST(gam_pf, MAIN));
 }
 
+static struct xe_dbg_reg_snapshot *xe_node_status_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->primary_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->primary_gt,
+						  XE_GT_REG_LIST(l3_node, MAIN));
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -440,6 +471,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** GAM PF Report ****\n");
 	xe_gam_pf_snapshot_print(&p, ss->gam_pf_report);
 
+	drm_printf(&p, "\n**** Node Status ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->ns);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -495,6 +529,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
 	ss->gam_pf_report = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->ns);
+	ss->ns = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -702,6 +739,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->gam_pf_report = xe_gam_pf_report_capture(q->gt);
+
+	ss->ns = xe_node_status_capture(q->gt);
+
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
 	if (job)
 		ss->job = xe_sched_job_snapshot_capture(job);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index ea7638d0a7a2..6f6d1a80dbb6 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -92,6 +92,8 @@ struct xe_devcoredump_snapshot {
 
 	/** @gam_pf_report: GAM PF report snapshot */
 	struct xe_dbg_reg_snapshot *gam_pf_report;
+	/** @ns: Node status snapshot */
+	struct xe_dbg_reg_snapshot *ns;
 
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
-- 
2.43.0

