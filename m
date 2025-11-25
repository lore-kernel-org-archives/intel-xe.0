Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C95D0E6EA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 13:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1B710E402;
	Tue, 25 Nov 2025 13:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbT1IujT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1392F10E402
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078879; x=1795614879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4RuC8Ehm6wuEbxdquJ/FjkCpIT49G3LBlhhm3iB87Pg=;
 b=gbT1IujTE4j0twFKPai1DlC0hhUJ+x2DL98A82lrD5jI42BBan8dTNfU
 Ztv/R7tcn+Q+bR81KWoB1uGMWJmZQ18QzSzTyHNiOO4oRRvePkX26LY8N
 4v5qM1xHMfIq4rzLbSRnee2ea3R/jXxymH2OHdY+XiJXJx4Ivrk+Qqvom
 fXVhtApVSWqIPUpW2crleo1fLE7P10DwI7OxxAP5CKlevECHp6S7DSpF3
 4p1UL9SdUe9HP0RaOhveRITe2n2BIC0oNb6o127+DoK+l9Ci2Fh7L7L3L
 sZ77yV65XzbWAL3LU0VdQcnBME2J/HutmSz1CcVeSSW16svs7zSipMX3T w==;
X-CSE-ConnectionGUID: ksfC2d7IR7eQ0VjyO2AdsA==
X-CSE-MsgGUID: O7RfLiVGQHKIeWfWo2rD6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802560"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65802560"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:39 -0800
X-CSE-ConnectionGUID: cF19Ctv2T1qSJiC0dmzKMw==
X-CSE-MsgGUID: gaQmGzURRM++TVBMckuwsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196954009"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:37 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v10 2/4] drm/xe: Don't update wedged mode in case of an error
Date: Tue, 25 Nov 2025 14:54:20 +0100
Message-Id: <20251125135422.11244-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251125135422.11244-1-lukasz.laguna@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
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

Change driver's internal wedged.mode state only in case of a success and
update GuC's reset policy only when it's necessary.

Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 68 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_ads.c      | 12 ++---
 drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
 4 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e7cdfb1cda8c..71d53099187c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -252,14 +252,62 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
 
+static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
+{
+	int ret;
+
+	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
+						       mode != XE_WEDGED_MODE_UPON_ANY_HANG);
+	if (ret)
+		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
+
+	return ret;
+}
+
+static int set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
+{
+	struct xe_gt *gt;
+	int ret;
+	u8 id;
+
+	guard(xe_pm_runtime)(xe);
+	for_each_gt(gt, xe, id) {
+		ret = __set_reset_policy(gt, mode);
+		if (ret) {
+			if (id > 0) {
+				xe->wedged.inconsistent_reset = true;
+				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
+			}
+			return ret;
+		}
+	}
+
+	xe->wedged.inconsistent_reset = false;
+
+	return 0;
+}
+
+static bool needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
+{
+	if (xe->wedged.inconsistent_reset)
+		return true;
+
+	if (xe->wedged.mode == mode)
+		return false;
+
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG ||
+	    mode == XE_WEDGED_MODE_UPON_ANY_HANG)
+		return true;
+
+	return false;
+}
+
 static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 			       size_t size, loff_t *pos)
 {
 	struct xe_device *xe = file_inode(f)->i_private;
-	struct xe_gt *gt;
 	u32 wedged_mode;
 	ssize_t ret;
-	u8 id;
 
 	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
 	if (ret)
@@ -269,20 +317,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (ret)
 		return ret;
 
-	if (xe->wedged.mode == wedged_mode)
-		return size;
+	if (needs_policy_update(xe, wedged_mode)) {
+		ret = set_reset_policy(xe, wedged_mode);
+		if (ret)
+			return ret;
+	}
 
 	xe->wedged.mode = wedged_mode;
 
-	guard(xe_pm_runtime)(xe);
-	for_each_gt(gt, xe, id) {
-		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
-		if (ret) {
-			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
-			return -EIO;
-		}
-	}
-
 	return size;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 81bf4a70b888..4aa99bcfbcc7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -603,6 +603,8 @@ struct xe_device {
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
+		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
+		bool inconsistent_reset;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 466f192b6054..e5ca25b865a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -983,16 +983,16 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
 /**
  * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
  * @ads: Additional data structures object
+ * @enable: true to enable engine resets, false otherwise
  *
- * This function update the GuC's engine reset policy based on wedged.mode.
+ * This function update the GuC's engine reset policy.
  *
  * Return: 0 on success, and negative error code otherwise.
  */
-int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable)
 {
 	struct guc_policies *policies;
 	struct xe_guc *guc = ads_to_guc(ads);
-	struct xe_device *xe = ads_to_xe(ads);
 	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
 
 	if (!xe_guc_buf_is_valid(buf))
@@ -1004,10 +1004,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
 	policies->is_valid = 1;
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
-		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
-	else
+	if (enable)
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	else
+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 2e6674c760ff..9879aadd22d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GUC_ADS_H_
 #define _XE_GUC_ADS_H_
 
+#include <linux/types.h>
+
 struct xe_guc_ads;
 
 int xe_guc_ads_init(struct xe_guc_ads *ads);
@@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
-int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable);
 
 #endif
-- 
2.40.0

