Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3206C5DF9D
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838E110E828;
	Mon, 24 Aug 2026 18:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIsKCDZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6410E828
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597094; x=1819133094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tn/7XAV4z99DtHWjBgMGynRn2Bd/j2y/dA4E8SyZmgg=;
 b=BIsKCDZWwVZK41DJDQHt5fdP//dUI/I6LBj3FlHU7E+jwtDNMXUJOSgP
 iBuk/S9NcLXMhDHQryYH18HrBFEWGsqs1d0viVu0RIdHEn1kfywv8Sy6A
 kgy1Hk4hRjoN6c4uER1aj4O9rTlvfamyOBjqtSXP+A9X+XS9xobd1C4DC
 RInnv7aRoOcezeNQ+oq9b1ZQkUDPaqrheWW9Sgx5Slw44GhtS39SkVO7V
 8/30LcZY+1sZvCtFNG6qWIvUTgR8ub8TVpQlhM4prLx0/KIS9mJ3sEUgb
 0cJMHwX4k61NZt+0qHQk8PoH+V7fe4gazXyg2mwVBAJDw1K8fq9bVA6JG A==;
X-CSE-ConnectionGUID: KZyJCT7WTPeLeX30QlsF2A==
X-CSE-MsgGUID: VX1qWNwLTsyieqniKLa+Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75592758"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="75592758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:44:54 -0700
X-CSE-ConnectionGUID: wN6mJflBTBG/NC2UlHVNIQ==
X-CSE-MsgGUID: s8LjqOZXRUuCxNzao5nNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263351742"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 11:44:52 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 2/7] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
Date: Tue, 25 Aug 2026 00:13:51 +0530
Message-ID: <20260824184356.1960708-3-naresh.kumar.g@intel.com>
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
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |  5 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 58 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  5 ++
 3 files changed, 68 insertions(+)

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
index e5c33bc94103..62b1158b89a5 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -27,6 +27,7 @@
 #include "xe_vm.h"
 #include "xe_mmio.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 /**
  * DOC: Xe device coredump
@@ -86,6 +87,16 @@ struct xe_reg_desc {
 
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
@@ -161,6 +172,17 @@ static const struct xe_gt_regset xe_rpm_regset = {
 	},
 };
 
+static const struct xe_gt_regset xe_guc_regset = {
+	.gt[XE_GT_TYPE_MAIN] = {
+		.regs = xe3p_gt_guc_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_gt_guc_reglist),
+	},
+	.gt[XE_GT_TYPE_MEDIA] = {
+		.regs = xe3p_gt_guc_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_gt_guc_reglist),
+	},
+};
+
 #define XE_GT_REG_LIST(_type, _gt_type) \
 	(&xe_##_type##_regset.gt[XE_GT_TYPE_##_gt_type])
 
@@ -297,6 +319,28 @@ xe_media_gt_rpm_snapshot_capture(struct xe_gt *gt)
 						  XE_GT_REG_LIST(rpm, MEDIA));
 }
 
+static struct xe_dbg_reg_snapshot *
+xe_gt_guc_reg_snapshot_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->primary_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->primary_gt,
+						  XE_GT_REG_LIST(guc, MAIN));
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_media_gt_guc_reg_snapshot_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->media_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->media_gt,
+						  XE_GT_REG_LIST(guc, MEDIA));
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -351,6 +395,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
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
@@ -398,6 +447,12 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
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
@@ -603,6 +658,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->gt_rpm = xe_gt_rpm_snapshot_capture(q->gt);
 	ss->media_gt_rpm = xe_media_gt_rpm_snapshot_capture(q->gt);
 
+	ss->gt_guc_reg = xe_gt_guc_reg_snapshot_capture(q->gt);
+	ss->media_gt_guc_reg = xe_media_gt_guc_reg_snapshot_capture(q->gt);
+
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 75f317a5fe36..4671e00558db 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -74,6 +74,11 @@ struct xe_devcoredump_snapshot {
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

