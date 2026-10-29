Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE40606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WtxUdVBR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE4411248B;
	Thu, 29 Oct 2026 17:31:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71C011248B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793295059; x=1824831059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NmuBVz1zT+cFhqgukktvjJR1PfNffa9wBAfmsv5Uxlc=;
 b=WtxUdVBRUyc5Xx0ZPmLt7cslIVgV+FkGb95S0ZIbMr4i7yn7NGfUJVvL
 Z9VrOWeyj6NsVB+ZIZ48tGxWwRUwcXIMKAS+59acyOo3KAKw/PsVTHPie
 s7KivOO36cOMY1ToUpIoPPjjArvlscNLw/Zd1Cl0SG7qZIURJbvfhe/Pt
 HVt+7g+AR9pLPr22xMOGwyDg8fPHv8Ob4GIzd6YylibuUcYusH/EwSm+t
 PthqSHYONcznuP/Fv69pQSOZIETLt0GtMU0ooEhoHVWXB8BxZJAOYHxQX
 WaugX24tNpCRvb2g1tpukYCmrfsvebdc93YZMka6ffPcspbZGJ1boVgxX A==;
X-CSE-ConnectionGUID: Hq/ouS70SFyyWCLt48hI5g==
X-CSE-MsgGUID: lj+iRzS1TbuTjvh+W+vFiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1955563"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1955563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 10:30:59 -0700
X-CSE-ConnectionGUID: xvJkEbQwQ2y5TFIEF1Y1bA==
X-CSE-MsgGUID: 3+MWYF7iSpGZfgGXWdWnaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5595486"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 10:30:58 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v7 6/7] drm/xe: capture L3 node status registers in devcoredump
Date: Thu, 29 Oct 2026 22:57:59 +0530
Message-ID: <20261029172800.2150325-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172800.2150325-1-naresh.kumar.g@intel.com>
References: <20261029172800.2150325-1-naresh.kumar.g@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

v7:(Sashiko)
-Use a Xe_LP-specific L3 capture list to avoid unsupported L3_NODE_IDLE MCR
reads while retaining L3STAT_LBCF_GFX capture

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 35 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f884fc2e38aaf..28331505bb34e 100644
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
index 67e38a4dda8d0..7634246d77258 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -122,6 +122,15 @@ static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] = {
 	XE_REG_DESC_MCR(PAGE_FLTRPTQ_TAIL, "PAGE_FLTRPTQ_TAIL"),
 };
 
+static const struct xe_reg_desc xe_dbg_xelp_l3_reglist[] = {
+	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
+};
+
+static const struct xe_reg_desc xe_dbg_l3_node_reglist[] = {
+	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
+	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
+};
+
 /**
  * struct xe_gt_regset - Struct for register descriptor list for GT
  *
@@ -142,6 +151,8 @@ struct xe_gt_regset {
  * @XE_DBG_REGSET_RPM: RPM register set
  * @XE_DBG_REGSET_GUC: GUC register set
  * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
+ * @XE_DBG_REGSET_XELP_L3: Xe_LP L3 register set
+ * @XE_DBG_REGSET_L3_NODE: L3 Node register Set
  * @XE_DBG_REGSET_MAX: Number of debug register set types
  */
 enum xe_dbg_regset_type {
@@ -149,6 +160,8 @@ enum xe_dbg_regset_type {
 	XE_DBG_REGSET_RPM,
 	XE_DBG_REGSET_GUC,
 	XE_DBG_REGSET_GAM_PF,
+	XE_DBG_REGSET_XELP_L3,
+	XE_DBG_REGSET_L3_NODE,
 	XE_DBG_REGSET_MAX,
 };
 
@@ -175,6 +188,14 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_gam_pf_reglist,
 					ARRAY_SIZE(xe_dbg_gam_pf_reglist) },
 	},
+	[XE_DBG_REGSET_XELP_L3] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_xelp_l3_reglist,
+					 ARRAY_SIZE(xe_dbg_xelp_l3_reglist) },
+	},
+	[XE_DBG_REGSET_L3_NODE] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_l3_node_reglist,
+					 ARRAY_SIZE(xe_dbg_l3_node_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -359,6 +380,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 
 	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss->gam_pf_report);
 
+	xe_dbg_reg_snapshot_print(&p, "Node Status", ss->ns);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -416,6 +439,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
 	ss->gam_pf_report = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->ns);
+	ss->ns = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -588,6 +614,10 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
 					   struct xe_gt *gt, struct xe_gt *other_gt)
 {
+	enum xe_dbg_regset_type l3_regset =
+		GRAPHICS_VERx100(gt_to_xe(gt)) < 1250 ?
+		XE_DBG_REGSET_XELP_L3 : XE_DBG_REGSET_L3_NODE;
+
 	ss->gt_fuse      = xe_dbg_gt_snapshot_capture(gt,
 						      other_gt,
 						      XE_DBG_REGSET_FUSE,
@@ -616,6 +646,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
 						       other_gt,
 						       XE_DBG_REGSET_GAM_PF,
 						       XE_GT_TYPE_MAIN);
+	ss->ns = xe_dbg_gt_snapshot_capture(gt,
+					    other_gt,
+					    l3_regset,
+					    XE_GT_TYPE_MAIN);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -667,7 +701,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		if (job)
 			ss->job = xe_sched_job_snapshot_capture(job);
 		ss->vm = xe_vm_snapshot_capture(q->vm);
-
 		xe_engine_snapshot_capture_for_queue(q);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index fba3d23040b9e..e4fb3e12e068e 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -110,6 +110,8 @@ struct xe_devcoredump_snapshot {
 
 	/** @gam_pf_report: GAM PF report snapshot */
 	struct xe_dbg_reg_snapshot *gam_pf_report;
+	/** @ns: Node status snapshot */
+	struct xe_dbg_reg_snapshot *ns;
 
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
-- 
2.43.0

