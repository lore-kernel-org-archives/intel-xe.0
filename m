Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1BEEE6432
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDC010E5C9;
	Fri, 15 Sep 2023 07:49:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD7710E5C9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694764149; x=1726300149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gRlaroBKSCWhxMMHBkOMEUFS8sXVxYhdXycMkVNMA8o=;
 b=JJE+ofYfyx/VeXuQmLya0/XYAMp/ieE9x3Xln2xLk9Z3Otq524qJs8Ux
 8B9j/dQiwXrsKhIV3NXTh0pkAwJkCk/XNz2JPnuGs0UugJNQtlpc16Mwm
 /GCpHuYxfRht0BsguK6UorSaTaLacTgqprmndae9ZlB1bpsLRvLHG25Su
 SGXePir9J183fbKXdE/ZnGjwatjcUsArmB6mZ0WyvgBOCQGr/UOJyOWqL
 MKiuydZ678z+eoqUIsTOSLPkwIQ3iU6nodUzsAsGDuDtCitqCFwILu/uS
 q5tUDlUuJtM1Js3I8xxsh6UU4Ihtv/vvPrO43OoUG6AzCZY7QDfYAalmG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369507606"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="369507606"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075711662"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="1075711662"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:45 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:48:17 +0300
Message-Id: <20230915074818.903353-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
References: <20230915074818.903353-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/7] drm/i915: Handle dma fences in dirtyfb
 callback
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

Take into account dma fences in dirtyfb callback. If there is no
unsignaled dma fences perform flush immediately. If there are
unsignaled dma fences perform invalidate and add callback which will
queue flush when the fence gets signaled.

v4:
 - Move invalidate before callback is added
v3:
 - Check frontbuffer bits before adding any fence fb
 - Flush only when adding fence cb succeeds
v2: Use dma_resv_get_singleton

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230901093500.3463046-5-jouni.hogander@intel.com
(cherry picked from commit 1bb2af547a4bc2e053b398573d8ec7c3bf5ce69e)
---
 drivers/gpu/drm/i915/display/intel_fb.c | 60 +++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 8891ff14a446..80b19d4b3086 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -8,6 +8,9 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper.h>
 
+#include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
+
 #include "i915_drv.h"
 #include "intel_display.h"
 #include "intel_display_types.h"
@@ -1930,6 +1933,21 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 	return drm_gem_handle_create(file, &obj->ttm.base, handle);
 }
 
+struct frontbuffer_fence_cb {
+	struct dma_fence_cb base;
+	struct intel_frontbuffer *front;
+};
+
+static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
+					      struct dma_fence_cb *data)
+{
+	struct frontbuffer_fence_cb *cb = container_of(data, typeof(*cb), base);
+
+	intel_frontbuffer_queue_flush(cb->front);
+	kfree(cb);
+	dma_fence_put(dma);
+}
+
 static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_file *file,
 					unsigned int flags, unsigned int color,
@@ -1937,11 +1955,47 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					unsigned int num_clips)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
+	struct dma_fence *fence;
+	struct frontbuffer_fence_cb *cb;
+	int ret = 0;
 
-	i915_gem_object_flush_if_display(obj);
-	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
+	if (!atomic_read(&front->bits))
+		return 0;
 
-	return 0;
+	if (dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(false)))
+		goto flush;
+
+	ret = dma_resv_get_singleton(obj->base.resv, dma_resv_usage_rw(false),
+				     &fence);
+	if (ret || !fence)
+		goto flush;
+
+	cb = kmalloc(sizeof(*cb), GFP_KERNEL);
+	if (!cb) {
+		dma_fence_put(fence);
+		ret = -ENOMEM;
+		goto flush;
+	}
+
+	cb->front = front;
+
+	intel_frontbuffer_invalidate(front, ORIGIN_DIRTYFB);
+
+	ret = dma_fence_add_callback(fence, &cb->base,
+				     intel_user_framebuffer_fence_wake);
+	if (ret) {
+		intel_user_framebuffer_fence_wake(fence, &cb->base);
+		if (ret == -ENOENT)
+			ret = 0;
+	}
+
+	return ret;
+
+flush:
+	i915_gem_object_flush_if_display(obj);
+	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
+	return ret;
 }
 
 static const struct drm_framebuffer_funcs intel_fb_funcs = {
-- 
2.34.1

