Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2C0CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 06:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B252910E88C;
	Thu, 23 Oct 2025 06:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arZ18/2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C000E10E890
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 06:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761200933; x=1792736933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UmAtuNP2cjicnR/2oDekws9pgExWkiTwDzosTXCpGcM=;
 b=arZ18/2LOiJcIbYduDk1GtvS+7q5fgGzNGcI4wNPSTjzcFsZDaFD5VWa
 EJL+zFJc2/zOgje6u+m815ksHp4PD+zt8TsLmnnnmVX8CJVOIUtfc4qwg
 AteQ07A9g4ipq8Bdn7BW40Wv7AuzYcEXLY8zOsTJqX88HQItZ5SbizmTj
 1KmLTfNJuEpPpLtCaA6e9KmkE1Q2WDqXCGTsqrc8dAZ8jN5527Ervecsm
 8ohbx1VxJuHM6xxvDTtE1LMC2zsMJ2Sui8JLFm4eP6JJYTmRHtaz8uSlC
 /+/exvG0YUcxWcdaTBEG+9lgs2NbbeZ3d9cpfqbot76a7LFrxm2MRoarp Q==;
X-CSE-ConnectionGUID: lkGdGYFWTtSRgoxgen/q5w==
X-CSE-MsgGUID: 5CG5Ll/QTXiwLHbWhDKL/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63064572"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63064572"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:28:52 -0700
X-CSE-ConnectionGUID: lZdWRIESQdmPA4r9vxUrmQ==
X-CSE-MsgGUID: 59ZTJtRCQQ+N0ONPy4Fp8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="184553604"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 23:28:50 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
Date: Thu, 23 Oct 2025 12:16:11 +0530
Message-ID: <20251023064610.4499-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
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

With SRIOV enabled, while resuming from S4, there is a possibility that,
the VM might have been suspended on one VF and resumed on another VF.
Since GGTT space is not virtualized, we need to fixup all the GGTT
references while resuming.

While resuming from S4, check whether the GGTT space is same or not for
the given VF and fix-up if it is different.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
V1 -> V2:
- Rebased to latest drm-tip.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 32 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c          | 12 +++++++++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d0b102ab6ce8..38528495478f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1375,3 +1375,35 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 					       HZ * 5);
 	xe_gt_WARN_ON(gt, !ret);
 }
+
+/**
+ * xe_sriov_vf_fixup_ggtt - Fix up GGTT on resume from S4.
+ * @gt: the &xe_gt.
+ *
+ * This function shall be called only by VF.
+ * Main GT and media GT share the same GGTT space. So, fixups are needed
+ * only for Main GT.
+ *
+ * Returns: 0 if the operation completed successfully, or a negative
+ * error code otherwise.
+ */
+int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt)
+{
+	int err = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	if (gt->info.type != XE_GT_TYPE_MAIN)
+		return err;
+
+	xe_guc_comm_init_early(&gt->uc.guc);
+	err = xe_gt_sriov_vf_bootstrap(gt);
+	if (err)
+		goto out;
+
+	err = vf_post_migration_fixups(gt);
+
+out:
+	return err;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index af40276790fa..17004223f33a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -39,5 +39,6 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
 void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
+int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 210298c4bcb1..68bf08ae62f6 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -19,6 +19,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
@@ -248,6 +249,17 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_display_pm_resume_early(xe);
 
+	/* GGTT fixups (if needed) have to be done before restoring BOs */
+	if (IS_SRIOV_VF(xe)) {
+		for_each_gt(gt, xe, id) {
+			err = xe_gt_sriov_vf_fixup_ggtt(gt);
+			if (err) {
+				drm_err(&xe->drm, "GGTT fixups failed with %d\n", err);
+				return err;
+			}
+		}
+	}
+
 	/*
 	 * This only restores pinned memory which is the memory required for the
 	 * GT(s) to resume.
-- 
2.51.0

