Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7C5C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 09:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2144C10E5FE;
	Wed, 14 May 2025 09:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdNj4ag9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25310E5FE
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747214725; x=1778750725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmZ6MPmVISj76MJR6hknSJV2kGiSFK4hzAjjVBTS1D8=;
 b=HdNj4ag96ykJA9GqENRHJk42ItJtStc8V5FQfxro0/Wb5kyWTKtA8MlR
 Jl+ceopPvcYrCdMVUz5JpgsWH+g0O+tESHjjNkofCX/Amvk63XwosEKQk
 iKR+RGL5hB2fyq8c7jJGmdLg8sgrE6XxxLJodO/376EkR3njZzXhRBxZE
 Q0ur0K1IkUE0kbyiPGcCmehpsZsTmOAdgGT/Cr4UEmOglL7dqQZ9ysON7
 qvl8keGIxUkcuhO1WpX4F/M0HGzCK5CL/taUG3qsSUZ9u0o2VTXlUvCmC
 waY8VA0i/ItgTrhlKBor6cFVxz+tslUUhSjZ/FXavmixZBOVxE9hdeNmD A==;
X-CSE-ConnectionGUID: dviuTvEBRkKJTZ7cW06Kgw==
X-CSE-MsgGUID: 3b/lkNw1RLCZ7jB4l44dww==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49218337"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="49218337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:25 -0700
X-CSE-ConnectionGUID: QT+uuCeLSdKJB7FguZWWcw==
X-CSE-MsgGUID: MkjeqE1PT2KyxQQO+UTx/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="142016820"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:24 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v4 2/4] drm/xe: Don't update wedged mode in case of an error
Date: Wed, 14 May 2025 11:24:50 +0200
Message-Id: <20250514092452.8364-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250514092452.8364-1-lukasz.laguna@intel.com>
References: <20250514092452.8364-1-lukasz.laguna@intel.com>
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

Update driver's internal wedged.mode state only in case of a success to
avoid inconsistent state.

Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++----
 drivers/gpu/drm/xe/xe_guc_ads.c | 7 ++++---
 drivers/gpu/drm/xe/xe_guc_ads.h | 3 ++-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5dd0ad3f9bae..72515fc638b1 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -170,19 +170,19 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (xe->wedged.mode == wedged_mode)
 		return size;
 
-	xe->wedged.mode = wedged_mode;
-
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
-		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
+		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads, wedged_mode);
 		if (ret) {
-			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
+			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy\n");
 			xe_pm_runtime_put(xe);
 			return -EIO;
 		}
 	}
 	xe_pm_runtime_put(xe);
 
+	xe->wedged.mode = wedged_mode;
+
 	return size;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 413711bd3f58..99aec2e8378b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -997,12 +997,13 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
 /**
  * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
  * @ads: Additional data structures object
+ * @mode: The wedged mode
  *
- * This function update the GuC's engine reset policy based on wedged.mode.
+ * This function update the GuC's engine reset policy based on wedged mode.
  *
  * Return: 0 on success, and negative error code otherwise.
  */
-int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, enum xe_wedged_mode mode)
 {
 	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_gt *gt = ads_to_gt(ads);
@@ -1018,7 +1019,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
 	policies->is_valid = 1;
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
+	if (mode == XE_WEDGED_MODE_UPON_ANY_HANG)
 		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 	else
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 2e6674c760ff..641d9c8375fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -7,12 +7,13 @@
 #define _XE_GUC_ADS_H_
 
 struct xe_guc_ads;
+enum xe_wedged_mode;
 
 int xe_guc_ads_init(struct xe_guc_ads *ads);
 int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
-int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, enum xe_wedged_mode mode);
 
 #endif
-- 
2.40.0

