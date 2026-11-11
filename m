Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C647A606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZDV1i4yB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F5810FB25;
	Wed, 11 Nov 2026 11:20:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53C10FB25;
 Wed, 11 Nov 2026 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396031; x=1825932031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dGYEc6yaZCjhcAEpLTXnGHRMQfmRRonjuEiMOgc80Us=;
 b=ZDV1i4yBd6PnODoqDKbOl4auVgPxYgUaMb7wmNWSPsQnjr/3lJ2QGAdn
 WTzIXhfx/sFM8Ypzwhwl/ZwWbCqkhUxifsr1egZDtTZBJ8+Tp6H4sjhrg
 rfVUS4ud9vgT8/CActfP8m+j7ke6My+Ae4glXXJSi4O+lKJERngsEAjD7
 OiZIpwGqIydpkwruzZ+/UlqNvqSBmVORQQGMkV35y8mMzngAsiDq1/W7J
 S6SRXGAAFqmm02owNLSD/hhL6E6uYW/8KD3OQlXagXpWUw3bpvXGGENAb
 rKpgs3ndr5GaEAczszt2bICNHinpBoSf0/XvNEfbdMUMNec7Yq6uxzWCr Q==;
X-CSE-ConnectionGUID: hLK1YTYESOulIPgt+ux8Hg==
X-CSE-MsgGUID: MAaR0Y8HStueaC3JPsHgjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3162117"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3162117"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:31 -0800
X-CSE-ConnectionGUID: xo2D1ifyTEOZUIJpmhE7rg==
X-CSE-MsgGUID: fPiM6PKaQxO6LIkTf2LmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8493134"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:29 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/13] drm/i915: intel_{remapped,
 rotation}_info_size() into intel/gtt_view_types.h
Date: Wed, 11 Nov 2026 13:19:59 +0200
Message-ID: <20261111112007.16790-6-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_remapped_info_size() and intel_rotation_info_size() operate
on intel_gtt_view, and need to be shared across driver boundaries.
Move them into the appropriate header as static inlines. While
static inlines are a bit icky these functions don't really depend
on anything and just do some basic arithmetic, so not the end
of the world.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c       | 38 +------------------
 drivers/gpu/drm/i915/display/intel_fb.h       |  3 --
 drivers/gpu/drm/i915/i915_vma.c               |  3 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  3 --
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  3 +-
 include/drm/intel/gtt_view_types.h            | 38 +++++++++++++++++++
 6 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 40012b432d91..b3344e3f187f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -11,6 +11,8 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_print.h>
 
+#include <drm/intel/gtt_view_types.h>
+
 #include "intel_bo.h"
 #include "intel_display.h"
 #include "intel_display_core.h"
@@ -1895,42 +1897,6 @@ static void intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 	}
 }
 
