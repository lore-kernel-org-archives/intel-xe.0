Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B4EE0211
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0955C10E1F4;
	Wed, 13 Sep 2023 23:14:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C9D10E1DD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694646891; x=1726182891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ZKx1kETYHmwhK+vx0QT1DdRIWsrFHhXqFL181Vz2vM=;
 b=FZeuI498X3h34Dl1d/uP0mheJODuPrALWfwhoL4pqi5vR0hGcLBOGR9R
 +5D8RDJwy+p0cd8peN0e7OhPx+tNfLF0yx5DKPrFlHg3rj3LwiQQ798TM
 BIQh9CZJb9k/M7eoOfXyOTBxAzPl9Lyj52ANd8qDVonW9xZwG/Jq0za/d
 89msyVRC0irVVkU0mvVz75MwpLWA/Kshu6b27MhV0gu3+2vPkFxTuy6mw
 OIhV0UAI425l6sy/oNiBagfCfG3oJ6+Ei6fdDxByTFdHhmY6S3wQJXYgx
 xEUFtBRP3bQOu3Fii59wRLcfqCVdIyfkgR52T0B0vwE9asGaSli6nb05O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377714990"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377714990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773659706"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773659706"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:14:16 -0700
Message-ID: <20230913231411.291933-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913231411.291933-8-matthew.d.roper@intel.com>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/i915/display: Apply workarounds during
 display init
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rather than applying display workarounds as part of
intel_clock_gating_init() (which in turn is confusingly called from
i915_gem_init during device probe), handle them at the point we're
actually initializing the display hardware.  This will also ensure that
these workarounds are properly applied during display initialization on
the Xe driver, which re-uses i915's display code, but does not call
i915's gem init.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230906234732.3728630-10-matthew.d.roper@intel.com
(cherry picked from commit da1bc5cc3b55af2d785c6dd02c3b461f89f51adf)
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 3 +++
 drivers/gpu/drm/i915/intel_clock_gating.c           | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 8f144d4d3c39..9d9b034b9bdc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -31,6 +31,7 @@
 #include "intel_display_irq.h"
 #include "intel_display_power.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_dkl_phy.h"
 #include "intel_dmc.h"
 #include "intel_dp.h"
@@ -88,6 +89,8 @@ void intel_display_driver_init_hw(struct drm_i915_private *i915)
 	intel_update_cdclk(i915);
 	intel_cdclk_dump_config(i915, &i915->display.cdclk.hw, "Current CDCLK");
 	cdclk_state->logical = cdclk_state->actual = i915->display.cdclk.hw;
+
+	intel_display_wa_apply(i915);
 }
 
 static const struct drm_mode_config_funcs intel_mode_funcs = {
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index abfb6bdbd367..9c21ce69bd98 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -28,7 +28,6 @@
 #include "display/intel_de.h"
 #include "display/intel_display.h"
 #include "display/intel_display_trace.h"
-#include "display/intel_display_wa.h"
 #include "display/skl_watermark.h"
 
 #include "gt/intel_engine_regs.h"
@@ -750,8 +749,6 @@ static void i830_init_clock_gating(struct drm_i915_private *i915)
 void intel_clock_gating_init(struct drm_i915_private *i915)
 {
 	i915->clock_gating_funcs->init_clock_gating(i915);
-
-	intel_display_wa_apply(i915);
 }
 
 static void nop_init_clock_gating(struct drm_i915_private *i915)
-- 
2.41.0

