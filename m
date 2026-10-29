Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2611F606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eu7m9WM2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9A410E779;
	Thu, 29 Oct 2026 17:31:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E2E10E768
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793295056; x=1824831056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GGkTcl/wulgXSbTS9CB8l5/zK/DqrUcAfqq72cC0GZM=;
 b=eu7m9WM29AeAjO0n+vA2bQefvmDYf/BSMobEsskTTo8d6gF51zjvCXnP
 3rhJFaFLlwzIWk3L2QD7SBJkYrBznSH4UiAVQSlouCOH0W88DUk2NPpPH
 N22DQKWfK3NqySpshE8t6JjQ/ey9jehoLATOfX5UNrZInulBCgN1aKn8r
 ienYVblPig4a4+b71itnHL139l9fRHPlTY0/baEixwzlJsp1toOf6QsKp
 AJEARfIkmW/TcVdGRpnJ9/K3B6kN9BBLFAGe4PBOXrOeg1uA/t11JfUPD
 LAatk29uPmmC+uMNOrpRINGXuU6lpoxDIl81QifMJM1DCCOaUJ5Az2wME A==;
X-CSE-ConnectionGUID: V0whDURFRzeSPMjZmUIG+w==
X-CSE-MsgGUID: jdA3jinhTlilJE/fPa8E/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1955559"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1955559"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 10:30:56 -0700
X-CSE-ConnectionGUID: nBf3kNcZRCS52qc8b44XSQ==
X-CSE-MsgGUID: ESuMXnkKQruc7QeEzM4GpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5595473"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 10:30:54 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v7 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Date: Thu, 29 Oct 2026 22:57:57 +0530
Message-ID: <20261029172800.2150325-5-naresh.kumar.g@intel.com>
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

v5:
Refactored as per patch1 changes

v6:(Tejas)
- Changed GAM Pagefault regs from reg to mcr reg infra

v7:(Sashiko)
- Gate GAM page-fault capture on target-GT MCR coverage to
  avoid unsupported steered reads on Xe_LP.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 54 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 12 ++++-
 3 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 220f0968f9db8..ad8aa6e10e361 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -530,6 +530,9 @@
 #define   LMEM_EN				REG_BIT(31)
 #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
 
+#define PAGE_FLTRPTQ_HEAD			XE_REG_MCR(0xcf90)
+#define PAGE_FLTRPTQ_TAIL			XE_REG_MCR(0xcf94)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 04c08b68317b1..67e38a4dda8d0 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_guc_capture.h"
@@ -74,6 +75,7 @@
 #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
 
 #define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
+#define XE_REG_DESC_MCR(_reg, _name)   { .mcr_reg = (_reg), .name = (_name) }
 
 static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] = {
 	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
@@ -115,6 +117,11 @@ static const struct xe_reg_desc xe_dbg_media_gt_rpm_reglist[] = {
 	XE_REG_DESC(MIRROR_PM_DEBUG, "MIRROR_PM_DEBUG"),
 };
 
+static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] = {
+	XE_REG_DESC_MCR(PAGE_FLTRPTQ_HEAD, "PAGE_FLTRPTQ_HEAD"),
+	XE_REG_DESC_MCR(PAGE_FLTRPTQ_TAIL, "PAGE_FLTRPTQ_TAIL"),
+};
+
 /**
  * struct xe_gt_regset - Struct for register descriptor list for GT
  *
@@ -134,12 +141,14 @@ struct xe_gt_regset {
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
 
@@ -162,6 +171,10 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MEDIA] = { xe_dbg_gt_guc_reglist,
 					  ARRAY_SIZE(xe_dbg_gt_guc_reglist) },
 	},
+	[XE_DBG_REGSET_GAM_PF] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_gam_pf_reglist,
+					ARRAY_SIZE(xe_dbg_gam_pf_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -203,6 +216,23 @@ static const u32 *xe_dbg_find_value(const struct xe_dbg_reg_snapshot *snap,
 	return NULL;
 }
 
+static void xe_gam_pf_snapshot_print(struct drm_printer *p,
+				     const char *title,
+				     const struct xe_dbg_reg_snapshot *snap)
+{
+	const u32 *val1, *val2;
+
+	xe_dbg_reg_snapshot_print(p, title, snap);
+
+	if (!snap)
+		return;
+
+	val1 = xe_dbg_find_value(snap, PAGE_FLTRPTQ_HEAD.__reg);
+	val2 = xe_dbg_find_value(snap, PAGE_FLTRPTQ_TAIL.__reg);
+	if ((val1 && val2) && (*val1 != *val2))
+		drm_printf(p, "PF occurred, refer to dmesg log for PF info\n");
+}
+
 static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
 				     const char *title,
 				     const struct xe_dbg_reg_snapshot *snap)
@@ -235,8 +265,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
 
 	snap->desc	= reglist;
 	snap->num_regs = reglist->num_regs;
-	for (i = 0; i < reglist->num_regs; i++)
-		snap->values[i] = xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
+	for (i = 0; i < reglist->num_regs; i++) {
+		if (reglist->regs[i].reg.mcr)
+			snap->values[i] = xe_gt_mcr_unicast_read_any(gt,
+								     reglist->regs[i].mcr_reg);
+		else
+			snap->values[i] = xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
+	}
 
 	return snap;
 }
@@ -260,6 +295,12 @@ xe_dbg_gt_snapshot_capture(struct xe_gt *fault_gt, struct xe_gt *other_gt,
 	if (target_gt != fault_gt && target_gt != other_gt)
 		return NULL;
 
+	/* Capture GAM fault registers only where MCR steering is defined. */
+	if (type == XE_DBG_REGSET_GAM_PF &&
+	    (!xe_gt_mcr_check_reg(target_gt, PAGE_FLTRPTQ_HEAD.__reg) ||
+	     !xe_gt_mcr_check_reg(target_gt, PAGE_FLTRPTQ_TAIL.__reg)))
+		return NULL;
+
 	return xe_dbg_reg_snapshot_capture_target(target_gt,
 						  &xe_dbg_regsets[type].gt[gt_type]);
 }
@@ -316,6 +357,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
 
+	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss->gam_pf_report);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -370,6 +413,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
+	ss->gam_pf_report = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -566,6 +612,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
 							  other_gt,
 							  XE_DBG_REGSET_GUC,
 							  XE_GT_TYPE_MEDIA);
+	ss->gam_pf_report = xe_dbg_gt_snapshot_capture(gt,
+						       other_gt,
+						       XE_DBG_REGSET_GAM_PF,
+						       XE_GT_TYPE_MAIN);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 52db64640f89e..fba3d23040b9e 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -9,6 +9,7 @@
 #include <linux/ktime.h>
 #include <linux/mutex.h>
 
+#include "regs/xe_reg_defs.h"
 #include "xe_hw_engine_types.h"
 
 struct xe_device;
@@ -21,8 +22,12 @@ struct xe_gt;
  * of the register to dump its value during coredump for debug purpose.
  */
 struct xe_reg_desc {
-	/** @reg: The register */
-	struct xe_reg reg;
+	union {
+		/** @reg: The register */
+		struct xe_reg reg;
+		/** @mcr_reg: The mcr register */
+		struct xe_reg_mcr mcr_reg;
+	};
 	/** @name: Name of the register */
 	const char *name;
 };
@@ -103,6 +108,9 @@ struct xe_devcoredump_snapshot {
 		struct xe_guc_log_snapshot *log;
 	} guc;
 
+	/** @gam_pf_report: GAM PF report snapshot */
+	struct xe_dbg_reg_snapshot *gam_pf_report;
+
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 
-- 
2.43.0

