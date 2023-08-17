Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E1BEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DB110E415;
	Thu, 17 Aug 2023 08:25:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1B010E415
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260707; x=1723796707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZMFAmatki4LxHureMMJSDm27PI/Ey173T+jmrAzKJ4=;
 b=KgOC+PAXg2sBGlzDa6Ikb0eUP6QQb9drsRI8v8F9oBniXTqf0PGAR9ZZ
 3I8+4eo1Mncze96gGqy+rLXberZKJNvUW8eKQhX07jZrGdb3TEuusrW9D
 o9w38L8eFTc5Tb6s4/Lqu1eHAZQDeJbzXlD4FC4QNPO0sJSO2Yb0F1ggd
 z05I9u38cfrMHUbuoVO97FIaVNsSBwKrLF1RAjlwiedRTmt1ElZbCQacW
 vyacs5X6LWwRjKujohDYxwwO8DH3LgtoELBhSrWdD9gKsTO/0nri4KamH
 HjLCFTnRZd5hD8o1bfHATbVvQvdcrO7pXAQHqcAxwuMZo8vVCHXDkNPPh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375514223"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="375514223"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848803654"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="848803654"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:33 +0300
Message-Id: <20230817082437.3116208-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 5/9] fixup! drm/xe/display: Implement display support
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With "drm/i915/irq: add dedicated intel_display_irq_init()" we can ditch
the xe local copy of the same function. It's also called as part of
intel_display_driver_early_probe(), so there's no need to call it from
xe_display_init_nommio(). This changes the init order for xe, as the
call is moved to xe_display_init_noirq() i.e. a bit later. I don't think
it should make a diffence. *fingers crossed*

With "drm/i915/irq: move all PCH irq postinstall calls to display code"
it's no longer necessary to call icp_irq_postinstall() and
gen11_de_irq_postinstall() separately. Drop
gen11_display_irq_postinstall() and call gen11_de_irq_postinstall()
directly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 36 -----------------------
 drivers/gpu/drm/xe/display/ext/i915_irq.h |  4 ---
 drivers/gpu/drm/xe/xe_display.c           |  3 +-
 3 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index df543f1cbfba..216cd6e6e7e3 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -6,10 +6,7 @@
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
-#include "intel_display_irq.h"
-#include "intel_display_types.h"
 #include "intel_hotplug.h"
-#include "intel_hotplug_irq.h"
 #include "intel_uncore.h"
 
 void gen3_irq_reset(struct intel_uncore *uncore, i915_reg_t imr,
@@ -67,39 +64,6 @@ void gen3_irq_init(struct intel_uncore *uncore,
  * and related files, but that will be described in separate chapters.
  */
 
-void gen11_display_irq_postinstall(struct drm_i915_private *dev_priv)
-{
-	if (!HAS_DISPLAY(dev_priv))
-		return;
-
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
-		icp_irq_postinstall(dev_priv);
-
-	gen11_de_irq_postinstall(dev_priv);
-}
-
-void intel_display_irq_init(struct drm_i915_private *dev_priv)
-{
-	struct drm_device *dev = &dev_priv->drm;
-
-	if (!HAS_DISPLAY(dev_priv))
-		return;
-
-	dev->vblank_disable_immediate = true;
-
-	/* Most platforms treat the display irq block as an always-on
-	 * power domain. vlv/chv can disable it at runtime and need
-	 * special care to avoid writing any of the display block registers
-	 * outside of the power domain. We defer setting up the display irqs
-	 * in this case to the runtime pm.
-	 */
-	dev_priv->display_irqs_enabled = true;
-	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
-		dev_priv->display_irqs_enabled = false;
-
-	intel_hotplug_irq_init(dev_priv);
-}
-
 void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
 {
 	intel_hpd_cancel_work(dev_priv);
diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.h b/drivers/gpu/drm/xe/display/ext/i915_irq.h
index 3df524bbbecf..d7931139d4cd 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.h
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.h
@@ -13,8 +13,6 @@
 struct drm_i915_private;
 struct intel_uncore;
 
-void intel_display_irq_init(struct drm_i915_private *dev_priv);
-
 bool intel_irqs_enabled(struct drm_i915_private *dev_priv);
 void intel_synchronize_irq(struct drm_i915_private *i915);
 
@@ -28,8 +26,6 @@ void gen3_irq_init(struct intel_uncore *uncore,
 		   i915_reg_t ier, u32 ier_val,
 		   i915_reg_t iir);
 
-void gen11_display_irq_postinstall(struct drm_i915_private *dev_priv);
-
 #define GEN8_IRQ_RESET_NDX(uncore, type, which) \
 ({ \
 	unsigned int which_ = which; \
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index ec7a654bf587..be4cd6ebbe83 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -155,7 +155,6 @@ int xe_display_init_nommio(struct xe_device *xe)
 
 	/* This must be called before any calls to HAS_PCH_* */
 	intel_detect_pch(xe);
-	intel_display_irq_init(xe);
 
 	err = intel_power_domains_init(xe);
 	if (err)
@@ -313,7 +312,7 @@ void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 		return;
 
 	if (gt->info.id == XE_GT0)
-		gen11_display_irq_postinstall(xe);
+		gen11_de_irq_postinstall(xe);
 }
 
 static void intel_suspend_encoders(struct xe_device *xe)
-- 
2.39.2

