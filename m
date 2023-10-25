Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFCFC25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925FF10E592;
	Wed, 25 Oct 2023 10:21:04 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2610E633
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:21:00 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 12:20:41 +0200
Message-Id: <20231025102045.817068-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025102045.817068-1-maarten.lankhorst@linux.intel.com>
References: <20231025102045.817068-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/10] revert intel_frontbuffer changes.
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

No functional change, just things removed.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 7 ++++---
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 4 ----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index d64ce5bfeca82..2ea37c0414a95 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -190,7 +190,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = intel_bo_to_i915((front->obj));
+	struct drm_i915_private *i915 = intel_bo_to_i915(front->obj);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -259,6 +259,7 @@ static void frontbuffer_release(struct kref *ref)
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
 	i915_ggtt_clear_scanout(obj);
+
 	ret = i915_gem_object_set_frontbuffer(obj, NULL);
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, ret);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
@@ -289,12 +290,12 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 			 frontbuffer_retire,
 			 I915_ACTIVE_RETIRE_SLEEPS);
 	INIT_WORK(&front->flush_work, intel_frontbuffer_flush_work);
+
 	spin_lock(&i915->display.fb_tracking.lock);
 	cur = i915_gem_object_set_frontbuffer(obj, front);
 	spin_unlock(&i915->display.fb_tracking.lock);
 	if (cur != front)
 		kfree(front);
-
 	return cur;
 }
 
@@ -337,7 +338,7 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 	}
 
 	if (new) {
-		drm_WARN_ON(&intel_bo_to_i915(old->obj)->drm,
+		drm_WARN_ON(&intel_bo_to_i915(new->obj)->drm,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 00467d513e74d..abb51e8bb9200 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,10 +28,6 @@
 #include <linux/bits.h>
 #include <linux/kref.h>
 
-#ifndef I915
-#include "xe_bo.h"
-#endif
-
 #include "i915_active_types.h"
 
 struct drm_i915_private;
-- 
2.39.2

