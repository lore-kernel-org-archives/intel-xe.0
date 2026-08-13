Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3CDC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B85E10F341;
	Thu, 13 Aug 2026 13:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMyI73vA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EDC10F341
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627882; x=1818163882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+2YCMjNbdZQaM1y/tTaH103XxWg9pWT5AlcKr9w2O7k=;
 b=RMyI73vA6Wq1ITlSekMBWwWlG/C2BhOHCWwnH5ObFsFfYNEPpfH5V9FE
 fGg2J1gSblJs99LfzIK09AZdmw8wXBGByyEXo5CYyeIN1cGzLIhPCkKUY
 mgU7yOnJIz6K1I+XqiiFKYcDjQjoKzqtnWtThXcaRncsuv58rLkbptoy1
 SPZMlgUqVhvMkYsNlcaN9txQGwV91/xwxY6Inab7gC/HQfizYWSgYTTeZ
 YiBKM9x6odOLTE2WOpmJaeFzpJG5NyXNNMjOFhcDZvTl7oO5x6fUg6vCv
 kRtNEQpGNlUfkG4mJzkyLVI9U4qylvk7IEnOIeLt7FZzkXaZsq/MwQSaY w==;
X-CSE-ConnectionGUID: A/1YUTTrRVOSYVSVGR3Org==
X-CSE-MsgGUID: Kc1IMkFUSnmGtzHbzNEcVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97547732"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97547732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:31:22 -0700
X-CSE-ConnectionGUID: 87v94iAbSAWYQNP4h8iMUA==
X-CSE-MsgGUID: RyhcJjn1QHGDRkuPPsEYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268207364"
Received: from unknown (HELO gfx-coremm-kmd15.iind.intel.com) ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 06:31:21 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 6/6] drm/xe: capture L3 node status registers in devcoredump
Date: Thu, 13 Aug 2026 19:00:37 +0530
Message-ID: <20260813133037.2912699-7-naresh.kumar.g@intel.com>
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

Add L3_NODE_IDLE and L3STAT_LBCF_GFX register definitions and include
them in the devcoredump snapshot as a node status section.

Extend the register descriptor to mark MCR registers so the snapshot
code can read them through xe_gt_mcr_unicast_read_any(), then print and
free the captured node status registers alongside the existing dump
sections.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 37 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8c55d766a5a6..fdd081791961 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -430,6 +430,9 @@
 #define   L3_ESC_MASK				REG_BIT(0)
 #define   L3_ESC(value)				REG_FIELD_PREP(L3_ESC_MASK, value)
 
+#define L3_NODE_IDLE				XE_REG(0xb0b0)
+#define L3STAT_LBCF_GFX				XE_REG(0xb128)
+
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 6cc4e3969417..ab8cd7d58964 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -28,6 +28,7 @@
 #include "xe_mmio.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "xe_gt_mcr.h"
 
 /**
  * DOC: Xe device coredump
@@ -83,6 +84,8 @@ struct xe_reg_desc {
 	struct xe_reg reg;
 	/** @name: Name of the register */
 	const char *name;
+	/** @mcr: mcr type registers */
+	bool mcr;
 };
 
 static const struct xe_reg_desc xe_gt_guc_reg_list[] = {
@@ -133,6 +136,11 @@ static const struct xe_reg_desc xe3p_gam_pf_reglist[] = {
 	{ PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"},
 };
 
+static const struct xe_reg_desc xe3p_l3_node_reglist[] = {
+	{ L3_NODE_IDLE, "L3_NODE_IDLE", .mcr = true },
+	{ L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX", .mcr = true },
+};
+
 /**
  * struct xe_reg_desc_list - Struct for register descriptor list
  *
@@ -156,7 +164,12 @@ xe_capture_reg_desc_list(struct xe_gt *gt,
 
 	for (i = 0; i < count; i++) {
 		dst[i].reg = src[i].reg;
-		dst[i].value = xe_mmio_read32(&gt->mmio, src[i].reg);
+		if (src[i].mcr)
+			dst[i].value = xe_gt_mcr_unicast_read_any(gt,
+								  XE_REG_MCR
+								  (src[i].reg.addr));
+		else
+			dst[i].value = xe_mmio_read32(&gt->mmio, src[i].reg);
 		dst[i].name = src[i].name;
 	}
 }
@@ -266,6 +279,19 @@ static struct xe_dbg_reg_snapshot *xe_gam_pf_report_capture(struct xe_gt *gt)
 	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
 }
 
+static struct xe_dbg_reg_snapshot *xe_node_status_capture(struct xe_gt *gt)
+{
+	struct xe_reg_desc_list reg_list;
+
+	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
+		return NULL;
+
+	reg_list.regs = xe3p_l3_node_reglist;
+	reg_list.num_regs = ARRAY_SIZE(xe3p_l3_node_reglist);
+
+	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -329,6 +355,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** GAM PF Report ****\n");
 	xe_dbg_reg_snapshot_print(&p, ss->gam_pf_report);
 
+	drm_printf(&p, "\n**** Node Status ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->ns);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -378,6 +407,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
 	ss->gam_pf_report = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->ns);
+	ss->ns = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -582,6 +614,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
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
index 893eadd68a3d..e6554aa02429 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -88,6 +88,8 @@ struct xe_devcoredump_snapshot {
 
 	/** @gam_pf_report: GAM PF report snapshot */
 	struct xe_dbg_reg_snapshot *gam_pf_report;
+	/** @ns: Node status snapshot */
+	struct xe_dbg_reg_snapshot *ns;
 
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
-- 
2.43.0

