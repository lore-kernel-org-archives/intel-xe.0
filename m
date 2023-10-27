Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046C4C25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB1010E952;
	Fri, 27 Oct 2023 08:00:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B4410E95F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393603; x=1729929603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0rIe/s3w553st5m3k4pOTKrsiWTftJPHMHUUlqyle8=;
 b=kQG3FDnC7Sd1JL+k1eIg+dIprPXmMeJ8rlCS0vTLeibDgIKfpA1q8Kht
 OoYIBUQvUKIVVwsfnb6GE00m/fG1LxyU3zDCVEfaI8NmTm8Y3EUnRU86A
 /jzLKSDF8Y5XXgR03JzxDiXvXjdy4APyiv/SIfjrmVNct0Vyeo/iKWHia
 vcWU4CLay7ej82EtNiiZuobRMjeD/oBqFxQAb7L8HTPevQuGo8hfLXHJ/
 cYEiFHAEhfE/f0TsnNW1Id41O1zmNhUphdIgUswWfeeSgu+z/pnU1wZOY
 qOqBsb8aO2G9Mxtp9RdjwqhOAKUmmsGV5teG/KOMyUBBa0zzXyrZwNOZH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603775"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510284"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510284"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:02 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:03 +0300
Message-Id: <20231027075918.2206862-17-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/31] drm/i915/display: Move disable_power_well
 module parameter under display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231024124109.384973-13-jouni.hogander@intel.com
(cherry picked from commit bfcda58ba1555ac0596d851ae6d748cdebff1af7)
---
 drivers/gpu/drm/i915/display/intel_display_params.c |  4 ++++
 drivers/gpu/drm/i915/display/intel_display_params.h |  1 +
 drivers/gpu/drm/i915/display/intel_display_power.c  | 12 ++++++------
 drivers/gpu/drm/i915/i915_params.c                  |  4 ----
 drivers/gpu/drm/i915/i915_params.h                  |  1 -
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index a98df2afc996..79a212dded80 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -53,6 +53,10 @@ intel_display_param_named_unsafe(enable_dpt, bool, 0400,
 intel_display_param_named_unsafe(enable_sagv, bool, 0400,
 	"Enable system agent voltage/frequency scaling (SAGV) (default: true)");
 
+intel_display_param_named_unsafe(disable_power_well, int, 0400,
+	"Disable display power wells when possible "
+	"(-1=auto [default], 0=power wells always on, 1=power wells disabled when possible)");
+
 intel_display_param_named_unsafe(enable_fbc, int, 0400,
 	"Enable frame buffer compression for power savings "
 	"(default: -1 (use per-chip default))");
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 0a7ac416403a..aadbef664965 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -31,6 +31,7 @@ struct drm_i915_private;
 	param(int, enable_dc, -1, 0400) \
 	param(bool, enable_dpt, true, 0400) \
 	param(bool, enable_sagv, true, 0600) \
+	param(int, disable_power_well, -1, 0400) \
 	param(int, enable_fbc, -1, 0600) \
 	param(int, enable_psr, -1, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 4832eb8da080..e390595d7341 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -967,7 +967,7 @@ static u32 get_allowed_dc_mask(const struct drm_i915_private *dev_priv,
 		DISPLAY_VER(dev_priv) >= 11 ?
 	       DC_STATE_EN_DC9 : 0;
 
-	if (!dev_priv->params.disable_power_well)
+	if (!dev_priv->display.params.disable_power_well)
 		max_dc = 0;
 
 	if (enable_dc >= 0 && enable_dc <= max_dc) {
@@ -1016,9 +1016,9 @@ int intel_power_domains_init(struct drm_i915_private *dev_priv)
 {
 	struct i915_power_domains *power_domains = &dev_priv->display.power.domains;
 
-	dev_priv->params.disable_power_well =
+	dev_priv->display.params.disable_power_well =
 		sanitize_disable_power_well_option(dev_priv,
-						   dev_priv->params.disable_power_well);
+						   dev_priv->display.params.disable_power_well);
 	power_domains->allowed_dc_mask =
 		get_allowed_dc_mask(dev_priv, dev_priv->display.params.enable_dc);
 
@@ -1950,7 +1950,7 @@ void intel_power_domains_init_hw(struct drm_i915_private *i915, bool resume)
 		intel_display_power_get(i915, POWER_DOMAIN_INIT);
 
 	/* Disable power support if the user asked so. */
-	if (!i915->params.disable_power_well) {
+	if (!i915->display.params.disable_power_well) {
 		drm_WARN_ON(&i915->drm, power_domains->disable_wakeref);
 		i915->display.power.domains.disable_wakeref = intel_display_power_get(i915,
 										      POWER_DOMAIN_INIT);
@@ -1977,7 +1977,7 @@ void intel_power_domains_driver_remove(struct drm_i915_private *i915)
 		fetch_and_zero(&i915->display.power.domains.init_wakeref);
 
 	/* Remove the refcount we took to keep power well support disabled. */
-	if (!i915->params.disable_power_well)
+	if (!i915->display.params.disable_power_well)
 		intel_display_power_put(i915, POWER_DOMAIN_INIT,
 					fetch_and_zero(&i915->display.power.domains.disable_wakeref));
 
@@ -2096,7 +2096,7 @@ void intel_power_domains_suspend(struct drm_i915_private *i915, bool s2idle)
 	 * Even if power well support was disabled we still want to disable
 	 * power wells if power domains must be deinitialized for suspend.
 	 */
-	if (!i915->params.disable_power_well)
+	if (!i915->display.params.disable_power_well)
 		intel_display_power_put(i915, POWER_DOMAIN_INIT,
 					fetch_and_zero(&i915->display.power.domains.disable_wakeref));
 
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 51e706f6e57e..eab02f71a4e5 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -86,10 +86,6 @@ i915_param_named_unsafe(force_probe, charp, 0400,
 	"Force probe options for specified supported devices. "
 	"See CONFIG_DRM_I915_FORCE_PROBE for details.");
 
-i915_param_named_unsafe(disable_power_well, int, 0400,
-	"Disable display power wells when possible "
-	"(-1=auto [default], 0=power wells always on, 1=power wells disabled when possible)");
-
 i915_param_named_unsafe(enable_ips, int, 0400, "Enable IPS (default: true)");
 
 i915_param_named_unsafe(load_detect_test, bool, 0400,
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 066f15783580..060464df03c2 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -47,7 +47,6 @@ struct drm_printer;
  */
 #define I915_PARAMS_FOR_EACH(param) \
 	param(int, modeset, -1, 0400) \
-	param(int, disable_power_well, -1, 0400) \
 	param(int, enable_ips, 1, 0600) \
 	param(int, invert_brightness, 0, 0600) \
 	param(int, enable_guc, -1, 0400) \
-- 
2.34.1

