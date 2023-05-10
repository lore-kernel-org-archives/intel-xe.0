Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B08C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C54410E489;
	Wed, 10 May 2023 12:12:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE00A10E489
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720752; x=1715256752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AHemtuXSlzcWOmAnAAZkMj/rfmW9qfYdDYMDmzn8kHg=;
 b=cucoUUt2IQVKZzwkP8KtUGF7U7rhUJsFdGH8E60FFudGgLHwlvveFFPd
 icVPVpTCOukSpc3WK9nNETtL9xznUb9XENJU5gVxFZQ154urmIQaUJsc7
 WqwUoQwgwT+A5stMkvNaNJ2tXF4FeOP8UgMw+yGgTlFmdYmCHkUKTcI0I
 OqI5ht4ihCJJc+deRMiMXg5WNOVWUUYRs7gZY4zDJ76CvknvNsjUbQbTp
 YP4JEFPfaFocZkVtJMORZbq2wFaZm5O07onJG4QX2wsfxRxUBuGn/PDtO
 DXoaWCzTgTCHPnZOsl815vRj5hOXyOw31WVvF/nTASIj10LDhhx/xkboj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268113"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268113"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906213"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906213"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:37 +0300
Message-Id: <20230510121152.736148-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 08/23] drm/i915: Add getter for
 i915_gem_object->frontbuffer
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

Add getter/setter for i915_gem_object->frontbuffer and use it instead of
directly referring object's frontbuffer pointer.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 19 ++---
 .../gpu/drm/i915/display/intel_frontbuffer.h  | 27 -------
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 70 ++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  6 ++
 drivers/gpu/drm/i915/i915_vma.c               |  2 +-
 5 files changed, 82 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index d50a70595828..d3ca5fc6f6d6 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -237,7 +237,7 @@ static void frontbuffer_release(struct kref *ref)
 	}
 	spin_unlock(&obj->vma.lock);
 
-	RCU_INIT_POINTER(obj->frontbuffer, NULL);
+	i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock);
 
 	i915_active_fini(&front->write);
@@ -250,9 +250,9 @@ struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = intel_bo_to_i915(obj);
-	struct intel_frontbuffer *front;
+	struct intel_frontbuffer *front, *front_ret;
 
-	front = __intel_frontbuffer_get(obj);
+	front = i915_gem_object_get_frontbuffer(obj);
 	if (front)
 		return front;
 
@@ -269,17 +269,12 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 			 I915_ACTIVE_RETIRE_SLEEPS);
 
 	spin_lock(&i915->display.fb_tracking.lock);
-	if (rcu_access_pointer(obj->frontbuffer)) {
-		kfree(front);
-		front = rcu_dereference_protected(obj->frontbuffer, true);
-		kref_get(&front->ref);
-	} else {
-		i915_gem_object_get(obj);
-		rcu_assign_pointer(obj->frontbuffer, front);
-	}
+	front_ret = i915_gem_object_set_frontbuffer(obj, front);
 	spin_unlock(&i915->display.fb_tracking.lock);
+	if (front_ret != front)
+		kfree(front);
 
-	return front;
+	return front_ret;
 }
 
 void intel_frontbuffer_put(struct intel_frontbuffer *front)
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 3c474ed937fb..eeccc847331d 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -75,33 +75,6 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 
 void intel_frontbuffer_put(struct intel_frontbuffer *front);
 
