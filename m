Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7863AC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EF110F67D;
	Thu,  3 Sep 2026 14:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4d9d7gY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66A10F66D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788445192; x=1819981192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/XbbDshEHNnQLMkn4Szw5WVGT364kN0tx6vkBv+JfE=;
 b=A4d9d7gYBg3dO2/iQ7cVxBMdoCaNXK1Qc/5PAxqDdjBWeM6ycyAnAE/p
 hnTnH2nGXze/LX1Z+bAFh8yrCdT1V83BWPyqYRwPXJLBMSj52+9KnqrKw
 hpkNHciClM8ki4Gdtuy5B6Q/DNfCGI6F1Nre/i6OHc9u/EkeyxLfw5O5t
 Yg/dnLFDORmui4P9R6xma1oUTbZCqtQqAMaSyaCytjeg5WOHLx5FX3noJ
 B+aaUtL/vAdw1NGP1BmKKCn5h0qbX4QmccjF6qUyWUvqFwie/o776QBfU
 X+0a8UV/aLDNfbbRXbJ67tYHurARQy7QZ2sLBwyx44uY2GUr4/y+r4tZI g==;
X-CSE-ConnectionGUID: UPZx/ErbSeau5r8Zn/fP8g==
X-CSE-MsgGUID: Wv+6qoRBRZCMlH3xUC2MEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92797487"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92797487"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:19:52 -0700
X-CSE-ConnectionGUID: L2Hp3/yqQzaFrou8rXdv0w==
X-CSE-MsgGUID: YhfROHppTrukdg4mUwFdwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275014709"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 07:19:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Date: Thu,  3 Sep 2026 19:48:31 +0530
Message-ID: <20260903141834.1315675-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
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

Add PAGE_FLTRPTQ_HEAD_GAMCTRL and PAGE_FLTRPTQ_TAIL_GAMCTRL to the Xe
register definitions and capture them as part of the devcoredump
snapshot.

Include the register dump in the devcoredump output and release the
snapshot during cleanup so page fault report state is available for
post-mortem debugging.

v2:
- As design change made for previous patches. refactored this patch
  as well to accommodate those changes.
- Add PF occurred print when the two register values are not equal

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 39 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  3 ++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 19f0a65cc3d2..05542f20c7b5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -501,6 +501,9 @@
 #define   LMEM_EN				REG_BIT(31)
 #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
 
+#define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
+#define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 5c89aa4f71df..09e571e27660 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -127,6 +127,11 @@ static const struct xe_reg_desc xe3p_media_gt_rpm_reglist[] = {
 	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
 };
 
+static const struct xe_reg_desc xe3p_gam_pf_reglist[] = {
+	XE_REG_DESC(PAGE_FLTRPTQ_HEAD_GAMCTRL, "PAGE_FLTRPTQ_HEAD_GAMCTRL"),
+	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
+};
+
 /**
  * struct xe_reg_desc_list - Struct for register descriptor list
  *
@@ -183,6 +188,13 @@ static const struct xe_gt_regset xe_guc_regset = {
 	},
 };
 
+static const struct xe_gt_regset xe_gam_pf_regset = {
+	.gt[XE_GT_TYPE_MAIN] = {
+		.regs = xe3p_gam_pf_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_gam_pf_reglist),
+	},
+};
+
 #define XE_GT_REG_LIST(_type, _gt_type) \
 	(&xe_##_type##_regset.gt[XE_GT_TYPE_##_gt_type])
 
@@ -257,6 +269,16 @@ static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
 		drm_puts(p, "render powergating appears not enabled\n");
 }
 
+static void xe_gam_pf_snapshot_print(struct drm_printer *p,
+				     const struct xe_dbg_reg_snapshot *snap)
+{
+	xe_dbg_reg_snapshot_print(p, snap);
+
+	if (snap && snap->num_regs >= 2 &&
+	    snap->regs[0].value != snap->regs[1].value)
+		drm_printf(p, "PF occurred, refer to dmesg log for PF info\n");
+}
+
 static struct xe_dbg_reg_snapshot *
 xe_dbg_reg_snapshot_capture_target(struct xe_gt *fault_gt,
 				   struct xe_gt *target_gt,
@@ -342,6 +364,16 @@ xe_media_gt_guc_reg_snapshot_capture(struct xe_gt *gt)
 						  XE_GT_REG_LIST(guc, MEDIA));
 }
 
+static struct xe_dbg_reg_snapshot *xe_gam_pf_report_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->primary_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->primary_gt,
+						  XE_GT_REG_LIST(gam_pf, MAIN));
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -406,6 +438,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
+	drm_printf(&p, "\n**** GAM PF Report ****\n");
+	xe_gam_pf_snapshot_print(&p, ss->gam_pf_report);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -458,6 +493,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
+	ss->gam_pf_report = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -664,6 +702,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
+	ss->gam_pf_report = xe_gam_pf_report_capture(q->gt);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
 	if (job)
 		ss->job = xe_sched_job_snapshot_capture(job);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 4671e00558db..ea7638d0a7a2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -90,6 +90,9 @@ struct xe_devcoredump_snapshot {
 		struct xe_guc_log_snapshot *log;
 	} guc;
 
+	/** @gam_pf_report: GAM PF report snapshot */
+	struct xe_dbg_reg_snapshot *gam_pf_report;
+
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 
-- 
2.43.0

