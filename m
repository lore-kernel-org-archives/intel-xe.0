Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315C606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T49UlE+p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12BE10FB4A;
	Wed, 11 Nov 2026 11:21:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9765F10FB46;
 Wed, 11 Nov 2026 11:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396060; x=1825932060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qlnfn+RJ5mt8dPQWBqJlZYXmFOagziQOIVmHod5l5ho=;
 b=T49UlE+pU2V4fuPY4e5r7zJc29v7JV2xmnVe1fuzEJCdF+x8whKapnl/
 /TXQu0hSCYfH+lLN3LrwwuF+j9ErRo1Mjl1Aht+AfVI7MDBSgaX38PLS+
 0nqk04eqpsFz06PyoVMAAdktjKidePPedsKJKH3CLchOMGiFyHFyUlOUk
 9V36t0pL5Y7CErkOOK0BBK+ehinx5QW8LWE0EWl+isaXvfuhUYxuShzbz
 IOjBEDgCSA3A/VmjGV8zTxhOSTnQZFySNGDtz/47qWcyBaoZjbn0JKfam
 2YU1Tg2Hie4WeMgzm9f+WGHdMKdfFMxuhHLp+eIprKPy3177K/m243Gl1 w==;
X-CSE-ConnectionGUID: ZmkO+Y/iTdWwT36+h4WNdA==
X-CSE-MsgGUID: qyHjaTwLTXyl4BU1N4inXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3195921"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3195921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:21:00 -0800
X-CSE-ConnectionGUID: WAZdijX9QkeaBhnZbTYaOg==
X-CSE-MsgGUID: YHFuxcENT4i+jJrnWpcz0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8287863"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:59 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/13] drm/i915/dpt: s/struct intel_dpt/struct i915_dpt/
Date: Wed, 11 Nov 2026 13:20:07 +0200
Message-ID: <20261111112007.16790-14-ville.syrjala@linux.intel.com>
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

struct intel_dpt is now completely encased inside i915 code, so
rename it to struct i915_dpt.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_dpt.c    | 60 +++++++++++++++---------------
 drivers/gpu/drm/i915/i915_dpt.h    | 16 ++++----
 drivers/gpu/drm/i915/i915_fb_pin.c |  6 +--
 3 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 4957e172340e..525c5c7d0815 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -13,7 +13,7 @@
 #include "i915_dpt.h"
 #include "i915_drv.h"
 
