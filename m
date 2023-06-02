Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC52C7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732D810E611;
	Fri,  2 Jun 2023 17:55:12 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C973410E600
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685728510; x=1717264510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QSyQECM9BMho9PfyynZ6N5x/o5vA9av2Ug9hVka07Zw=;
 b=ZYGQeqpVZXehDWQEXvYUEVxCARwItIdiybKN4SylWbDUiz+x3aj8sw5W
 g2RcJUwLNOL9lCGCLhP5n//sk3eT78SFlpL7zrNOb/SC679nQTn12wryf
 mLTB0QGfJmQ4ozqdO4ixT7vC2dWEyzfWAP9UDMc09KgpeNTf1YDIsfrN/
 4ID6TC2ZKvNXOj8gQUX5WKgOw7EHmoPgvnNpVsb8JeyMHpxrkPpMvBCZT
 xjPcR2srScNHau0wt/GYCydpyl4Ga9EmV0KnV9LUExvM3L0fgcwOmV2cX
 FK17b0UuhbK7YuPXeUL23GBUSGj4/Xs6KlE/rgB2zsMCwqxcVU9dHvw13 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335543430"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="335543430"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="740897806"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="740897806"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:55:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 20:54:44 +0300
Message-Id: <20230602175444.3511273-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602175444.3511273-1-jani.nikula@intel.com>
References: <20230602175444.3511273-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/i915: Remove i915_drm_suspend_mode
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

enum i915_drm_suspend_mode suspend_mode is only used in
intel_display_power, while we only care about whether we perform a
s2idle. Remove it and use a simple bool.

v2: Rebase

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230529105900.1942814-1-jani.nikula@intel.com
(cherry picked from commit c7b5abd3e030718b6666cdf766f8905b006a9b1b)
---
 .../gpu/drm/i915/display/intel_display_power.c   |  8 +++-----
 .../gpu/drm/i915/display/intel_display_power.h   |  3 +--
 drivers/gpu/drm/i915/i915_driver.c               | 16 ++--------------
 drivers/gpu/drm/i915/intel_runtime_pm.h          |  6 ------
 4 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 92660f65587c..94338e4968f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -2021,7 +2021,7 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
 /**
  * intel_power_domains_suspend - suspend power domain state
  * @i915: i915 device instance
- * @suspend_mode: specifies the target suspend state (idle, mem, hibernation)
+ * @s2idle: specifies whether we go to idle, or deeper sleep
  *
  * This function prepares the hardware power domain state before entering
  * system suspend.
@@ -2029,8 +2029,7 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
  * It must be called with power domains already disabled (after a call to
  * intel_power_domains_disable()) and paired with intel_power_domains_resume().
  */
-void intel_power_domains_suspend(struct drm_i915_private *i915,
-				 enum i915_drm_suspend_mode suspend_mode)
+void intel_power_domains_suspend(struct drm_i915_private *i915, bool s2idle)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
 	intel_wakeref_t wakeref __maybe_unused =
@@ -2045,8 +2044,7 @@ void intel_power_domains_suspend(struct drm_i915_private *i915,
 	 * resources as required and also enable deeper system power states
 	 * that would be blocked if the firmware was inactive.
 	 */
-	if (!(power_domains->allowed_dc_mask & DC_STATE_EN_DC9) &&
-	    suspend_mode == I915_DRM_SUSPEND_IDLE &&
+	if (!(power_domains->allowed_dc_mask & DC_STATE_EN_DC9) && s2idle &&
 	    intel_dmc_has_payload(i915)) {
 		intel_display_power_flush_work(i915);
 		intel_power_domains_verify_state(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 4eb506ae3862..7f2ded540d6e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -176,8 +176,7 @@ void intel_power_domains_init_hw(struct drm_i915_private *dev_priv, bool resume)
 void intel_power_domains_driver_remove(struct drm_i915_private *dev_priv);
 void intel_power_domains_enable(struct drm_i915_private *dev_priv);
 void intel_power_domains_disable(struct drm_i915_private *dev_priv);
-void intel_power_domains_suspend(struct drm_i915_private *dev_priv,
-				 enum i915_drm_suspend_mode);
+void intel_power_domains_suspend(struct drm_i915_private *dev_priv, bool s2idle);
 void intel_power_domains_resume(struct drm_i915_private *dev_priv);
 void intel_power_domains_sanitize_state(struct drm_i915_private *dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index fd198700272b..903a0a2e3635 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1099,18 +1099,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 	return 0;
 }
 
-static enum i915_drm_suspend_mode
-get_suspend_mode(struct drm_i915_private *dev_priv, bool hibernate)
-{
-	if (hibernate)
-		return I915_DRM_SUSPEND_HIBERNATE;
-
-	if (suspend_to_idle(dev_priv))
-		return I915_DRM_SUSPEND_IDLE;
-
-	return I915_DRM_SUSPEND_MEM;
-}
-
 static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -1118,6 +1106,7 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	struct intel_gt *gt;
 	int ret, i;
+	bool s2idle = !hibernation && suspend_to_idle(dev_priv);
 
 	disable_rpm_wakeref_asserts(rpm);
 
@@ -1128,8 +1117,7 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
-	intel_power_domains_suspend(dev_priv,
-				    get_suspend_mode(dev_priv, hibernation));
+	intel_power_domains_suspend(dev_priv, s2idle);
 
 	intel_display_power_suspend_late(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i915/intel_runtime_pm.h
index e592e8d6499a..764b183ae452 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
@@ -16,12 +16,6 @@ struct device;
 struct drm_i915_private;
 struct drm_printer;
 
-enum i915_drm_suspend_mode {
-	I915_DRM_SUSPEND_IDLE,
-	I915_DRM_SUSPEND_MEM,
-	I915_DRM_SUSPEND_HIBERNATE,
-};
-
 /*
  * This struct helps tracking the state needed for runtime PM, which puts the
  * device in PCI D3 state. Notice that when this happens, nothing on the
-- 
2.39.2

