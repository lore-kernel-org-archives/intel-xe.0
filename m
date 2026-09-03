Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9146EC624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5138C10E104;
	Thu,  3 Sep 2026 14:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD3w+zGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA3010F65D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788445196; x=1819981196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tbrTyf2MpbtN3Lew1Mj0CVyCSb0x6p85cAYSeyaWFR0=;
 b=LD3w+zGPffweiiRamItnaVa5NBdFajD2ouFvx1ZIIkC7wYqWVZiWId5+
 aYpP6jPtb6NqPhH20mfAPxTqsNowV5FJiZUqnbwVrBznm354ZUZVojmfA
 Pqak8a92d5ESpp3dE6uZepTK438YOKkp/la/+Gm4ivN/YuZEO0paWVKDr
 Fnz+Mp769O/qqvyEBKjpvV3pbrpHOiTnJDtYF4H1Rg3GbmJjwT9VlzuuJ
 bQ7tJ40cqWQcnBjwkH5Sd/VlDxDUgO83/YtIVm4w1CtgU1fkmXg1EVAFu
 OmZfP3r0+pviuupq0/oefimNxxFG1wI8oYCroWG7KjTI1USVRiyGIcGet A==;
X-CSE-ConnectionGUID: GtbJm7QKQoKhMwnPyWmhgg==
X-CSE-MsgGUID: PofCyU8wTROb8oRICcxYxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92797503"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92797503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:19:56 -0700
X-CSE-ConnectionGUID: aFJBpy4qQQqsxF5otaRNwQ==
X-CSE-MsgGUID: mi8waqwZQsqvsTQiln68NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275014775"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 07:19:54 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 6/7] drm/xe: capture L3 node status registers in devcoredump
Date: Thu,  3 Sep 2026 19:48:33 +0530
Message-ID: <20260903141834.1315675-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
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
index 09e571e27660..f10be2ae54db 100644
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
@@ -374,6 +395,16 @@ static struct xe_dbg_reg_snapshot *xe_gam_pf_report_capture(struct xe_gt *gt)
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
@@ -441,6 +472,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** GAM PF Report ****\n");
 	xe_gam_pf_snapshot_print(&p, ss->gam_pf_report);
 
+	drm_printf(&p, "\n**** Node Status ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->ns);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -496,6 +530,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
 	ss->gam_pf_report = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->ns);
+	ss->ns = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -703,6 +740,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
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

