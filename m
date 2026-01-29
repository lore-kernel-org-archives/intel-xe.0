Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65685D73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2598010E914;
	Thu, 29 Jan 2026 20:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8KuWqWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E81B10E90A;
 Thu, 29 Jan 2026 20:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769720328; x=1801256328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7fGgDF+z+YyMlO6chsQs4UEz9TFHDDtTZBh+an4lkrY=;
 b=i8KuWqWHSxsQPkKSBBxs5sPq+/DEsNT8XxlM4krxRSEwk+/CEZfPDuTp
 LKKX0kDUmXaoMqqv4VX6sAvD1geEF8+DDdcDqM4bgS0BYptQN4DF/l9Au
 sxSW1m4iftJCkKb3nzEGWQydHjEaZmrL1mJxk8jU+JGP6MVjPmsLL1jjY
 jkKCLahGB61OrV8dKpyhaGmPFRf4brQfmkNF9mWKfZPNti6+o60KLghNb
 XFgaZ0kPND0Qh68RlLIwgOb+GWI5lbjubtdPAmJYof7aUdVfddVeDg9VI
 mRldX8ja1C3DOyGR5ZOiCznvHo2oAt0iZKzQ9sBIxxwtznXHIfqAzhFcu g==;
X-CSE-ConnectionGUID: pgPt/6pbQryaIWG3f7kxFg==
X-CSE-MsgGUID: s9GWd8VeRvuQswPLKhnUnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88545350"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88545350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:58:48 -0800
X-CSE-ConnectionGUID: mBUUfWhNQ0mq5VsuN3Vrgw==
X-CSE-MsgGUID: 979rQasqQCic44g9bHZyKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239927276"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 12:58:46 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 18/19] drm/i915: Remove i915_reg.h from intel_modeset_setup.c
Date: Fri, 30 Jan 2026 02:43:57 +0530
Message-ID: <20260129211358.1240283-19-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129211358.1240283-1-uma.shankar@intel.com>
References: <20260129211358.1240283-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move GEN9_CLKGATE_DIS_0 reg to display header to make
intel_modeset_setup.c free from i915_reg.h include.

v2: Remove from gmd common header and use display_regs.h (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h  | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  1 -
 drivers/gpu/drm/i915/i915_reg.h                    | 14 --------------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 758749c5c322..ba1fb4c392e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -417,6 +417,20 @@
 #define   SKL_EDP_PSR_FIX_RDWRAP	REG_BIT(3)
 #define   IGNORE_PSR2_HW_TRACKING	REG_BIT(1)
 
+/*
+ * GEN9 clock gating regs
+ */
+#define GEN9_CLKGATE_DIS_0		_MMIO(0x46530)
+#define   DARBF_GATING_DIS		REG_BIT(27)
+#define   DMG_GATING_DIS		REG_BIT(21)
+#define   MTL_PIPEDMC_GATING_DIS(pipe)	REG_BIT(15 - (pipe))
+#define   PWM2_GATING_DIS		REG_BIT(14)
+#define   PWM1_GATING_DIS		REG_BIT(13)
+
+#define GEN9_CLKGATE_DIS_3		_MMIO(0x46538)
+#define   TGL_VRH_GATING_DIS		REG_BIT(31)
+#define   DPT_GATING_DIS		REG_BIT(22)
+
 #define GEN9_CLKGATE_DIS_4		_MMIO(0x4653C)
 #define   BXT_GMBUS_GATING_DIS		(1 << 14)
 #define   DG2_DPFC_GATING_DIS		REG_BIT(31)
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index d10cbf69a5f8..9b0becee221c 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -11,7 +11,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
-#include "i915_reg.h"
 #include "i9xx_wm.h"
 #include "intel_atomic.h"
 #include "intel_bw.h"
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e4fc61dcd384..c360843a2e35 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -629,20 +629,6 @@
 #define VLV_CLK_CTL2			_MMIO(0x101104)
 #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28
 
-/*
- * GEN9 clock gating regs
- */
-#define GEN9_CLKGATE_DIS_0		_MMIO(0x46530)
-#define   DARBF_GATING_DIS		REG_BIT(27)
-#define   DMG_GATING_DIS		REG_BIT(21)
-#define   MTL_PIPEDMC_GATING_DIS(pipe)	REG_BIT(15 - (pipe))
-#define   PWM2_GATING_DIS		REG_BIT(14)
-#define   PWM1_GATING_DIS		REG_BIT(13)
-
-#define GEN9_CLKGATE_DIS_3		_MMIO(0x46538)
-#define   TGL_VRH_GATING_DIS		REG_BIT(31)
-#define   DPT_GATING_DIS		REG_BIT(22)
-
 #define VLV_DPFLIPSTAT				_MMIO(VLV_DISPLAY_BASE + 0x70028)
 #define   PIPEB_LINE_COMPARE_INT_EN			REG_BIT(29)
 #define   PIPEB_HLINE_INT_EN			REG_BIT(28)
-- 
2.50.1

