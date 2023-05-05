Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534C8C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B7510E5A6;
	Fri,  5 May 2023 08:31:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBA310E5A6
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275506; x=1714811506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ij+t9vjjHSc+qptr2YUAfp0C+YA+aYmNm0CkYtjEofk=;
 b=DItbbJFU/PczoSuR9u+Qga4/noFcqmW15rsXuwVSBGpOZ1lk25lsdfcs
 vTQ3stGlO2/2y9E1z5tW4ChOwOXSFjRS1wXidSa7bm2zPc6Hf514KlZwd
 0FRSpNjZwEObwyQ6Tl5xd9+RWye38tSu5bsxCoeB+OxPahYFeKgDYBJo2
 fAVwOr4qxMBlOjJ39mqBQffvHT9naWjnoDAL9we5mbbDf/mtYDX5o0VOr
 45rw0z5Xut/AHDbCqdd5VmQ4NSPkmR+EkgLouWIDXslwm2IU7sdz+VeoA
 L8fRrtIpHlxSXy0LM6pnHLsPGfJOST19NfP+S7VrX8n7Ni60+pgyPXHCF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783346"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783346"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749709"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749709"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:55 +0300
Message-Id: <20230505082956.2247875-20-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 19/20] drm/i915: Handle dma fences in dirtyfb
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Take into account dma fences in dirtyfb callback. If there is no
unsignaled dma fences perform flush immediately. If there are
unsignaled dma fences perform invalidate and add callback which will
queue flush when the fence gets signaled.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 55 +++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index fa4464d433b7..fc325f2299a4 100644
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
@@ -1888,6 +1891,20 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 }
 
 #ifdef I915
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
+}
+
 static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_file *file,
 					unsigned int flags, unsigned int color,
@@ -1895,11 +1912,43 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					unsigned int num_clips)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret;
+
+	if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj).resv, dma_resv_usage_rw(false))) {
+		intel_bo_flush_if_display(obj);
+		intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
+		return 0;
+	}
 
-	intel_bo_flush_if_display(obj);
-	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
+	intel_frontbuffer_invalidate(front, ORIGIN_DIRTYFB);
 
-	return 0;
+	dma_resv_iter_begin(&cursor, intel_bo_to_drm_bo(obj).resv,
+			    dma_resv_usage_rw(false));
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		struct frontbuffer_fence_cb *cb =
+			kmalloc(sizeof(struct frontbuffer_fence_cb), GFP_KERNEL);
+		if (!cb) {
+			ret = -ENOMEM;
+			break;
+		}
+		cb->front = front;
+
+		ret = dma_fence_add_callback(fence, &cb->base,
+					     intel_user_framebuffer_fence_wake);
+		if (ret) {
+			intel_user_framebuffer_fence_wake(fence, &cb->base);
+			if (ret == -ENOENT)
+				ret = 0;
+			else
+				break;
+		}
+	}
+	dma_resv_iter_end(&cursor);
+
+	return ret;
 }
 #endif
 
-- 
2.34.1

