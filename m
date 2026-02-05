Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E17EC1E85
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CDB10E862;
	Thu,  5 Feb 2026 09:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msASrwGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFFB10E846;
 Thu,  5 Feb 2026 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770283713; x=1801819713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tvdNIXb/SbWWVwqxO8TCBbjQDxLPttp/QBISP5hqa3o=;
 b=msASrwGSBC0n75Lbj2LQZcoTf+M9VBRsZPlc3HaB1JvZ9J8jb0vsmbrg
 B0/+4sy0jYzYFXYLY4byNx62JC+wVvKMDcwLivtrXX+WiCBA1X/LB8Y2W
 qrDdUBq/xn7OvO/kuj2iqh9u45KBkmBUwOZHk2V58rIoqbotN/STb+N7Y
 GaAE1JNwh4JWbm64e4Jxp/hy93TuKp60bEsBxBYbem7KJZtKcQTzExkUO
 M75T7LSZqqFibGlBI29eMXfAChd72uA5wZkiLpYK4wtV8AoxU5h1LFRcl
 WlOPqFTg10QI9fU5LqDAocbSU2U9LhZTv0NRXLAHcEdqGl8utCUaCzhvA g==;
X-CSE-ConnectionGUID: 17kySQFgSUiotBweBFXMJw==
X-CSE-MsgGUID: CxqG4ptaSaeCOxSgZ9hs/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89060147"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89060147"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:28:32 -0800
X-CSE-ConnectionGUID: xT5ZIi4eTNaqn2+iq+/LBw==
X-CSE-MsgGUID: Z1FlITJKTzeRvaWjn2y7Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209807818"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2026 01:28:31 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 19/20] drm/i915: Remove i915_reg.h from intel_modeset_setup.c
Date: Thu,  5 Feb 2026 15:13:40 +0530
Message-ID: <20260205094341.1882816-20-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260205094341.1882816-1-uma.shankar@intel.com>
References: <20260205094341.1882816-1-uma.shankar@intel.com>
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
index d661385a1edd..49e2a9e3ee0e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -407,6 +407,20 @@
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
index 7f3d5b7f7abd..784d99afde64 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -630,20 +630,6 @@
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

