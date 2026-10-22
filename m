Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFCC606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eYQ4gU9g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C5A11265A;
	Thu, 22 Oct 2026 13:32:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBAD11264F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792675948; x=1824211948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Lr0lrUEWtV1T6hLO74sVdDC5EUqT2Tik4OC1P+ATps=;
 b=eYQ4gU9gSHm1DArDAO7s1N6ZZuVkJWXb1OO6NxVm4IInr0zba+HHx2ID
 56YfKNaMMQ5iedUceq8A5lrRoSFECHR9+40te+brgah9f2MrZ8RWMLLQc
 DZUXoGa+0VdL8JseYaikrODpG3EVx25waXutr2fdpSmgsjPZy552l1k+t
 iw6cASsCm8mdyUP/bnGJ8M3+QG1wTJryQArpfMcfZC5XLGspVyiBKcqfJ
 8LtyPnzSkwxhuBb7nRPKcdx0Max1OuHMxvmeKhgvqlEHmku69aHJzoIBh
 Y5LO9qqmcmIpRYQNylm/55y5jqNOirtLHYlpU2rRiaPJqyOe5ER6fiyP1 A==;
X-CSE-ConnectionGUID: dlNaBptRRVuqezGGrM0dgA==
X-CSE-MsgGUID: CQv6/Cv2Swue3IhcTmp0Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1439223"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1439223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:32:27 -0700
X-CSE-ConnectionGUID: /djYJkHdSNO3xz6kOxrpJg==
X-CSE-MsgGUID: +J5RrLIfQeag570UZZzacQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3700768"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2026 06:32:26 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v5 2/7] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
Date: Thu, 22 Oct 2026 18:59:52 +0530
Message-ID: <20261022132957.2479469-3-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |  5 ++++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 35 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  5 ++++
 3 files changed, 45 insertions(+)

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
index e363818160af..ee92a0d203b8 100644
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
 
+static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] = {
+	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
+	XE_REG_DESC(GUC_WOPCM_SIZE,	"GUC_WOPCM_SIZE"),
+	XE_REG_DESC(GUC_DEVICEID,	"GUC_DEVICEID"),
+	XE_REG_DESC(DMA_CTRL,	"DMA_CTRL"),
+	XE_REG_DESC(GUC_HW_FATL_ERR,	"GUC_HW_FATL_ERR"),
+	XE_REG_DESC(GUC_HW_NOTIFY_ERR,	"GUC_HW_NOTIFY_ERR"),
+	XE_REG_DESC(GUC_SHIM_ERR_TRAP,	"GUC_SHIM_ERR_TRAP"),
+};
+
 static const struct xe_reg_desc xe_dbg_gt_fuse_reglist[] = {
 	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE, "GT_GEOMETRY_DSS_ENABLE"),
 	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE, "GT_COMPUTE_DSS_ENABLE"),
@@ -121,11 +132,13 @@ struct xe_gt_regset {
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
 
@@ -142,6 +155,12 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
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
@@ -288,6 +307,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	xe_dbg_reg_snapshot_print(&p, "Media GT Fuse Register Dump", ss->media_fuse);
 	xe_gt_rpm_snapshot_print(&p, "GT RPM Register Dump", ss->gt_rpm);
 	xe_dbg_reg_snapshot_print(&p, "Media GT RPM Register Dump", ss->media_gt_rpm);
+	xe_dbg_reg_snapshot_print(&p, "GT GuC Register Dump", ss->gt_guc_reg);
+	xe_dbg_reg_snapshot_print(&p, "Media GT GuC Register Dump", ss->media_gt_guc_reg);
 
 	drm_puts(&p, "\n**** GuC Log ****\n");
 	xe_guc_log_snapshot_print(ss->guc.log, &p);
@@ -338,6 +359,12 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
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
@@ -530,6 +557,14 @@ static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
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
index e2fac33dce09..52db64640f89 100644
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

