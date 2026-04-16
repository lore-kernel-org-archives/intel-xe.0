Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9FDF8D766
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 17:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAE010E922;
	Thu, 16 Apr 2026 17:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gj66zesI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEFC10E925;
 Thu, 16 Apr 2026 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776361526; x=1807897526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZzT1mkGM0G3vct20/f1QjNKT6HgkikSKK1sLXwM/uR8=;
 b=gj66zesIUQhbooYfMHATUPwIMbxDKBUqCNGJoyHv87fYDKRq8pPhW0f+
 MCx0f4tcscjnnBCfOOQi5qCiMaNXPqtNd7dFht7Fc8YfbWNcdpzvH92pg
 G+vYTYSqMQBLOw3iKOjlHzuP3ht1HFQp3a05lfJYvQjsrFbxKGH+C2e7i
 XM7chKbIDXpgebCr1JwenI4glaDEKb1dKj6p98ezDKA2eKDZZPz0Z6/bS
 1AJzpwqcmA3peVM1xpa5izXMo79piB7DBFBXNd57xaFbG26ec3C3MotkV
 tec7kWkwqwwXWft45oPMxmZUaOVNpKf0t4pf0uN7C2btROXY5sYj0URK0 Q==;
X-CSE-ConnectionGUID: L+Dc3y/PQcCDYFg3bN0hDg==
X-CSE-MsgGUID: o2yW5Hh4Rsuyvwu+JEqCLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77279651"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77279651"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:45:20 -0700
X-CSE-ConnectionGUID: H+30y3W8Qp63NPu581fRPg==
X-CSE-MsgGUID: hxApLztDT0uppPHzRK/FaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229960354"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:45:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/11] drm/i915: Introduce pin_params.needs_low_address
Date: Thu, 16 Apr 2026 20:44:42 +0300
Message-ID: <20260416174448.28264-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
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

Add a new flag pin_params.needs_low_address to inform the pinning
code that the display needs a low ggtt address.

The goal is to eliminate all display specific stuff from
the low level pinning code (the direct intel_plane_needs_low_addres())
call in this case).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb_pin.h | 1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c  | 2 ++
 drivers/gpu/drm/i915/i915_fb_pin.c          | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/drm/i915/display/intel_fb_pin.h
index bcf5a1f46092..cf54a96569de 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
@@ -20,6 +20,7 @@ struct intel_fb_pin_params {
 	unsigned int phys_alignment;
 	unsigned int vtd_guard;
 	bool needs_cpu_lmem_access;
+	bool needs_low_address;
 };
 
 struct i915_vma *
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 136fa827c8f0..4c3e54acde81 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -55,6 +55,7 @@
 #include "intel_fb_pin.h"
 #include "intel_fbdev.h"
 #include "intel_frontbuffer.h"
+#include "intel_plane.h"
 
 struct intel_fbdev {
 	struct intel_framebuffer *fb;
@@ -314,6 +315,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	pin_params.vtd_guard = intel_fb_view_vtd_guard(&fb->base,
 						       &fb->normal_view,
 						       DRM_MODE_ROTATE_0);
+	pin_params.needs_low_address = intel_plane_needs_low_address(display);
 
 	vma = intel_fb_pin_to_ggtt(&fb->base, &pin_params, NULL);
 	if (IS_ERR(vma)) {
diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index a3e5107c12f0..97e4cdfd2447 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -142,7 +142,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
 
 	pinctl = 0;
 	/* PIN_MAPPABLE limits the address to GMADR size */
-	if (intel_plane_needs_low_address(display))
+	if (pin_params->needs_low_address)
 		pinctl |= PIN_MAPPABLE;
 
 	i915_gem_ww_ctx_init(&ww, true);
@@ -256,6 +256,7 @@ intel_plane_fb_vtd_guard(const struct intel_plane_state *plane_state)
 int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 		       const struct intel_plane_state *old_plane_state)
 {
+	struct intel_display *display = to_intel_display(plane_state);
 	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	const struct intel_framebuffer *fb =
@@ -269,6 +270,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 			.phys_alignment = intel_plane_fb_min_phys_alignment(plane_state),
 			.vtd_guard = intel_plane_fb_vtd_guard(plane_state),
 			.needs_cpu_lmem_access = intel_fb_needs_cpu_access(&fb->base),
+			.needs_low_address = intel_plane_needs_low_address(display),
 		};
 		int fence_id = -1;
 
-- 
2.52.0

