Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83237C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E02710E916;
	Thu,  7 Dec 2023 15:58:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6210E917
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701964714; x=1733500714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m8aJFVMDRwXFVzE8mPJziKY5MJ7sWXYA6H5AwDoF3H8=;
 b=IGYf4uc/YE+5xWuf76LoBWuADnFiDiO4mpF+sEJ4z/iM6ZTH+9rS41tt
 e73gcmFL14F1y8L/0vWVNCCWDc0n6kfSJmpbCcu5N+u8kTHhH6wzA/qa/
 MFyI8Hxcb4YHdLfdiupxX4L4BALrBqydXqspM5NaFNQUcsBSMu0bRNoOq
 5yegSYud4U8Hc7PGUq3KwH2fmXFJNYxhHlxk43tGFeNt2JmJN81UnJc6o
 +0vajB72riPmXofSfy0TgPI3F+jx1+RuBIKX6h1IBkIYxESR1y9R/UeF+
 ZAo2XGyTMR4gIn0k+QY8sYzuhafkakc9zp27QWo4xBL4Jpr0bw6NTeXXh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384655286"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384655286"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765151681"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765151681"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:31 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 3/9] drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
Date: Thu,  7 Dec 2023 17:58:09 +0200
Message-Id: <20231207155815.2467082-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207155815.2467082-1-jouni.hogander@intel.com>
References: <20231207155815.2467082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are preparing for Xe driver. I915 and Xe object implementation are
differing. Do not use  i915_gem_object->base directly. Instead use
intel_bo_to_drm_bo.

Also use drm_gem_object_put instead of i915_gem_object_put. This should be
ok as i915_gem_object_put is really just doing 	__drm_gem_object_put.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231203114840.841311-2-jouni.hogander@intel.com
(cherry picked from commit 72207699ff76d4392244c8d9850aaef0160dc6b4)
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 77226ec00cb1..b17600aba577 100644
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
 
@@ -1889,7 +1889,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						unsigned int *handle)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_bo_to_drm_bo(obj)->dev);
 
 	if (i915_gem_object_is_userptr(obj)) {
 		drm_dbg(&i915->drm,
@@ -1897,7 +1897,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 		return -EINVAL;
 	}
 
-	return drm_gem_handle_create(file, &obj->base, handle);
+	return drm_gem_handle_create(file, intel_bo_to_drm_bo(obj), handle);
 }
 
 struct frontbuffer_fence_cb {
@@ -1975,7 +1975,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_i915_gem_object *obj,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_bo_to_drm_bo(obj)->dev);
 	struct drm_framebuffer *fb = &intel_fb->base;
 	u32 max_stride;
 	unsigned int tiling, stride;
@@ -2153,7 +2153,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	}
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	i915_gem_object_put(obj);
+	drm_gem_object_put(intel_bo_to_drm_bo(obj));
 
 	return fb;
 }
-- 
2.34.1