-unsigned int intel_rotation_info_size(const struct intel_rotation_info *rot_info)
-{
-	unsigned int size = 0;
-	int i;
-
-	for (i = 0 ; i < ARRAY_SIZE(rot_info->plane); i++)
-		size += rot_info->plane[i].dst_stride * rot_info->plane[i].width;
-
-	return size;
-}
-
-unsigned int intel_remapped_info_size(const struct intel_remapped_info *rem_info)
-{
-	unsigned int size = 0;
-	int i;
-
-	for (i = 0 ; i < ARRAY_SIZE(rem_info->plane); i++) {
-		unsigned int plane_size;
-
-		if (rem_info->plane[i].linear)
-			plane_size = rem_info->plane[i].size;
-		else
-			plane_size = rem_info->plane[i].dst_stride * rem_info->plane[i].height;
-
-		if (plane_size == 0)
-			continue;
-
-		if (rem_info->plane_alignment)
-			size = ALIGN(size, rem_info->plane_alignment);
-
-		size += plane_size;
-	}
-
-	return size;
-}
-
 void intel_fb_fill_view(const struct intel_framebuffer *fb, unsigned int rotation,
 			struct intel_fb_view *view)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 0a027e2595b2..161899308ecf 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -81,9 +81,6 @@ u32 intel_plane_compute_aligned_offset(int *x, int *y,
 bool intel_plane_uses_fence(const struct intel_plane_state *plane_state);
 bool intel_fb_supports_90_270_rotation(const struct intel_framebuffer *fb);
 
-unsigned int intel_rotation_info_size(const struct intel_rotation_info *rot_info);
-unsigned int intel_remapped_info_size(const struct intel_remapped_info *rem_info);
-
 int intel_fill_fb_info(struct intel_display *display, struct intel_framebuffer *fb);
 void intel_fb_fill_view(const struct intel_framebuffer *fb, unsigned int rotation,
 			struct intel_fb_view *view);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 16782d8579a8..52f82772a1c0 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -28,7 +28,8 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
-#include "display/intel_fb.h"
+#include <drm/intel/gtt_view_types.h>
+
 #include "display/intel_frontbuffer.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object_frontbuffer.h"
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1bb484254d6e..8df844120ea8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -7,9 +7,6 @@
 #include <drm/intel/gtt_view_types.h>
 #include <drm/ttm/ttm_bo.h>
 
-/* FIXME move intel_remapped_info_size() & co. to parent interface? */
-#include "intel_fb.h"
-
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_display_vma.h"
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d0..d0c1fbca1611 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -4,10 +4,11 @@
  */
 
 #include <drm/intel/display_parent_interface.h>
+#include <drm/intel/gtt_view_types.h>
 
 #include "regs/xe_gtt_defs.h"
 
-/* FIXME move intel_remapped_info_size() & co. */
+/* FIXME move intel_framebuffer_init() out */
 #include "intel_fb.h"
 
 /* FIXME move intel_initial_plane_config */
diff --git a/include/drm/intel/gtt_view_types.h b/include/drm/intel/gtt_view_types.h
index 128392d98f3a..a19f67060966 100644
--- a/include/drm/intel/gtt_view_types.h
+++ b/include/drm/intel/gtt_view_types.h
@@ -4,6 +4,8 @@
 #ifndef __DRM_INTEL_GTT_VIEW_TYPES_H__
 #define __DRM_INTEL_GTT_VIEW_TYPES_H__
 
+#include <linux/align.h>
+#include <linux/array_size.h>
 #include <linux/types.h>
 
 struct intel_remapped_plane_info {
@@ -76,4 +78,40 @@ static inline bool intel_gtt_view_is_partial(const struct intel_gtt_view *view)
 	return view->type == INTEL_GTT_VIEW_PARTIAL;
 }
 
+static inline unsigned int intel_rotation_info_size(const struct intel_rotation_info *rot_info)
+{
+	unsigned int size = 0;
+	int i;
+
+	for (i = 0 ; i < ARRAY_SIZE(rot_info->plane); i++)
+		size += rot_info->plane[i].dst_stride * rot_info->plane[i].width;
+
+	return size;
+}
+
+static inline unsigned int intel_remapped_info_size(const struct intel_remapped_info *rem_info)
+{
+	unsigned int size = 0;
+	int i;
+
+	for (i = 0 ; i < ARRAY_SIZE(rem_info->plane); i++) {
+		unsigned int plane_size;
+
+		if (rem_info->plane[i].linear)
+			plane_size = rem_info->plane[i].size;
+		else
+			plane_size = rem_info->plane[i].dst_stride * rem_info->plane[i].height;
+
+		if (plane_size == 0)
+			continue;
+
+		if (rem_info->plane_alignment)
+			size = ALIGN(size, rem_info->plane_alignment);
+
+		size += plane_size;
+	}
+
+	return size;
+}
+
 #endif /* __DRM_INTEL_GTT_VIEW_TYPES_H__ */
-- 
2.56.0

