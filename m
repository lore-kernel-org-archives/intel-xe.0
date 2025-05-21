Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503F9C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 12:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1857D11206E;
	Wed, 21 May 2025 12:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0GMmwYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DD011206E
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747830324; x=1779366324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2QxCv+S0lpMMyLB566YqJ9mTzYPSSSHSDJ6YqInAg4E=;
 b=R0GMmwYgj52hEEkTLQLdppuh72g/GLS2IKe9xVf5cvSHzXe1QTiDarhK
 Qmunu0h79kJCZhx7FUBqeKHXnBc3DJC1owUXunxMmmqDmSVN6S5GixzK6
 BokJuSfgXG7yZ/3GRmbNUhn7XwtL5d5F5MHViGgb1Vo/e7TInZ8krohYz
 ca9I2TTwWK2xadZVTfqDHxgDRSCwgnuvUlhP2E10xczLdYB7xP4YcEdlj
 KrcLUx/Bx3JF/4mulHGqd+Wk0rUUcynVWLvK6ovq6XiOcnmMkZYLcthp+
 01BZIHMDgcTlZldza6j23iS7IEmTgE4efovLva8dmc21i4dqpO9PmOnYb g==;
X-CSE-ConnectionGUID: emPXN+spRe6XkauiVoTB5g==
X-CSE-MsgGUID: 5f2EmGanSWSuFwYYEjtq2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72324580"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="72324580"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:24 -0700
X-CSE-ConnectionGUID: Nc7kksz9T6SGV8d3bdr3Dg==
X-CSE-MsgGUID: UJnezWpWTY+zqiOYJOYnIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139945553"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:22 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v6 2/4] drm/xe: Don't update wedged mode in case of an error
Date: Wed, 21 May 2025 14:25:09 +0200
Message-Id: <20250521122511.5760-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250521122511.5760-1-lukasz.laguna@intel.com>
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
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

Update driver's internal wedged.mode state only in case of a success or
set it to "misconfigured" in case of inconsistent reset policy state
between GTs.

Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 34 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.c       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c      | 12 +++++-----
 drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +++-
 5 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5dd0ad3f9bae..5bc4fe5aa9a2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -150,6 +150,25 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
 
+static int wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret;
+
+	if ((xe->wedged.mode == XE_WEDGED_MODE_NEVER &&
+	     mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR) ||
+	    (xe->wedged.mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR &&
+	     mode == XE_WEDGED_MODE_NEVER))
+		return 0;
+
+	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
+						       !(mode == XE_WEDGED_MODE_UPON_ANY_HANG));
+	if (ret)
+		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
+
+	return ret;
+}
+
 static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 			       size_t size, loff_t *pos)
 {
@@ -170,19 +189,24 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (xe->wedged.mode == wedged_mode)
 		return size;
 
-	xe->wedged.mode = wedged_mode;
-
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
-		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
+		ret = wedged_mode_set_reset_policy(gt, wedged_mode);
 		if (ret) {
-			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
+			if (id > 0) {
+				xe->wedged.mode = XE_WEDGED_MODE_MISCONFIGURED;
+				drm_err(&xe->drm, "Inconsistent reset policy state between GTs, setting wedged mode: (%u) %s\n",
+					xe->wedged.mode,
+					xe_device_wedged_mode_to_string(xe->wedged.mode));
+			}
 			xe_pm_runtime_put(xe);
-			return -EIO;
+			return ret;
 		}
 	}
 	xe_pm_runtime_put(xe);
 
+	xe->wedged.mode = wedged_mode;
+
 	return size;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index fa4f1a3ac1f2..0aea87994541 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1206,6 +1206,8 @@ const char *xe_device_wedged_mode_to_string(enum xe_wedged_mode mode)
 		return "upon-critical-error";
 	case XE_WEDGED_MODE_UPON_ANY_HANG:
 		return "upon-any-hang";
+	case XE_WEDGED_MODE_MISCONFIGURED:
+		return "misconfigured";
 	default:
 		return "<invalid>";
 	}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a8dfacb951c1..8ec1d891a2ab 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -562,6 +562,7 @@ struct xe_device {
 			XE_WEDGED_MODE_NEVER = 0,
 			XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
 			XE_WEDGED_MODE_UPON_ANY_HANG = 2,
+			XE_WEDGED_MODE_MISCONFIGURED = 3,
 			XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
 		} mode;
 	} wedged;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ca8bdb0ec08d..f2c4c4e292f6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -1008,14 +1008,14 @@ static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_poli
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
-	struct xe_device *xe = ads_to_xe(ads);
 	struct guc_policies *policies;
 	int ret;
 
@@ -1026,10 +1026,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
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
 
 	ret = guc_ads_update_policies(ads, policies);
 	kfree(policies);
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

