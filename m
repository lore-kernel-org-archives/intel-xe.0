Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DFFCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DD510F1A5;
	Mon, 12 Oct 2026 14:55:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E531D10F1AE
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791816896; x=1823352896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q4zcA2oEqt8rJwo2rgkzGs6sD28io8XFWt0raHQumrA=;
 b=jBT03GEWnvdpG0MqhmT1kYpBf8qDbdWgBlmymjHoncKGovyP5q7hNbH/
 d9U7Y0bdWmUvlBco5Ori1cokmOO+ToTMbbnwrVrMVMrz13XGYaj3O5o2Y
 /VgthOUA72NroA87imMDL72PzsCa9Vo10LK35nqvN0J0uNuNO+ywXlekn
 9UQ0fEaE4or26z8CDuLkiFNz1sx3Gf13vPND+ScNqQD7CKXXr9Cy8ajga
 8puNFsJf375PI0A2+Hxyqg1b9PBpnrXdtwt7nzFwgzjTd28TlxwnEhRyk
 Y8DR1A8tBZltYAx1v9U/WkmuNG1bdBWRVKuHBNp83/DlUMMBB0tERDch8 A==;
X-CSE-ConnectionGUID: PHX/s7eHShWwsuOime09gg==
X-CSE-MsgGUID: YgXZ1Y8FTaG9GpemwRRMgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513560"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="513560"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:54:55 -0700
X-CSE-ConnectionGUID: wn9oa6gaQveiQJa4kAcjhg==
X-CSE-MsgGUID: hAWh4QrRSwi9s8ki6v/pmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2675266"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 07:54:54 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Date: Mon, 12 Oct 2026 20:22:34 +0530
Message-ID: <20261012145237.3788198-5-naresh.kumar.g@intel.com>
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

v4:
Refactored as per the patch1 change(Tejas)

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 37 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  3 ++
 3 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e93895e0c731..e9eb0bd04af1 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -530,6 +530,9 @@
 #define   LMEM_EN				REG_BIT(31)
 #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
 
+#define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
+#define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index f4a22e46eda7..a2a3437ec2f6 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -114,6 +114,11 @@ static const struct xe_reg_desc xe3p_media_gt_rpm_reglist[] = {
 	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
 };
 
+static const struct xe_reg_desc xe3p_gam_pf_reglist[] = {
+	XE_REG_DESC(PAGE_FLTRPTQ_HEAD_GAMCTRL, "PAGE_FLTRPTQ_HEAD_GAMCTRL"),
+	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
+};
+
 /**
  * struct xe_gt_regset - Struct for register descriptor list for GT
  *
@@ -130,12 +135,14 @@ struct xe_gt_regset {
  * @XE_DBG_REGSET_FUSE: Fuse register set
  * @XE_DBG_REGSET_RPM: RPM register set
  * @XE_DBG_REGSET_GUC: GUC register set
+ * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
  * @XE_DBG_REGSET_MAX: Number of debug register set types
  */
 enum xe_dbg_regset_type {
 	XE_DBG_REGSET_FUSE,
 	XE_DBG_REGSET_RPM,
 	XE_DBG_REGSET_GUC,
+	XE_DBG_REGSET_GAM_PF,
 	XE_DBG_REGSET_MAX,
 };
 
@@ -158,6 +165,10 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MEDIA] = { xe3p_gt_guc_reglist,
 					  ARRAY_SIZE(xe3p_gt_guc_reglist) },
 	},
+	[XE_DBG_REGSET_GAM_PF] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe3p_gam_pf_reglist,
+					ARRAY_SIZE(xe3p_gam_pf_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -195,6 +206,22 @@ static const u32 *xe_dbg_find_value(const struct xe_dbg_reg_snapshot *snap,
 	return NULL;
 }
 
+static void xe_gam_pf_snapshot_print(struct drm_printer *p,
+				     const struct xe_dbg_reg_snapshot *snap)
+{
+	const u32 *val1, *val2;
+
+	xe_dbg_reg_snapshot_print(p, snap);
+
+	if (!snap)
+		return;
+
+	val1 = xe_dbg_find_value(snap, PAGE_FLTRPTQ_HEAD_GAMCTRL);
+	val2 = xe_dbg_find_value(snap, PAGE_FLTRPTQ_TAIL_GAMCTRL);
+	if ((val1 && val2) && (*val1 != *val2))
+		drm_printf(p, "PF occurred, refer to dmesg log for PF info\n");
+}
+
 static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
 				     const struct xe_dbg_reg_snapshot *snap)
 {
@@ -314,6 +341,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
+	drm_printf(&p, "\n**** GAM PF Report ****\n");
+	xe_gam_pf_snapshot_print(&p, ss->gam_pf_report);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -368,6 +398,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
+	ss->gam_pf_report = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -602,6 +635,10 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
+	ss->gam_pf_report = xe_dbg_gt_snapshot_capture(q->gt,
+						       other_gt,
+						       XE_DBG_REGSET_GAM_PF,
+						       XE_GT_TYPE_MAIN);
 
 	if (q) {
 		ss->ge = xe_guc_exec_queue_snapshot_capture(q);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index efea306f0fec..dc5ae67cdaf7 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -103,6 +103,9 @@ struct xe_devcoredump_snapshot {
 		struct xe_guc_log_snapshot *log;
 	} guc;
 
+	/** @gam_pf_report: GAM PF report snapshot */
+	struct xe_dbg_reg_snapshot *gam_pf_report;
+
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 
-- 
2.43.0

