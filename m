Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DC4CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9249C10F1A8;
	Mon, 12 Oct 2026 14:55:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7E10F19F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791816899; x=1823352899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/QrRYSgCrM9w6ZMYto71p/Vo6O7Y75MBSFC47jXDr8=;
 b=U9IfafGWqbVGsvz6NMxAkPwr+DmEO1sgmhCtp89pAehS9KGUivkOmWGQ
 Zf5XaGSmu+ivn5erlfNQnduiJJ9M52fm/Gd/1yW3Fw8qHrM4Tx1qo3M3Z
 8bsNcdkLBJdvYgf5bbZ2NOVXSLa2jOKfSs2mhWnWnuqS3tmfD1DmhR+Z3
 j4VTbti4BG0SsMPdK+gYHNWfdhpXmiMiL5kCdhPDKK+P6/NGKFxiAwvQw
 wpFaH/S7ZYGsFDHH6Ht1Mbu74bEh8OhpryKTEbVTiHbM6ref9mvt2xD60
 E1v6biaMydI+PPW40vOV5+smWhWsrPQibD/NVlcEdCgpYxk8hUD7s0FRN A==;
X-CSE-ConnectionGUID: RqT/nInlQJSNrQ3mrLDfmg==
X-CSE-MsgGUID: NkbBALqaQT+mXh7EPScOZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513563"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="513563"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:54:58 -0700
X-CSE-ConnectionGUID: yQYBKU9FQCuyey02MTgGoQ==
X-CSE-MsgGUID: OSMaY6krTu+dqoDwmhwTEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2675272"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 07:54:57 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 6/7] drm/xe: capture L3 node status registers in devcoredump
Date: Mon, 12 Oct 2026 20:22:36 +0530
Message-ID: <20261012145237.3788198-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
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

v4:(Tejas)
- Add L3_NODE type into the enum as changed/added in initial patch

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 34 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 10 +++++--
 3 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2e4cb4957479..55f0eee4e20e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -454,6 +454,9 @@
 #define   L3_ESC_MASK				REG_BIT(0)
 #define   L3_ESC(value)				REG_FIELD_PREP(L3_ESC_MASK, value)
 
+#define L3_NODE_IDLE				XE_REG_MCR(0xb0b0)
+#define L3STAT_LBCF_GFX				XE_REG_MCR(0xb128)
+
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a2a3437ec2f6..db7ccee12006 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -28,6 +28,7 @@
 #include "xe_mmio.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "xe_gt_mcr.h"
 
 /**
  * DOC: Xe device coredump
@@ -73,6 +74,7 @@
 #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
 
 #define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
+#define XE_REG_DESC_MCR(_reg, _name)	{ .mcr_reg = (_reg), .name = (_name) }
 
 static const struct xe_reg_desc xe3p_gt_guc_reglist[] = {
 	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
@@ -119,6 +121,11 @@ static const struct xe_reg_desc xe3p_gam_pf_reglist[] = {
 	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
 };
 
+static const struct xe_reg_desc xe3p_l3_node_reglist[] = {
+	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
+	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
+};
+
 /**
  * struct xe_gt_regset - Struct for register descriptor list for GT
  *
@@ -136,6 +143,7 @@ struct xe_gt_regset {
  * @XE_DBG_REGSET_RPM: RPM register set
  * @XE_DBG_REGSET_GUC: GUC register set
  * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
+ * @XE_DBG_REGSET_L3_NODE: L3 Node register Set
  * @XE_DBG_REGSET_MAX: Number of debug register set types
  */
 enum xe_dbg_regset_type {
@@ -143,6 +151,7 @@ enum xe_dbg_regset_type {
 	XE_DBG_REGSET_RPM,
 	XE_DBG_REGSET_GUC,
 	XE_DBG_REGSET_GAM_PF,
+	XE_DBG_REGSET_L3_NODE,
 	XE_DBG_REGSET_MAX,
 };
 
@@ -169,6 +178,10 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MAIN] = { xe3p_gam_pf_reglist,
 					ARRAY_SIZE(xe3p_gam_pf_reglist) },
 	},
+	[XE_DBG_REGSET_L3_NODE] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe3p_l3_node_reglist,
+					 ARRAY_SIZE(xe3p_l3_node_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -253,8 +266,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
 
 	snap->desc	= reglist;
 	snap->num_regs = reglist->num_regs;
-	for (i = 0; i < reglist->num_regs; i++)
-		snap->values[i] = xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
+	for (i = 0; i < reglist->num_regs; i++) {
+		if (reglist->regs[i].reg.mcr)
+			snap->values[i] = xe_gt_mcr_unicast_read_any(gt,
+								     reglist->regs[i].mcr_reg);
+		else
+			snap->values[i] = xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
+	}
 
 	return snap;
 }
@@ -344,6 +362,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** GAM PF Report ****\n");
 	xe_gam_pf_snapshot_print(&p, ss->gam_pf_report);
 
+	drm_printf(&p, "\n**** Node Status ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->ns);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -401,6 +422,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
 	ss->gam_pf_report = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->ns);
+	ss->ns = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -639,13 +663,15 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 						       other_gt,
 						       XE_DBG_REGSET_GAM_PF,
 						       XE_GT_TYPE_MAIN);
-
+	ss->ns = xe_dbg_gt_snapshot_capture(q->gt,
+					    other_gt,
+					    XE_DBG_REGSET_L3_NODE,
+					    XE_GT_TYPE_MAIN);
 	if (q) {
 		ss->ge = xe_guc_exec_queue_snapshot_capture(q);
 		if (job)
 			ss->job = xe_sched_job_snapshot_capture(job);
 		ss->vm = xe_vm_snapshot_capture(q->vm);
-
 		xe_engine_snapshot_capture_for_queue(q);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index dc5ae67cdaf7..8003ff8dfecf 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -21,8 +21,12 @@ struct xe_gt;
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
@@ -105,6 +109,8 @@ struct xe_devcoredump_snapshot {
 
 	/** @gam_pf_report: GAM PF report snapshot */
 	struct xe_dbg_reg_snapshot *gam_pf_report;
+	/** @ns: Node status snapshot */
+	struct xe_dbg_reg_snapshot *ns;
 
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
-- 
2.43.0

