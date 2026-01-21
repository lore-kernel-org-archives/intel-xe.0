Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396B2D4695A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB3110E8C0;
	Wed, 21 Jan 2026 23:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM6My9I7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C215910E8B8;
 Wed, 21 Jan 2026 23:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769036932; x=1800572932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZTG4kgT/f47Rc/atUO9Kj1YdgdOGRVnHK2j5eV9NdUI=;
 b=FM6My9I7giEAqm38R/g5CGxRceTyrxr/r8Cl5uXvFd2UJWTvV0q84X6y
 Ts1GdC/lByDd16yRvRrBBfZPlt0vakFirN+TtmR+AKzRTeQyVXGowNjlN
 TvzsLpF+usKFkBfKe9MeL9HF6VUAr8yCpxLHBSwwEkiFEskyi3LdcFMiy
 lJWJy3+2qC4WWewbOvuLsUocipiolyywCBpDNv8Yzs3A9LLLMScPiXf0L
 B+MZ/foMOFhTTKbPycIXhqY0Orn0gZ28BQjMUnRwE6ghQzFJeP/bp7yFB
 hNybsaKPfAKsfD6ROpwiaTt9V/ppXB0MIxoWS5kLDhVVbFLzBxBxQ5W0E A==;
X-CSE-ConnectionGUID: Zs+JSbm/QD+sSTWnce076g==
X-CSE-MsgGUID: K+YLq1amSQKrfwiiFsA+Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70244995"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70244995"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 15:08:51 -0800
X-CSE-ConnectionGUID: YeEinkaASxGLMpa5dR3PXQ==
X-CSE-MsgGUID: fbpv+fRNQruhMfTK+l7JNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="206889615"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jan 2026 15:08:50 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 12/19] drm/{i915, xe}: Remove i915_reg.h from g4x_hdmi.c
Date: Thu, 22 Jan 2026 04:54:07 +0530
Message-ID: <20260121232414.707192-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260121232414.707192-1-uma.shankar@intel.com>
References: <20260121232414.707192-1-uma.shankar@intel.com>
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

Move TRANS_CHICKEN1 reg to display header to make g4x_hdmi.c
free from i915_reg.h dependency.

v2: Remove from common header in include and use display_regs.h (Jani)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_hdmi.c           |  1 -
 drivers/gpu/drm/i915/display/intel_display_regs.h | 12 ++++++++++++
 drivers/gpu/drm/i915/i915_reg.h                   | 12 ------------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.c b/drivers/gpu/drm/i915/display/g4x_hdmi.c
index 8b22447e8e23..5fe5067c4237 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.c
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.c
@@ -8,7 +8,6 @@
 #include <drm/drm_print.h>
 
 #include "g4x_hdmi.h"
-#include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_audio.h"
 #include "intel_connector.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 477896faa79e..2c7cd9002da3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2122,6 +2122,18 @@
 #define  TRANS_BPC_6			REG_FIELD_PREP(TRANS_BPC_MASK, 2)
 #define  TRANS_BPC_12			REG_FIELD_PREP(TRANS_BPC_MASK, 3)
 
+/* Icelake PPS_DATA and _ECC DIP Registers.
+ * These are available for transcoders B,C and eDP.
+ * Adding the _A so as to reuse the _MMIO_TRANS2
+ * definition, with which it offsets to the right location.
+ */
+
+#define _TRANSA_CHICKEN1	 0xf0060
+#define _TRANSB_CHICKEN1	 0xf1060
+#define TRANS_CHICKEN1(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN1, _TRANSB_CHICKEN1)
+#define   TRANS_CHICKEN1_HDMIUNIT_GC_DISABLE	REG_BIT(10)
+#define   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE	REG_BIT(4)
+
 #define _TRANSA_CHICKEN2	0xf0064
 #define _TRANSB_CHICKEN2	0xf1064
 #define TRANS_CHICKEN2(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN2, _TRANSB_CHICKEN2)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index bd3871f458d6..5d640f7cfc23 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -836,18 +836,6 @@
 #define   MASK_WAKEMEM				REG_BIT(13)
 #define   DDI_CLOCK_REG_ACCESS			REG_BIT(7)
 
-/* Icelake PPS_DATA and _ECC DIP Registers.
- * These are available for transcoders B,C and eDP.
- * Adding the _A so as to reuse the _MMIO_TRANS2
- * definition, with which it offsets to the right location.
- */
-
-#define _TRANSA_CHICKEN1	 0xf0060
-#define _TRANSB_CHICKEN1	 0xf1060
-#define TRANS_CHICKEN1(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN1, _TRANSB_CHICKEN1)
-#define   TRANS_CHICKEN1_HDMIUNIT_GC_DISABLE	REG_BIT(10)
-#define   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE	REG_BIT(4)
-
 #define  VLV_PMWGICZ				_MMIO(0x1300a4)
 
 #define  HSW_EDRAM_CAP				_MMIO(0x120010)
-- 
2.50.1

