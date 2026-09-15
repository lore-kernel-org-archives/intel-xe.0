Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2782CC88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBB410E2D6;
	Tue, 15 Sep 2026 20:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJJvrGba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F50A10E2D6;
 Tue, 15 Sep 2026 20:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502981; x=1821038981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blm0opOeRXnFWVb7Rm4iZICejZQ68fa118JYAyekT58=;
 b=iJJvrGba4QBN/VP5e2MFsSB0UIgdMj0uHVGLfPZbFKBVFpugFDMygpWJ
 pZk2jmtzWvDQyRU3WaDtmRZW143n8KWRUTeiM+yF0czZQ81poxEIqgMRC
 TCQAZnNn4duuHmkfL3dRlSgEOhwQyrM7d6y2pVeHx/bH+g+rZeOelAbMw
 +qDjxa1cAzkRWSoFj5PPylCcTv9FhoByZOB9FIZ60Oll9DeALJAbzSibb
 WVGQLNgiN1HCYREolz5hJcF89jOD16TG68+qYiM/bNyhP83OyndLGjJYZ
 aoj08iavg2BI7jC6f5Q+IFmCXSdOP4AFMPMoHQM7Y+SxFVyoZJg54g3/a Q==;
X-CSE-ConnectionGUID: tPGXG0oJQmiy2+A2TvfyLw==
X-CSE-MsgGUID: v+6i3oPsT6G4aCdyraYhSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89902234"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89902234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:40 -0700
X-CSE-ConnectionGUID: JdhP81e0TTqY2+0Xt6EABQ==
X-CSE-MsgGUID: 0fbX8pB3RiirO4+QjybFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="268840641"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 03/10] drm/intel: rename i915_gtt_view* struct/enum to
 intel_gtt_view*
Date: Tue, 15 Sep 2026 23:09:14 +0300
Message-ID: <53935476107554fbd9f61e9b7ef892fa4406c4c0.1789502902.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make enum i915_gtt_view_type and struct i915_gtt_view less i915
specific, and rename them enum intel_gtt_view_type and struct
intel_gtt_view, respectively.

