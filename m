Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ADDEA7955
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4610E822;
	Thu,  5 Feb 2026 09:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBOGsi0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D0B10E81D;
 Thu,  5 Feb 2026 09:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770283684; x=1801819684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I6EfClniufACwlPSxOuxt589Mh42iymmsiL9ErvRbD4=;
 b=nBOGsi0mKeVENNT/e8Bfm9dV6avPBu12pbko7aKFGlgTxqPG26poS75j
 x+8ZqGPOKcG31RDZqiCR8MsCp9UPm/YaNkU9rgN9MqYkXYg/KyOXVAVCa
 o96h683WtT+HuypNfLfwpkkUOAQL5eGV0jaQyNpY7kE9RfrcHvRfg6CGG
 HOM74AvEkxuYOcHI+esHnoDu42GgtaY7vQiLjNtIiRt2GGilz2znOsIdh
 oZa2Z5ebGYu+cta+F3mlpxveI8CC9rS87YTpQniSAuFTtZjfBi3GvPMDp
 49p4vlRQCvUjYLjI7ycvhclfahXw5n9WhvNPG3Lkb8BK/1+DL+8C5g/WY w==;
X-CSE-ConnectionGUID: 2kKSIVaTRiSOfnVYeuW+mw==
X-CSE-MsgGUID: 0VJ+4evMSA+BGOxtkLMHCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89060096"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89060096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:28:03 -0800
X-CSE-ConnectionGUID: oFW6zxyTScKinBqxAJcSpw==
X-CSE-MsgGUID: V1HJWO9lSN2lE1CgGQSVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209807688"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2026 01:27:57 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 02/20] drm/i915: Extract South chicken registers from i915_reg.h
 to display
Date: Thu,  5 Feb 2026 15:13:23 +0530
Message-ID: <20260205094341.1882816-3-uma.shankar@intel.com>
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

Extract South Chicken registers from i915_reg.h to display header.
This allows intel_pch_refclk.c not to include i915_reg.h

v3: Drop whitespace changes, commit header updated (Jani)

