Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF9ED73E8A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3C10E8F3;
	Thu, 29 Jan 2026 20:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPGRKd05";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D33110E8F1;
 Thu, 29 Jan 2026 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769720312; x=1801256312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W6yiwG0dBsvR58/gF1w4iXLv7cOaxByq6SP2SJ+qxoQ=;
 b=HPGRKd055AgJaxeIlmj/aTlM4cLZv0leV6a4VF4h20nsyGMKL7V2eMmD
 DoJq9pGappHASlbI4qzyPrNptLPypETVeAW4ilUH4iqI3Cjrj9hXxhBep
 E+2YWUBq1JGY7tWwHzo8C3i1q8hDnzKbpBA4bk90NRRRx1oYbSYQrWsPh
 WzlavufVcwY0Lstq7VBVtcx5FOYtyJBevmeGddyuSUvwFLg6ZwpGDgi5a
 7Gs+fOpgtx0TkhmwZ98c8FxUq1iQRdX83tmfFOLSHn58ldRk8UIEt0AtD
 8is7G3LzAsu0Cp92LihTJsc2q9HYex5H6f54SmI3JKkfxKySt80SPfteh A==;
X-CSE-ConnectionGUID: DepZWdk0SSK7FqgoUMFoMw==
X-CSE-MsgGUID: /J87YrQhRQ+gJHOes6msNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88545329"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88545329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:58:32 -0800
X-CSE-ConnectionGUID: VoI4haFhQcKU7MU/fXMfpg==
X-CSE-MsgGUID: mPtfsB0WTrujbwJuS4agZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239927157"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 12:58:30 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 10/19] drm/i915: Remove i915_reg.h from g4x_dp.c
Date: Fri, 30 Jan 2026 02:43:49 +0530
Message-ID: <20260129211358.1240283-11-uma.shankar@intel.com>
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

Move DE_IRQ_REGS to display header to make g4x_dp.c
free from i915_reg.h dependency. These registers are
only used by display and gvt.

v2: Move DE interrupt regs from common to display header (Jani)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_dp.c            |  2 +-
 .../gpu/drm/i915/display/intel_display_regs.h    | 16 ++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h                  | 15 ---------------
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index 4cb753177fd8..017c6dd8f9f6 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -8,9 +8,9 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_print.h>
+#include <drm/intel/intel_gmd_interrupt.h>
 
 #include "g4x_dp.h"
-#include "i915_reg.h"
 #include "intel_audio.h"
 #include "intel_backlight.h"
 #include "intel_connector.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 40538910cb09..0164dcbb709f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1049,6 +1049,15 @@
 #define SWF3(dev_priv, i)	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x72414 + (i) * 4)
 #define SWF_ILK(i)	_MMIO(0x4F000 + (i) * 4)
 
+#define DEISR   _MMIO(0x44000)
+#define DEIMR   _MMIO(0x44004)
+#define DEIIR   _MMIO(0x44008)
+#define DEIER   _MMIO(0x4400c)
+
+#define DE_IRQ_REGS		I915_IRQ_REGS(DEIMR, \
+					      DEIER, \
+					      DEIIR)
+
 #define DIGITAL_PORT_HOTPLUG_CNTRL	_MMIO(0x44030)
 #define  DIGITAL_PORTA_HOTPLUG_ENABLE		(1 << 4)
 #define  DIGITAL_PORTA_PULSE_DURATION_2ms	(0 << 2) /* pre-HSW */
@@ -1792,6 +1801,13 @@
 					 SDE_TC_HOTPLUG_ICP(HPD_PORT_TC2) | \
 					 SDE_TC_HOTPLUG_ICP(HPD_PORT_TC1))
 
+/* PCH */
+
+#define SDEISR  _MMIO(0xc4000)
+#define SDEIMR  _MMIO(0xc4004)
+#define SDEIIR  _MMIO(0xc4008)
+#define SDEIER  _MMIO(0xc400c)
+
 #define SDE_IRQ_REGS			I915_IRQ_REGS(SDEIMR, \
 						      SDEIER, \
 						      SDEIIR)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 22b68ddfa7b4..6cb72e6e9086 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -728,15 +728,6 @@
 #define VLV_MASTER_IER			_MMIO(0x4400c) /* Gunit master IER */
 #define   MASTER_INTERRUPT_ENABLE	(1 << 31)
 
-#define DEISR   _MMIO(0x44000)
-#define DEIMR   _MMIO(0x44004)
-#define DEIIR   _MMIO(0x44008)
-#define DEIER   _MMIO(0x4400c)
-
-#define DE_IRQ_REGS		I915_IRQ_REGS(DEIMR, \
-					      DEIER, \
-					      DEIIR)
-
 #define GTISR   _MMIO(0x44010)
 #define GTIMR   _MMIO(0x44014)
 #define GTIIR   _MMIO(0x44018)
@@ -868,12 +859,6 @@
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
 #define   GMD_ID_STEP				REG_GENMASK(5, 0)
 
-/* PCH */
-
-#define SDEISR  _MMIO(0xc4000)
-#define SDEIMR  _MMIO(0xc4004)
-#define SDEIIR  _MMIO(0xc4008)
-#define SDEIER  _MMIO(0xc400c)
 
 /* Icelake PPS_DATA and _ECC DIP Registers.
  * These are available for transcoders B,C and eDP.
-- 
2.50.1