-static inline struct intel_frontbuffer *
-__intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
-{
-	struct intel_frontbuffer *front;
-
-	if (likely(!rcu_access_pointer(obj->frontbuffer)))
-		return NULL;
-
-	rcu_read_lock();
-	do {
-		front = rcu_dereference(obj->frontbuffer);
-		if (!front)
-			break;
-
-		if (unlikely(!kref_get_unless_zero(&front->ref)))
-			continue;
-
-		if (likely(front == rcu_access_pointer(obj->frontbuffer)))
-			break;
-
-		intel_frontbuffer_put(front);
-	} while (1);
-	rcu_read_unlock();
-
-	return front;
-}
-
 struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 4666bb82f312..deb0b98d0ee3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -405,7 +405,7 @@ void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
 {
 	struct intel_frontbuffer *front;
 
-	front = __intel_frontbuffer_get(obj);
+	front = i915_gem_object_get_frontbuffer(obj);
 	if (front) {
 		intel_frontbuffer_flush(front, origin);
 		intel_frontbuffer_put(front);
@@ -417,7 +417,7 @@ void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
 {
 	struct intel_frontbuffer *front;
 
-	front = __intel_frontbuffer_get(obj);
+	front = i915_gem_object_get_frontbuffer(obj);
 	if (front) {
 		intel_frontbuffer_invalidate(front, origin);
 		intel_frontbuffer_put(front);
@@ -894,6 +894,72 @@ bool i915_gem_object_has_unknown_state(struct drm_i915_gem_object *obj)
 	return obj->mm.unknown_state;
 }
 
+/**
+ * i915_gem_object_get_frontbuffer - Get the object's frontbuffer
+ * @obj: The object whose frontbuffer to get.
+ *
+ * Get pointer to object's frontbuffer if such exists. Please note that RCU
+ * mechanism is used to handle e.g. ongoing removal of frontbuffer pointer.
+ *
+ * Return: pointer to object's frontbuffer is such exists or NULL
+ */
+struct intel_frontbuffer *
+i915_gem_object_get_frontbuffer(const struct drm_i915_gem_object *obj)
+{
+	struct intel_frontbuffer *front;
+
+	if (likely(!rcu_access_pointer(obj->frontbuffer)))
+		return NULL;
+
+	rcu_read_lock();
+	do {
+		front = rcu_dereference(obj->frontbuffer);
+		if (!front)
+			break;
+
+		if (unlikely(!kref_get_unless_zero(&front->ref)))
+			continue;
+
+		if (likely(front == rcu_access_pointer(obj->frontbuffer)))
+			break;
+
+		intel_frontbuffer_put(front);
+	} while (1);
+	rcu_read_unlock();
+
+	return front;
+}
+
+/**
+ * i915_gem_object_set_frontbuffer - Set the object's frontbuffer
+ * @obj: The object whose frontbuffer to set.
+ * @front: The frontbuffer to set
+ *
+ * Set object's frontbuffer pointer. If frontbuffer is already set for the
+ * object keep it and return it's pointer to the caller. Please note that RCU
+ * mechanism is used to handle e.g. ongoing removal of frontbuffer pointer.
+ *
+ * Return: pointer to frontbuffer which was set.
+ */
+struct intel_frontbuffer *
+i915_gem_object_set_frontbuffer(struct drm_i915_gem_object *obj,
+				struct intel_frontbuffer *front)
+{
+	struct intel_frontbuffer *front_ret = front;
+
+	if (!front) {
+		RCU_INIT_POINTER(obj->frontbuffer, NULL);
+	} else if (rcu_access_pointer(obj->frontbuffer)) {
+		front_ret = rcu_dereference_protected(obj->frontbuffer, true);
+		kref_get(&front_ret->ref);
+	} else {
+		drm_gem_object_get(&intel_bo_to_drm_bo(obj));
+		rcu_assign_pointer(obj->frontbuffer, front);
+	}
+
+	return front_ret;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 885ccde9dc3c..126d5e38461f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -883,4 +883,10 @@ static inline int i915_gem_object_userptr_validate(struct drm_i915_gem_object *o
 
 #endif
 
+struct intel_frontbuffer *
+i915_gem_object_get_frontbuffer(const struct drm_i915_gem_object *obj);
+struct intel_frontbuffer *
+i915_gem_object_set_frontbuffer(struct drm_i915_gem_object *obj,
+				struct intel_frontbuffer *front);
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 20a44788999e..7baaf999f1d6 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1906,7 +1906,7 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 	if (flags & EXEC_OBJECT_WRITE) {
 		struct intel_frontbuffer *front;
 
-		front = __intel_frontbuffer_get(obj);
+		front = i915_gem_object_get_frontbuffer(obj);
 		if (unlikely(front)) {
 			if (intel_frontbuffer_invalidate(front, ORIGIN_CS))
 				i915_active_add_request(&front->write, rq);
-- 
2.34.1

