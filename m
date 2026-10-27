Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08BB606A329
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D43/2Jp1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA2210E37F;
	Tue, 27 Oct 2026 05:13:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489BE10E37F
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 05:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793077991; x=1824613991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QB8gnTdItI2YraO+X2vogy6FDETmb/75WLiWT57Y9yc=;
 b=D43/2Jp18+501oHpU5W7XHldyMY80t8Uxjo0UDokz49IrSVFZ3zH/1lQ
 V4WIVHpTv1OIWDstX3I7j4VYWK8pCmfjzi5oYAYQkuLaQllhAe0lcDMdY
 2ZAdsqRRgMA4HKv/3sik41Fa0xqk/qaax3oWCVhMJxdfDYyc+VDL1BHi+
 HWGMDL3e8nVtefoOtxdcELHVXUt9n2FpVnHZtPgSe+JaqrWdOF/OKVKC/
 z/EnRmgky2Lipz+1XByN9iVUpxTq2fi3LTQjI591e+L3iKWfEZ29n+2AB
 oy3nkUBuI5VVPCnoXkeZnVsNwCA77M4fohhCDQivQAfzA1+lyvn84FMR+ Q==;
X-CSE-ConnectionGUID: LJ4ZyNFvRLSZV4Cm8/E+3g==
X-CSE-MsgGUID: TbtZl7e1TcC4di5I50QKTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1857333"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1857333"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 22:13:09 -0700
X-CSE-ConnectionGUID: e0WEo7jSRQyNCC1LcHsn2A==
X-CSE-MsgGUID: 3ofvzGbNQGCRmqeX+j+ZrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4536715"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 26 Oct 2026 22:13:07 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v6 6/7] drm/xe: capture L3 node status registers in devcoredump
Date: Tue, 27 Oct 2026 10:40:23 +0530
Message-ID: <20261027051024.465587-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027051024.465587-1-naresh.kumar.g@intel.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
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
 drivers/gpu/drm/xe/xe_devcoredump.c       | 21 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 3 files changed, 25 insertions(+), 1 deletion(-)

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
index 90e16c89dd963..714b63e9653df 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -121,6 +121,11 @@ static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] = {
 	XE_REG_DESC_MCR(PAGE_FLTRPTQ_TAIL, "PAGE_FLTRPTQ_TAIL"),
 };
 
+static const struct xe_reg_desc xe_dbg_l3_node_reglist[] = {
+	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
+	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
+};
+
 /**
  * struct xe_gt_regset - Struct for register descriptor list for GT
  *
@@ -141,6 +146,7 @@ struct xe_gt_regset {
  * @XE_DBG_REGSET_RPM: RPM register set
  * @XE_DBG_REGSET_GUC: GUC register set
  * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
+ * @XE_DBG_REGSET_L3_NODE: L3 Node register Set
  * @XE_DBG_REGSET_MAX: Number of debug register set types
  */
 enum xe_dbg_regset_type {
@@ -148,6 +154,7 @@ enum xe_dbg_regset_type {
 	XE_DBG_REGSET_RPM,
 	XE_DBG_REGSET_GUC,
 	XE_DBG_REGSET_GAM_PF,
+	XE_DBG_REGSET_L3_NODE,
 	XE_DBG_REGSET_MAX,
 };
 
@@ -174,6 +181,10 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_gam_pf_reglist,
 					ARRAY_SIZE(xe_dbg_gam_pf_reglist) },
 	},
+	[XE_DBG_REGSET_L3_NODE] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_l3_node_reglist,
+					 ARRAY_SIZE(xe_dbg_l3_node_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -352,6 +363,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 
 	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss->gam_pf_report);
 
+	xe_dbg_reg_snapshot_print(&p, "Node Status", ss->ns);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -409,6 +422,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
 	ss->gam_pf_report = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->ns);
+	ss->ns = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -609,6 +625,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
 						       other_gt,
 						       XE_DBG_REGSET_GAM_PF,
 						       XE_GT_TYPE_MAIN);
+	ss->ns = xe_dbg_gt_snapshot_capture(gt,
+					    other_gt,
+					    XE_DBG_REGSET_L3_NODE,
+					    XE_GT_TYPE_MAIN);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -660,7 +680,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
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

