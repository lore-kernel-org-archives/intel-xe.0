Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A9FEFB70
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E63C10EBDA;
	Fri, 27 Feb 2026 17:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2ej3S2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F68610EBD9;
 Fri, 27 Feb 2026 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772212649; x=1803748649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dvA2Pd1YoApQvF3MF2JhylOMe0JgWJJfntVlewKU4SA=;
 b=g2ej3S2ysXXkqMAqE77K0tg+cUsBBGWMpn5NJo8tjfSpvKbpzzow9n9/
 MJEp45OryCvr5gk+ejBSA7SZQKQZd0A+EZXNh+HA6Yhbb2unpSZko3IaQ
 fbr6gGNBNKYyAqsHbBibnS9H91l/eY1UBOVThLv3CLVoVy1ok7byF0tCa
 qNhQnz5Mp7m2GY1jIr/AylawwOvlCwMZCDhE61UF8E2LpSlFqD1NECfra
 /5Y290Jc2XNKTEcE2qHCz0lbOBhFVVFWW9WsGbxHap39/tByqZz2xccgx
 BskBydggR6JrlLwva9IGkpBMEnu7tAWSm/6ikLyBE63zS8AKhxlnkkU94 g==;
X-CSE-ConnectionGUID: aphAN3xVQT2dwTNph59q9w==
X-CSE-MsgGUID: U8s1Y0jUSY++tVZXj32+iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75902354"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75902354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:29 -0800
X-CSE-ConnectionGUID: 7I72Gxr4Qgakj4ojMdOWqw==
X-CSE-MsgGUID: EKRPTyuoSO+eVGmZusH+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213804048"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/4] drm/i915: add VMA to parent interface
Date: Fri, 27 Feb 2026 19:17:12 +0200
Message-ID: <036f4b2d20cc1b0a7ab814beb5bb914c53b6eb53.1772212579.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772212579.git.jani.nikula@intel.com>
References: <cover.1772212579.git.jani.nikula@intel.com>
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

It's unclear what the direction of the VMA abstraction in the parent
interface should be, but convert i915_vma_fence_id() to parent interface
for starters. This paves the way for making struct i915_vma opaque
towards display.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c          |  5 ++---
 drivers/gpu/drm/i915/display/intel_parent.c       |  9 +++++++++
 drivers/gpu/drm/i915/display/intel_parent.h       |  3 +++
 drivers/gpu/drm/i915/i915_driver.c                |  1 +
 drivers/gpu/drm/i915/i915_vma.c                   | 10 ++++++++++
 drivers/gpu/drm/i915/i915_vma.h                   |  7 ++-----
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h |  2 --
 include/drm/intel/display_parent_interface.h      |  7 +++++++
 8 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 91de38379282..3e9b3e532499 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -45,7 +45,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
-#include "i915_vma.h"
 #include "i9xx_plane_regs.h"
 #include "intel_de.h"
 #include "intel_display_device.h"
@@ -1463,7 +1462,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 		    !intel_fbc_has_fences(display));
 
 	if (plane_state->flags & PLANE_HAS_FENCE)
-		fbc_state->fence_id =  i915_vma_fence_id(plane_state->ggtt_vma);
+		fbc_state->fence_id = intel_parent_vma_fence_id(display, plane_state->ggtt_vma);
 	else
 		fbc_state->fence_id = -1;
 
@@ -1490,7 +1489,7 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	 */
 	return DISPLAY_VER(display) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
-		 i915_vma_fence_id(plane_state->ggtt_vma) != -1);
+		 intel_parent_vma_fence_id(display, plane_state->ggtt_vma) != -1);
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index 89f78ca1cd15..0c5962cb2f6d 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -317,6 +317,15 @@ void intel_parent_stolen_node_free(struct intel_display *display, const struct i
 	display->parent->stolen->node_free(node);
 }
 
