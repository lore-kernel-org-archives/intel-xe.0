Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C6D73E8A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07D710E8D5;
	Thu, 29 Jan 2026 20:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwFpuyeV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C21810E8C9;
 Thu, 29 Jan 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769720294; x=1801256294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YprW+5gFkgr1Z7vaDwrOsJyzdc8dv0xh5TbTF3+fZZU=;
 b=VwFpuyeVj2rtDi7fEKQ8NKqbTRffFvm8QiJCLppVeqGyTqTPtRYpkFN8
 Dm0UHy9twRDsUc8ML0DksVc9gQRvkS/dsU8JGsT3K/+eL69uEDfnBostt
 eTJTi1Puy3INpqvDDb4FquOCqQ72rIOQfLimJTooedeKxAWddY5NEBAuD
 YeloLisxtCl4+8gjhCDHG3eWkPmpDslv0DXV/wtayPFI3xqVG/Qu11Y5t
 OUJVW8QzOiIfTfxNATx6ajqe8W742lh5aY+DKOBNmbq/frKZF90rBuEPq
 880jU5k5QWqYAK6hhjPRq7rcNoqu4tiiPpDaf2skagxQAImlsG/h0cN6K w==;
X-CSE-ConnectionGUID: 2Q45g2O+RkeaWOHf6XZW5A==
X-CSE-MsgGUID: OmbEhuwaTrawkkopXSWWAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88545300"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88545300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:58:14 -0800
X-CSE-ConnectionGUID: brkAmiEZSY2NfZWNnxIkjA==
X-CSE-MsgGUID: 0u43IHlZQzK2znOJwC2xEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239927113"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 12:58:12 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 01/19] drm/i915: Extract display registers from i915_reg.h to
 display
Date: Fri, 30 Jan 2026 02:43:40 +0530
Message-ID: <20260129211358.1240283-2-uma.shankar@intel.com>
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

There are certain register definitions which are defined in i915_reg.h
which are exclusively needed by display. Move the same to display
headers to remove i915_reg.h includes from display. This is a step
towards making display independent of i915.

intel_clock_gating.c can include display header directly, since its
usage is planned to be re-factored and will be moved within display.

v3: Updated subject and commit message (Jani)

v2: Drop common header in include and use display_regs.h (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_pch_display.c  |  1 -
 drivers/gpu/drm/i915/i915_reg.h                   | 10 ----------
 drivers/gpu/drm/i915/intel_clock_gating.c         |  2 +-
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 9e0d853f4b61..9f8fbfb2e115 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2021,6 +2021,16 @@
 #define  TRANS_BPC_6			REG_FIELD_PREP(TRANS_BPC_MASK, 2)
 #define  TRANS_BPC_12			REG_FIELD_PREP(TRANS_BPC_MASK, 3)
 
+#define _TRANSA_CHICKEN2	0xf0064
+#define _TRANSB_CHICKEN2	0xf1064
+#define TRANS_CHICKEN2(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN2, _TRANSB_CHICKEN2)
+#define   TRANS_CHICKEN2_TIMING_OVERRIDE		REG_BIT(31)
+#define   TRANS_CHICKEN2_FDI_POLARITY_REVERSED		REG_BIT(29)
+#define   TRANS_CHICKEN2_FRAME_START_DELAY_MASK		REG_GENMASK(28, 27)
+#define   TRANS_CHICKEN2_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANS_CHICKEN2_FRAME_START_DELAY_MASK, (x)) /* 0-3 */
+#define   TRANS_CHICKEN2_DISABLE_DEEP_COLOR_COUNTER	REG_BIT(26)
+#define   TRANS_CHICKEN2_DISABLE_DEEP_COLOR_MODESWITCH	REG_BIT(25)
+
 #define PCH_DP_B		_MMIO(0xe4100)
 #define PCH_DP_C		_MMIO(0xe4200)
 #define PCH_DP_D		_MMIO(0xe4300)
diff --git a/drivers/gpu/drm/i915/display/intel_pch_display.c b/drivers/gpu/drm/i915/display/intel_pch_display.c
index 16619f7be5f8..69c7952a1413 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_display.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_display.c
@@ -6,7 +6,6 @@
 #include <drm/drm_print.h>
 
 #include "g4x_dp.h"
-#include "i915_reg.h"
 #include "intel_crt.h"
 #include "intel_crt_regs.h"
 #include "intel_de.h"
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index f928db78a3fa..f65f50bf44ba 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1023,16 +1023,6 @@
 #define   TRANS_CHICKEN1_HDMIUNIT_GC_DISABLE	REG_BIT(10)
 #define   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE	REG_BIT(4)
 
-#define _TRANSA_CHICKEN2	 0xf0064
-#define _TRANSB_CHICKEN2	 0xf1064
-#define TRANS_CHICKEN2(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN2, _TRANSB_CHICKEN2)
-#define   TRANS_CHICKEN2_TIMING_OVERRIDE		REG_BIT(31)
-#define   TRANS_CHICKEN2_FDI_POLARITY_REVERSED		REG_BIT(29)
-#define   TRANS_CHICKEN2_FRAME_START_DELAY_MASK		REG_GENMASK(28, 27)
-#define   TRANS_CHICKEN2_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANS_CHICKEN2_FRAME_START_DELAY_MASK, (x)) /* 0-3 */
-#define   TRANS_CHICKEN2_DISABLE_DEEP_COLOR_COUNTER	REG_BIT(26)
-#define   TRANS_CHICKEN2_DISABLE_DEEP_COLOR_MODESWITCH	REG_BIT(25)
-
 #define SOUTH_CHICKEN1		_MMIO(0xc2000)
 #define  FDIA_PHASE_SYNC_SHIFT_OVR	19
 #define  FDIA_PHASE_SYNC_SHIFT_EN	18
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 7336934bb934..4e18d5a22112 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -30,7 +30,7 @@
 #include "display/i9xx_plane_regs.h"
 #include "display/intel_display.h"
 #include "display/intel_display_core.h"
-
+#include "display/intel_display_regs.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_mcr.h"
-- 
2.50.1

