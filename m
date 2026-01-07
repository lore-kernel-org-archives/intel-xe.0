Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D5D0D150
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2BA10E5A9;
	Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNKbgG1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36FA10E2B6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808073; x=1799344073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Atn8P3B2KXDHakiel+SxYb7hDWwdDlPnGGjFF0yXy/E=;
 b=iNKbgG1eb77KiiUWAEMavOxlACBX5ySNrOiT7L380eVtcBtMPBLV+MXA
 Hg+lB3h9xPakuo3k8szbGQ/X/ozfc6LV0Zn/xMY9UVaDDRgtCzlbD6ec1
 T+GtC9BmLF0n1uUbDPn95UmRqy9Qe/CD2KpPWr1qv4w1afUeFRjkUuSpx
 wbjgjvDsjNPlIQowPFNeVlYBPNlODNc9ZWFHLOGuc7CB014CmmghARCvR
 VID0gINAPyHnOWVxtDQhFk6tEE0E6Dcm5cX/5jp3hMRSk0taCZlU/uAuA
 rj9/oNatusskzYIVow3y2fDjfo/rK1tfz7JpZfnXJZn0cQhGmStUQyC9H g==;
X-CSE-ConnectionGUID: oy/Al4b7QwCutz6SFcOC5g==
X-CSE-MsgGUID: L2YaY3JLTw+quYh5rmRvTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="91842123"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="91842123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:53 -0800
X-CSE-ConnectionGUID: Fn3F6b1mQwuj3sSxdm0hBA==
X-CSE-MsgGUID: aOjoHpXlSl+A7WZ9LapuLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202191212"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:51 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v12 2/4] drm/xe: Update wedged.mode only after successful
 reset policy change
Date: Wed,  7 Jan 2026 18:47:39 +0100
Message-Id: <20260107174741.29163-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260107174741.29163-1-lukasz.laguna@intel.com>
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
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
v12:
 - rename helpers to make wedged mode context explicit (Rodrigo).
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 70 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_ads.c      | 14 +++---
 drivers/gpu/drm/xe/xe_guc_ads.h      |  5 +-
 4 files changed, 71 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index db2afd60d8bc..844cfafe1ec7 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -254,14 +254,64 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
 
+static int __wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
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
+static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
+{
+	struct xe_gt *gt;
+	int ret;
+	u8 id;
+
+	guard(xe_pm_runtime)(xe);
+	for_each_gt(gt, xe, id) {
+		ret = __wedged_mode_set_reset_policy(gt, mode);
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
+static bool wedged_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
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
+	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
+		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
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
index d790129a06db..4dab3057f58d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -648,6 +648,8 @@ struct xe_device {
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
+		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
+		bool inconsistent_reset;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 2b47e897d2ea..7e1cb6093de7 100644
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
index 2e6674c760ff..7a39f361cb17 100644
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
+					     bool enable_engine_reset);
 
 #endif
-- 
2.40.0

