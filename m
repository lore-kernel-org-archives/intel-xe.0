Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A88E606A320
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0OYVgit
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79D4112493;
	Thu, 29 Oct 2026 17:31:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB0710E779
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793295052; x=1824831052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AzXTFy3V0n677c+3DTBs+uryP892g4Su5/4JW0oRAYM=;
 b=I0OYVgitecjA/lxMoCkzJuKNWAmxn41AQaBAn1ZAetDPkMwycQ4Z6RML
 mM2qQwY4S/ezYej1pue65YGgzesopSN7GyiEgnugA80YHyMhdfDLqe52D
 wegDzd0sRb6+e0eCfO50Q97sEeip8zQ97Aj/hBmUihaIHdGufZgP2/qvr
 Eqqrdq5Cpsx1zTTmSTiG6MK/+IRj5tNdGUsJf0FVMfJrw7XBHaqo/awz2
 vtMcNaoMp5Xw3WRQw4XueQy0sbWMHS07DdY/rf5e9LmHVgs+ETBl3hVyL
 76I9E9Qc/zhepuxns70E9LBiaThPQXoMkD9lXopCC6Il/Fa5EOtB2VtlK Q==;
X-CSE-ConnectionGUID: bq4aOLGbQN++cAuB4iRFzw==
X-CSE-MsgGUID: OLkfMTP3RCmQr3TxJ9CuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1955549"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1955549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 10:30:52 -0700
X-CSE-ConnectionGUID: YeKFVLDSQv+ITjrEKl0Hww==
X-CSE-MsgGUID: FFqBbVYyS1O9sjeVzA/ruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5595447"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 10:30:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v7 2/7] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
Date: Thu, 29 Oct 2026 22:57:55 +0530
Message-ID: <20261029172800.2150325-3-naresh.kumar.g@intel.com>
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

v5:
- Rebase as per patch1 changes

v6:(Tejas)
- Refactor register name as per spec

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |  5 ++++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 35 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  5 ++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 5faac8316b66c..5a8a67eb37eea 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -150,6 +150,11 @@
 #define GUC_INTR_SW_INT_1			REG_BIT(1)
 #define GUC_INTR_SW_INT_0			REG_BIT(0)
 
+#define GUC_DEVICEID				XE_REG(0xc008)
+#define SHIM_ERR_TRAP				XE_REG(0xc070)
+#define GUC_HW_FATAL_ERR			XE_REG(0xc598)
+#define GUC_HW_NOTIFY_ERR			XE_REG(0xc59c)
+
 #define GUC_NUM_DOORBELLS			256
 
 /* format of the HW-monitored doorbell cacheline */
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index eef993fbae2ef..04c08b68317b1 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -13,6 +13,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -74,6 +75,16 @@
 
 #define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
 
+static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] = {
+	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
+	XE_REG_DESC(GUC_WOPCM_SIZE,	"GUC_WOPCM_SIZE"),
+	XE_REG_DESC(GUC_DEVICEID,	"GUC_DEVICEID"),
+	XE_REG_DESC(DMA_CTRL,	"DMA_CTRL"),
+	XE_REG_DESC(GUC_HW_FATAL_ERR,	"GUC_HW_FATAL_ERR"),
+	XE_REG_DESC(GUC_HW_NOTIFY_ERR,	"GUC_HW_NOTIFY_ERR"),
+	XE_REG_DESC(SHIM_ERR_TRAP,	"SHIM_ERR_TRAP"),
+};
+
 static const struct xe_reg_desc xe_dbg_gt_fuse_reglist[] = {
 	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE, "GT_GEOMETRY_DSS_ENABLE"),
 	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE, "GT_COMPUTE_DSS_ENABLE"),
@@ -122,11 +133,13 @@ struct xe_gt_regset {
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
 
@@ -143,6 +156,12 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MEDIA] = { xe_dbg_media_gt_rpm_reglist,
 					  ARRAY_SIZE(xe_dbg_media_gt_rpm_reglist) },
 	},
+	[XE_DBG_REGSET_GUC] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_gt_guc_reglist,
+					ARRAY_SIZE(xe_dbg_gt_guc_reglist) },
+		.gt[XE_GT_TYPE_MEDIA] = { xe_dbg_gt_guc_reglist,
+					  ARRAY_SIZE(xe_dbg_gt_guc_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -289,6 +308,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	xe_dbg_reg_snapshot_print(&p, "Media GT Fuse Register Dump", ss->media_fuse);
 	xe_gt_rpm_snapshot_print(&p, "GT RPM Register Dump", ss->gt_rpm);
 	xe_dbg_reg_snapshot_print(&p, "Media GT RPM Register Dump", ss->media_gt_rpm);
+	xe_dbg_reg_snapshot_print(&p, "GT GuC Register Dump", ss->gt_guc_reg);
+	xe_dbg_reg_snapshot_print(&p, "Media GT GuC Register Dump", ss->media_gt_guc_reg);
 
 	drm_puts(&p, "\n**** GuC Log ****\n");
 	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
@@ -339,6 +360,12 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
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
@@ -531,6 +558,14 @@ static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
 						      other_gt,
 						      XE_DBG_REGSET_RPM,
 						      XE_GT_TYPE_MEDIA);
+	ss->gt_guc_reg = xe_dbg_gt_snapshot_capture(gt,
+						    other_gt,
+						    XE_DBG_REGSET_GUC,
+						    XE_GT_TYPE_MAIN);
+	ss->media_gt_guc_reg = xe_dbg_gt_snapshot_capture(gt,
+							  other_gt,
+							  XE_DBG_REGSET_GUC,
+							  XE_GT_TYPE_MEDIA);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index e2fac33dce091..52db64640f89e 100644
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

