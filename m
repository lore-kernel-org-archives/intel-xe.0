Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B462606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 00:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CxDQYlM+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36FE10F84F;
	Wed, 21 Oct 2026 00:18:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A95510F84F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 00:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792541916; x=1824077916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bBTYSFIDz8nLet8w/etooS+w0maiCNpJDHSpAzwKotg=;
 b=CxDQYlM+E/V/9uawPiE+tJD7QfMa9oQkH4wdrAegB4o02ujbKSmH8C8F
 lIrR8CMj/WRUlvUVP9Pqa5RUiNm1lFTx+ECNewwVjAKPWeLYSOf8yGyl6
 PzHN1b1xFpa/X4op++rXdVgOf223aPkVYvfrymrmE91jgOqCGm1a5zxAe
 6njxbS3NE9sRmRWMvHWKGhSNJJZJYXP+75yRzVnnEPlErVDuOz9V0cRWz
 O81nLdftIDYYpFt4Snof+LrNdkg8ynIa5t9luC02zLUn38i4HUEciqE22
 Fi76pLCom9UljaCDnnreoRUiu00jo2CPP3KE4Vo1RVWCAfweKIDz08i8y g==;
X-CSE-ConnectionGUID: hVuZqsz3SQCTYLilCcQpPA==
X-CSE-MsgGUID: Zx7S6kUTTKq8J/lxCZQJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1132518"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1132518"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 17:18:36 -0700
X-CSE-ConnectionGUID: 3/yUrxaMSTGdHPoYv3NyoQ==
X-CSE-MsgGUID: T3j1lQXlTfetWR+T98xd8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2955651"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2026 17:18:35 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Memset g2g buffer on resume
Date: Tue, 20 Oct 2026 10:39:47 -0700
Message-ID: <20261020173943.669600-8-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020173943.669600-5-vinay.belgaumkar@intel.com>
References: <20261020173943.669600-5-vinay.belgaumkar@intel.com>
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
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c     |  4 ++--
 drivers/gpu/drm/xe/xe_uc.c     | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 7 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc9bf6f0b5a7..3abb7d409bac 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -50,7 +50,6 @@
 #include "xe_lmtt.h"
 #include "xe_log.h"
 #include "xe_lrc.h"
-#include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pagefault.h"
@@ -1084,6 +1083,19 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
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
index 92d934d50244..9b69f36ebc7a 100644
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
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e9fc55917fa3..4ea1f71d5a52 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -862,6 +862,22 @@ void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
 	xe_guc_ct_disable(ct);
 }
 
+/**
+ * xe_guc_ct_resume_early() - Early init for GuC CT resume
+ * @ct: the &xe_guc_ct
+ *
+ * CT init before GT restart after a suspend cycle.
+ */
+void xe_guc_ct_resume_early(struct xe_guc_ct *ct)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_device *xe = ct_to_xe(ct);
+
+	/* clear the g2g buffer which is marked as NORESTORE during alloc */
+	if (guc->g2g.bo && guc->g2g.owned)
+		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
+}
+
 /**
  * xe_guc_ct_runtime_resume() - GuC CT runtime resume
  * @ct: the &xe_guc_ct
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index f3af15c95c75..3470ced126de 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -20,6 +20,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 int xe_guc_ct_restart(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
+void xe_guc_ct_resume_early(struct xe_guc_ct *ct);
 void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
 void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
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
index 65f59f06177f..8a704ca7d496 100644
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
+	xe_guc_ct_resume_early(&uc->guc.ct);
+}
+
 /**
  * xe_uc_runtime_suspend() - UC runtime suspend
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 255a54a8f876..7a05f4a97ab5 100644
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

