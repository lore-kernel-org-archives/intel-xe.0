Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7DEE9A047
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F8F10E5EB;
	Wed, 18 Feb 2026 15:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdaNnHZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C53A10E5EB;
 Wed, 18 Feb 2026 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428537; x=1802964537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nxfV3JFbMIiD4to4RsMc9L/XLr+7RW8MDhK8OaUOL1M=;
 b=RdaNnHZ3I8JS4uzt7fefjxHEXjkF8tXPFsCQ6f0u1bh/bmS9zFshFfVz
 tVpeQ5YRB6yezk+XxNNVNUOBra+fD2ZerWB54/7KgKEOOlvFWyEG0nMOj
 VA+JhzuWmDqCvy8CX5tP+UtqYVD6I7vK2roZ6yY8nH/4HtgGamZAFhwlP
 6M5wQVCtFB5JUe1YeF3ZNtXIUMLmKyuqcUqsx0RmwD6l3PJvrN1XHYNMi
 8l1Drde5Cmd8ALnkqOI6TRpoUIGrIaPXcS/udFyiBG2eb0s+6RDc1oIgv
 Sj+NRKcDv75mtodGgV0EoT98I6v8itJVWrWpAuzQxO8WaN4PUunu98uv7 A==;
X-CSE-ConnectionGUID: mQbeonF2S8Wt979KDwvSoQ==
X-CSE-MsgGUID: MVHTN6c3RT6NHV7EkFTT6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60084477"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="60084477"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:57 -0800
X-CSE-ConnectionGUID: SJUoHJBLRiqCNgSwd6y4SQ==
X-CSE-MsgGUID: ltkxSa8pT5+PNuIeaGCwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="218756652"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:56 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/19] drm/i915/overlay: Abstract buffer (un)pinning
Date: Wed, 18 Feb 2026 17:27:58 +0200
Message-ID: <20260218152806.18885-12-ville.syrjala@linux.intel.com>
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

Make the buffer (un)pinning a bit more abstract so that
the display side of the code doesn't need to know about i915
specific things (i915_ggtt_offset() and i915_vma_unpin()).

In preparation for the full parent vs. display driver split
we'll also pass in the drm_device to these functions, although
not strictly needed yet.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 24 ++++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 9b5ae3f4f5bd..24579c9a7fec 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -780,7 +780,9 @@ static u32 overlay_cmd_reg(struct drm_intel_overlay_put_image *params)
 	return cmd;
 }
 
-static struct i915_vma *intel_overlay_pin_fb(struct drm_gem_object *obj)
+static struct i915_vma *i915_overlay_pin_fb(struct drm_device *drm,
+					    struct drm_gem_object *obj,
+					    u32 *offset)
 {
 	struct drm_i915_gem_object *new_bo = to_intel_bo(obj);
 	struct i915_gem_ww_ctx ww;
@@ -804,9 +806,17 @@ static struct i915_vma *intel_overlay_pin_fb(struct drm_gem_object *obj)
 	if (ret)
 		return ERR_PTR(ret);
 
+	*offset = i915_ggtt_offset(vma);
+
 	return vma;
 }
 
+static void i915_overlay_unpin_fb(struct drm_device *drm,
+				  struct i915_vma *vma)
+{
+	i915_vma_unpin(vma);
+}
+
 static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 				      struct drm_gem_object *obj,
 				      struct drm_intel_overlay_put_image *params)
@@ -818,7 +828,7 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 	bool scale_changed = false;
 	struct i915_vma *vma;
 	int ret, tmp_width;
-	u32 tmp;
+	u32 tmp, offset;
 
 	drm_WARN_ON(display->drm,
 		    !drm_modeset_is_locked(&display->drm->mode_config.connection_mutex));
@@ -829,7 +839,7 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 
 	atomic_inc(&display->restore.pending_fb_pin);
 
-	vma = intel_overlay_pin_fb(obj);
+	vma = i915_overlay_pin_fb(display->drm, obj, &offset);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto out_pin_section;
@@ -868,7 +878,7 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 	swidth = params->src_width;
 	swidthsw = calc_swidthsw(display, params->offset_Y, tmp_width);
 	sheight = params->src_height;
-	iowrite32(i915_ggtt_offset(vma) + params->offset_Y, &regs->OBUF_0Y);
+	iowrite32(offset + params->offset_Y, &regs->OBUF_0Y);
 	ostride = params->stride_Y;
 
 	if (params->flags & I915_OVERLAY_YUV_PLANAR) {
@@ -885,9 +895,9 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 				      params->src_width / uv_hscale);
 		swidthsw |= max(tmp_U, tmp_V) << 16;
 
-		iowrite32(i915_ggtt_offset(vma) + params->offset_U,
+		iowrite32(offset + params->offset_U,
 			  &regs->OBUF_0U);
-		iowrite32(i915_ggtt_offset(vma) + params->offset_V,
+		iowrite32(offset + params->offset_V,
 			  &regs->OBUF_0V);
 
 		ostride |= params->stride_UV << 16;
@@ -916,7 +926,7 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 	return 0;
 
 out_unpin:
-	i915_vma_unpin(vma);
+	i915_overlay_unpin_fb(display->drm, vma);
 out_pin_section:
 	atomic_dec(&display->restore.pending_fb_pin);
 
-- 
2.52.0

