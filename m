Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92234EC1E83
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A3F10E841;
	Thu,  5 Feb 2026 09:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXwWLUQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BE110E836;
 Thu,  5 Feb 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770283697; x=1801819697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HeXAoHLmn/Fo/NAp0NVeQmJ1Xb2lI/7DLnjjdDMWPlU=;
 b=AXwWLUQzc8MUs0sTXLAZ5Yltm46O1KTSLbYq48kHDCWx1qUHX0CjTstc
 eaB1xQoAhJNmRmcyr5LYH/7mTAGwkFvLCQxppI3iXkFRVrE6RAU1SalKf
 iFgj31KaB/kWS5Y7q1vGJHW3/o7oHIBopeW2pCMDizdW1oPc6EWW2N12h
 ZI/WskWCDPsNLbzGWBAul3i2JkK8aJHdRDAH5OrclSX+6BCV3NGHI2Tuz
 6pNdmOY+GUqeJfCpZEEu9Pg8E8BHEz7WNR52Zs5WZGgdU3fx+k4naaXye
 EE85uLHYs6j50gEFaosmAYCM+jTUYUKfNNxkUZSlIFT5wTm3DsGyjsNr2 g==;
X-CSE-ConnectionGUID: UDe1QKnZTuaGGslaIrlaCA==
X-CSE-MsgGUID: q5CQsMXvRrOQlHylGs+uOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89060121"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89060121"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:28:17 -0800
X-CSE-ConnectionGUID: TsLoOpfaTu6TnRf6MtnRAg==
X-CSE-MsgGUID: JxfbK8EISKKJ79yKSrkPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209807789"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2026 01:28:15 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 11/20] drm/i915: Remove i915_reg.h from g4x_dp.c
Date: Thu,  5 Feb 2026 15:13:32 +0530
Message-ID: <20260205094341.1882816-12-uma.shankar@intel.com>
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

Move DE_IRQ_REGS to display header to make g4x_dp.c
free from i915_reg.h dependency. These registers are
only used by display and gvt.

v3: Drop a superfluous include (Jani)

v2: Move DE interrupt regs from common to display header (Jani)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_dp.c            |  1 -
 .../gpu/drm/i915/display/intel_display_regs.h    | 16 ++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h                  | 15 ---------------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index 4cb753177fd8..d7de329abf19 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -10,7 +10,6 @@
 #include <drm/drm_print.h>
 
 #include "g4x_dp.h"
-#include "i915_reg.h"
 #include "intel_audio.h"
 #include "intel_backlight.h"
 #include "intel_connector.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index d03f554ecd7e..5bc891f6de57 100644
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
index 1be8426b6a91..b808d1ec5387 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -727,15 +727,6 @@
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
@@ -863,12 +854,6 @@
 #define   MASK_WAKEMEM				REG_BIT(13)
 #define   DDI_CLOCK_REG_ACCESS			REG_BIT(7)
 
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

