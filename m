Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AB2C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35010F131;
	Fri,  2 Feb 2024 22:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wuup+M8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B8610F131
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914299; x=1738450299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HAz0vHB8z9ZufABCsUZkz3K/YMzvRqqNdAQZvTAbjTw=;
 b=Wuup+M8GECa9S/WoeMLetdBAOaKP4YhpDgnnnMZnnlKSCXup5Up9as9u
 mlyAP3WEPs+1AqQ0W5X58Q75LsT/aSsi6QCXpH6Q3gxNFonk7tOyRuv/C
 FH7c6NZfWaDJfnRKGZiptSbsfX+Z1JL0FVoCZg64VHyAdPX+lWbuhWJGL
 BUlUYN1NpnNB7p45xGtgRbENd3ZfeRDel0zx1hG3SuDVBQfibKMiS3aEv
 YfOwOGkb1Cm77EvEZv5f7IjSxpazPhwJnnpzrubUI6CCPUGqEcDdAfmlr
 6/c00lTpfvPMDXROIPUJz81xxCq9C+dvbKc4/nACpYvJpiC7jPYvdGP2L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153782"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332062"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332062"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:26 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 12/16] drm/i915: Simplify intel_initial_plane_config()
 calling convention
Date: Sat,  3 Feb 2024 00:43:36 +0200
Message-ID: <20240202224340.30647-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There's no reason the caller of intel_initial_plane_config() should
have to loop over the CRTCs. Pull the loop into the function to
make life simpler for the caller.

v2: "fix" xe

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_driver.c   |  7 +---
 .../drm/i915/display/intel_plane_initial.c    | 40 +++++++++++--------
 .../drm/i915/display/intel_plane_initial.h    |  4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 40 +++++++++++--------
 4 files changed, 49 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index ecf9cb74734b..f3fe1743243b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -415,7 +415,6 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
 	enum pipe pipe;
-	struct intel_crtc *crtc;
 	int ret;
 
 	if (!HAS_DISPLAY(i915))
@@ -467,11 +466,7 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 	intel_acpi_assign_connector_fwnodes(i915);
 	drm_modeset_unlock_all(dev);
 
-	for_each_intel_crtc(dev, crtc) {
-		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
-			continue;
-		intel_crtc_initial_plane_config(crtc);
-	}
+	intel_initial_plane_config(i915);
 
 	/*
 	 * Make sure hardware watermarks really match the state we read out.
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 78bff6181ceb..b7e12b60d68b 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -357,25 +357,31 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 		i915_vma_put(plane_config->vma);
 }
 
-void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
+void intel_initial_plane_config(struct drm_i915_private *i915)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	struct intel_initial_plane_config plane_config = {};
+	struct intel_crtc *crtc;
 
-	/*
-	 * Note that reserving the BIOS fb up front prevents us
-	 * from stuffing other stolen allocations like the ring
-	 * on top.  This prevents some ugliness at boot time, and
-	 * can even allow for smooth boot transitions if the BIOS
-	 * fb is large enough for the active pipe configuration.
-	 */
-	dev_priv->display.funcs.display->get_initial_plane_config(crtc, &plane_config);
+	for_each_intel_crtc(&i915->drm, crtc) {
+		struct intel_initial_plane_config plane_config = {};
 
-	/*
-	 * If the fb is shared between multiple heads, we'll
-	 * just get the first one.
-	 */
-	intel_find_initial_plane_obj(crtc, &plane_config);
+		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
+			continue;
 
-	plane_config_fini(&plane_config);
+		/*
+		 * Note that reserving the BIOS fb up front prevents us
+		 * from stuffing other stolen allocations like the ring
+		 * on top.  This prevents some ugliness at boot time, and
+		 * can even allow for smooth boot transitions if the BIOS
+		 * fb is large enough for the active pipe configuration.
+		 */
+		i915->display.funcs.display->get_initial_plane_config(crtc, &plane_config);
+
+		/*
+		 * If the fb is shared between multiple heads, we'll
+		 * just get the first one.
+		 */
+		intel_find_initial_plane_obj(crtc, &plane_config);
+
+		plane_config_fini(&plane_config);
+	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.h b/drivers/gpu/drm/i915/display/intel_plane_initial.h
index c7e35ab3182b..64ab95239cd4 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.h
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.h
@@ -6,8 +6,8 @@
 #ifndef __INTEL_PLANE_INITIAL_H__
 #define __INTEL_PLANE_INITIAL_H__
 
-struct intel_crtc;
+struct drm_i915_private;
 
-void intel_crtc_initial_plane_config(struct intel_crtc *crtc);
+void intel_initial_plane_config(struct drm_i915_private *i915);
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index ccf83c12b545..0aaf4eb2cdc5 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -267,25 +267,31 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 	}
 }
 
-void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
+void intel_initial_plane_config(struct drm_i915_private *i915)
 {
-	struct xe_device *xe = to_xe_device(crtc->base.dev);
-	struct intel_initial_plane_config plane_config = {};
+	struct intel_crtc *crtc;
 
-	/*
-	 * Note that reserving the BIOS fb up front prevents us
-	 * from stuffing other stolen allocations like the ring
-	 * on top.  This prevents some ugliness at boot time, and
-	 * can even allow for smooth boot transitions if the BIOS
-	 * fb is large enough for the active pipe configuration.
-	 */
-	xe->display.funcs.display->get_initial_plane_config(crtc, &plane_config);
+	for_each_intel_crtc(&i915->drm, crtc) {
+		struct intel_initial_plane_config plane_config = {};
 
-	/*
-	 * If the fb is shared between multiple heads, we'll
-	 * just get the first one.
-	 */
-	intel_find_initial_plane_obj(crtc, &plane_config);
+		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
+			continue;
 
-	plane_config_fini(&plane_config);
+		/*
+		 * Note that reserving the BIOS fb up front prevents us
+		 * from stuffing other stolen allocations like the ring
+		 * on top.  This prevents some ugliness at boot time, and
+		 * can even allow for smooth boot transitions if the BIOS
+		 * fb is large enough for the active pipe configuration.
+		 */
+		i915->display.funcs.display->get_initial_plane_config(crtc, &plane_config);
+
+		/*
+		 * If the fb is shared between multiple heads, we'll
+		 * just get the first one.
+		 */
+		intel_find_initial_plane_obj(crtc, &plane_config);
+
+		plane_config_fini(&plane_config);
+	}
 }
-- 
2.43.0

