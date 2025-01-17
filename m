Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0054C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 07:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9921710EA7F;
	Fri, 17 Jan 2025 07:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mixOa0r1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721210EA7F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737100059; x=1768636059;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7nsAwysmgNYmpdJBMxTOd5siPQ+x4vEcFPLTrcw6T60=;
 b=mixOa0r1Jgcz70NhsOvO50NMGwCW+Mj0g7hZoorPZ4gsVZGuuesqnm06
 XiWUZ9QJoLZjbrYTq4T3kkA5ZgqCuUipjFk4hAp4+WNCFzgZktYrWaSun
 U/WKJ6dxUXW7YcsLA9zKt2OmL25wDQr9Pf5PW6f2btwhsxtAgeFgAhWPy
 cjeUpuOi5C0a5SJqUth9Et98EhMm8b2Soasegvympc85nP4HxTvlMevye
 uL/gTaUcO5FZw5d0BtaxcHA95G8WUUib2gZ33rGZmBhP+I0cUYzXui6Dx
 DZ5IX/CQdhwO5yW4TLNZm6M0v2ukyjMg5K3ww6rtdZTozHbwZVm77f+By g==;
X-CSE-ConnectionGUID: 7OzUrSfqSCytwHqBOEFq0A==
X-CSE-MsgGUID: DKAq2EuLSsKEWi9GgjXMDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37760750"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37760750"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:47:39 -0800
X-CSE-ConnectionGUID: KWzbiE7IRAeiWpbEUOcptg==
X-CSE-MsgGUID: vrz/JIK2SXOSGFpM83DRgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105687940"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 23:47:38 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 4/7] drm/i915/scaler: Compute scaling factors for pipe
 scaler
Date: Fri, 17 Jan 2025 13:14:18 +0530
Message-ID: <20250117074422.3965519-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
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

Compute scaling factors and scaler user for pipe scaler if
particular scaler user is pipe scaler.

--v2:
- Fix typos. [Ankit]
- Remove FIXME tag. [Ankit]
- Should be common hscale, vscale instead of local one to
avoid garbage overwritten.

--v3:
- Separate out max_scaling information. [Ankit]
- Use max_hscale and max_vscale info instead of INT_MAX. [Ankit]

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 36 ++++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index a832cdccd9fa..72344044d9d3 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -368,6 +368,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 					&crtc_state->scaler_state;
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	u32 mode;
+	int hscale, vscale, max_vscale, max_hscale;
 
 	if (*scaler_id < 0)
 		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
@@ -416,15 +417,10 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 		mode = SKL_PS_SCALER_MODE_DYN;
 	}
 
-	/*
-	 * FIXME: we should also check the scaler factors for pfit, so
-	 * this shouldn't be tied directly to planes.
-	 */
 	if (plane_state && plane_state->hw.fb) {
 		const struct drm_framebuffer *fb = plane_state->hw.fb;
 		const struct drm_rect *src = &plane_state->uapi.src;
 		const struct drm_rect *dst = &plane_state->uapi.dst;
-		int hscale, vscale, max_vscale, max_hscale;
 
 		calculate_max_scale(crtc,
 				    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier),
@@ -448,11 +444,37 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 
 			return -EINVAL;
 		}
+	}
+
+	if (crtc_state->pch_pfit.enabled) {
+		struct drm_rect src;
+
+		drm_rect_init(&src, 0, 0,
+			      drm_rect_width(&crtc_state->pipe_src) << 16,
+			      drm_rect_height(&crtc_state->pipe_src) << 16);
+
+		calculate_max_scale(crtc, 0, *scaler_id,
+				    &max_hscale, &max_vscale);
 
-		scaler_state->scalers[*scaler_id].hscale = hscale;
-		scaler_state->scalers[*scaler_id].vscale = vscale;
+		hscale = drm_rect_calc_hscale(&src, &crtc_state->pch_pfit.dst,
+					      0, max_hscale);
+		vscale = drm_rect_calc_vscale(&src, &crtc_state->pch_pfit.dst,
+					      0, max_vscale);
+
+		if (hscale < 0 || vscale < 0) {
+			drm_dbg_kms(display->drm,
+				    "Scaler %d doesn't support required pipe scaling\n",
+				    *scaler_id);
+			drm_rect_debug_print("src: ", &src, true);
+			drm_rect_debug_print("dst: ", &crtc_state->pch_pfit.dst, false);
+
+			return -EINVAL;
+		}
 	}
 
+	scaler_state->scalers[*scaler_id].hscale = hscale;
+	scaler_state->scalers[*scaler_id].vscale = vscale;
+
 	drm_dbg_kms(display->drm, "[CRTC:%d:%s] attached scaler id %u.%u to %s:%d\n",
 		    crtc->base.base.id, crtc->base.name,
 		    crtc->pipe, *scaler_id, name, idx);
-- 
2.48.1

