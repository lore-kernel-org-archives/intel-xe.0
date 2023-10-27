Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBD6C25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 07:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB2E10E953;
	Fri, 27 Oct 2023 07:59:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8E310E951
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393578; x=1729929578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iK1NeXlL4t+i5YMya+oS7Sk5ZP49uwZ8mUgcpptfM/w=;
 b=LGWyMaKKIsavKjHCpBANKeyT2sDcVj5RfIxBiR5ZcvFb8HBmeb+8Qngd
 ffUwSdsDwrNfOseUIC2AaAN58TDpBBdi4tMQSVwzWIZFekk9SXaDie375
 t1qqRm48GEqKDaxSCVZ6fAnm6j3tz7UGGyDxX+7xVkk50gtq/prg2j8kr
 jLIL5sHMjOUTH2ejHtIRRdAfh+vuMgNTdHyMzWCpzc1RfxjR1OwvNK1lT
 qMihvSXPwXt4Cptwlvnc8QcViTOSV4yKY1LYF924ByFHESMwCR5QlmCWB
 kDc+gWI25flBCrbCGa0Yv8jtFyFzzC0WXP9HJVpi3sZ6xe0F+tFesW9ne w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603712"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510089"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510089"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:35 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:58:49 +0300
Message-Id: <20231027075918.2206862-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/31] drm/i915: convert INTEL_DISPLAY_ENABLED()
 into a function
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

There's no need for this to be a macro. Add some documentation too.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/480b9b697b2ffa0c8677115bd443ba633801c6c1.1696336887.git.jani.nikula@intel.com
(cherry picked from commit fe63ea7c3dbb68a4a8f43a175c76e435b6ffb4ca)
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c        |  2 +-
 .../gpu/drm/i915/display/intel_display_device.c | 17 +++++++++++++++++
 .../gpu/drm/i915/display/intel_display_device.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_tv.c         |  2 +-
 drivers/gpu/drm/i915/i915_drv.h                 |  6 ------
 12 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index d4bad0ddff41..913e5d230a4d 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -838,7 +838,7 @@ intel_crt_detect(struct drm_connector *connector,
 		    connector->base.id, connector->name,
 		    force);
 
-	if (!INTEL_DISPLAY_ENABLED(dev_priv))
+	if (!intel_display_device_enabled(dev_priv))
 		return connector_status_disconnected;
 
 	if (dev_priv->params.load_detect_test) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index ce55b968e658..dea64c99721e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1091,3 +1091,20 @@ void intel_display_device_info_print(const struct intel_display_device_info *inf
 	drm_printf(p, "has_dmc: %s\n", str_yes_no(runtime->has_dmc));
 	drm_printf(p, "has_dsc: %s\n", str_yes_no(runtime->has_dsc));
 }
+
+/*
+ * Assuming the device has display hardware, should it be enabled?
+ *
+ * It's an error to call this function if the device does not have display
+ * hardware.
+ *
+ * Disabling display means taking over the display hardware, putting it to
+ * sleep, and preventing connectors from being connected via any means.
+ */
+bool intel_display_device_enabled(struct drm_i915_private *i915)
+{
+	/* Only valid when HAS_DISPLAY() is true */
+	drm_WARN_ON(&i915->drm, !HAS_DISPLAY(i915));
+
+	return !i915->params.disable_display && !intel_opregion_headless_sku(i915);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 44733c9d5812..8977bac8cb7f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -150,6 +150,7 @@ struct intel_display_device_info {
 	} color;
 };
 
