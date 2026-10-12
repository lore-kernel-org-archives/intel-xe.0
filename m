Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A808CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D210F19E;
	Mon, 12 Oct 2026 14:55:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6BE10F19E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791816892; x=1823352892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UzYGJVNiK4Mu/deMyla6u3OcWTf7UlgzkQ0Y2qh/MRY=;
 b=Jeu4KtxGyvK9Dn2z91zHUNEDAIrABzTNLqAhI6/68c45kLWFsM02H3N3
 +4/qAkY8kCCdRvqlrpbsXaLYe9sPAN6jr7EzBd4/f4X0Vqird26kaFUm7
 XgKoBSKAb5SQu6y78g8IyMkdj471o4YHDBwi8JWcjG1YwiLVtEKRwxnae
 2c53s2zscY5txntM+VlK+JHT4eedUF/dH6E1EK1VqYhrZ9QauVqXUm9WV
 Aj6bCVEaMg5YIGu92SrOXjRAi8wxLeQtcXQO0Q0z8NEV6eebu4j5m/KrJ
 /slQIst8XZ2mvEsvUKqs2Iqe1dDwnlEv6ZsWuil6W3qF4we8exBkhA9UG w==;
X-CSE-ConnectionGUID: YO2hSXRiRgSRKiW0u5dzaA==
X-CSE-MsgGUID: YZuSWvE2R7WLqpYZWWsr0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513557"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="513557"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:54:52 -0700
X-CSE-ConnectionGUID: 2N1Gc9qRSZq+LcxVbKWDYQ==
X-CSE-MsgGUID: 9iGfOLwAR7yeQ76EnwbDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2675260"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 07:54:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 2/7] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
Date: Mon, 12 Oct 2026 20:22:32 +0530
Message-ID: <20261012145237.3788198-3-naresh.kumar.g@intel.com>
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

Add support for capturing GuC register state as part of the xe
devcoredump snapshot.

Define a dedicated GuC register snapshot structure, record selected
GT and media GuC status/error registers during devcoredump capture,
and free the snapshot during teardown.

Keeping these register values in the devcoredump helps with
post-mortem analysis of GuC-related failures.

v2:(Sashiko)
- Reuse the generic target GT snapshot helper for GuC register capture
- Capture primary and media GuC registers using correct GT MMIO context
- Avoid reading the same on SR-IOV VF
- skip reading media GT GuC registers when media is not present
- drop hardcoded media register address macros

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |  5 +++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 38 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  5 +++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 5faac8316b66..c13ee6e21e37 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -150,6 +150,11 @@
 #define GUC_INTR_SW_INT_1			REG_BIT(1)
 #define GUC_INTR_SW_INT_0			REG_BIT(0)
 
+#define GUC_DEVICEID				XE_REG(0xc008)
+#define GUC_SHIM_ERR_TRAP			XE_REG(0xc070)
+#define GUC_HW_FATL_ERR				XE_REG(0xc598)
+#define GUC_HW_NOTIFY_ERR			XE_REG(0xc59c)
+
 #define GUC_NUM_DOORBELLS			256
 
 /* format of the HW-monitored doorbell cacheline */
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 1dbee725f55a..f4a22e46eda7 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -27,6 +27,7 @@
 #include "xe_vm.h"
 #include "xe_mmio.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 /**
  * DOC: Xe device coredump
@@ -73,6 +74,16 @@
 
 #define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
 
+static const struct xe_reg_desc xe3p_gt_guc_reglist[] = {
+	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
+	XE_REG_DESC(GUC_WOPCM_SIZE,	"GUC_WOPCM_SIZE"),
+	XE_REG_DESC(GUC_DEVICEID,	"GUC_DEVICEID"),
+	XE_REG_DESC(DMA_CTRL,	"DMA_CTRL"),
+	XE_REG_DESC(GUC_HW_FATL_ERR,	"GUC_HW_FATL_ERR"),
+	XE_REG_DESC(GUC_HW_NOTIFY_ERR,	"GUC_HW_NOTIFY_ERR"),
+	XE_REG_DESC(GUC_SHIM_ERR_TRAP,	"GUC_SHIM_ERR_TRAP"),
+};
+
 static const struct xe_reg_desc xe3p_gt_fuse_reglist[] = {
 	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE, "GT_GEOMETRY_DSS_ENABLE"),
 	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE, "GT_COMPUTE_DSS_ENABLE"),
