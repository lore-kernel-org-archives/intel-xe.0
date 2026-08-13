Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6E8C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C45B10F347;
	Thu, 13 Aug 2026 13:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQfenNnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA0710F341
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627872; x=1818163872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EFsK7X2m3+nVWBCll4EsEz1y67RQDIkW62qY6tDuDKQ=;
 b=dQfenNnnNBFxAEp+g+QcnclqTKvmdy7YSA9O2dsD59ODdipUg23JDHR/
 sRneArycyUO9lRlOACx6MAFEbgIYRUVf29XSpdwExHtcIliAMTfe8kRNh
 B9eUyOauSpbNP8JeiCLQHn51crbRq0a7CIK1W23t3/I5hGXoqbtTpDpRj
 ba9xTOxeqEji7yNfoeP0Uxl9i9nXpkilWl4+x2Quk5tvX2MJyk43iPYnW
 c4076IayLqJxpvJrB3YHtOE+tyxcc4YKuJnWuZyVCNHzI1tDEVB0y8i5J
 xPqcvLmwuCGpBygSEZRTo0wDJi7hVpQJz/1x1O86VhkGYxaXrHZMkGsFb A==;
X-CSE-ConnectionGUID: Js74VaKiQoC1DvPjaKaqxg==
X-CSE-MsgGUID: M0G+XRw4SZadXl807tO9dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97547706"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97547706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:31:12 -0700
X-CSE-ConnectionGUID: 14HYNJPpRzqLbg65fho9TA==
X-CSE-MsgGUID: kQpsvoUVRQ6Mlh1DEAu4Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268207349"
Received: from unknown (HELO gfx-coremm-kmd15.iind.intel.com) ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 06:31:11 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 2/6] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
Date: Thu, 13 Aug 2026 19:00:33 +0530
Message-ID: <20260813133037.2912699-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     | 13 +++++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 60 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  5 ++
 3 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 5faac8316b66..99487abbbc62 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -150,6 +150,19 @@
 #define GUC_INTR_SW_INT_1			REG_BIT(1)
 #define GUC_INTR_SW_INT_0			REG_BIT(0)
 
+#define GUC_DEVICEID				XE_REG(0xc008)
+#define GUC_SHIM_ERR_TRAP			XE_REG(0xc070)
+#define GUC_HW_FATL_ERR				XE_REG(0xc598)
+#define GUC_HW_NOTIFY_ERR			XE_REG(0xc59c)
+
+#define GUC_STATUS_M				XE_REG(0x38c000)
+#define GUC_WOPCM_SIZE_M			XE_REG(0x38c050)
+#define GUC_DEVICEID_M				XE_REG(0x38c008)
+#define DMA_CTRL_M				XE_REG(0x38c314)
+#define GUC_HW_FATL_ERR_M			XE_REG(0x38c598)
+#define GUC_HW_NOTIFY_ERR_M			XE_REG(0x38c59c)
+#define GUC_SHIM_ERR_TRAP_M			XE_REG(0x38c070)
+
 #define GUC_NUM_DOORBELLS			256
 
 /* format of the HW-monitored doorbell cacheline */
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 35d8101f2a19..b339d4035628 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -27,6 +27,7 @@
 #include "xe_vm.h"
 #include "xe_mmio.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 /**
  * DOC: Xe device coredump
@@ -84,6 +85,26 @@ struct xe_reg_desc {
 	const char *name;
 };
 
