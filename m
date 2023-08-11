Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE6C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 09:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9830B10E685;
	Fri, 11 Aug 2023 09:36:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C15D10E685
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691746572; x=1723282572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i/g1JcBBt6Mc/svsCk/TvIKw3Tvo+etVokqvR7B4CPo=;
 b=huO32tMGrqgg+0gym5X37U5m/n5NfObIO92phkpHNpFwoCH0QXLwm6ip
 +k3CkVKAOyZtXhbgM4u17WJQvd3yol8ijWpNhN2IV1MSNRo9e2zyjh0yK
 2OdVIjMcTlE1TFQdbC6CQqJ8dW/b30Xyn+8fKO3Cl+SmUBNnpmwBW41Ws
 fnDEzG2lx7ZbbqJMuDCuvCRCJDYJG7U7c+OL+AhpdFOV5i3Tik/YhebTB
 e3YPLvlnoFxle3QmJrB7IA0mSwFjKTe3Jm5zthXWyskvB43RXz0IGiPC5
 2fLlErMTWRm0pTq79ujpC0R0VJubMalk4GnQFNpoF8Gfg5IkDgPk1Ue8a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="458012758"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="458012758"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906374733"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906374733"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 12:35:51 +0300
Message-Id: <20230811093559.2304457-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
References: <20230811093559.2304457-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/9] drm/i915/irq: add dedicated
 intel_display_irq_init()
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Continue splitting display from the rest.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/45c247c9f5104f3e25bd8913644402a11ec3afaf.1691509966.git.jani.nikula@intel.com
(cherry picked from commit 1486d040df4df9c4bca99e74c09165aa92179dcf)
---
 .../gpu/drm/i915/display/intel_display_driver.c |  2 ++
 .../gpu/drm/i915/display/intel_display_irq.c    | 17 +++++++++++++++++
 .../gpu/drm/i915/display/intel_display_irq.h    |  2 ++
 drivers/gpu/drm/i915/i915_irq.c                 | 17 -----------------
 4 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index b909814ae02b..8f144d4d3c39 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -28,6 +28,7 @@
 #include "intel_crtc.h"
 #include "intel_display_debugfs.h"
 #include "intel_display_driver.h"
+#include "intel_display_irq.h"
 #include "intel_display_power.h"
 #include "intel_display_types.h"
 #include "intel_dkl_phy.h"
@@ -177,6 +178,7 @@ void intel_display_driver_early_probe(struct drm_i915_private *i915)
 	if (!HAS_DISPLAY(i915))
 		return;
 
+	intel_display_irq_init(i915);
 	intel_dkl_phy_init(i915);
 	intel_color_init_hooks(i915);
 	intel_init_cdclk_hooks(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index e6f172cc665a..168f6d4ce208 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1699,3 +1699,20 @@ void gen11_de_irq_postinstall(struct drm_i915_private *dev_priv)
 			   GEN11_DISPLAY_IRQ_ENABLE);
 }
 
+void intel_display_irq_init(struct drm_i915_private *i915)
+{
+	i915->drm.vblank_disable_immediate = true;
+
+	/*
+	 * Most platforms treat the display irq block as an always-on power
+	 * domain. vlv/chv can disable it at runtime and need special care to
+	 * avoid writing any of the display block registers outside of the power
+	 * domain. We defer setting up the display irqs in this case to the
+	 * runtime pm.
+	 */
+	i915->display_irqs_enabled = true;
+	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
+		i915->display_irqs_enabled = false;
+
+	intel_hotplug_irq_init(i915);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index 874893f4f16d..8a2d069d3aac 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -78,4 +78,6 @@ void i965_pipestat_irq_handler(struct drm_i915_private *i915, u32 iir, u32 pipe_
 void valleyview_pipestat_irq_handler(struct drm_i915_private *i915, u32 pipe_stats[I915_MAX_PIPES]);
 void i8xx_pipestat_irq_handler(struct drm_i915_private *i915, u16 iir, u32 pipe_stats[I915_MAX_PIPES]);
 
+void intel_display_irq_init(struct drm_i915_private *i915);
+
 #endif /* __INTEL_DISPLAY_IRQ_H__ */
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 512fc0ef94a4..1723c215dcf6 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -1343,23 +1343,6 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
 	/* pre-gen11 the guc irqs bits are in the upper 16 bits of the pm reg */
 	if (HAS_GT_UC(dev_priv) && GRAPHICS_VER(dev_priv) < 11)
 		to_gt(dev_priv)->pm_guc_events = GUC_INTR_GUC2HOST << 16;
-
-	if (!HAS_DISPLAY(dev_priv))
-		return;
-
-	dev_priv->drm.vblank_disable_immediate = true;
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
 }
 
 /**
-- 
2.39.2

