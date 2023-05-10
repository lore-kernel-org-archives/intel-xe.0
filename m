Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD06C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65F210E487;
	Wed, 10 May 2023 12:12:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8941B10E49C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720746; x=1715256746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xjso0mhCIDPhgC1uyv4HCBwV6OgtW36J0XidNoDUXrw=;
 b=RY5U8P60YjnusRvXEL+hNuoNH/N2hOgPxVnvPc93sLxEPMUlB/ArS+ef
 j/MFrXqNnxGK5v6HCuqg54UYHWRpkuuj5455ZIcwwFdnG9Nk2qq/or9L3
 iugzBbikILXebYVuJd8N4t73eGW25KTpxVvWUasYPhw1GYIE0P2rLhtyk
 necEpZZDAjO94YZjuuVUlG0gFdonbaDwNzJY/2Yq31/9Ma2Q3ROWg7Ltm
 lv8ApIJumpVUIdPNIxeo5NKe3kmfUKamdT9mgKXg5nrTiZ8oZobt2roVm
 mlX8Duz5BNUqow8S/ZQ/WwunV+xsbsHUq2RbiuENnVCBrPCu4HZp7gsN7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268099"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268099"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906132"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906132"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:23 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:35 +0300
Message-Id: <20230510121152.736148-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 06/23] drm/i915: Add macros to get i915
 device from i915_gem_object
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper macro to kill couple of #ifdefs and use it.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/i915/display/intel_frontbuffer.c   | 18 +++++++++---------
 .../gpu/drm/i915/gem/i915_gem_object_types.h   |  3 +++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 17a7aa8b28c2..d50a70595828 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -167,7 +167,7 @@ void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = intel_bo_to_i915(front->obj);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -188,7 +188,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = intel_bo_to_i915(front->obj);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -221,14 +221,14 @@ static void frontbuffer_retire(struct i915_active *ref)
 }
 
 static void frontbuffer_release(struct kref *ref)
-	__releases(&to_i915(front->obj->base.dev)->display.fb_tracking.lock)
+	__releases(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock)
 {
 	struct intel_frontbuffer *front =
 		container_of(ref, typeof(*front), ref);
 	struct drm_i915_gem_object *obj = front->obj;
 	struct i915_vma *vma;
 
-	drm_WARN_ON(obj->base.dev, atomic_read(&front->bits));
+	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
 	spin_lock(&obj->vma.lock);
 	for_each_ggtt_vma(vma, obj) {
@@ -238,7 +238,7 @@ static void frontbuffer_release(struct kref *ref)
 	spin_unlock(&obj->vma.lock);
 
 	RCU_INIT_POINTER(obj->frontbuffer, NULL);
-	spin_unlock(&to_i915(obj->base.dev)->display.fb_tracking.lock);
+	spin_unlock(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock);
 
 	i915_active_fini(&front->write);
 
@@ -249,7 +249,7 @@ static void frontbuffer_release(struct kref *ref)
 struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = intel_bo_to_i915(obj);
 	struct intel_frontbuffer *front;
 
 	front = __intel_frontbuffer_get(obj);
@@ -286,7 +286,7 @@ void intel_frontbuffer_put(struct intel_frontbuffer *front)
 {
 	kref_put_lock(&front->ref,
 		      frontbuffer_release,
-		      &to_i915(front->obj->base.dev)->display.fb_tracking.lock);
+		      &intel_bo_to_i915(front->obj)->display.fb_tracking.lock);
 }
 
 /**
@@ -315,13 +315,13 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 	BUILD_BUG_ON(I915_MAX_PLANES > INTEL_FRONTBUFFER_BITS_PER_PIPE);
 
 	if (old) {
-		drm_WARN_ON(old->obj->base.dev,
+		drm_WARN_ON(&intel_bo_to_i915(new->obj)->drm,
 			    !(atomic_read(&old->bits) & frontbuffer_bits));
 		atomic_andnot(frontbuffer_bits, &old->bits);
 	}
 
 	if (new) {
-		drm_WARN_ON(new->obj->base.dev,
+		drm_WARN_ON(&intel_bo_to_i915(new->obj)->drm,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 830c11431ee8..17db49464597 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -673,6 +673,9 @@ struct drm_i915_gem_object {
 	};
 };
 
+#define intel_bo_to_drm_bo(bo) ((bo)->base)
+#define intel_bo_to_i915(bo) to_i915(intel_bo_to_drm_bo(bo).dev)
+
 static inline struct drm_i915_gem_object *
 to_intel_bo(struct drm_gem_object *gem)
 {
-- 
2.34.1

