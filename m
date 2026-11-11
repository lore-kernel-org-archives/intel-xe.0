Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8D606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPNCpzH9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A1310FB3F;
	Wed, 11 Nov 2026 11:20:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686510FB1A;
 Wed, 11 Nov 2026 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396042; x=1825932042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0oRqKH6vsKVuuVzCj+fyGh4OspDQpJUjTehxcOEehy4=;
 b=mPNCpzH9+aY6N9BGKRvDmQuc5HDVFB4Wn0p7QhSc/B2QkZ43zWom8iWa
 B+7suLP2E18UAgQ7PKQLdel7njOJ57x2WjlOBuCSUL386vz9AQjYMp/mP
 3IMPy+k94yfKyNWZaS8xpGj16vMeHtyL9mgHb18YCu0zZ3JNsz4tYZfA5
 2ZfNTB1FYSIFC+4bz/i+4qGdCCxpsBaT11Qlt2w3+2FbK7BM5vGAzqI/Y
 hV+uZ7l8/iPbnjq9nHaVvpD3BDliD7BZQ1eHHjE1PQsuW/adNZcwuZFIz
 yndWiq2+a4KxTOiblmlBfCVZv8lLfb7zOO5Xuxjxc+KQ4zFbBrhSGP5Gc w==;
X-CSE-ConnectionGUID: z9dJj4eeR+6E47nFIHmyWA==
X-CSE-MsgGUID: D45aoPRXTsufl2+D2xUBfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3162131"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3162131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:42 -0800
X-CSE-ConnectionGUID: 4yQVGxZfSyaXpYZtRWAk9w==
X-CSE-MsgGUID: Ed7lQX7NS6SiEs5qBmQpbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8493223"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/13] drm/i915/vma: Introduce i915_vma_lookup()
Date: Wed, 11 Nov 2026 13:20:02 +0200
Message-ID: <20261111112007.16790-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Expose a "lookup only" variant of i915_vma_instance()
(which will create the vma if it didn't exist before)
as i915_vma_lookup(). This can be used when we know that
the vma must already exists (eg. it's currently pinned).
Not magically creating the vma if we screw up badly could
help with catching the bug earlier.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 39 ++++++++++++++++++++++++++-------
 drivers/gpu/drm/i915/i915_vma.h |  5 +++++
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 52f82772a1c0..daf933036ce0 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -285,9 +285,9 @@ vma_create(struct drm_i915_gem_object *obj,
 }
 
 static struct i915_vma *
-i915_vma_lookup(struct drm_i915_gem_object *obj,
-	   struct i915_address_space *vm,
-	   const struct intel_gtt_view *view)
+__i915_vma_lookup(struct drm_i915_gem_object *obj,
+		  struct i915_address_space *vm,
+		  const struct intel_gtt_view *view)
 {
 	struct rb_node *rb;
 
@@ -309,6 +309,34 @@ i915_vma_lookup(struct drm_i915_gem_object *obj,
 	return NULL;
 }
 
+/**
+ * i915_vma_lookup - return the singleton instance of the VMA if it exists
+ * @obj: parent &struct drm_i915_gem_object to be mapped
+ * @vm: address space in which the mapping is located
+ * @view: additional mapping requirements
+ *
+ * i915_vma_lookup() look up an existinbg VMA of the @obj in the @vm with
+ * the same @view characteristics. If no match is not found NULL is returned.
+ *
+ * Returns the vma, or NULL.
+ */
+struct i915_vma *
+i915_vma_lookup(struct drm_i915_gem_object *obj,
+		struct i915_address_space *vm,
+		const struct intel_gtt_view *view)
+{
+	struct i915_vma *vma;
+
+	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
+	GEM_BUG_ON(!kref_read(&vm->ref));
+
+	spin_lock(&obj->vma.lock);
+	vma = __i915_vma_lookup(obj, vm, view);
+	spin_unlock(&obj->vma.lock);
+
+	return vma;
+}
+
 /**
  * i915_vma_instance - return the singleton instance of the VMA
  * @obj: parent &struct drm_i915_gem_object to be mapped
@@ -329,12 +357,7 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
 {
 	struct i915_vma *vma;
 
-	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
-	GEM_BUG_ON(!kref_read(&vm->ref));
-
-	spin_lock(&obj->vma.lock);
 	vma = i915_vma_lookup(obj, vm, view);
-	spin_unlock(&obj->vma.lock);
 
 	/* vma_create() will resolve the race if another creates the vma */
 	if (unlikely(!vma))
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 85c2408f1823..5327cafa6edb 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -45,6 +45,11 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
 		  struct i915_address_space *vm,
 		  const struct intel_gtt_view *view);
 
+struct i915_vma *
+i915_vma_lookup(struct drm_i915_gem_object *obj,
+		struct i915_address_space *vm,
+		const struct intel_gtt_view *view);
+
 void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 #define I915_VMA_RELEASE_MAP BIT(0)
 
-- 
2.56.0

