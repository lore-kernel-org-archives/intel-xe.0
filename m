Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECD6D5B85E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65D610E49D;
	Mon, 15 Dec 2025 17:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYBvQkfA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCCB10E49D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765820786; x=1797356786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7uM2bDqI6od78xTRh6tom4OdUGdkLCgfS+fWklu7jrw=;
 b=CYBvQkfAXrE49Z78IrN/mx6Yn9I7Xq5uZuQdS7AAOy0jeWCIDniPpy0o
 sHozzRO6ASeJ0wdjkJA9IY//w3TW57DHK0eMogIttQNvJQRTJGgRIXBKt
 yXCCfeijh0+7jpuapGGt6FdPKj8SMbwS74ZR/wJyvxlP+sx42CqwwVWRn
 XoUfRIapgjn8sdRbGkUk5/+E6T01/GSOn2UtyC5TSzqiy2f+e65WC9TPX
 pVJ8eY9Rrn3QCZdByN3q2+7yuHReMLIy3gLHAjBx60UlabkHHIXHT0hvH
 VmAGxLmqI/qj6UgzdojUrOa/4iJWl8KxczHx7p8HAdbyWolJRP5TrJ2vK w==;
X-CSE-ConnectionGUID: X9HxJicuSWubkjQbGygTsQ==
X-CSE-MsgGUID: hypg/Po8QYyvZEv0AIhmwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67612353"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67612353"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:26 -0800
X-CSE-ConnectionGUID: Zz32ZQAwSIWyF6krt/3jDA==
X-CSE-MsgGUID: O8ijkNk4TCKcWwBTwULPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="198610935"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:25 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v11 2/4] drm/xe: Update wedged.mode only after successful
 reset policy change
Date: Mon, 15 Dec 2025 18:46:11 +0100
Message-Id: <20251215174613.3701-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251215174613.3701-1-lukasz.laguna@intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
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

Previously, the driver's internal wedged.mode state was updated without
verifying whether the corresponding engine reset policy update in GuC
succeeded. This could leave the driver reporting a wedged.mode state
that doesn't match the actual reset behavior programmed in GuC.

With this change, the reset policy is updated first, and the driver's
wedged.mode state is modified only if the policy update succeeds on all
available GTs.

This patch also introduces two functional improvements:

 - The policy is sent to GuC only when a change is required. An update
   is needed only when entering or leaving XE_WEDGED_MODE_UPON_ANY_HANG,
   because only in that case the reset policy changes. For example,
   switching between XE_WEDGED_MODE_UPON_CRITICAL_ERROR and
   XE_WEDGED_MODE_NEVER doesn't affect the reset policy, so there is no
   need to send the same value to GuC.

 - An inconsistent_reset flag is added to track cases where reset policy
   update succeeds only on a subset of GTs. If such inconsistency is
   detected, future wedged mode configuration will force a retry of the
   reset policy update to restore a consistent state across all GTs.

Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v11:
 - add more detailed commit description (Rodrigo).
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 70 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_ads.c      | 14 +++---
 drivers/gpu/drm/xe/xe_guc_ads.h      |  5 +-
 4 files changed, 71 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0b65c3940f41..f62174f7035a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -254,14 +254,64 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
 
+static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
+{
+	bool enable_engine_reset;
+	int ret;
+
+	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
+	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
+						       enable_engine_reset);
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
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
+	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
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
@@ -271,20 +321,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
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
index 20a847965b20..e41f82518d75 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -626,6 +626,8 @@ struct xe_device {
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
+		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
+		bool inconsistent_reset;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e95604416f2d..25ea17a74a64 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -983,16 +983,17 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
 /**
  * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
  * @ads: Additional data structures object
+ * @enable_engine_reset: true to enable engine resets, false otherwise
  *
- * This function update the GuC's engine reset policy based on wedged.mode.
+ * This function update the GuC's engine reset policy.
  *
  * Return: 0 on success, and negative error code otherwise.
  */
-int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
+					     bool enable_engine_reset)
 {
 	struct guc_policies *policies;
 	struct xe_guc *guc = ads_to_guc(ads);
-	struct xe_device *xe = ads_to_xe(ads);
 	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
 
 	if (!xe_guc_buf_is_valid(buf))
@@ -1004,10 +1005,11 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
 	policies->is_valid = 1;
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
-	else
+
+	if (enable_engine_reset)
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	else
+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 2e6674c760ff..bec404dda56b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GUC_ADS_H_
 #define _XE_GUC_ADS_H_
 
+#include <linux/types.h>
+
 struct xe_guc_ads;
 
 int xe_guc_ads_init(struct xe_guc_ads *ads);
@@ -13,6 +15,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
-int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
+                                             bool enable_engine_reset);
 
 #endif
-- 
2.40.0