$ sed -i 's/i915_gtt_view/intel_gtt_view/g' -- $(git grep -l i915_gtt_view)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_types.h   |  2 +-
 drivers/gpu/drm/i915/display/intel_fb.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_parent.c      |  4 ++--
 drivers/gpu/drm/i915/display/intel_parent.h      |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c         |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h       |  2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_mman.c   |  4 ++--
 drivers/gpu/drm/i915/i915_gem.c                  |  4 ++--
 drivers/gpu/drm/i915/i915_gem.h                  |  6 +++---
 drivers/gpu/drm/i915/i915_vma.c                  |  8 ++++----
 drivers/gpu/drm/i915/i915_vma.h                  |  4 ++--
 drivers/gpu/drm/i915/i915_vma_types.h            | 16 ++++++++--------
 drivers/gpu/drm/i915/selftests/i915_vma.c        | 16 ++++++++--------
 drivers/gpu/drm/xe/display/xe_fb_pin.c           | 10 +++++-----
 include/drm/intel/display_parent_interface.h     |  8 ++++----
 include/drm/intel/gtt_view_types.h               | 12 ++++++------
 17 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 2a9f690c3d70..60f7ab32ebb3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -111,7 +111,7 @@ struct intel_fb_view {
 	 * In the normal view the FB object's backing store sg list is used
 	 * directly and hence the remap information here is not used.
 	 */
-	struct i915_gtt_view gtt;
+	struct intel_gtt_view gtt;
 
 	/*
 	 * The GTT view (gtt.type) specific information for each FB color
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 63b7644c5659..d1b4efa08bcc 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1632,7 +1632,7 @@ calc_plane_normal_size(const struct intel_framebuffer *fb, int color_plane,
 
 static void intel_fb_view_init(struct intel_display *display,
 			       struct intel_fb_view *view,
-			       enum i915_gtt_view_type view_type,
+			       enum intel_gtt_view_type view_type,
 			       const struct intel_framebuffer *fb)
 {
 	memset(view, 0, sizeof(*view));
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index 99cebb17763a..ed3e21b0a927 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -94,9 +94,9 @@ void intel_parent_fb_pin_dpt_unpin(struct intel_display *display,
 struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
 					       struct i915_vma *old_ggtt_vma,
 					       struct drm_gem_object *old_obj,
-					       const struct i915_gtt_view *old_view,
+					       const struct intel_gtt_view *old_view,
 					       struct drm_gem_object *new_obj,
-					       const struct i915_gtt_view *new_view,
+					       const struct intel_gtt_view *new_view,
 					       u32 *out_offset)
 {
 	if (!display->parent->fb_pin->reuse_vma)
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index cc4a58f63166..923cb6464a98 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -11,12 +11,12 @@ struct dma_fence;
 struct drm_file;
 struct drm_gem_object;
 struct drm_scanout_buffer;
-struct i915_gtt_view;
 struct i915_vma;
 struct intel_display;
 struct intel_dpt;
 struct intel_fb_pin_params;
 struct intel_frontbuffer;
+struct intel_gtt_view;
 struct intel_hdcp_gsc_context;
 struct intel_panic;
 struct intel_stolen_node;
@@ -53,9 +53,9 @@ void intel_parent_fb_pin_dpt_unpin(struct intel_display *display,
 struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
 					       struct i915_vma *old_ggtt_vma,
 					       struct drm_gem_object *old_obj,
-					       const struct i915_gtt_view *old_view,
+					       const struct intel_gtt_view *old_view,
 					       struct drm_gem_object *new_obj,
-					       const struct i915_gtt_view *new_view,
+					       const struct intel_gtt_view *new_view,
 					       u32 *out_offset);
 void intel_parent_fb_pin_get_map(struct intel_display *display,
 				 struct i915_vma *vma, struct iosys_map *map);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index b7297c0a3a48..0cb41704e54e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -421,7 +421,7 @@ struct i915_vma *
 i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 				     struct i915_gem_ww_ctx *ww,
 				     u32 alignment, unsigned int guard,
-				     const struct i915_gtt_view *view,
+				     const struct intel_gtt_view *view,
 				     unsigned int flags)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 9ca90c1bb5b4..ee8fbbcbb5fe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -196,12 +196,12 @@ int i915_gem_mmap_gtt_version(void)
 	return 5;
 }
 
-static inline struct i915_gtt_view
+static inline struct intel_gtt_view
 compute_partial_view(const struct drm_i915_gem_object *obj,
 		     pgoff_t page_offset,
 		     unsigned int chunk)
 {
-	struct i915_gtt_view view;
+	struct intel_gtt_view view;
 
 	if (i915_gem_object_is_tiled(obj))
 		chunk = roundup(chunk, tile_row_pages(obj) ?: 1);
@@ -391,7 +391,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 					  PIN_NOEVICT);
 	if (IS_ERR(vma) && vma != ERR_PTR(-EDEADLK)) {
 		/* Use a partial view if it is bigger than available space */
-		struct i915_gtt_view view =
+		struct intel_gtt_view view =
 			compute_partial_view(obj, page_offset, MIN_CHUNK_PAGES);
 		unsigned int flags;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2c5d20e4dbaf..a2f4b6758a65 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -776,7 +776,7 @@ struct i915_vma * __must_check
 i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 				     struct i915_gem_ww_ctx *ww,
 				     u32 alignment, unsigned int guard,
-				     const struct i915_gtt_view *view,
+				     const struct intel_gtt_view *view,
 				     unsigned int flags);
 
 void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index d01acfb7d93d..4d49fd6c15e3 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -97,7 +97,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 {
 	const unsigned long npages = obj->base.size / PAGE_SIZE;
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_gtt_view view;
+	struct intel_gtt_view view;
 	struct i915_vma *vma;
 	unsigned long offset;
 	unsigned long page;
@@ -214,7 +214,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 	}
 
 	for_each_prime_number_from(page, 1, npages) {
-		struct i915_gtt_view view =
+		struct intel_gtt_view view =
 			compute_partial_view(obj, page, MIN_CHUNK_PAGES);
 		unsigned long offset;
 		u32 __iomem *io;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index a432daf8038a..62987ae59a50 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -902,7 +902,7 @@ static void discard_ggtt_vma(struct i915_vma *vma)
 struct i915_vma *
 i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    struct i915_gem_ww_ctx *ww,
-			    const struct i915_gtt_view *view,
+			    const struct intel_gtt_view *view,
 			    u64 size, u64 alignment, u64 flags)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
