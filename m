Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D12C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259D310E9FE;
	Wed,  5 Apr 2023 15:40:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2479110E9FE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709215; x=1712245215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ePQiU0coVHW5nRcjqtQyTWpzvuTo9tfM/WpWMWBTaV8=;
 b=ilydrVR7wn7tS+HN+jD6CmZUU1RkB6iSqOHBgojUYIok3ZD5NlArrWAj
 WoCDkF5skCV8ldFMN+nG9+2NAhMjTIjcJ7kZiluG590YQ4xgLkXib5VOx
 jf7vo1uE9LkRcytaEA7DlUHcis10mYZ92X1oOj4/V/L9tRidx5eG+i/nS
 2sVcTls8GzxezLN9WO9h0RtfxAl+Zdy9Z+lhQkTXVZDS3Kx3b7ng3y/Ui
 NBvrQTO6bPiRq0nXTt3iWXQN+gHiIIoHLcQqXhphoZu3PA+zSHLdpWmc1
 DC9mE1OEG2derH6ysL8233RYJmL+tbAA2iGAOfAVTmrf2832Z9yYFC41F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341210934"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341210934"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751295891"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="751295891"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:08 +0300
Message-Id: <20230405153920.926583-10-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/21] fixup! drm/i915/display: Remaining changes
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove i9xx_plane.h related ifdefs

With the conditional build for i9xx_plane.h this is no longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    | 6 +-----
 drivers/gpu/drm/i915/display/intel_display.c | 5 -----
 drivers/gpu/drm/i915/display/intel_sprite.c  | 2 +-
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index d3c6542de3d7..df363ffd939c 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -14,8 +14,8 @@
 #include "i915_irq.h"
 #ifdef I915
 #include "i915_vgpu.h"
-#include "i9xx_plane.h"
 #endif
+#include "i9xx_plane.h"
 #include "icl_dsi.h"
 #include "intel_atomic.h"
 #include "intel_atomic_plane.h"
@@ -310,11 +310,7 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 		primary = skl_universal_plane_create(dev_priv, pipe,
 						     PLANE_PRIMARY);
 	else
-#ifdef I915
 		primary = intel_primary_plane_create(dev_priv, pipe);
-#else
-		BUG_ON(1);
-#endif
 	if (IS_ERR(primary)) {
 		ret = PTR_ERR(primary);
 		goto fail;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9c80292e5666..cb14c201cc17 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -57,7 +57,6 @@
 
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
-#include "i9xx_plane.h"
 #include "vlv_dsi.h"
 #include "vlv_dsi_pll.h"
 #include "vlv_dsi_regs.h"
@@ -8294,10 +8293,6 @@ static const struct intel_display_funcs skl_display_funcs = {
 	.get_initial_plane_config = skl_get_initial_plane_config,
 };
 
-#ifndef I915
-#define i9xx_get_initial_plane_config skl_get_initial_plane_config
-#endif
-
 static const struct intel_display_funcs ddi_display_funcs = {
 	.get_pipe_config = hsw_get_pipe_config,
 	.crtc_enable = hsw_crtc_enable,
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index e8564fdd8930..69603563f741 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -43,9 +43,9 @@
 
 #ifdef I915
 #include "i915_vgpu.h"
-#include "i9xx_plane.h"
 #endif
 
+#include "i9xx_plane.h"
 #include "intel_atomic_plane.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
-- 
2.39.2