-struct intel_dpt {
+struct i915_dpt {
 	struct i915_address_space vm;
 
 	struct drm_i915_gem_object *obj;
@@ -23,14 +23,14 @@ struct intel_dpt {
 	struct list_head ggtt_link;
 };
 
-struct intel_dpt *i915_vm_to_dpt(struct i915_address_space *vm)
+struct i915_dpt *i915_vm_to_dpt(struct i915_address_space *vm)
 {
-	BUILD_BUG_ON(offsetof(struct intel_dpt, vm));
+	BUILD_BUG_ON(offsetof(struct i915_dpt, vm));
 	drm_WARN_ON(&vm->i915->drm, !vm->is_dpt);
-	return container_of(vm, struct intel_dpt, vm);
+	return container_of(vm, struct i915_dpt, vm);
 }
 
-struct i915_address_space *i915_dpt_to_vm(struct intel_dpt *dpt)
+struct i915_address_space *i915_dpt_to_vm(struct i915_dpt *dpt)
 {
 	return &dpt->vm;
 }
@@ -46,7 +46,7 @@ static void dpt_insert_page(struct i915_address_space *vm,
 			    unsigned int pat_index,
 			    u32 flags)
 {
-	struct intel_dpt *dpt = i915_vm_to_dpt(vm);
+	struct i915_dpt *dpt = i915_vm_to_dpt(vm);
 	gen8_pte_t __iomem *base = dpt->iomem;
 
 	gen8_set_pte(base + offset / I915_GTT_PAGE_SIZE,
@@ -58,7 +58,7 @@ static void dpt_insert_entries(struct i915_address_space *vm,
 			       unsigned int pat_index,
 			       u32 flags)
 {
-	struct intel_dpt *dpt = i915_vm_to_dpt(vm);
+	struct i915_dpt *dpt = i915_vm_to_dpt(vm);
 	gen8_pte_t __iomem *base = dpt->iomem;
 	const gen8_pte_t pte_encode = vm->pte_encode(0, pat_index, flags);
 	struct sgt_iter sgt_iter;
@@ -118,12 +118,12 @@ static void dpt_unbind_vma(struct i915_address_space *vm,
 
 static void dpt_cleanup(struct i915_address_space *vm)
 {
-	struct intel_dpt *dpt = i915_vm_to_dpt(vm);
+	struct i915_dpt *dpt = i915_vm_to_dpt(vm);
 
 	i915_gem_object_put(dpt->obj);
 }
 
-struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignment)
+struct i915_vma *i915_dpt_pin_to_ggtt(struct i915_dpt *dpt, unsigned int alignment)
 {
 	struct drm_i915_private *i915 = dpt->vm.i915;
 	struct ref_tracker *wakeref;
@@ -176,26 +176,26 @@ void i915_dpt_unpin_from_ggtt(struct i915_vma *vma)
 	i915_vma_put(vma);
 }
 
-static void i915_dpt_get(struct intel_dpt *dpt)
+static void i915_dpt_get(struct i915_dpt *dpt)
 {
 	i915_vm_get(&dpt->vm);
 }
 
-static void i915_dpt_put(struct intel_dpt *dpt)
+static void i915_dpt_put(struct i915_dpt *dpt)
 {
 	i915_vm_put(&dpt->vm);
 }
 
-static void i915_dpt_free(struct intel_dpt *dpt)
+static void i915_dpt_free(struct i915_dpt *dpt)
 {
 	dpt->obj->is_dpt = false;
 	i915_dpt_put(dpt);
 }
 
-static struct intel_dpt *__i915_dpt_lookup(struct drm_i915_gem_object *obj,
-					   const struct intel_gtt_view *view)
+static struct i915_dpt *__i915_dpt_lookup(struct drm_i915_gem_object *obj,
+					  const struct intel_gtt_view *view)
 {
-	struct intel_dpt *dpt;
+	struct i915_dpt *dpt;
 
 	lockdep_assert_held(&obj->dpt_lock);
 
@@ -207,10 +207,10 @@ static struct intel_dpt *__i915_dpt_lookup(struct drm_i915_gem_object *obj,
 	return NULL;
 }
 
-struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
-				  const struct intel_gtt_view *view)
+struct i915_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
+				 const struct intel_gtt_view *view)
 {
-	struct intel_dpt *dpt;
+	struct i915_dpt *dpt;
 
 	spin_lock(&obj->dpt_lock);
 	dpt = __i915_dpt_lookup(obj, view);
@@ -219,12 +219,12 @@ struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
 	return dpt;
 }
 
-static struct intel_dpt *i915_dpt_add(struct drm_i915_gem_object *obj,
-				      struct intel_dpt *new_dpt)
+static struct i915_dpt *i915_dpt_add(struct drm_i915_gem_object *obj,
+				     struct i915_dpt *new_dpt)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
-	struct intel_dpt *old_dpt;
+	struct i915_dpt *old_dpt;
 
 	spin_lock(&obj->dpt_lock);
 
@@ -250,14 +250,14 @@ static struct intel_dpt *i915_dpt_add(struct drm_i915_gem_object *obj,
 	return new_dpt;
 }
 
-static struct intel_dpt *dpt_create(struct drm_i915_gem_object *obj,
-				    const struct intel_gtt_view *view)
+static struct i915_dpt *dpt_create(struct drm_i915_gem_object *obj,
+				   const struct intel_gtt_view *view)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct drm_i915_gem_object *dpt_obj;
 	struct i915_address_space *vm;
-	struct intel_dpt *dpt;
+	struct i915_dpt *dpt;
 	size_t size;
 	int ret;
 
@@ -321,10 +321,10 @@ static struct intel_dpt *dpt_create(struct drm_i915_gem_object *obj,
 	return dpt;
 }
 
-struct intel_dpt *i915_dpt_instance(struct drm_i915_gem_object *obj,
-				    const struct intel_gtt_view *view)
+struct i915_dpt *i915_dpt_instance(struct drm_i915_gem_object *obj,
+				   const struct intel_gtt_view *view)
 {
-	struct intel_dpt *dpt;
+	struct i915_dpt *dpt;
 
 	/* already have one? */
 	dpt = i915_dpt_lookup(obj, view);
@@ -342,7 +342,7 @@ void i915_dpt_obj_free(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
-	struct intel_dpt *dpt, *next;
+	struct i915_dpt *dpt, *next;
 	LIST_HEAD(dpt_list);
 
 	spin_lock(&obj->dpt_lock);
@@ -364,7 +364,7 @@ void i915_dpt_suspend(struct i915_ggtt *ggtt)
 	LIST_HEAD(dpt_list);
 
 	for (;;) {
-		struct intel_dpt *dpt;
+		struct i915_dpt *dpt;
 
 		spin_lock(&ggtt->dpt_lock);
 
@@ -395,7 +395,7 @@ void i915_dpt_suspend(struct i915_ggtt *ggtt)
 
 void i915_dpt_resume(struct i915_ggtt *ggtt)
 {
-	struct intel_dpt *dpt;
+	struct i915_dpt *dpt;
 
 	/*
 	 * i915_ggtt_resume_vm() with evict_all==true
diff --git a/drivers/gpu/drm/i915/i915_dpt.h b/drivers/gpu/drm/i915/i915_dpt.h
index 5fdd9923ca74..42620dbcc84e 100644
--- a/drivers/gpu/drm/i915/i915_dpt.h
+++ b/drivers/gpu/drm/i915/i915_dpt.h
@@ -8,20 +8,20 @@
 
 struct drm_i915_gem_object;
 struct i915_address_space;
+struct i915_dpt;
 struct i915_ggtt;
 struct i915_vma;
-struct intel_dpt;
 struct intel_gtt_view;
 
-struct intel_dpt *i915_vm_to_dpt(struct i915_address_space *vm);
+struct i915_dpt *i915_vm_to_dpt(struct i915_address_space *vm);
 void i915_dpt_obj_free(struct drm_i915_gem_object *obj);
-struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
-				  const struct intel_gtt_view *view);
-struct intel_dpt *i915_dpt_instance(struct drm_i915_gem_object *obj,
-				    const struct intel_gtt_view *view);
+struct i915_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
+				 const struct intel_gtt_view *view);
+struct i915_dpt *i915_dpt_instance(struct drm_i915_gem_object *obj,
+				   const struct intel_gtt_view *view);
 
-struct i915_address_space *i915_dpt_to_vm(struct intel_dpt *dpt);
-struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignment);
+struct i915_address_space *i915_dpt_to_vm(struct i915_dpt *dpt);
+struct i915_vma *i915_dpt_pin_to_ggtt(struct i915_dpt *dpt, unsigned int alignment);
 void i915_dpt_unpin_from_ggtt(struct i915_vma *vma);
 u64 i915_dpt_offset(struct i915_vma *dpt_vma);
 
diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index 81f5b0c4618a..0ee561d07211 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -15,7 +15,7 @@
 #include "i915_vma.h"
 
 static struct i915_vma *
-intel_fb_pin_to_dpt(struct drm_i915_gem_object *obj, struct intel_dpt *dpt,
+intel_fb_pin_to_dpt(struct drm_i915_gem_object *obj, struct i915_dpt *dpt,
 		    const struct intel_fb_pin_params *pin_params)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
@@ -257,7 +257,7 @@ static int i915_fb_pin_dpt_pin(struct drm_gem_object *_obj,
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
 	struct i915_vma *ggtt_vma, *dpt_vma;
-	struct intel_dpt *dpt;
+	struct i915_dpt *dpt;
 
 	dpt = i915_dpt_instance(obj, pin_params->view);
 	if (IS_ERR(dpt))
@@ -289,7 +289,7 @@ static void i915_fb_pin_dpt_unpin(struct drm_gem_object *_obj,
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
 	struct i915_vma *dpt_vma;
-	struct intel_dpt *dpt;
+	struct i915_dpt *dpt;
 
 	dpt = i915_dpt_lookup(obj, view);
 	if (drm_WARN_ON(obj->base.dev, !dpt))
-- 
2.56.0

