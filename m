Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBB5EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D6D10E413;
	Thu, 17 Aug 2023 08:24:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746FA10E413
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260691; x=1723796691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a5w2M+MLt2nNiOkr7LTVqRJssjD0OqHc3erex+OE0jU=;
 b=cDxdmeDALMHFLvImd4ryqgjJW75cFn2tr1CP/eJWCKjpxE8oHTZuQaKC
 065lE5t7hLILKh8NWXcLnhgFs6cMBrIVYgP7xQkplSw4Uvh8KB0WrneNJ
 DKPEcrOcH0hpzoTwLy33Ndq2qBSLpEV7O998coLULpDkzD/6/4IetZNym
 KUEUPN8LBgS/XoCi3ZKxkPRtTeEqPkWehiNVJYqLBvxHN6BaoUR+9Xzra
 qVwGoiltAJXcxhOPVdNGZNEijZ0Wgr/d56Zn78bJNGPSQb8B/042dbd0z
 gwjz8f2MFmaFsrHGSkFZcjzj6E9e+LtddaQpx/KScJqDtN9JEQWZppEA4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459104282"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="459104282"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799944150"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="799944150"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:29 +0300
Message-Id: <20230817082437.3116208-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 1/9] drm/i915/irq: add dedicated
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Continue splitting display from the rest.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/45c247c9f5104f3e25bd8913644402a11ec3afaf.1691509966.git.jani.nikula@intel.com
(cherry picked from commit 1486d040df4df9c4bca99e74c09165aa92179dcf)
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
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

