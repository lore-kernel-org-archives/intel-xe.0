Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E039CCF2E6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D2410ED76;
	Mon, 19 Oct 2026 13:54:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8251D10ED45;
 Mon, 19 Oct 2026 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418039; x=1823954039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eMBAghZB3Hq+YIMdiYHin+Cje+suule/o90KG17Be5w=;
 b=JrM55Ig8OtGr4mhVP2udFlHzqoZ+zKYr2BKTBjH53gV88zGD/sxm79Dk
 0w/WoG/EN/6kP3xeXl5YYFg4Ix7e8wHbP7+sfpkx0gMdUb7CQcZ+lY08b
 tmlDkT+bQFpmh1XxMNRsQhCz6ulrz2vk6q4Gpy+MMZPEua8OLEFhQ7pkG
 7ThzTZApdIgg4jodUTST9nFJ5w4E2ADhuq72lfi7MkOYUwAYLaoHpyx6Z
 WtLNnscTbLNS+7Ex31h69uXeEihyGfaCAFZUnkBsowoADXv8PZZDf4tw3
 Llixvng32awZguadduNrNEQnuDq2uEgUurMKdEkJDVtH+0+Mpb6BPFEbi Q==;
X-CSE-ConnectionGUID: CgrFJpsBTIW7IvULd7a3Ew==
X-CSE-MsgGUID: J0vME60aR9KAAmecmhBKmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085167"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:57 -0700
X-CSE-ConnectionGUID: Gior1lS+S5qH6C7nDU59Uw==
X-CSE-MsgGUID: /WBZ6+tFSKSMBhpgVPmvrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844431"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:55 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/15] drm/i915/pfit: Extract i9xx_pfit_vscale_ratio() and
 i9xx_pfit_is_one_line_mode()
Date: Mon, 19 Oct 2026 16:53:06 +0300
Message-ID: <20261019135309.23578-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Move the raw pfit stuff from the overlay code into intel_pfit.c.
For now we'll stick to the "read registers" approach in
i9xx_pfit_vscale_ratio(), but really we should just use precomputed
values there...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 31 ++++----------------
 drivers/gpu/drm/i915/display/intel_pfit.c    | 30 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pfit.h    |  3 ++
 3 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index a809aa2950ac..822eef96ea37 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -37,7 +37,7 @@
 #include "intel_frontbuffer.h"
 #include "intel_overlay.h"
 #include "intel_parent.h"
-#include "intel_pfit_regs.h"
+#include "intel_pfit.h"
 
 /* Limits for overlay size. According to intel doc, the real limits are:
  * Y width: 4095, UV width (planar): 2047, Y height: 2047,
@@ -614,28 +614,8 @@ static int check_overlay_possible_on_crtc(struct intel_overlay *overlay,
 static void update_pfit_vscale_ratio(struct intel_overlay *overlay)
 {
 	struct intel_display *display = overlay->display;
-	u32 ratio;
 
-	/* XXX: This is not the same logic as in the xorg driver, but more in
-	 * line with the intel documentation for the i965
-	 */
-	if (DISPLAY_VER(display) >= 4) {
-		u32 tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
-
-		/* on i965 use the PGM reg to read out the autoscaler values */
-		ratio = REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, tmp);
-	} else {
-		u32 tmp;
-
-		if (intel_de_read(display, PFIT_CONTROL(display)) & PFIT_VERT_AUTO_SCALE)
-			tmp = intel_de_read(display, PFIT_AUTO_RATIOS(display));
-		else
-			tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
-
-		ratio = REG_FIELD_GET(PFIT_VERT_SCALE_MASK, tmp);
-	}
-
-	overlay->pfit_vscale_ratio = ratio;
+	overlay->pfit_vscale_ratio = i9xx_pfit_vscale_ratio(display);
 }
 
 static int check_overlay_dst(struct intel_overlay *overlay,
@@ -838,13 +818,12 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		overlay->crtc = crtc;
 		crtc->overlay = overlay;
 
-		/* line too wide, i.e. one-line-mode */
-		if (drm_rect_width(&crtc->config->pipe_src) > 1024 &&
-		    crtc->config->gmch_pfit.control & PFIT_ENABLE) {
+		if (i9xx_pfit_is_one_line_mode(crtc->config)) {
 			overlay->pfit_active = true;
 			update_pfit_vscale_ratio(overlay);
-		} else
+		} else {
 			overlay->pfit_active = false;
+		}
 	}
 
 	ret = check_overlay_dst(overlay, params);
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index d94301c80d57..d8daa463452e 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -960,3 +960,33 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
 			ilk_pfit_get_config(crtc_state);
 	}
 }
+
+bool i9xx_pfit_is_one_line_mode(const struct intel_crtc_state *crtc_state)
+{
+	return crtc_state->gmch_pfit.control & PFIT_ENABLE &&
+		drm_rect_width(&crtc_state->pipe_src) > 1024;
+}
+
+u32 i9xx_pfit_vscale_ratio(struct intel_display *display)
+{
+	/* XXX: This is not the same logic as in the xorg driver, but more in
+	 * line with the intel documentation for the i965
+	 *
+	 * FIXME don't read this from the hardware but use a computed value
+	 */
+	if (DISPLAY_VER(display) >= 4) {
+		u32 tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
+
+		/* on i965 use the PGM reg to read out the autoscaler values */
+		return REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, tmp);
+	} else {
+		u32 tmp;
+
+		if (intel_de_read(display, PFIT_CONTROL(display)) & PFIT_VERT_AUTO_SCALE)
+			tmp = intel_de_read(display, PFIT_AUTO_RATIOS(display));
+		else
+			tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
+
+		return REG_FIELD_GET(PFIT_VERT_SCALE_MASK, tmp);
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.h b/drivers/gpu/drm/i915/display/intel_pfit.h
index f1162b37d407..e6cd3af2e2a4 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.h
+++ b/drivers/gpu/drm/i915/display/intel_pfit.h
@@ -27,4 +27,7 @@ intel_pfit_mode_valid(struct intel_display *display,
 		      const struct drm_display_mode *mode,
 		      enum intel_output_format output_format,
 		      int num_joined_pipes);
+bool i9xx_pfit_is_one_line_mode(const struct intel_crtc_state *crtc_state);
+u32 i9xx_pfit_vscale_ratio(struct intel_display *display);
+
 #endif /* __INTEL_PFIT_H__ */
-- 
2.55.0