@@ -118,11 +129,13 @@ struct xe_gt_regset {
  * enum xe_dbg_regset_type - debug register set types
  * @XE_DBG_REGSET_FUSE: Fuse register set
  * @XE_DBG_REGSET_RPM: RPM register set
+ * @XE_DBG_REGSET_GUC: GUC register set
  * @XE_DBG_REGSET_MAX: Number of debug register set types
  */
 enum xe_dbg_regset_type {
 	XE_DBG_REGSET_FUSE,
 	XE_DBG_REGSET_RPM,
+	XE_DBG_REGSET_GUC,
 	XE_DBG_REGSET_MAX,
 };
 
@@ -139,6 +152,12 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MEDIA] = { xe3p_media_gt_rpm_reglist,
 					  ARRAY_SIZE(xe3p_media_gt_rpm_reglist) },
 	},
+	[XE_DBG_REGSET_GUC] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe3p_gt_guc_reglist,
+					ARRAY_SIZE(xe3p_gt_guc_reglist) },
+		.gt[XE_GT_TYPE_MEDIA] = { xe3p_gt_guc_reglist,
+					  ARRAY_SIZE(xe3p_gt_guc_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -285,6 +304,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** Media GT RPM Register Dump ****\n");
 	xe_dbg_reg_snapshot_print(&p, ss->media_gt_rpm);
 
+	drm_printf(&p, "\n**** GT GuC Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->gt_guc_reg);
+	drm_printf(&p, "\n**** Media GT GuC Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->media_gt_guc_reg);
+
 	drm_puts(&p, "\n**** GuC Log ****\n");
 	xe_guc_log_snapshot_print(ss->guc.log, &p);
 	drm_puts(&p, "\n**** GuC CT ****\n");
@@ -334,6 +358,12 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->media_gt_rpm);
 	ss->media_gt_rpm = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gt_guc_reg);
+	ss->gt_guc_reg = NULL;
+
+	xe_dbg_reg_snapshot_free(ss->media_gt_guc_reg);
+	ss->media_gt_guc_reg = NULL;
+
 	if (!IS_ERR_OR_NULL(ss->gt))
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
@@ -561,6 +591,14 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 						      other_gt,
 						      XE_DBG_REGSET_RPM,
 						      XE_GT_TYPE_MEDIA);
+	ss->gt_guc_reg = xe_dbg_gt_snapshot_capture(q->gt,
+						    other_gt,
+						    XE_DBG_REGSET_GUC,
+						    XE_GT_TYPE_MAIN);
+	ss->media_gt_guc_reg = xe_dbg_gt_snapshot_capture(q->gt,
+							  other_gt,
+							  XE_DBG_REGSET_GUC,
+							  XE_GT_TYPE_MEDIA);
 
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 90cca9ad2877..efea306f0fec 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -87,6 +87,11 @@ struct xe_devcoredump_snapshot {
 	/** @media_gt_rpm: Media GT RPM snapshot */
 	struct xe_dbg_reg_snapshot *media_gt_rpm;
 
+	/** @gt_guc_reg: gt guc reg snapshot */
+	struct xe_dbg_reg_snapshot *gt_guc_reg;
+	/** @media_gt_guc_reg: media gt guc reg snapshot */
+	struct xe_dbg_reg_snapshot *media_gt_guc_reg;
+
 	/** @work: Workqueue for deferred capture outside of signaling context */
 	struct work_struct work;
 
-- 
2.43.0

