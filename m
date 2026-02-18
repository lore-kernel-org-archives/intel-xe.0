Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82543E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A25D10E5E7;
	Wed, 18 Feb 2026 15:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhZyddHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9A10E5E7;
 Wed, 18 Feb 2026 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428533; x=1802964533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q97cNxvIfv9WZSCPWeuFL/vW4TSdyLIsvv5Wy0kl34I=;
 b=ZhZyddHvARiqB0ztQ4XDV6siFEa2FMS5/gGYcKg3Vd5nWP5b3eVKYUOo
 ufknBxUbuhph7YT5K3xwhl/9P3EiorEXsmaV93kzoktVrUqKiiM+zZUBr
 uhNq1wFyrpI79foLU5tQ4JJg222wkF+Wod6erDvugYLjEBC+u3HZMRRm+
 ctsYUMuiT+AQSi8mqlDuSRaINnkIxyOT/4KuH6y0ET+QI63KrWAg4hH/i
 unuCpe12y4yGmNawWVpyvcCU2pEoHpRX+Ez7vlrY+hm4WpNusszFPD1Lv
 Y48I0gnjgc5G8tSA1QHX4Y9xAloacRbLi7EUeMODALFy5+2fZmAEn3XBd g==;
X-CSE-ConnectionGUID: 6/GRADKJSISY3ExAl0XPEw==
X-CSE-MsgGUID: QFVdeR/wTVysUkURAluHnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60084473"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="60084473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:53 -0800
X-CSE-ConnectionGUID: zSwfTla4RmGwZ7J9UbC/dw==
X-CSE-MsgGUID: 17Q//ZHRRRGV9vdcmJRYDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="218756649"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:52 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/19] drm/i915/overlay: Extract i915_overlay_cleanup()
Date: Wed, 18 Feb 2026 17:27:57 +0200
Message-ID: <20260218152806.18885-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
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

Pull the i915 specific bits of the overlay cleanup into
a separate function (i915_overlay_cleanup()) to accommodate
the upcoming parent vs. display driver split.

For now we'll also have to pass in the overlay struct, but
that will disappear once the i915 vs. display split is completed.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 22 +++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 5683bddf33b4..9b5ae3f4f5bd 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1490,23 +1490,29 @@ bool intel_overlay_available(struct intel_display *display)
 	return display->overlay;
 }
 
-void intel_overlay_cleanup(struct intel_display *display)
+static void i915_overlay_cleanup(struct drm_device *drm,
+				 struct intel_overlay *overlay)
 {
-	struct intel_overlay *overlay;
-
-	overlay = fetch_and_zero(&display->overlay);
-	if (!overlay)
-		return;
-
 	/*
 	 * The bo's should be free'd by the generic code already.
 	 * Furthermore modesetting teardown happens beforehand so the
 	 * hardware should be off already.
 	 */
-	drm_WARN_ON(display->drm, i915_overlay_is_active(display->drm));
+	drm_WARN_ON(drm, i915_overlay_is_active(drm));
 
 	i915_gem_object_put(overlay->reg_bo);
 	i915_active_fini(&overlay->last_flip);
+}
+
+void intel_overlay_cleanup(struct intel_display *display)
+{
+	struct intel_overlay *overlay;
+
+	overlay = fetch_and_zero(&display->overlay);
+	if (!overlay)
+		return;
+
+	i915_overlay_cleanup(display->drm, overlay);
 
 	kfree(overlay);
 }
-- 
2.52.0