+bool intel_display_device_enabled(struct drm_i915_private *i915);
 void intel_display_device_probe(struct drm_i915_private *i915);
 void intel_display_device_info_runtime_init(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 11420595c4f9..f0f43aeabd21 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5358,7 +5358,7 @@ intel_dp_detect(struct drm_connector *connector,
 	drm_WARN_ON(&dev_priv->drm,
 		    !drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
-	if (!INTEL_DISPLAY_ENABLED(dev_priv))
+	if (!intel_display_device_enabled(dev_priv))
 		return connector_status_disconnected;
 
 	/* Can't disconnect eDP */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 648cf37e02a8..a21cc9d0689e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1062,7 +1062,7 @@ intel_dp_mst_detect(struct drm_connector *connector,
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 	struct intel_dp *intel_dp = intel_connector->mst_port;
 
-	if (!INTEL_DISPLAY_ENABLED(i915))
+	if (!intel_display_device_enabled(i915))
 		return connector_status_disconnected;
 
 	if (drm_connector_is_unregistered(connector))
diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index d9f427856fb8..55d6743374bd 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -319,7 +319,7 @@ intel_dvo_detect(struct drm_connector *_connector, bool force)
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s]\n",
 		    connector->base.base.id, connector->base.name);
 
-	if (!INTEL_DISPLAY_ENABLED(i915))
+	if (!intel_display_device_enabled(i915))
 		return connector_status_disconnected;
 
 	return intel_dvo->dev.dev_ops->detect(&intel_dvo->dev);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index af4102e91769..ac315f8e7820 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2496,7 +2496,7 @@ intel_hdmi_detect(struct drm_connector *connector, bool force)
 	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
 		    connector->base.id, connector->name);
 
-	if (!INTEL_DISPLAY_ENABLED(dev_priv))
+	if (!intel_display_device_enabled(dev_priv))
 		return connector_status_disconnected;
 
 	wakeref = intel_display_power_get(dev_priv, POWER_DOMAIN_GMBUS);
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index e8562f6f8bb4..0c0700c6ec66 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -763,7 +763,7 @@ static void i915_hpd_poll_init_work(struct work_struct *work)
 void intel_hpd_poll_enable(struct drm_i915_private *dev_priv)
 {
 	if (!HAS_DISPLAY(dev_priv) ||
-	    !INTEL_DISPLAY_ENABLED(dev_priv))
+	    !intel_display_device_enabled(dev_priv))
 		return;
 
 	WRITE_ONCE(dev_priv->display.hotplug.poll_enabled, true);
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 086cb8dbe22c..483beedac5b8 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -680,7 +680,7 @@ intel_panel_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_i915_private *i915 = to_i915(connector->dev);
 
-	if (!INTEL_DISPLAY_ENABLED(i915))
+	if (!intel_display_device_enabled(i915))
 		return connector_status_disconnected;
 
 	return connector_status_connected;
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 950ba0431f5f..35137e978591 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2121,7 +2121,7 @@ intel_sdvo_detect(struct drm_connector *connector, bool force)
 	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
 		      connector->base.id, connector->name);
 
-	if (!INTEL_DISPLAY_ENABLED(i915))
+	if (!intel_display_device_enabled(i915))
 		return connector_status_disconnected;
 
 	if (!intel_sdvo_set_target_output(intel_sdvo,
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 36b479b46b60..31a79fdfc812 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1720,7 +1720,7 @@ intel_tv_detect(struct drm_connector *connector,
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s] force=%d\n",
 		    connector->base.id, connector->name, force);
 
-	if (!INTEL_DISPLAY_ENABLED(i915))
+	if (!intel_display_device_enabled(i915))
 		return connector_status_disconnected;
 
 	if (force) {
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 511eba3bbdba..557b17d1e7a6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -790,12 +790,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define NUM_L3_SLICES(i915) (IS_HASWELL_GT3(i915) ? \
 				 2 : HAS_L3_DPF(i915))
 
-/* Only valid when HAS_DISPLAY() is true */
-#define INTEL_DISPLAY_ENABLED(i915) \
-	(drm_WARN_ON(&(i915)->drm, !HAS_DISPLAY(i915)),		\
-	 !(i915)->params.disable_display &&				\
-	 !intel_opregion_headless_sku(i915))
-
 #define HAS_GUC_DEPRIVILEGE(i915) \
 	(INTEL_INFO(i915)->has_guc_deprivilege)
 
-- 
2.34.1

