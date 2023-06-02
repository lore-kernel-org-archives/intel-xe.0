Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683C9C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4160F10E5F0;
	Fri,  2 Jun 2023 17:55:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7861910E5F7
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685728506; x=1717264506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l6PvHmLiyE5fd/fN6kDjVj0a54YG+N98G6vgTA5J3ZU=;
 b=fl8zxkO8IG4kfhQTOSmTuDJ0MF84kEWzjkO3eGNlTFT8EtCIZHjFo3Wg
 DCOei7XJKLAX651esxVi2ySjHyJS4AMR/J4Zw8KY9fFzkEltt64qvmKk4
 HY/LAW+09/xSCx0HP61H30CwoJgCFKG3y47r2wSU75B3syuUKw876jWuU
 Bmu61/7XEgDtIN6U35Cr3Jntsr9zUoecQFiSD5x1UFIUuKnJTFPU0Vfmr
 Vm2bCu70GY8kWvO02bRqAucm/7XOuZExnh2CH2c1t9hgB4Z5I1o14k9Y+
 E46cWciaXzkwuX7D5U122BglybGzJvYO1dOXJ4pBPv4k5t+lXdiBVEJE+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335543422"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="335543422"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="740897783"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="740897783"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:55:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 20:54:43 +0300
Message-Id: <20230602175444.3511273-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602175444.3511273-1-jani.nikula@intel.com>
References: <20230602175444.3511273-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] Revert "drm/i915/display: Remove
 i915_drm_suspend_mode"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 8b346b4184e2b6e4a96d1c6bce1d4d1b0916b032.

To be replaced with backport of upstream commit c7b5abd3e030 ("drm/i915:
Remove i915_drm_suspend_mode").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_power.c   |  8 +++++---
 .../gpu/drm/i915/display/intel_display_power.h   |  3 ++-
 drivers/gpu/drm/i915/i915_driver.c               | 16 ++++++++++++++--
 drivers/gpu/drm/i915/intel_runtime_pm.h          |  6 ++++++
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index c6ae4c88dae4..92660f65587c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -2021,7 +2021,7 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
 /**
  * intel_power_domains_suspend - suspend power domain state
  * @i915: i915 device instance
- * @s2idle: specifies whether we go to idle, or deeper sleep
+ * @suspend_mode: specifies the target suspend state (idle, mem, hibernation)
  *
  * This function prepares the hardware power domain state before entering
  * system suspend.
@@ -2029,7 +2029,8 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
  * It must be called with power domains already disabled (after a call to
  * intel_power_domains_disable()) and paired with intel_power_domains_resume().
  */
-void intel_power_domains_suspend(struct drm_i915_private *i915, bool s2idle)
+void intel_power_domains_suspend(struct drm_i915_private *i915,
+				 enum i915_drm_suspend_mode suspend_mode)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
 	intel_wakeref_t wakeref __maybe_unused =
@@ -2045,7 +2046,8 @@ void intel_power_domains_suspend(struct drm_i915_private *i915, bool s2idle)
 	 * that would be blocked if the firmware was inactive.
 	 */
 	if (!(power_domains->allowed_dc_mask & DC_STATE_EN_DC9) &&
-	    s2idle && intel_dmc_has_payload(i915)) {
+	    suspend_mode == I915_DRM_SUSPEND_IDLE &&
+	    intel_dmc_has_payload(i915)) {
 		intel_display_power_flush_work(i915);
 		intel_power_domains_verify_state(i915);
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 7f2ded540d6e..4eb506ae3862 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -176,7 +176,8 @@ void intel_power_domains_init_hw(struct drm_i915_private *dev_priv, bool resume)
 void intel_power_domains_driver_remove(struct drm_i915_private *dev_priv);
 void intel_power_domains_enable(struct drm_i915_private *dev_priv);
 void intel_power_domains_disable(struct drm_i915_private *dev_priv);
-void intel_power_domains_suspend(struct drm_i915_private *dev_priv, bool s2idle);
+void intel_power_domains_suspend(struct drm_i915_private *dev_priv,
+				 enum i915_drm_suspend_mode);
 void intel_power_domains_resume(struct drm_i915_private *dev_priv);
 void intel_power_domains_sanitize_state(struct drm_i915_private *dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 903a0a2e3635..fd198700272b 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1099,6 +1099,18 @@ static int i915_drm_suspend(struct drm_device *dev)
 	return 0;
 }
 
+static enum i915_drm_suspend_mode
+get_suspend_mode(struct drm_i915_private *dev_priv, bool hibernate)
+{
+	if (hibernate)
+		return I915_DRM_SUSPEND_HIBERNATE;
+
+	if (suspend_to_idle(dev_priv))
+		return I915_DRM_SUSPEND_IDLE;
+
+	return I915_DRM_SUSPEND_MEM;
+}
+
 static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -1106,7 +1118,6 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	struct intel_gt *gt;
 	int ret, i;
-	bool s2idle = !hibernation && suspend_to_idle(dev_priv);
 
 	disable_rpm_wakeref_asserts(rpm);
 
@@ -1117,7 +1128,8 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
-	intel_power_domains_suspend(dev_priv, s2idle);
+	intel_power_domains_suspend(dev_priv,
+				    get_suspend_mode(dev_priv, hibernation));
 
 	intel_display_power_suspend_late(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i915/intel_runtime_pm.h
index 764b183ae452..e592e8d6499a 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
@@ -16,6 +16,12 @@ struct device;
 struct drm_i915_private;
 struct drm_printer;
 
+enum i915_drm_suspend_mode {
+	I915_DRM_SUSPEND_IDLE,
+	I915_DRM_SUSPEND_MEM,
+	I915_DRM_SUSPEND_HIBERNATE,
+};
+
 /*
  * This struct helps tracking the state needed for runtime PM, which puts the
  * device in PCI D3 state. Notice that when this happens, nothing on the
-- 
2.39.2