v2: Drop common header in include and use display_regs.h (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 .../gpu/drm/i915/display/intel_display_regs.h | 27 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_pch_refclk.c   |  1 -
 drivers/gpu/drm/i915/i915_reg.h               | 27 -------------------
 3 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index a9bbd20c27ec..cf02e567cf99 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2871,6 +2871,33 @@ enum skl_power_gate {
 #define  SFUSE_STRAP_DDIC_DETECTED	(1 << 1)
 #define  SFUSE_STRAP_DDID_DETECTED	(1 << 0)
 
+#define SOUTH_CHICKEN1		_MMIO(0xc2000)
+#define  FDIA_PHASE_SYNC_SHIFT_OVR	19
+#define  FDIA_PHASE_SYNC_SHIFT_EN	18
+#define  INVERT_DDIE_HPD			REG_BIT(28)
+#define  INVERT_DDID_HPD_MTP			REG_BIT(27)
+#define  INVERT_TC4_HPD				REG_BIT(26)
+#define  INVERT_TC3_HPD				REG_BIT(25)
+#define  INVERT_TC2_HPD				REG_BIT(24)
+#define  INVERT_TC1_HPD				REG_BIT(23)
+#define  INVERT_DDID_HPD			(1 << 18)
+#define  INVERT_DDIC_HPD			(1 << 17)
+#define  INVERT_DDIB_HPD			(1 << 16)
+#define  INVERT_DDIA_HPD			(1 << 15)
+#define  FDI_PHASE_SYNC_OVR(pipe) (1 << (FDIA_PHASE_SYNC_SHIFT_OVR - ((pipe) * 2)))
+#define  FDI_PHASE_SYNC_EN(pipe) (1 << (FDIA_PHASE_SYNC_SHIFT_EN - ((pipe) * 2)))
+#define  FDI_BC_BIFURCATION_SELECT	(1 << 12)
+#define  CHASSIS_CLK_REQ_DURATION_MASK	(0xf << 8)
+#define  CHASSIS_CLK_REQ_DURATION(x)	((x) << 8)
+#define  SBCLK_RUN_REFCLK_DIS		(1 << 7)
+#define  ICP_SECOND_PPS_IO_SELECT	REG_BIT(2)
+#define  SPT_PWM_GRANULARITY		(1 << 0)
+#define SOUTH_CHICKEN2		_MMIO(0xc2004)
+#define  FDI_MPHY_IOSFSB_RESET_STATUS	(1 << 13)
+#define  FDI_MPHY_IOSFSB_RESET_CTL	(1 << 12)
+#define  LPT_PWM_GRANULARITY		(1 << 5)
+#define  DPLS_EDP_PPS_FIX_DIS		(1 << 0)
+
 /* Gen4+ Timestamp and Pipe Frame time stamp registers */
 #define GEN4_TIMESTAMP		_MMIO(0x2358)
 #define ILK_TIMESTAMP_HI	_MMIO(0x70070)
diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.c b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
index 9a89bb6dcf65..5f88663ef5e8 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
@@ -5,7 +5,6 @@
 
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index f65f50bf44ba..c2efa50f080d 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1023,33 +1023,6 @@
 #define   TRANS_CHICKEN1_HDMIUNIT_GC_DISABLE	REG_BIT(10)
 #define   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE	REG_BIT(4)
 
-#define SOUTH_CHICKEN1		_MMIO(0xc2000)
-#define  FDIA_PHASE_SYNC_SHIFT_OVR	19
-#define  FDIA_PHASE_SYNC_SHIFT_EN	18
-#define  INVERT_DDIE_HPD			REG_BIT(28)
-#define  INVERT_DDID_HPD_MTP			REG_BIT(27)
-#define  INVERT_TC4_HPD				REG_BIT(26)
-#define  INVERT_TC3_HPD				REG_BIT(25)
-#define  INVERT_TC2_HPD				REG_BIT(24)
-#define  INVERT_TC1_HPD				REG_BIT(23)
-#define  INVERT_DDID_HPD			(1 << 18)
-#define  INVERT_DDIC_HPD			(1 << 17)
-#define  INVERT_DDIB_HPD			(1 << 16)
-#define  INVERT_DDIA_HPD			(1 << 15)
-#define  FDI_PHASE_SYNC_OVR(pipe) (1 << (FDIA_PHASE_SYNC_SHIFT_OVR - ((pipe) * 2)))
-#define  FDI_PHASE_SYNC_EN(pipe) (1 << (FDIA_PHASE_SYNC_SHIFT_EN - ((pipe) * 2)))
-#define  FDI_BC_BIFURCATION_SELECT	(1 << 12)
-#define  CHASSIS_CLK_REQ_DURATION_MASK	(0xf << 8)
-#define  CHASSIS_CLK_REQ_DURATION(x)	((x) << 8)
-#define  SBCLK_RUN_REFCLK_DIS		(1 << 7)
-#define  ICP_SECOND_PPS_IO_SELECT	REG_BIT(2)
-#define  SPT_PWM_GRANULARITY		(1 << 0)
-#define SOUTH_CHICKEN2		_MMIO(0xc2004)
-#define  FDI_MPHY_IOSFSB_RESET_STATUS	(1 << 13)
-#define  FDI_MPHY_IOSFSB_RESET_CTL	(1 << 12)
-#define  LPT_PWM_GRANULARITY		(1 << 5)
-#define  DPLS_EDP_PPS_FIX_DIS		(1 << 0)
-
 #define SOUTH_DSPCLK_GATE_D	_MMIO(0xc2020)
 #define  PCH_GMBUSUNIT_CLOCK_GATE_DISABLE (1 << 31)
 #define  PCH_DPLUNIT_CLOCK_GATE_DISABLE (1 << 30)
-- 
2.50.1

