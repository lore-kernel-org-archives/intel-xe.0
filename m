Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398EBC25B6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 07:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AC010E952;
	Fri, 27 Oct 2023 07:59:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E3710E951
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 07:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393579; x=1729929579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJoVixJbt7daJIddReSAhDj95mPjSQLE0BKKm3Jp/5U=;
 b=GDc0HcOMwPsI3EKBb7QLuilGCiWpFd4p+jGiLIDWg0AOLQ3Tm1B7dZnA
 6Tif+Kw3o2rgnLgK/z8Z3nk7EkSzWh+m0EK0f4hSP12aVQGzBxg9H+fZ7
 NDl8owfgYCxVzH6pSAd4zCQiF7VTT+NOgoFmIqsOIqejMyXUanFO46kVJ
 CTrhifxSJkoRSGswBCswpUOsH8lRIdsW+zNivaWhg7TKPZkvvZMqgVj50
 1BJYeuJOw+Vnm3WBOIaVMT3g29+aZCFoZL/fl248T4bltGuK6ZhUnVfla
 IM0wavHeWdqDpafFbOvxbA3Tik4ytSjIQc5trfoURwo0PF7u+9giJoqlH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603714"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510110"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510110"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:37 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:58:50 +0300
Message-Id: <20231027075918.2206862-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/31] drm/i915: separate display runtime info
 init
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

Move display related functionality from intel_device_info_runtime_init()
to intel_display_device_info_runtime_init() and call the latter from the
top level.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/a2226a47a4450e75d867c2ac48665b387af0e42d.1696336887.git.jani.nikula@intel.com
(cherry picked from commit b8eed6a4aee4f85ed0465b233b63e2b233a420b9)
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/i915/display/intel_display_device.c   | 19 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_driver.c            |  1 +
 drivers/gpu/drm/i915/intel_device_info.c      | 17 -----------------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index dea64c99721e..11f4a6c54cc7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -939,7 +939,7 @@ void intel_display_device_probe(struct drm_i915_private *i915)
 	}
 }
 
-void intel_display_device_info_runtime_init(struct drm_i915_private *i915)
+static void __intel_display_device_info_runtime_init(struct drm_i915_private *i915)
 {
 	struct intel_display_runtime_info *display_runtime = DISPLAY_RUNTIME_INFO(i915);
 	enum pipe pipe;
@@ -1071,6 +1071,23 @@ void intel_display_device_info_runtime_init(struct drm_i915_private *i915)
 	memset(display_runtime, 0, sizeof(*display_runtime));
 }
 
+void intel_display_device_info_runtime_init(struct drm_i915_private *i915)
+{
+	if (HAS_DISPLAY(i915))
+		__intel_display_device_info_runtime_init(i915);
+
+	/* Display may have been disabled by runtime init */
+	if (!HAS_DISPLAY(i915)) {
+		i915->drm.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
+		i915->display.info.__device_info = &no_display;
+	}
+
+	/* Disable nuclear pageflip by default on pre-g4x */
+	if (!i915->params.nuclear_pageflip &&
+	    DISPLAY_VER(i915) < 5 && !IS_G4X(i915))
+		i915->drm.driver_features &= ~DRIVER_ATOMIC;
+}
+
 void intel_display_device_info_print(const struct intel_display_device_info *info,
 				     const struct intel_display_runtime_info *runtime,
 				     struct drm_printer *p)
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 78501a83ba10..ccbb2834cde0 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -338,6 +338,7 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 	/* Try to make sure MCHBAR is enabled before poking at it */
 	intel_gmch_bar_setup(dev_priv);
 	intel_device_info_runtime_init(dev_priv);
+	intel_display_device_info_runtime_init(dev_priv);
 
 	for_each_gt(gt, dev_priv, i) {
 		ret = intel_gt_init_mmio(gt);
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index d2ed0f057cb2..db3997cec6ff 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -350,8 +350,6 @@ void intel_device_info_runtime_init_early(struct drm_i915_private *i915)
 	intel_device_info_subplatform_init(i915);
 }
 
-static const struct intel_display_device_info no_display = {};
-
 /**
  * intel_device_info_runtime_init - initialize runtime info
  * @dev_priv: the i915 device
@@ -372,21 +370,6 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 {
 	struct intel_runtime_info *runtime = RUNTIME_INFO(dev_priv);
 
-	if (HAS_DISPLAY(dev_priv))
-		intel_display_device_info_runtime_init(dev_priv);
-
-	/* Display may have been disabled by runtime init */
-	if (!HAS_DISPLAY(dev_priv)) {
-		dev_priv->drm.driver_features &= ~(DRIVER_MODESET |
-						   DRIVER_ATOMIC);
-		dev_priv->display.info.__device_info = &no_display;
-	}
-
-	/* Disable nuclear pageflip by default on pre-g4x */
-	if (!dev_priv->params.nuclear_pageflip &&
-	    DISPLAY_VER(dev_priv) < 5 && !IS_G4X(dev_priv))
-		dev_priv->drm.driver_features &= ~DRIVER_ATOMIC;
-
 	BUILD_BUG_ON(BITS_PER_TYPE(intel_engine_mask_t) < I915_NUM_ENGINES);
 
 	if (GRAPHICS_VER(dev_priv) == 6 && i915_vtd_active(dev_priv)) {
-- 
2.34.1