@@ -1004,7 +1004,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 
 struct i915_vma * __must_check
 i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
-			 const struct i915_gtt_view *view,
+			 const struct intel_gtt_view *view,
 			 u64 size, u64 alignment, u64 flags)
 {
 	struct i915_gem_ww_ctx ww;
diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_gem.h
index 20b3cb29cfff..80d9758fe684 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -36,8 +36,8 @@ struct drm_file;
 struct drm_i915_gem_object;
 struct drm_i915_private;
 struct i915_gem_ww_ctx;
-struct i915_gtt_view;
 struct i915_vma;
+struct intel_gtt_view;
 
 #define I915_GEM_GPU_DOMAINS	       \
 	(I915_GEM_DOMAIN_RENDER |      \
@@ -55,12 +55,12 @@ void i915_gem_drain_workqueue(struct drm_i915_private *i915);
 struct i915_vma * __must_check
 i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    struct i915_gem_ww_ctx *ww,
-			    const struct i915_gtt_view *view,
+			    const struct intel_gtt_view *view,
 			    u64 size, u64 alignment, u64 flags);
 
 struct i915_vma * __must_check
 i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
-			 const struct i915_gtt_view *view,
+			 const struct intel_gtt_view *view,
 			 u64 size, u64 alignment, u64 flags);
 
 int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index afc192d9931b..61ddfa5d2895 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -147,7 +147,7 @@ static void __i915_vma_retire(struct i915_active *ref)
 static struct i915_vma *
 vma_create(struct drm_i915_gem_object *obj,
 	   struct i915_address_space *vm,
-	   const struct i915_gtt_view *view)
+	   const struct intel_gtt_view *view)
 {
 	struct i915_vma *pos = ERR_PTR(-E2BIG);
 	struct i915_vma *vma;
@@ -286,7 +286,7 @@ vma_create(struct drm_i915_gem_object *obj,
 static struct i915_vma *
 i915_vma_lookup(struct drm_i915_gem_object *obj,
 	   struct i915_address_space *vm,
-	   const struct i915_gtt_view *view)
+	   const struct intel_gtt_view *view)
 {
 	struct rb_node *rb;
 
@@ -324,7 +324,7 @@ i915_vma_lookup(struct drm_i915_gem_object *obj,
 struct i915_vma *
 i915_vma_instance(struct drm_i915_gem_object *obj,
 		  struct i915_address_space *vm,
-		  const struct i915_gtt_view *view)
+		  const struct intel_gtt_view *view)
 {
 	struct i915_vma *vma;
 
@@ -1267,7 +1267,7 @@ intel_remap_pages(struct intel_remapped_info *rem_info,
 }
 
 static noinline struct sg_table *
-intel_partial_pages(const struct i915_gtt_view *view,
+intel_partial_pages(const struct intel_gtt_view *view,
 		    struct drm_i915_gem_object *obj)
 {
 	struct sg_table *st;
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 892306ab935d..a8a89bb0270c 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -43,7 +43,7 @@
 struct i915_vma *
 i915_vma_instance(struct drm_i915_gem_object *obj,
 		  struct i915_address_space *vm,
-		  const struct i915_gtt_view *view);
+		  const struct intel_gtt_view *view);
 
 void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 #define I915_VMA_RELEASE_MAP BIT(0)
@@ -207,7 +207,7 @@ static inline void i915_vma_put(struct i915_vma *vma)
 static inline long
 i915_vma_compare(struct i915_vma *vma,
 		 struct i915_address_space *vm,
-		 const struct i915_gtt_view *view)
+		 const struct intel_gtt_view *view)
 {
 	ptrdiff_t cmp;
 
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 83fe02833b5e..8815421eaefb 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -66,22 +66,22 @@
  * Implementation and usage
  *
  * GGTT views are implemented using VMAs and are distinguished via enum
- * i915_gtt_view_type and struct i915_gtt_view.
+ * intel_gtt_view_type and struct intel_gtt_view.
  *
  * A new flavour of core GEM functions which work with GGTT bound objects were
  * added with the _ggtt_ infix, and sometimes with _view postfix to avoid
- * renaming  in large amounts of code. They take the struct i915_gtt_view
+ * renaming  in large amounts of code. They take the struct intel_gtt_view
  * parameter encapsulating all metadata required to implement a view.
  *
  * As a helper for callers which are only interested in the normal view,
- * globally const i915_gtt_view_normal singleton instance exists. All old core
+ * globally const intel_gtt_view_normal singleton instance exists. All old core
  * GEM API functions, the ones not taking the view parameter, are operating on,
  * or with the normal GGTT view.
  *
  * Code wanting to add or use a new GGTT view needs to:
  *
  * 1. Add a new enum with a suitable name.
- * 2. Extend the metadata in the i915_gtt_view structure if required.
+ * 2. Extend the metadata in the intel_gtt_view structure if required.
  * 3. Add support to i915_get_vma_pages().
  *
  * New views are required to build a scatter-gather table from within the
@@ -89,7 +89,7 @@
  * exists for the lifetime of an VMA.
  *
  * Core API is designed to have copy semantics which means that passed in
- * struct i915_gtt_view does not need to be persistent (left around after
+ * struct intel_gtt_view does not need to be persistent (left around after
  * calling the core API functions).
  *
  */
@@ -111,7 +111,7 @@ static inline void assert_i915_gem_gtt_types(void)
 	/* As we encode the size of each branch inside the union into its type,
 	 * we have to be careful that each branch has a unique size.
 	 */
-	switch ((enum i915_gtt_view_type)0) {
+	switch ((enum intel_gtt_view_type)0) {
 	case I915_GTT_VIEW_NORMAL:
 	case I915_GTT_VIEW_PARTIAL:
 	case I915_GTT_VIEW_ROTATED:
@@ -230,11 +230,11 @@ struct i915_vma {
 	/**
 	 * Support different GGTT views into the same object.
 	 * This means there can be multiple VMA mappings per object and per VM.
-	 * i915_gtt_view_type is used to distinguish between those entries.
+	 * intel_gtt_view_type is used to distinguish between those entries.
 	 * The default one of zero (I915_GTT_VIEW_NORMAL) is default and also
 	 * assumed in GEM functions which take no ggtt view parameter.
 	 */
-	struct i915_gtt_view gtt_view;
+	struct intel_gtt_view gtt_view;
 
 	/** This object's place on the active/inactive lists */
 	struct list_head vm_link;
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 7c4111e60f2e..b16297a6a4e8 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -63,7 +63,7 @@ static bool assert_vma(struct i915_vma *vma,
 static struct i915_vma *
 checked_vma_instance(struct drm_i915_gem_object *obj,
 		     struct i915_address_space *vm,
-		     const struct i915_gtt_view *view)
+		     const struct intel_gtt_view *view)
 {
 	struct i915_vma *vma;
 	bool ok = true;
@@ -533,7 +533,7 @@ assert_remapped(struct drm_i915_gem_object *obj,
 	return sg;
 }
 
-static unsigned int remapped_size(enum i915_gtt_view_type view_type,
+static unsigned int remapped_size(enum intel_gtt_view_type view_type,
 				  const struct intel_remapped_plane_info *a,
 				  const struct intel_remapped_plane_info *b)
 {
@@ -572,7 +572,7 @@ static int igt_vma_rotate_remap(void *arg)
 
 		{ }
 	}, *a, *b;
-	enum i915_gtt_view_type types[] = {
+	enum intel_gtt_view_type types[] = {
 		I915_GTT_VIEW_ROTATED,
 		I915_GTT_VIEW_REMAPPED,
 		0,
@@ -592,7 +592,7 @@ static int igt_vma_rotate_remap(void *arg)
 	for (t = types; *t; t++) {
 	for (a = planes; a->width; a++) {
 		for (b = planes + ARRAY_SIZE(planes); b-- != planes; ) {
-			struct i915_gtt_view view = {
+			struct intel_gtt_view view = {
 				.type = *t,
 				.remapped.plane[0] = *a,
 				.remapped.plane[1] = *b,
@@ -745,7 +745,7 @@ static bool assert_partial(struct drm_i915_gem_object *obj,
 }
 
 static bool assert_pin(struct i915_vma *vma,
-		       struct i915_gtt_view *view,
+		       struct intel_gtt_view *view,
 		       u64 size,
 		       const char *name)
 {
@@ -823,7 +823,7 @@ static int igt_vma_partial(void *arg)
 		nvma = 0;
 		for_each_prime_number_from(sz, 1, npages) {
 			for_each_prime_number_from(offset, 0, npages - sz) {
-				struct i915_gtt_view view;
+				struct intel_gtt_view view;
 
 				view.type = I915_GTT_VIEW_PARTIAL;
 				view.partial.offset = offset;
@@ -981,7 +981,7 @@ static int igt_vma_remapped_gtt(void *arg)
 
 		{ }
 	}, *p;
-	enum i915_gtt_view_type types[] = {
+	enum intel_gtt_view_type types[] = {
 		I915_GTT_VIEW_ROTATED,
 		I915_GTT_VIEW_REMAPPED,
 		0,
@@ -1001,7 +1001,7 @@ static int igt_vma_remapped_gtt(void *arg)
 
 	for (t = types; *t; t++) {
 		for (p = planes; p->width; p++) {
-			struct i915_gtt_view view = {
+			struct intel_gtt_view view = {
 				.type = *t,
 				.rotated.plane[0] = *p,
 			};
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 6fae8cc27aad..1402e76102fa 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -148,7 +148,7 @@ static int __xe_pin_fb_vma_dpt(struct drm_gem_object *obj,
 	struct xe_device *xe = to_xe_device(obj->dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_ggtt *ggtt = tile0->mem.ggtt;
-	const struct i915_gtt_view *view = pin_params->view;
+	const struct intel_gtt_view *view = pin_params->view;
 	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
 
@@ -231,7 +231,7 @@ write_ggtt_rotated(struct xe_ggtt *ggtt, u32 *ggtt_ofs,
 }
 
 struct fb_rotate_args {
-	const struct i915_gtt_view *view;
+	const struct intel_gtt_view *view;
 	struct xe_bo *bo;
 };
 
@@ -256,7 +256,7 @@ static int __xe_pin_fb_vma_ggtt(struct drm_gem_object *obj,
 				const struct intel_fb_pin_params *pin_params,
 				struct i915_vma *vma)
 {
-	const struct i915_gtt_view *view = pin_params->view;
+	const struct intel_gtt_view *view = pin_params->view;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_device *xe = to_xe_device(obj->dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
@@ -457,9 +457,9 @@ static void xe_fb_pin_dpt_unpin(struct intel_dpt *dpt,
 static struct i915_vma *
 xe_fb_pin_reuse_vma(struct i915_vma *old_ggtt_vma,
 		    struct drm_gem_object *old_obj,
-		    const struct i915_gtt_view *old_view,
+		    const struct intel_gtt_view *old_view,
 		    struct drm_gem_object *new_obj,
-		    const struct i915_gtt_view *new_view,
+		    const struct intel_gtt_view *new_view,
 		    u32 *out_offset)
 {
 	if (old_ggtt_vma && old_obj == new_obj &&
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 5e44c022d1ae..bc43d8b15827 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -16,11 +16,11 @@ struct drm_mode_fb_cmd2;
 struct drm_plane_state;
 struct drm_scanout_buffer;
 struct fb_info;
-struct i915_gtt_view;
 struct i915_vma;
 struct intel_dpt;
 struct intel_dsb_buffer;
 struct intel_frontbuffer;
+struct intel_gtt_view;
 struct intel_hdcp_gsc_context;
 struct intel_initial_plane_config;
 struct intel_panic;
@@ -31,7 +31,7 @@ struct seq_file;
 struct vm_area_struct;
 
 struct intel_fb_pin_params {
-	const struct i915_gtt_view *view;
+	const struct intel_gtt_view *view;
 	unsigned int alignment;
 	unsigned int phys_alignment;
 	unsigned int vtd_guard;
@@ -101,9 +101,9 @@ struct intel_display_fb_pin_interface {
 			  struct i915_vma *ggtt_vma);
 	struct i915_vma *(*reuse_vma)(struct i915_vma *old_ggtt_vma,
 				      struct drm_gem_object *old_obj,
-				      const struct i915_gtt_view *old_view,
+				      const struct intel_gtt_view *old_view,
 				      struct drm_gem_object *new_obj,
-				      const struct i915_gtt_view *new_view,
+				      const struct intel_gtt_view *new_view,
 				      u32 *out_offset);
 	void (*get_map)(struct i915_vma *vma, struct iosys_map *map);
 };
diff --git a/include/drm/intel/gtt_view_types.h b/include/drm/intel/gtt_view_types.h
index a39f7cae733b..2f1793a31b1a 100644
--- a/include/drm/intel/gtt_view_types.h
+++ b/include/drm/intel/gtt_view_types.h
@@ -39,15 +39,15 @@ struct intel_remapped_info {
 	u32 plane_alignment;
 } __packed;
 
-enum i915_gtt_view_type {
+enum intel_gtt_view_type {
 	I915_GTT_VIEW_NORMAL = 0,
 	I915_GTT_VIEW_ROTATED = sizeof(struct intel_rotation_info),
 	I915_GTT_VIEW_PARTIAL = sizeof(struct intel_partial_info),
 	I915_GTT_VIEW_REMAPPED = sizeof(struct intel_remapped_info),
 };
 
-struct i915_gtt_view {
-	enum i915_gtt_view_type type;
+struct intel_gtt_view {
+	enum intel_gtt_view_type type;
 	union {
 		/* Members need to contain no holes/padding */
 		struct intel_partial_info partial;
@@ -56,17 +56,17 @@ struct i915_gtt_view {
 	};
 };
 
-static inline bool intel_gtt_view_is_normal(const struct i915_gtt_view *view)
+static inline bool intel_gtt_view_is_normal(const struct intel_gtt_view *view)
 {
 	return view->type == I915_GTT_VIEW_NORMAL;
 }
 
-static inline bool intel_gtt_view_is_remapped(const struct i915_gtt_view *view)
+static inline bool intel_gtt_view_is_remapped(const struct intel_gtt_view *view)
 {
 	return view->type == I915_GTT_VIEW_REMAPPED;
 }
 
-static inline bool intel_gtt_view_is_rotated(const struct i915_gtt_view *view)
+static inline bool intel_gtt_view_is_rotated(const struct intel_gtt_view *view)
 {
 	return view->type == I915_GTT_VIEW_ROTATED;
 }
-- 
2.47.3

