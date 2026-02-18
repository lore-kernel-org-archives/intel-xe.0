Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECADE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7F510E5D8;
	Wed, 18 Feb 2026 15:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lt04lZmK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E011410E5D3;
 Wed, 18 Feb 2026 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428500; x=1802964500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OtfuUtcfvNUAdyTRhGJdUs3/rmFdmHZJFRgRjoENHn0=;
 b=lt04lZmKKtiZnqvkLeWmnZgdYrci18+as5o0E0sKISRWX1Tp1HzQelVH
 sDemortmQxgW/Vkk7PWX5lZm4Wl9PfTDX/r3AJEhQQwbrrITaIyMjAZo3
 tuybA6K/CQcSbATlSZOsZuABRnuTXc/UOlS1ad7chWlPe8967YnqYNERt
 glp1Y2hAfc6umNCTbBDpxu37jr+7FMvlTt6NdPeyS5JBE2jBPOtMEMrB3
 TAuLPVsAzLL9E+or+aSwWcuFCdZRBlhILW2rinUJ0nBCFeSFJr1MGjMbM
 FvloJysygDc7pVXTr22SEcuwoaaMbPPb6DQXhH0zC6kFkOEEA+vKT+6pM A==;
X-CSE-ConnectionGUID: +fi5jL6XQJ+3bymKDew2AQ==
X-CSE-MsgGUID: nD9Ok/U3RrCSiuFdjR9bEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72420152"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72420152"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:19 -0800
X-CSE-ConnectionGUID: dQ9vKkVtRR63MtePBkw9cg==
X-CSE-MsgGUID: NiCHXcPBQsOKYXdnLFXY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214335098"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:19 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/19] drm/i915/overlay: Track current frontbuffer_bits
Date: Wed, 18 Feb 2026 17:27:49 +0200
Message-ID: <20260218152806.18885-3-ville.syrjala@linux.intel.com>
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

Store the current frontbuffer_bits in the overlay data. The
main benefit here is that we get rid of the 'crtc->pipe'
usage from intel_overlay_flip_prepare() which will have to
move to the i915 side of the parent vs. display driver split.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 33a38d116c90..dd04e75fe3a7 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -205,6 +205,7 @@ struct intel_overlay {
 	struct drm_i915_gem_object *reg_bo;
 	struct overlay_registers __iomem *regs;
 	u32 flip_addr;
+	u32 frontbuffer_bits;
 	/* flip handling */
 	struct i915_active last_flip;
 	void (*flip_complete)(struct intel_overlay *ovl);
@@ -255,7 +256,8 @@ alloc_request(struct intel_overlay *overlay, void (*fn)(struct intel_overlay *))
 }
 
 /* overlay needs to be disable in OCMD reg */
-static int intel_overlay_on(struct intel_overlay *overlay)
+static int intel_overlay_on(struct intel_overlay *overlay,
+			    u32 frontbuffer_bits)
 {
 	struct intel_display *display = overlay->display;
 	struct i915_request *rq;
@@ -274,6 +276,7 @@ static int intel_overlay_on(struct intel_overlay *overlay)
 	}
 
 	overlay->active = true;
+	overlay->frontbuffer_bits = frontbuffer_bits;
 
 	if (display->platform.i830)
 		i830_overlay_clock_gating(display, false);
@@ -293,7 +296,6 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
 				       struct i915_vma *vma)
 {
 	struct intel_display *display = overlay->display;
-	enum pipe pipe = overlay->crtc->pipe;
 	struct intel_frontbuffer *frontbuffer = NULL;
 
 	drm_WARN_ON(display->drm, overlay->old_vma);
@@ -302,7 +304,7 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
 		frontbuffer = intel_frontbuffer_get(intel_bo_to_drm_bo(vma->obj));
 
 	intel_frontbuffer_track(overlay->frontbuffer, frontbuffer,
-				INTEL_FRONTBUFFER_OVERLAY(pipe));
+				overlay->frontbuffer_bits);
 
 	if (overlay->frontbuffer)
 		intel_frontbuffer_put(overlay->frontbuffer);
@@ -364,7 +366,7 @@ static void intel_overlay_release_old_vma(struct intel_overlay *overlay)
 	if (drm_WARN_ON(display->drm, !vma))
 		return;
 
-	intel_frontbuffer_flip(display, INTEL_FRONTBUFFER_OVERLAY(overlay->crtc->pipe));
+	intel_frontbuffer_flip(display, overlay->frontbuffer_bits);
 
 	i915_vma_unpin(vma);
 	i915_vma_put(vma);
@@ -382,9 +384,8 @@ static void intel_overlay_off_tail(struct intel_overlay *overlay)
 
 	intel_overlay_release_old_vma(overlay);
 
-	overlay->crtc->overlay = NULL;
-	overlay->crtc = NULL;
 	overlay->active = false;
+	overlay->frontbuffer_bits = 0;
 
 	if (display->platform.i830)
 		i830_overlay_clock_gating(display, true);
@@ -506,6 +507,7 @@ void intel_overlay_reset(struct intel_display *display)
 	overlay->old_yscale = 0;
 	overlay->crtc = NULL;
 	overlay->active = false;
+	overlay->frontbuffer_bits = 0;
 }
 
 static int packed_depth_bytes(u32 format)
@@ -836,7 +838,7 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 			OCONF_PIPE_A : OCONF_PIPE_B;
 		iowrite32(oconfig, &regs->OCONFIG);
 
-		ret = intel_overlay_on(overlay);
+		ret = intel_overlay_on(overlay, INTEL_FRONTBUFFER_OVERLAY(pipe));
 		if (ret != 0)
 			goto out_unpin;
 	}
@@ -924,6 +926,9 @@ int intel_overlay_switch_off(struct intel_overlay *overlay)
 
 	iowrite32(0, &overlay->regs->OCMD);
 
+	overlay->crtc->overlay = NULL;
+	overlay->crtc = NULL;
+
 	return intel_overlay_off(overlay);
 }
 
-- 
2.52.0

