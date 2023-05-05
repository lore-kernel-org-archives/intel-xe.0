Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0DC77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698FD10E5A7;
	Fri,  5 May 2023 08:30:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BED510E5A7
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275450; x=1714811450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XOQX7p2B75QWFd5F3MHiGGxMxc3m3Fq9JkRZaQuzObo=;
 b=nKdERtk3ayan+hqc9eZ5uTE9lRYyrCbgMKv/mpiHMhBM7g7Pl44cweB2
 2wg8cA9NB7yjw7oisjIx5OW9sE3KKW5sgoO/xr12O2CIMV3M1AGME1zd1
 X9P/nOQOszYjOJ5hT7ckaJBarqSU7z0PPtXe64CVS85XT8u0V2z/bCk+l
 ocf/nBPgQQ1hUlwrWznO85yWokZjfnULQX2oI7fkRrPCAtE+o5cLYA7bv
 GB/FgdMdIfgMSpFGIhqSbnCMVPM3IR6rcJjrKI7f5YQ9rUzHxq4OAMHbq
 nNah85gM/TjG+6DZp6nQCrMBPw8Szsje/2Mki8xf2z5tFd62bH7k3sxJ1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783201"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783201"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749136"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749136"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:47 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:42 +0300
Message-Id: <20230505082956.2247875-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 06/20] drm/i915: Add macros to get i915
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
Cc: jani.nikula@intel.com,
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
index 783ab1ab7f62..cdd214413746 100644
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
 
 	front = __intel_frontbuffer_get(obj->frontbuffer);
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