+/* vma */
+int intel_parent_vma_fence_id(struct intel_display *display, const struct i915_vma *vma)
+{
+	if (!display->parent->vma)
+		return -1;
+
+	return display->parent->vma->fence_id(vma);
+}
+
 /* generic */
 void intel_parent_fence_priority_display(struct intel_display *display, struct dma_fence *fence)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index 2317482ef072..6e7d09133aee 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -102,6 +102,9 @@ u64 intel_parent_stolen_node_size(struct intel_display *display, const struct in
 struct intel_stolen_node *intel_parent_stolen_node_alloc(struct intel_display *display);
 void intel_parent_stolen_node_free(struct intel_display *display, const struct intel_stolen_node *node);
 
+/* vma */
+int intel_parent_vma_fence_id(struct intel_display *display, const struct i915_vma *vma);
+
 /* generic */
 bool intel_parent_has_auxccs(struct intel_display *display);
 bool intel_parent_has_fenced_regions(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 5f77e891604d..18f912043f90 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -775,6 +775,7 @@ static const struct intel_display_parent_interface parent = {
 	.rpm = &i915_display_rpm_interface,
 	.rps = &i915_display_rps_interface,
 	.stolen = &i915_display_stolen_interface,
+	.vma = &i915_display_vma_interface,
 
 	.fence_priority_display = fence_priority_display,
 	.has_auxccs = has_auxccs,
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index afc192d9931b..6a3a4d4244dc 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -27,6 +27,7 @@
 
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
+#include <drm/intel/display_parent_interface.h>
 
 #include "display/intel_fb.h"
 #include "display/intel_frontbuffer.h"
@@ -2332,3 +2333,12 @@ int __init i915_vma_module_init(void)
 
 	return 0;
 }
+
+static int i915_vma_fence_id(const struct i915_vma *vma)
+{
+	return vma->fence ? vma->fence->id : -1;
+}
+
+const struct intel_display_vma_interface i915_display_vma_interface = {
+	.fence_id = i915_vma_fence_id,
+};
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 8054047840aa..fa2d9b429db6 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -404,11 +404,6 @@ i915_vma_unpin_fence(struct i915_vma *vma)
 		__i915_vma_unpin_fence(vma);
 }
 
-static inline int i915_vma_fence_id(const struct i915_vma *vma)
-{
-	return vma->fence ? vma->fence->id : -1;
-}
-
 void i915_vma_parked(struct intel_gt *gt);
 
 static inline bool i915_vma_is_scanout(const struct i915_vma *vma)
@@ -481,4 +476,6 @@ int i915_vma_module_init(void);
 I915_SELFTEST_DECLARE(int i915_vma_get_pages(struct i915_vma *vma));
 I915_SELFTEST_DECLARE(void i915_vma_put_pages(struct i915_vma *vma));
 
+extern const struct intel_display_vma_interface i915_display_vma_interface;
+
 #endif
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index c4b5adaaa99a..da1d97b48fee 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -26,8 +26,6 @@ struct i915_vma {
 	struct xe_ggtt_node *node;
 };
 
-#define i915_vma_fence_id(vma) -1
-
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
 	return xe_ggtt_node_addr(vma->node);
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index b4b0f58ae3ee..d02ab7cc1c92 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -149,6 +149,10 @@ struct intel_display_stolen_interface {
 	void (*node_free)(const struct intel_stolen_node *node);
 };
 
+struct intel_display_vma_interface {
+	int (*fence_id)(const struct i915_vma *vma);
+};
+
 /**
  * struct intel_display_parent_interface - services parent driver provides to display
  *
@@ -198,6 +202,9 @@ struct intel_display_parent_interface {
 	/** @stolen: Stolen memory. */
 	const struct intel_display_stolen_interface *stolen;
 
+	/** @vma: VMA interface. Optional. */
+	const struct intel_display_vma_interface *vma;
+
 	/* Generic independent functions */
 	struct {
 		/** @fence_priority_display: Set display priority. Optional. */
-- 
2.47.3

