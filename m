Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB0606A31D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 00:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SC/BUK+W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390D210E50F;
	Wed, 28 Oct 2026 00:21:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680EF10E50F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 00:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793146869; x=1824682869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rNMoFmz9KGQAnoDnrbLUbwB+Jr12sPHRvimX+eeNB2E=;
 b=SC/BUK+WWnBkFBMcKdOJUPX5aD4BMjnBKWleMFOQ0jrbbpFtru+MHgy2
 XO38DEHfY7K5qBef4dWcLOvQ0qedFVrhYsWLunu7tB6L0/o/VxSIp0BTG
 6Mz7cRYPdmhSnhqYFqAQ63oeHUUhiwqOiAO6OCOe72ytT9ORVp6nvu8Bd
 e21jrfvWUAQZzJW4ILYRvL/AYa54gLOMw3dLP81rBYzcskf1/cSY1+cPr
 S0/v1CVTZ2nooBO/yhdHJnsL/+LvBweyZbzP0PnG3jKF2/s+xV/QWL/lO
 j9Dw4PysFgN3vwgfLRA4CRSuiXiVsZQoXpX50+rYaxWLNrPY8+3kA3KEm A==;
X-CSE-ConnectionGUID: q5VZq3yHQvaJz5DuH8UwoA==
X-CSE-MsgGUID: SFAZivJwR4GGiy5ambv5rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1860089"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1860089"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 17:21:09 -0700
X-CSE-ConnectionGUID: 3KbKAMPcRk6BXIKtObYVmA==
X-CSE-MsgGUID: B3p8CLdHSJOw4uGrZO0aSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6454407"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 17:21:08 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 3/3] drm/xe: Memset g2g buffer on resume
Date: Tue, 27 Oct 2026 10:43:55 -0700
Message-ID: <20261027174351.619929-8-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
References: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KMD creates this buffer for use by GuC, it is also responsible for zeroing
it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
so we cannot trust its contents after a suspend cycle. This commit adds
xe_*_resume_early() functions for handling this and the C6 disable
during resume.

v2: Maintain layering with _early functions for gt/uc/ct (Matt Brost)
v3: Memset the g2g buffer in xe_guc_resume_early() (Daniele)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt.h  |  1 +
 drivers/gpu/drm/xe/xe_guc.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c  |  4 ++--
 drivers/gpu/drm/xe/xe_uc.c  | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h  |  1 +
 7 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 60d35ada2853..bbdb7ab6c5af 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1093,6 +1093,19 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 	return ret;
 }
 
+/**
+ * xe_gt_resume_early() - Early init for GT resume
+ * @gt: the GT object
+ *
+ * Handles GT related init before GT restart after a suspend cycle.
+ */
+void xe_gt_resume_early(struct xe_gt *gt)
+{
+	xe_gt_idle_disable_c6(gt);
+
+	xe_uc_resume_early(&gt->uc);
+}
+
 int xe_gt_resume(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 7b6952fe804c..7d292f9d0be7 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
+void xe_gt_resume_early(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 int xe_gt_runtime_resume(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1f4e132fa0c..74438aaad437 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1755,6 +1755,21 @@ int xe_guc_start(struct xe_guc *guc)
 	return xe_guc_submit_start(guc);
 }
 
+/**
+ * xe_guc_resume_early() - Early init for GuC resume
+ * @guc: the guc object
+ *
+ * GuC init after a suspend cycle
+ */
+void xe_guc_resume_early(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+
+	/* clear the g2g buffer which is marked as NORESTORE during alloc */
+	if (guc->g2g.bo && guc->g2g.owned)
+		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
+}
+
 /**
  * xe_guc_runtime_suspend() - GuC runtime suspend
  * @guc: The GuC object
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 75c4b9acb065..543ba4e5981e 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -38,6 +38,7 @@ int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
 int xe_guc_post_load_init(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
+void xe_guc_resume_early(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 1f5097875bcd..89d64aa6577d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
 		return err;
 
 	for_each_gt(gt, xe, id)
-		xe_gt_idle_disable_c6(gt);
+		xe_gt_resume_early(gt);
 
 	xe_display_pm_resume_early(xe);
 
@@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 
 		for_each_gt(gt, xe, id)
-			xe_gt_idle_disable_c6(gt);
+			xe_gt_resume_early(gt);
 
 		xe_display_pm_resume_early(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 686c28856014..89040d9fa05f 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -12,6 +12,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_rc.h"
 #include "xe_guc_engine_activity.h"
@@ -297,6 +298,20 @@ int xe_uc_suspend(struct xe_uc *uc)
 	return xe_guc_suspend(&uc->guc);
 }
 
+/**
+ * xe_uc_resume_early() - Early init for UC resume
+ * @uc: the UC object
+ *
+ * UC init before a GT restart during resume.
+ */
+void xe_uc_resume_early(struct xe_uc *uc)
+{
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return;
+
+	xe_guc_resume_early(&uc->guc);
+}
+
 /**
  * xe_uc_runtime_suspend() - UC runtime suspend
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 23bc0ce1c42f..3c56327fb3f9 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -13,6 +13,7 @@ int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_load_hw(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+void xe_uc_resume_early(struct xe_uc *uc);
 void xe_uc_runtime_resume(struct xe_uc *uc);
 void xe_uc_runtime_suspend(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
-- 
2.53.0

