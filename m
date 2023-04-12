Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1802C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839D510E823;
	Wed, 12 Apr 2023 14:21:12 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEE610E838
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309270; x=1712845270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O4UyHA3S9xjnAi1DWzeUZdTGxBX4lS3+uSFPehw2hSo=;
 b=RIwucyFFv1U+2l0US9W0qaG0e5xz0YM2TMhqFaprugLCEOFI75svJOLv
 HoWv5N3MZhRnJDml5Vs5nwydrsgWFuDlueoIC2axK7yqCoGdYXUmWBCpf
 AyjetTqGapCMmxtX///0NIe2OH74SCQyONCus1xWEkjJhIG/jLjd9zZ4d
 zCqHKimpMTXpzbO1e4zwqEC5/bmvN3srUfwTmqJPeaN2CVhMpH22XcG/U
 tJPWQfpdZ8+rRSD56+FDeEVZvjBIZGsqxvYUaLcIYGXSFFBv8Oj7Xd498
 FZ4WxpXXdCah9FKoQ77Kr7MQlX6P+KNHURymPFAFQjMNuoVK2NFl7Fy30 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343915286"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343915286"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688955661"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688955661"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:34 +0300
Message-Id: <20230412142006.877109-10-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c              | 3 ---
 drivers/gpu/drm/i915/display/intel_display.c            | 2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c      | 6 ------
 drivers/gpu/drm/i915/display/intel_display_power_well.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_dpll.c               | 3 ---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c            | 2 +-
 6 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 5ab20ca7c000..f451b8b1d1a6 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -36,10 +36,7 @@
 #include "intel_mchbar_regs.h"
 #include "intel_pci_config.h"
 #include "intel_psr.h"
-
-#ifdef I915
 #include "vlv_sideband.h"
-#endif
 
 /**
  * DOC: CDCLK / RAWCLK
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b577e58aec97..859db9ead755 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -58,7 +58,6 @@
 #include "vlv_dsi.h"
 #include "vlv_dsi_pll.h"
 #include "vlv_dsi_regs.h"
-#include "vlv_sideband.h"
 #endif
 
 #include "g4x_dp.h"
@@ -129,6 +128,7 @@
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
+#include "vlv_sideband.h"
 
 static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state);
 static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2fb8ce54bf3b..96108d121995 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -20,13 +20,7 @@
 #include "intel_pch_refclk.h"
 #include "intel_snps_phy.h"
 #include "skl_watermark.h"
-
-#ifdef I915
 #include "vlv_sideband.h"
-#else
-#define PUNIT_REG_ISPSSPM0 0
-#define PUNIT_REG_VEDSSPM0 0
-#endif
 
 #define for_each_power_domain_well(__dev_priv, __power_well, __domain)	\
 	for_each_power_well(__dev_priv, __power_well)				\
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 220b203e4abe..7cd52e545ae1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -21,11 +21,11 @@
 #include "intel_tc.h"
 #include "intel_vga.h"
 #include "skl_watermark.h"
+#include "vlv_sideband.h"
+#include "vlv_sideband_reg.h"
 
 #ifdef I915
 #include "intel_crt.h"
-#include "vlv_sideband.h"
-#include "vlv_sideband_reg.h"
 #endif
 
 struct i915_power_well_regs {
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 1c0663b3a168..6431505b7a1e 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -17,10 +17,7 @@
 #include "intel_panel.h"
 #include "intel_pps.h"
 #include "intel_snps_phy.h"
-
-#ifdef I915
 #include "vlv_sideband.h"
-#endif
 
 struct intel_dpll_funcs {
 	int (*crtc_compute_clock)(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index b45552d96c0c..c99d17728dbd 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -49,8 +49,8 @@
 #ifdef I915
 #include "vlv_dsi.h"
 #include "vlv_dsi_regs.h"
-#include "vlv_sideband.h"
 #endif
+#include "vlv_sideband.h"
 
 #define MIPI_TRANSFER_MODE_SHIFT	0
 #define MIPI_VIRTUAL_CHANNEL_SHIFT	1
-- 
2.39.2

