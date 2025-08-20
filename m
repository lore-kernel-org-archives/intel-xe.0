Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB26CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 08:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E762110E6CC;
	Wed, 20 Aug 2025 08:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnHVf5lN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C1E10E6CC
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 08:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755678483; x=1787214483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gyQih4b7HOcAFTHruJGcgYlixaTMsNy9gLE2x1VUDD8=;
 b=hnHVf5lNOZIAAt8ibDDvgNvGmxLY0IepDTUyIplf5+5Ap7FnwOGxiFco
 9G3cCHtupPxm3r8pGHQefqdV2b8fw/OyiRy9k61evRmnLqAvfc1Eizzau
 kf0SRmdar1Qnkc99xKua1CnbQVJ8Bq4yHRLYXw3/14/3kfxA7yiOOyLSY
 npsNYAbtcGO1MjTewTlzQwWJ+labtDmN6YnElCFP7h4MHi4SHTEqDNSNN
 5B15Mqk20336WBd+5l00K8zULVPp34yObFfjz2KmeHUFQE8I5IAkAt68G
 t/HhXdvfq7STZeh5C7TCeCixVh6sQ0mInd9zGEZjSy3bAs+f91KMfXhO5 Q==;
X-CSE-ConnectionGUID: AUVSHUAFRPaZ4O3q03jnEw==
X-CSE-MsgGUID: MfolzB1rRvOFF4i1O+/KWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61575383"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="61575383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:28:02 -0700
X-CSE-ConnectionGUID: aQqEQcu0Ri2AJHMTjSLx0Q==
X-CSE-MsgGUID: C1x1uRiUTWyfFLgPhIO4oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="173322677"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa004.fm.intel.com with ESMTP; 20 Aug 2025 01:27:59 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
Date: Wed, 20 Aug 2025 14:14:53 +0530
Message-ID: <20250820084453.27100-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/gpu/drm/xe/xe_pm.c       |  8 +++++++
 drivers/gpu/drm/xe/xe_sriov_vf.c | 36 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h |  1 +
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 51934d5dc44f..821e796e91e2 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -23,6 +23,7 @@
 #include "xe_irq.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
+#include "xe_sriov_vf.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
@@ -186,6 +187,13 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_display_pm_resume_early(xe);
 
+	/* GGTT fixups (if needed) have to be done before restoring BOs */
+	if (IS_SRIOV_VF(xe)) {
+		err = xe_sriov_vf_fixup_ggtt(xe);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * This only restores pinned memory which is the memory required for the
 	 * GT(s) to resume.
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 5de81f213d83..1540a444f921 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_irq.h"
@@ -378,3 +379,38 @@ void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
 	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
 		 "scheduled" : "already in progress");
 }
+
+/**
+ * xe_sriov_vf_fixup_ggtt - Fix up GGTT on resume from S4.
+ * @xe: the &xe_device to start on resume.
+ *
+ * This function shall be called only by VF.
+ * Main GT and media GT share the same GGTT space. So, fixups are needed
+ * only for Main GT.
+ *
+ * Returns: 0 if the operation completed successfully, or a negative error
+ * code otherwise.
+ */
+int xe_sriov_vf_fixup_ggtt(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	int err = 0;
+	u8 id;
+
+	for_each_gt(gt, xe, id) {
+		if (gt->info.type != XE_GT_TYPE_MAIN)
+			continue;
+
+		xe_guc_comm_init_early(&gt->uc.guc);
+		err = xe_gt_sriov_vf_bootstrap(gt);
+		if (err)
+			goto out;
+
+		err = gt_vf_post_migration_fixups(gt);
+		if (err)
+			goto out;
+	}
+
+out:
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 7b8622cff2b7..4c2a6cb825fc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -10,5 +10,6 @@ struct xe_device;
 
 void xe_sriov_vf_init_early(struct xe_device *xe);
 void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
+int xe_sriov_vf_fixup_ggtt(struct xe_device *xe);
 
 #endif
-- 
2.43.0

