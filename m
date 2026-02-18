Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1A3E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9F910E5E1;
	Wed, 18 Feb 2026 15:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzOK64dc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922FC10E5DA;
 Wed, 18 Feb 2026 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428508; x=1802964508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HrrBJVuLopheB4BllaS8Kw2LYF+jPF9vkLydNcDEneA=;
 b=YzOK64dcMuRRclkDnQ0qm6lsdUXQMHWgsXGlSb3mueNuwJMESRM9Lurh
 jh7hncYmbesrVpGm7ig3N/NcwRVVAdxG0yxCtv3Ri5n4H6dnZ29guXgVi
 QlIEQGwFkcL5sN+x4c3W0P3J47m5DHBgZyWe2TMODeIDbyanAmJe1/f2D
 R1dgW/JVaNiVrg8xOgGGUxMspb3X+SL8G19R5ZzTb7VkO3dXhFwJZg4EA
 B6+uv1h+CYsZWrccMnRk1d4jskJOUQ+uRQIB80RUQ0j5C0aYrCk/Wfg9a
 cM/g5jfLy8/lwADAkZl+CwHlQ3JKl+7WZw8oWxImhUksAK61PqK4Wgebc g==;
X-CSE-ConnectionGUID: dQENp67VSIiOW804mbVpOQ==
X-CSE-MsgGUID: fV26dta2Sa2H5KW+gctkLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72420164"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72420164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:28 -0800
X-CSE-ConnectionGUID: ehhFdwpxRwmRLKZwrumFqQ==
X-CSE-MsgGUID: nYTQjysgRauiQpJOupS+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214335119"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:27 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/19] drm/i915/overlay: Remove redundant overlay->active
Date: Wed, 18 Feb 2026 17:27:51 +0200
Message-ID: <20260218152806.18885-5-ville.syrjala@linux.intel.com>
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

Now that we have overlay->frontbuffer_bits, overlay->active
is completely redundant, so remove it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 32b45e9bc18a..9bd11dde29d6 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -194,7 +194,6 @@ struct intel_overlay {
 	struct i915_vma *vma;
 	struct i915_vma *old_vma;
 	struct intel_frontbuffer *frontbuffer;
-	bool active;
 	bool pfit_active;
 	u32 pfit_vscale_ratio; /* shifted-point number, (1<<12) == 1.0 */
 	u32 color_key:24;
@@ -260,7 +259,7 @@ static bool i915_overlay_is_active(struct drm_device *drm)
 	struct intel_display *display = to_intel_display(drm);
 	struct intel_overlay *overlay = display->overlay;
 
-	return overlay->active;
+	return overlay->frontbuffer_bits;
 }
 
 /* overlay needs to be disable in OCMD reg */
@@ -283,7 +282,6 @@ static int intel_overlay_on(struct intel_overlay *overlay,
 		return PTR_ERR(cs);
 	}
 
-	overlay->active = true;
 	overlay->frontbuffer_bits = frontbuffer_bits;
 
 	if (display->platform.i830)
@@ -392,7 +390,6 @@ static void intel_overlay_off_tail(struct intel_overlay *overlay)
 
 	intel_overlay_release_old_vma(overlay);
 
-	overlay->active = false;
 	overlay->frontbuffer_bits = 0;
 
 	if (display->platform.i830)
@@ -514,7 +511,6 @@ void intel_overlay_reset(struct intel_display *display)
 	overlay->old_xscale = 0;
 	overlay->old_yscale = 0;
 	overlay->crtc = NULL;
-	overlay->active = false;
 	overlay->frontbuffer_bits = 0;
 }
 
-- 
2.52.0

