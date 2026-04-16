Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13C4F8D765
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 17:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BD110E92F;
	Thu, 16 Apr 2026 17:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HV+Q6P8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CC710E92C;
 Thu, 16 Apr 2026 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776361540; x=1807897540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vbzo/hZ3eGwdUFzGGphabC++DL6brY9cA2d7g0io828=;
 b=HV+Q6P8FricvXZjU5kqf0/8Y/bDYxh0rBjPaU+g/K9Hb2fefNbfM8pUk
 ww57a0iCldsKHMUd8zIg3G1AaIrP+E8rmzgYUVWtBPAWiuWNVSxNPAKKV
 KfUrVpXQOtgQYDdbw45hzJZk3gtfTjuejmqruc3TF0x6QpTBgcYfNdxJr
 pjxZL7iE4rLBt+HN8gOe9gIKOYcfotLu4VbCp+fYZb3NwmO6UDPjTMmul
 TzfDD/2rbufiunsPc9f8lKxOZ92Nzda2EpjYg3Xf1swV12UMME8cTKA8i
 IsGp7SSb7GUGzF+OIDIjZx3jmuVl987KAJwk8NTgg3VlPJNONe93+QgfG w==;
X-CSE-ConnectionGUID: btHwO+zPSleOxsFGnWy7Ng==
X-CSE-MsgGUID: 5HV4t6UXTfyNFcmeai/8lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77279726"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77279726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:45:39 -0700
X-CSE-ConnectionGUID: 951uGzs1QF+5OqSacUykeQ==
X-CSE-MsgGUID: 96XDwrZGRw22Ib0c+Iuzjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229797846"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:45:39 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/11] drm/xe: Eliminate intel_fb_uses_dpt() call from
 __xe_pin_fb_vma()
Date: Thu, 16 Apr 2026 20:44:46 +0300
Message-ID: <20260416174448.28264-11-ville.syrjala@linux.intel.com>
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

Move the intel_fb_uses_dpt() out from __xe_pin_fb_vma() into
intel_plane_pin_fb() so the we don't any display stuff that deep
in the pinning code.

And intel_fb_pin_to_ggtt() can just say "this does not need DPT"
always since it's specifically about pinning the fb into GGTT.
The previous logic here was kinda insane with the high level code
assuming GGTT, and low level code potentially deciding otherwise.
In practice it should have been fine because intel_fb_pin_to_ggtt()
only gets used from the intiial_palne code, and there we are
not supposed to be have a framebuffer that needs DPT.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a4eb06cfa769..44562769fbc9 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -318,7 +318,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	return ret;
 }
 
-static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
+static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb, bool is_dpt,
 					const struct intel_fb_pin_params *pin_params)
 {
 	struct drm_device *dev = fb->base.dev;
@@ -375,7 +375,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		goto err;
 
 	vma->bo = bo;
-	if (intel_fb_uses_dpt(&fb->base))
+	if (is_dpt)
 		ret = __xe_pin_fb_vma_dpt(fb, pin_params, vma);
 	else
 		ret = __xe_pin_fb_vma_ggtt(fb, pin_params, vma);
@@ -419,7 +419,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
 	if (out_fence_id)
 		*out_fence_id = -1;
 
-	return __xe_pin_fb_vma(to_intel_framebuffer(fb), pin_params);
+	return __xe_pin_fb_vma(to_intel_framebuffer(fb), false, pin_params);
 }
 
 void intel_fb_unpin_vma(struct i915_vma *vma, int fence_id)
@@ -483,7 +483,8 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 	/* We reject creating !SCANOUT fb's, so this is weird.. */
 	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
 
-	vma = __xe_pin_fb_vma(intel_fb, &pin_params);
+	vma = __xe_pin_fb_vma(intel_fb, intel_fb_uses_dpt(&intel_fb->base),
+			      &pin_params);
 
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
-- 
2.52.0

