Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0314E606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BzqLdTZa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62F511265C;
	Thu, 22 Oct 2026 13:32:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08D0112656
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792675951; x=1824211951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BjZInHrCDeV/2IBV1j+r9zzTeR1JNhaFbCGQRnf9W0U=;
 b=BzqLdTZaIX3i8ZelVZulrDkvnf1x2pbEeQaGshuZUxtlCYVXZrvdpROy
 iKLJFqSKfGUUpsnidCm/gGAJrUofNoqMiRh9xUq8ihVRu06YZGQ/Kj/aI
 cq78g0W7uQ7xm+qN1OzDPJQhVmLgUJAO4PZSlQmywco2DxPeff0EP6F/F
 6R8Dow0334DRQXmxLbAdWiumpQ5+1MFH5yniMjGW3y9AHCbXkCRkhLlig
 5G881/b4/FyhXQUvWWfvGsk5eBZcFZWwKng0QSCSGC1CJVIdJQLtAR92C
 mu0U5HHCUat8UFvIgEHdOkyct3PKeqJKqy7e/Q94fbGJbKxIh4Wu/qcEw g==;
X-CSE-ConnectionGUID: fsOIZTgFSIuWpiQO2pZzsA==
X-CSE-MsgGUID: sQYw2ezmSMCUW9TRUbbU7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1439232"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1439232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:32:31 -0700
X-CSE-ConnectionGUID: 2AfY6Kt9Q1WcvDwPjwkaNA==
X-CSE-MsgGUID: hnuguwOqRF+vbBXyGH2UaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3700776"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2026 06:32:29 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v5 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Date: Thu, 22 Oct 2026 18:59:54 +0530
Message-ID: <20261022132957.2479469-5-naresh.kumar.g@intel.com>
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
index ee92a0d203b8..9f2f46e40012 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -114,6 +114,11 @@ static const struct xe_reg_desc xe_dbg_media_gt_rpm_reglist[] = {
 	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
 };
 
+static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] = {
+	XE_REG_DESC(PAGE_FLTRPTQ_HEAD_GAMCTRL, "PAGE_FLTRPTQ_HEAD_GAMCTRL"),
+	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
+};
+
 /**
  * struct xe_gt_regset - Struct for register descriptor list for GT
  *
@@ -133,12 +138,14 @@ struct xe_gt_regset {
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
 
@@ -161,6 +168,10 @@ static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
 		.gt[XE_GT_TYPE_MEDIA] = { xe_dbg_gt_guc_reglist,
 					  ARRAY_SIZE(xe_dbg_gt_guc_reglist) },
 	},
+	[XE_DBG_REGSET_GAM_PF] = {
+		.gt[XE_GT_TYPE_MAIN] = { xe_dbg_gam_pf_reglist,
+					ARRAY_SIZE(xe_dbg_gam_pf_reglist) },
+	},
 };
 
 static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
@@ -202,6 +213,23 @@ static const u32 *xe_dbg_find_value(const struct xe_dbg_reg_snapshot *snap,
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
+	val1 = xe_dbg_find_value(snap, PAGE_FLTRPTQ_HEAD_GAMCTRL);
+	val2 = xe_dbg_find_value(snap, PAGE_FLTRPTQ_TAIL_GAMCTRL);
+	if ((val1 && val2) && (*val1 != *val2))
+		drm_printf(p, "PF occurred, refer to dmesg log for PF info\n");
+}
+
 static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
 				     const char *title,
 				     const struct xe_dbg_reg_snapshot *snap)
@@ -315,6 +343,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
+	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss->gam_pf_report);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -369,6 +399,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
+	ss->gam_pf_report = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -565,6 +598,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
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
index 52db64640f89..34f224a6751f 100644
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

