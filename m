Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7689C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 16:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639B910E7D0;
	Thu, 11 Jan 2024 16:21:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD90210E7D0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704990063; x=1736526063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kbVdgvf5RlcrWNZu65Syc3K3jhtrbgFzWFcYCVmQBU4=;
 b=myn69GTpIJp7smQzg4HDUSFvDRQ4m2tOjU1+P3lqUfSBBdHPJqEJ81EA
 qrkezIU7oFgOGgBx2bxHXTRMYu3VGK3O/le+DSSyXau6PC//BKr4FQ4f3
 hAxiZUZAauuzWwXxFTICShOFAtOj3ILXPPjreRM6ktwT4Zs8Z1urFSVOR
 0Q+8rrS5s19ZuMrHUpsIGsp03vW1+Mj6vQpWpfjwX5Gz5faulf09x2d9M
 W3gHHidkrUEnmQpT7z30xAJrbgGcFwp1An3c1zei0u30e/wJmdZ1w4lbj
 XqBl8RrBMFTe2TXVQzOX5aiQXi3Y9FnHaFBWjEOMLZ5ZR7O2vBTmRYmgB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485069583"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="485069583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 08:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="24369658"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.229])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 08:21:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Split GuC communication initialization
Date: Thu, 11 Jan 2024 17:20:51 +0100
Message-Id: <20240111162051.585-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Soon we will be trying to communicate with the GuC firmware very
early during VF driver probe, before we finish normal init steps.
Split GuC communication initialization code so the GuC MMIO based
communication xe_guc_mmio_send() functions will work where needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 21 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc.h |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 6e73ebf67251..0fd9b5efe4c2 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -243,6 +243,22 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
 
+/**
+ * xe_guc_comm_init_early - early initialization of GuC communication
+ * @guc: the &xe_guc to initialize
+ *
+ * Must be called prior to first MMIO communication with GuC firmware.
+ */
+void xe_guc_comm_init_early(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (xe_gt_is_media_type(gt))
+		guc->notify_reg = MED_GUC_HOST_INTERRUPT;
+	else
+		guc->notify_reg = GUC_HOST_INTERRUPT;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -283,10 +299,7 @@ int xe_guc_init(struct xe_guc *guc)
 
 	guc_init_params(guc);
 
-	if (xe_gt_is_media_type(gt))
-		guc->notify_reg = MED_GUC_HOST_INTERRUPT;
-	else
-		guc->notify_reg = GUC_HOST_INTERRUPT;
+	xe_guc_comm_init_early(guc);
 
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index d3e49e7fd7c3..94f2dc5f6f90 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -13,6 +13,7 @@
 
 struct drm_printer;
 
+void xe_guc_comm_init_early(struct xe_guc *guc);
 int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
 int xe_guc_post_load_init(struct xe_guc *guc);

base-commit: 79184e72263e91528195db01783148435c7e4fad
-- 
2.25.1

