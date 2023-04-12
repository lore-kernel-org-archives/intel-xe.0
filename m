Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09E9C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9046410E823;
	Wed, 12 Apr 2023 14:21:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B758F10E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309281; x=1712845281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wPKVY7+RMVS29PqhLJkaAScYHCZ9Ebias+Rk6HhXzQs=;
 b=Y8VQyn2srb+MtB5Ao1A7LwUbg5cXrtMak9G70kkRlRy0MMk3chVe48iC
 6mwpX3RWF/1omAimoGZfL3r+rAju04hAhIREZejWmsCoGqPaad8FkqKYo
 D+iSevpQiQHDAW2n7pGZ96fiCg+xzIeOQYvxCp2lNvZyfu2aBNY3Ytl/X
 bxVKmUhPYhEuZs6QRT16O1r09j0Cy2PlZnP7vBiCGhV/a0Cmj4EsOQwA2
 YcuijXj1XudmGJcDKbZvNAe+kklcG6ynTgMz7vBvMwWeQQ93LlnBQJUaY
 duVXuReKqE6GcUZSlnSNYswUETMso3L+aPw8dReTXcxJZRTCpo6/U8my9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343915343"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343915343"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688955695"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688955695"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:36 +0300
Message-Id: <20230412142006.877109-12-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/41] fixup! drm/i915/display: Remaining changes
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

CRT is now better abstracted. No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c            | 5 ++---
 drivers/gpu/drm/i915/display/intel_display_power_well.c | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 859db9ead755..f701b75d1f37 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -46,7 +46,6 @@
 #include <drm/drm_rect.h>
 
 #ifdef I915
-#include "intel_crt.h"
 #include "intel_dvo.h"
 #include "intel_sdvo.h"
 #include "intel_tv.h"
@@ -75,6 +74,7 @@
 #include "intel_bw.h"
 #include "intel_cdclk.h"
 #include "intel_color.h"
+#include "intel_crt.h"
 #include "intel_crtc.h"
 #include "intel_crtc_state_dump.h"
 #include "intel_ddi.h"
@@ -7947,10 +7947,9 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_E);
 	} else if (HAS_DDI(dev_priv)) {
 		u32 found;
-#ifdef I915
+
 		if (intel_ddi_crt_present(dev_priv))
 			intel_crt_init(dev_priv);
-#endif
 
 		/* Haswell uses DDI functions to detect digital outputs. */
 		found = intel_de_read(dev_priv, DDI_BUF_CTL(PORT_A)) & DDI_INIT_DISPLAY_DETECTED;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 7cd52e545ae1..ddea30240a5b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -8,6 +8,7 @@
 #include "intel_backlight_regs.h"
 #include "intel_combo_phy.h"
 #include "intel_combo_phy_regs.h"
+#include "intel_crt.h"
 #include "intel_de.h"
 #include "intel_display_power_well.h"
 #include "intel_display_types.h"
@@ -24,10 +25,6 @@
 #include "vlv_sideband.h"
 #include "vlv_sideband_reg.h"
 
-#ifdef I915
-#include "intel_crt.h"
-#endif
-
 struct i915_power_well_regs {
 	i915_reg_t bios;
 	i915_reg_t driver;
-- 
2.39.2

