Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C98606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nPAjC00V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9E811265D;
	Thu, 22 Oct 2026 13:32:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5360911265D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792675955; x=1824211955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7QV8p2QHT49bamz/n1amak+K3wxJRT4JbreURVKLVLM=;
 b=nPAjC00Vw+6SrCnVqM9moMLNpSxbUCZGDz1TmjJgyG4kJSmBbpYvGaKY
 E1y94F9SL8AESmD5cHAuHWjot6X9FIuamRPrZe8aLDDgh6rCz8eLlPiRq
 6Td7eQcyYSAEP74R/r0706/hyp/04qCMWUFjWOndLaz3Cwqk4C4sKasz8
 iH1JkQJqyhf8pW+cdLnP3rGBDut3hk8GK8XJT9fDSztzLvnVM+wK0NTzo
 E7f3Yeu20KpVNxWD2+ppo+vUSE0CXQwYoPW8h22a7oeOhRAG9kk1y2DhT
 iaoWKAnjl438AjirPXIBE77GVF8sVoNfqXeF9D2EqmhTEeyPGIexY/vMe Q==;
X-CSE-ConnectionGUID: Eq2Hu5ppRjuQTIwQABH9cA==
X-CSE-MsgGUID: vKICGw9iSMe2gbPJQJk2uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1439236"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1439236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:32:33 -0700
X-CSE-ConnectionGUID: vGaBRu6HSXiqj7dwp2qT5w==
X-CSE-MsgGUID: o9bNOIphRqWdx1nEdlef2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3700783"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2026 06:32:32 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v5 6/7] drm/xe: capture L3 node status registers in devcoredump
Date: Thu, 22 Oct 2026 18:59:56 +0530
Message-ID: <20261022132957.2479469-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022132957.2479469-1-naresh.kumar.g@intel.com>
References: <20261022132957.2479469-1-naresh.kumar.g@intel.com>
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

v5:
- Rebase

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 +++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 32 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 10 +++++--
 3 files changed, 40 insertions(+), 5 deletions(-)

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
index 9f2f46e40012..1c80cc6c3b6a 100644
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
 
 static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] = {
 	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
@@ -119,6 +121,11 @@ static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] = {
 	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
 };
 
+static const struct xe_reg_desc xe_dbg_l3_node_reglist[] = {
+	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
+	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
+};
+
 /**
  * struct xe_gt_regset - Struct for register descriptor list for GT
  *
@@ -139,6 +146,7 @@ struct xe_gt_regset {
  * @XE_DBG_REGSET_RPM: RPM register set
  * @XE_DBG_REGSET_GUC: GUC register set
  * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
+ * @XE_DBG_REGSET_L3_NODE: L3 Node register Set
  * @XE_DBG_REGSET_MAX: Number of debug register set types
  */
 enum xe_dbg_regset_type {
@@ -146,6 +154,7 @@ enum xe_dbg_regset_type {
 	XE_DBG_REGSET_RPM,
 	XE_DBG_REGSET_GUC,
 	XE_DBG_REGSET_GAM_PF,
+	XE_DBG_REGSET_L3_NODE,
 	XE_DBG_REGSET_MAX,
 };
 
@@ -172,6 +181,10 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_gam_pf_reglist,
 					ARRAY_SIZE(xe_dbg_gam_pf_reglist) },
 	},
+	[XE_DBG_REGSET_L3_NODE] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_l3_node_reglist,
+					 ARRAY_SIZE(xe_dbg_l3_node_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -262,8 +275,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
 
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
@@ -345,6 +363,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 
 	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss->gam_pf_report);
 
+	xe_dbg_reg_snapshot_print(&p, "Node Status", ss->ns);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -402,6 +422,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
 	ss->gam_pf_report = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->ns);
+	ss->ns = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -602,6 +625,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
 						       other_gt,
 						       XE_DBG_REGSET_GAM_PF,
 						       XE_GT_TYPE_MAIN);
+	ss->ns = xe_dbg_gt_snapshot_capture(gt,
+					    other_gt,
+					    XE_DBG_REGSET_L3_NODE,
+					    XE_GT_TYPE_MAIN);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -653,7 +680,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		if (job)
 			ss->job = xe_sched_job_snapshot_capture(job);
 		ss->vm = xe_vm_snapshot_capture(q->vm);
-
 		xe_engine_snapshot_capture_for_queue(q);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 34f224a6751f..6cbecad43c42 100644
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

