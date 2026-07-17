Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D46BC4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F36A10E4A3;
	Fri, 17 Jul 2026 15:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDfXJlip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BE610E49E;
 Fri, 17 Jul 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302971; x=1815838971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mXXbIWTjtDvOcjVY0C0cwzxsQdpU73tTRNATNql/G3k=;
 b=RDfXJlipT6SklvEinsID+4pLEQgQZGxMTH/b2F3yACk0YX4OQ5d617nV
 jCItGRoUP6kGp5tZR14hmwORIWzvFqYZc7u+iPNA3em336VU+IoU5BEDC
 c5v9hpc1LD5xHnCwPPzEtaRmXQ7jN+RJx/qkVGXQm4nQo27GO1eIv6SG1
 73xypJKDw4gNLdI2CqLh5jkJAgkztL2qFwFEPJLxNLm4VQK1VKnDOWxIo
 SYQ3Ll/d2Uf1tTX3Pku7dyTYzcXUMtwJBexTNOPYgEw5XOwoUqOjLfNUu
 /jQbpzFL8HV+tpuVcqH3u/vcUPro8wrt3LeUYwcEEcbzwEE6jRT4p7Jjo Q==;
X-CSE-ConnectionGUID: gXXSdDFiR0WvdzRX6hK++g==
X-CSE-MsgGUID: V3cmW335TAKDO75P0j48ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88652129"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88652129"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:51 -0700
X-CSE-ConnectionGUID: YstKSsvVR1+HneXFXxxFJQ==
X-CSE-MsgGUID: LcYSPK+WRWqkiD2DSvwusw==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:49 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915: Don't pass the vma to
 parent->initial_plane->setup()
Date: Fri, 17 Jul 2026 18:42:33 +0300
Message-ID: <20260717154238.10792-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
References: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop passing the vma via intel_find_initial_plane_obj() to
parent->initial_plane->setup(), and instead just look up the
vma again in the i915 implementation (xe already did that
on account of using xe_fb_pin_ggtt_pin()).

The goal is to simplify the parent interface, and eventually
get rid of all this special case pinning code in the BIOS FB
readout path.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 5 +----
 drivers/gpu/drm/i915/i915_initial_plane.c          | 9 +++++++--
 drivers/gpu/drm/xe/display/xe_initial_plane.c      | 3 +--
 include/drm/intel/display_parent_interface.h       | 2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index 4c7e5de924cf..ea3defcc760b 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -123,7 +123,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->base.state);
 	struct drm_framebuffer *fb;
-	struct i915_vma *vma;
 	int ret;
 
 	/*
@@ -135,7 +134,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 
 	if (intel_alloc_initial_plane_obj(display, plane_config)) {
 		fb = plane_config->fb;
-		vma = plane_config->vma;
 	} else {
 		const struct intel_plane_state *other_plane_state;
 
@@ -144,14 +142,13 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 			goto nofb;
 
 		fb = other_plane_state->hw.fb;
-		vma = other_plane_state->ggtt_vma;
 	}
 
 	plane_state->uapi.rotation = plane_config->rotation;
 	intel_fb_fill_view(to_intel_framebuffer(fb),
 			   plane_state->uapi.rotation, &plane_state->view);
 
-	ret = display->parent->initial_plane->setup(plane->base.state, plane_config, fb, vma);
+	ret = display->parent->initial_plane->setup(plane->base.state, plane_config, fb);
 	if (ret)
 		goto nofb;
 
diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 98858a78e46a..bd5fd11fdc49 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -250,11 +250,16 @@ i915_alloc_initial_plane_obj(struct drm_device *drm,
 static int
 i915_initial_plane_setup(struct drm_plane_state *_plane_state,
 			 struct intel_initial_plane_config *plane_config,
-			 struct drm_framebuffer *fb,
-			 struct i915_vma *vma)
+			 struct drm_framebuffer *fb)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(_plane_state);
 	struct drm_i915_private *dev_priv = to_i915(_plane_state->plane->dev);
+	struct drm_gem_object *obj = intel_fb_bo(fb);
+	struct i915_vma *vma;
+
+	vma = i915_vma_instance(to_intel_bo(obj), &to_gt(dev_priv)->ggtt->vm, NULL);
+	if (IS_ERR(vma))
+		return PTR_ERR(vma);
 
 	__i915_vma_pin(vma);
 	plane_state->ggtt_vma = i915_vma_get(vma);
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d0..1aff8a8304b0 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -161,8 +161,7 @@ xe_alloc_initial_plane_obj(struct drm_device *drm,
 static int
 xe_initial_plane_setup(struct drm_plane_state *_plane_state,
 		       struct intel_initial_plane_config *plane_config,
-		       struct drm_framebuffer *fb,
-		       struct i915_vma *_unused)
+		       struct drm_framebuffer *fb)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(_plane_state);
 	struct i915_vma *vma;
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index de395df9ca30..26aed8878b16 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -127,7 +127,7 @@ struct intel_display_hdcp_interface {
 struct intel_display_initial_plane_interface {
 	struct drm_gem_object *(*alloc_obj)(struct drm_device *drm, struct intel_initial_plane_config *plane_config);
 	int (*setup)(struct drm_plane_state *plane_state, struct intel_initial_plane_config *plane_config,
-		     struct drm_framebuffer *fb, struct i915_vma *vma);
+		     struct drm_framebuffer *fb);
 	void (*config_fini)(struct intel_initial_plane_config *plane_config);
 };
 
-- 
2.54.0

