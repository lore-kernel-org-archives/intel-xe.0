Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D297BCAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 21:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970AB10E32F;
	Tue, 23 Sep 2025 21:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzoxQz9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C410E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 21:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662195; x=1790198195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+PPrNn8nmwCT9bcqAKgS51Ft7VjLYIio7zDiJyFCvk=;
 b=TzoxQz9WN20RLvPI74/xGMm2mOag3HMwgJI0JQvII2GrBy2i0MTQULG8
 QP405qKL5EMAHAvGUMv9fVorzCd5FVj9x8OAz/F1IeJDwIt12vFgk5aBZ
 IY7OLnOlIxUP71MIj8Rcs56IAeU4d6n+/dqqtlqzuRfWC2/0PyglYyC6p
 Xea2M2QBatB5b8ddEs31qLMuhaibeFL/FHmG4chMN5EN3QFIv2U7Zjm5D
 oy1pcFFOfLGVI+rPRZI1mN3l6btjSlzGABqbBUMu3GHEeUQFHGCNkUSVN
 dgJcjxlXKe4xuEenyA4mbb1DHamKsrH28+CEJv2/BtayeinmZsqchBaVE w==;
X-CSE-ConnectionGUID: CQuDaEYTRw6l8+yMSBHtAQ==
X-CSE-MsgGUID: tUk1J7KpQHWT+VRfVj4h+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64592590"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64592590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:35 -0700
X-CSE-ConnectionGUID: 659TbHCAR0C6bRG41G7T4A==
X-CSE-MsgGUID: tJATC2WLSsa9jJpl1GMldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="175989829"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 5/5] drm/xe/debugfs: Update xe_pat_dump signature
Date: Tue, 23 Sep 2025 23:16:13 +0200
Message-ID: <20250923211613.193347-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923211613.193347-1-michal.wajdeczko@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
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

Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
functions to return int. New signature allows us to drop wrapper.

While around, move kernel-doc closer to the function definition,
as suggested in the doc-guide.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  8 +-----
 drivers/gpu/drm/xe/xe_pat.c        | 40 +++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pat.h        |  7 +-----
 3 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b0e6dafeeacc..e4fd632f43cf 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -167,12 +167,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static int pat(struct xe_gt *gt, struct drm_printer *p)
-{
-	xe_pat_dump(gt, p);
-	return 0;
-}
-
 static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
@@ -232,7 +226,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
 	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
-	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = pat },
+	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
 	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
 	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
 };
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 2e7cb99ae87a..6e48ff84ad0a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -57,7 +57,7 @@ struct xe_pat_ops {
 				 int n_entries);
 	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			      int n_entries);
-	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
+	int (*dump)(struct xe_gt *gt, struct drm_printer *p);
 };
 
 static const struct xe_pat_table_entry xelp_pat_table[] = {
@@ -194,7 +194,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_pta->value);
 }
 
-static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
+static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int fw_ref;
@@ -202,7 +202,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
-		return;
+		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -215,6 +215,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	}
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -222,7 +223,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
 	.dump = xelp_dump,
 };
 
-static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
+static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int fw_ref;
@@ -230,7 +231,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
-		return;
+		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -245,6 +246,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	}
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -252,7 +254,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
 	.dump = xehp_dump,
 };
 
-static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
+static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int fw_ref;
@@ -260,7 +262,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
-		return;
+		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -273,6 +275,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	}
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -280,7 +283,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 	.dump = xehpc_dump,
 };
 
-static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
+static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int fw_ref;
@@ -288,7 +291,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
-		return;
+		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -306,6 +309,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	}
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 /*
@@ -318,7 +322,7 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 	.dump = xelpg_dump,
 };
 
-static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
+static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int fw_ref;
@@ -327,7 +331,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
-		return;
+		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -367,6 +371,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   pat);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
@@ -462,12 +467,19 @@ void xe_pat_init(struct xe_gt *gt)
 		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
 }
 
-void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
+/**
+ * xe_pat_dump() - Dump GT PAT table into a drm printer.
+ * @gt: the &xe_gt
+ * @p: the &drm_printer
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
 	if (!xe->pat.ops)
-		return;
+		return -EOPNOTSUPP;
 
-	xe->pat.ops->dump(gt, p);
+	return xe->pat.ops->dump(gt, p);
 }
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index fa0dfbe525cd..268c9a899f56 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -43,12 +43,7 @@ void xe_pat_init_early(struct xe_device *xe);
  */
 void xe_pat_init(struct xe_gt *gt);
 
-/**
- * xe_pat_dump - Dump PAT table
- * @gt: GT structure
- * @p: Printer to dump info to
- */
-void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
+int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
 
 /**
  * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
-- 
2.47.1

