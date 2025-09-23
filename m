Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439CCCAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 21:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057E010E27B;
	Tue, 23 Sep 2025 21:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSk4uXEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC6210E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662193; x=1790198193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FaUFnougziHtIE40+fLp0YX1phPf3zDd3kkCiAZSIh4=;
 b=LSk4uXEl5xfWw99kpqTPUqkc78HGrfMMM1ppCWMxZ8VmxZGO7tEijcPX
 y4CbmK1HQd5++JWjvHIlRzgJK5tNKKI2t/Ri2qMZr3QNws0iG3tWjxqH1
 OxqhlnJuv77FBPsRjTdg7giFnU0LCbr7Uvsp2DYg8C8WVBKO55A/ZuwKd
 pH6FBubd/WbRnfxzlIRaDp3hZx66App07zDq/CJsNt7AgiwxAszOvkfGE
 8CjG7IN2+jTmQ9PR/tuQsWaFVnQSsDWaU4hSmphsDXIO+eTbe1Bg3hFFt
 DqtLaTbr8zZXDLhkcYh7l6ETbPg8+ReKjMA/lX0R6HfpMGpvyyfShsB1J g==;
X-CSE-ConnectionGUID: zHq4ZrUISdqSY9acALAF5w==
X-CSE-MsgGUID: d/6QR+ldTimXH5nT37cE6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64592587"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64592587"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:33 -0700
X-CSE-ConnectionGUID: UuH+0WoGS1aP3TxlRkJxGw==
X-CSE-MsgGUID: DR5CfwcbQp2x6w0oKmThEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="175989826"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/5] drm/xe/debugfs: Update xe_mocs_dump signature
Date: Tue, 23 Sep 2025 23:16:12 +0200
Message-ID: <20250923211613.193347-5-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  8 +-------
 drivers/gpu/drm/xe/xe_mocs.c       | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_mocs.h       |  8 +-------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index bcf234e74471..b0e6dafeeacc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -173,12 +173,6 @@ static int pat(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static int mocs(struct xe_gt *gt, struct drm_printer *p)
-{
-	xe_mocs_dump(gt, p);
-	return 0;
-}
-
 static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
@@ -237,7 +231,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
-	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = mocs },
+	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
 	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = pat },
 	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
 	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 0c737413fcb6..7b68c22ff7bb 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -772,12 +772,20 @@ void xe_mocs_init(struct xe_gt *gt)
 		init_l3cc_table(gt, &table);
 }
 
-void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
+/**
+ * xe_mocs_dump() - Dump MOCS table.
+ * @gt: the &xe_gt with MOCS table
+ * @p: the &drm_printer to dump info to
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	enum xe_force_wake_domains domain;
 	struct xe_mocs_info table;
 	unsigned int fw_ref, flags;
+	int err = 0;
 
 	flags = get_mocs_settings(xe, &table);
 
@@ -785,14 +793,17 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 	xe_pm_runtime_get_noresume(xe);
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), domain);
 
-	if (!xe_force_wake_ref_has_domain(fw_ref, domain))
+	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
+		err = -ETIMEDOUT;
 		goto err_fw;
+	}
 
 	table.ops->dump(&table, flags, gt, p);
 
 err_fw:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
+	return err;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
index dc972ffd4d07..f00bbb269829 100644
--- a/drivers/gpu/drm/xe/xe_mocs.h
+++ b/drivers/gpu/drm/xe/xe_mocs.h
@@ -11,12 +11,6 @@ struct xe_gt;
 
 void xe_mocs_init_early(struct xe_gt *gt);
 void xe_mocs_init(struct xe_gt *gt);
-
-/**
- * xe_mocs_dump - Dump mocs table
- * @gt: GT structure
- * @p: Printer to dump info to
- */
-void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
+int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
 
 #endif
-- 
2.47.1