+static const struct xe_reg_desc xe_gt_guc_reg_list[] = {
+	{GUC_STATUS,	"GUC_STATUS"},
+	{GUC_WOPCM_SIZE,	"GUC_WOPCM_SIZE"},
+	{GUC_DEVICEID,	"GUC_DEVICEID"},
+	{DMA_CTRL,	"DMA_CTRL"},
+	{GUC_HW_FATL_ERR,	"GUC_HW_FATL_ERR"},
+	{GUC_HW_NOTIFY_ERR,	"GUC_HW_NOTIFY_ERR"},
+	{GUC_SHIM_ERR_TRAP,	"GUC_SHIM_ERR_TRAP"},
+};
+
+static const struct xe_reg_desc xe_media_gt_guc_reg_list[] = {
+	{GUC_STATUS_M,	"GUC_STATUS_M"},
+	{GUC_WOPCM_SIZE_M,	"GUC_WOPCM_SIZE_M"},
+	{GUC_DEVICEID_M,	"GUC_DEVICEID_M"},
+	{DMA_CTRL_M,	"DMA_CTRL_M"},
+	{GUC_HW_FATL_ERR_M,	"GUC_HW_FATL_ERR_M"},
+	{GUC_HW_NOTIFY_ERR_M,	"GUC_HW_NOTIFY_ERR_M"},
+	{GUC_SHIM_ERR_TRAP_M,	"GUC_SHIM_ERR_TRAP_M"}
+};
+
 static const struct xe_reg_desc xe3p_gt_fuse_reglist[] = {
 	{ XELP_GT_GEOMETRY_DSS_ENABLE, "GT_GEOMETRY_DSS_ENABLE" },
 	{ XEHP_GT_COMPUTE_DSS_ENABLE, "GT_COMPUTE_DSS_ENABLE" },
@@ -201,6 +222,32 @@ static struct xe_dbg_reg_snapshot *xe_media_gt_fuse_snapshot_capture(struct xe_g
 	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
 }
 
+static struct xe_dbg_reg_snapshot *xe_gt_guc_reg_snapshot_capture(struct xe_gt *gt)
+{
+	struct xe_reg_desc_list reg_list;
+
+	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
+		return NULL;
+
+	reg_list.regs = xe_gt_guc_reg_list;
+	reg_list.num_regs = ARRAY_SIZE(xe_gt_guc_reg_list);
+
+	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
+}
+
+static struct xe_dbg_reg_snapshot *xe_media_gt_guc_reg_snapshot_capture(struct xe_gt *gt)
+{
+	struct xe_reg_desc_list reg_list;
+
+	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
+		return NULL;
+
+	reg_list.regs = xe_media_gt_guc_reg_list;
+	reg_list.num_regs = ARRAY_SIZE(xe_media_gt_guc_reg_list);
+
+	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -251,6 +298,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** Media GT Fuse Register Dump ****\n");
 	xe_dbg_reg_snapshot_print(&p, ss->media_fuse);
 
+	drm_printf(&p, "\n**** GT GuC Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->gt_guc_reg);
+	drm_printf(&p, "\n**** Media GT GuC Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->media_gt_guc_reg);
+
 	drm_puts(&p, "\n**** GuC Log ****\n");
 	xe_guc_log_snapshot_print(ss->guc.log, &p);
 	drm_puts(&p, "\n**** GuC CT ****\n");
@@ -292,6 +344,12 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->media_fuse);
 	ss->media_fuse = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gt_guc_reg);
+	ss->gt_guc_reg = NULL;
+
+	xe_dbg_reg_snapshot_free(ss->media_gt_guc_reg);
+	ss->media_gt_guc_reg = NULL;
+
 	if (!IS_ERR_OR_NULL(ss->gt))
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
@@ -495,6 +553,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->gt_fuse = xe_gt_fuse_snapshot_capture(q->gt);
 	ss->media_fuse = xe_media_gt_fuse_snapshot_capture(q->gt);
 
+	ss->gt_guc_reg = xe_gt_guc_reg_snapshot_capture(q->gt);
+	ss->media_gt_guc_reg = xe_media_gt_guc_reg_snapshot_capture(q->gt);
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 14490b61a56f..28b505176657 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -70,6 +70,11 @@ struct xe_devcoredump_snapshot {
 	/** @media_fuse: Media Fuse snapshot */
 	struct xe_dbg_reg_snapshot *media_fuse;
 
+	/** @gt_guc_reg: gt guc reg snapshot */
+	struct xe_dbg_reg_snapshot *gt_guc_reg;
+	/** @media_gt_guc_reg: media gt guc reg snapshot */
+	struct xe_dbg_reg_snapshot *media_gt_guc_reg;
+
 	/** @work: Workqueue for deferred capture outside of signaling context */
 	struct work_struct work;
 
-- 
2.43.0

