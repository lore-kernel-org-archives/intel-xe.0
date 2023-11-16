Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB77FC54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 06:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781DF10E2A2;
	Thu, 16 Nov 2023 06:42:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF9B10E29E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 06:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700116947; x=1731652947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g0HOwGsJ3vb0Ux6WFC19RxGT/RLfstYUKJijH/rHMr0=;
 b=lKIDhHJiuqrnaEKOoHcYY0lrIVF+MObz2pnJwl2qIRvNnLmdHLRKpWCt
 LOfk+JL9cShZmAQHK1LUzKVC3zms1njD72GwsvVFfDLBE6FD3HfRpyEvS
 r7HybJJku0MeiEd3eqN3qILD1+vbLnSUO5pjHBjGzthq3xgxNjSgxNAQF
 dKHHhCxPJ/hBVE4h6953S9tV8fxMzl9urFLa1bleKElSxMR/75auLxJL9
 DHhuuEYKkGIf6DcaS23w92n6XRCR34b96qurkSRtCa4W6RKA6yHbwjsOu
 WVkdcOLVebk7/jMOYVZwV5j0kL/xetckv1sEmVTNdJk9P3sCU7CRHLAIS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381422796"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="381422796"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765216756"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="765216756"
Received: from dcarcium-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.40.251])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:25 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 08:41:42 +0200
Message-Id: <20231116064145.3969338-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116064145.3969338-1-jouni.hogander@intel.com>
References: <20231116064145.3969338-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/8] drm/i915/display: use intel_bo_to_drm_bo in
 intel_fb.c
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are preparing for Xe driver. I915 and Xe object implementation are
differing. Do not use  i915_gem_object->base directly. Instead use
intel_bo_to_drm_bo.

Also use drm_gem_object_put instead of i915_gem_object_put. This should be
ok as i915_gem_object_put is really just doing 	__drm_gem_object_put.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 748502936899..906db4ffd262 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1657,10 +1657,10 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
 		max_size = max(max_size, offset + size);
 	}
 
-	if (mul_u32_u32(max_size, tile_size) > obj->base.size) {
+	if (mul_u32_u32(max_size, tile_size) > intel_bo_to_drm_bo(obj)->size) {
 		drm_dbg_kms(&i915->drm,
 			    "fb too big for bo (need %llu bytes, have %zu bytes)\n",
-			    mul_u32_u32(max_size, tile_size), obj->base.size);
+			    mul_u32_u32(max_size, tile_size), intel_bo_to_drm_bo(obj)->size);
 		return -EINVAL;
 	}
 
@@ -1896,7 +1896,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						unsigned int *handle)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_bo_to_drm_bo(obj)->dev);
 
 	if (i915_gem_object_is_userptr(obj)) {
 		drm_dbg(&i915->drm,
@@ -1904,7 +1904,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 		return -EINVAL;
 	}
 
-	return drm_gem_handle_create(file, &obj->base, handle);
+	return drm_gem_handle_create(file, intel_bo_to_drm_bo(obj), handle);
 }
 
 struct frontbuffer_fence_cb {
@@ -1982,7 +1982,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_i915_gem_object *obj,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_bo_to_drm_bo(obj)->dev);
 	struct drm_framebuffer *fb = &intel_fb->base;
 	u32 max_stride;
 	unsigned int tiling, stride;
@@ -2159,7 +2159,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	}
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	i915_gem_object_put(obj);
+	drm_gem_object_put(intel_bo_to_drm_bo(obj));
 
 	return fb;
 }
-- 
2.34.1

