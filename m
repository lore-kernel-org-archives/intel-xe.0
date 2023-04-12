Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7188C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F4C10E838;
	Wed, 12 Apr 2023 14:21:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4C010E835
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309260; x=1712845260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZcGXfXmCR5CDdEZbxFXSCRV8WbkdeDiew24vZfCYyk=;
 b=GBCQUhRudAalA+QxPfqpcnuD9mVPxiAWg979ufcFxAMyAgv2IeeAo8KY
 uUnaSB4bh5rqnUvHqJj5GyGfBlMXeLy4uHjEwjmYuaoU3zIgCASpMgh5W
 bbpo+JAl9g9OmqncLiFU6Xo3mPgo7t9wWyCPrqSAMOIE0H1vjy9jtEq7/
 caF6MShwJDc5NZRsLjL/VexIsHkeXEZBJpsi/MtT56flsjCZ7ijRI2JpV
 U2QR5SDpk5gCtWqf5walxjfWFvbarOwcipkP/O3uIHzmWbYfHr2PeaMX2
 K6vN3/OXI0xvV0JSTzUu+5T7t/g8rhPe8dbYmIb4lMkeW0efR0NVp35Wq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328020234"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328020234"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753544305"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="753544305"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:32 +0300
Message-Id: <20230412142006.877109-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/41] fixup! drm/i915/display: Remaining changes
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

VGPU is now properly abstracted. No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   | 4 ----
 drivers/gpu/drm/i915/display/intel_fbc.c    | 3 +--
 drivers/gpu/drm/i915/display/intel_sprite.c | 4 ----
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index df363ffd939c..fca73a4f7c47 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -12,9 +12,7 @@
 #include <drm/drm_vblank_work.h>
 
 #include "i915_irq.h"
-#ifdef I915
 #include "i915_vgpu.h"
-#endif
 #include "i9xx_plane.h"
 #include "icl_dsi.h"
 #include "intel_atomic.h"
@@ -700,10 +698,8 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 
 	local_irq_enable();
 
-#ifdef I915
 	if (intel_vgpu_active(dev_priv))
 		return;
-#endif
 
 	if (crtc->debug.start_vbl_count &&
 	    crtc->debug.start_vbl_count != end_vbl_count) {
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 309cce443941..b1e7b2588fd9 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -45,6 +45,7 @@
 
 #include "i915_drv.h"
 #include "i915_utils.h"
+#include "i915_vgpu.h"
 #include "intel_cdclk.h"
 #include "intel_de.h"
 #include "intel_display_trace.h"
@@ -54,8 +55,6 @@
 
 #ifdef I915
 
-#include "i915_vgpu.h"
-
 #define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
 #define i915_gem_stolen_allocated(node) drm_mm_node_allocated(&(node))
 #define i915_gem_stolen_compressed_offset(node) ((node).start)
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 23e23f119a2e..718fe026c5f7 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -40,11 +40,7 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
-
-#ifdef I915
 #include "i915_vgpu.h"
-#endif
-
 #include "i9xx_plane.h"
 #include "intel_atomic_plane.h"
 #include "intel_de.h"
-- 
2.39.2

