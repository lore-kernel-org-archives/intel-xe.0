Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42EECD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 14:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7084B10F519;
	Fri,  8 May 2026 14:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAiIWonv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4047C10F51A;
 Fri,  8 May 2026 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778250937; x=1809786937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTGd7DXh6232Le5x5U6oNaYwDxHeEjSR4wn/ctqtYM4=;
 b=UAiIWonvpQ8oaNhboELeC91JF4IYpLnTKF1bOdzqns+dshDTtsA9fvc5
 jn73za1TZApmJ3XWif4S/KnI7au95doIPh0ZgNHyZvNBldEFYkHIdTz2Z
 eQa9smSkenTbuwuTZ3tWmV4sKGph0+6fEZ4DeLYV9cK+2hdJobv68DECn
 ZVbz8DrqrDob98RsiGgFTjvFYHgM48Z45vrWyfJYcoRURMs8SGOjwEgJZ
 hAAx31dPze1PWGnjdj6F1iz4OWEobJYstKyeXxFscJ1ISmaAa/jfc9urD
 0zEh0tHkOtV2zuEmLm9tOm3u677AItJk8lY9pdIvXfFZPoXkPJU06onWa A==;
X-CSE-ConnectionGUID: HU2PrFdaSgqJo+YDQ1nTeQ==
X-CSE-MsgGUID: SwjxsuGPRwKD+rSCuSJ9bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="83067360"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="83067360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:35:37 -0700
X-CSE-ConnectionGUID: 9LIwJGyLST2dGF8bPHK8oQ==
X-CSE-MsgGUID: t6AhgoQuQ366sbu+1Bym8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="235952485"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:35:36 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 15/16] drm/xe: Use xe_fb_pin_ggtt_pin() for the initial FB
 pin
Date: Fri,  8 May 2026 17:34:25 +0300
Message-ID: <20260508143426.26504-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
References: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
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

Use xe_fb_pin_ggtt_pin() instead of intel_fb_pin_to_ggtt() for
the initial FB pin. We want to get rid of intel_fb_pin_to_ggtt()
and just use the new fb_pin parent interface.

This still isn't quite the final solution since we bypass the
actual parent interface and call the implementation directly.
But sorting that out will require more cleanup to the initial
FB code.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 21 +++++--------------
 drivers/gpu/drm/xe/display/xe_fb_pin.h        | 12 +++++++++++
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 18 ++++++++++------
 3 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3247b0683987..a8f72de0cf3a 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -413,22 +413,11 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 	kfree(vma);
 }
 
-struct i915_vma *
-intel_fb_pin_to_ggtt(struct drm_gem_object *obj,
-		     const struct intel_fb_pin_params *pin_params,
-		     int *out_fence_id)
-{
-	if (out_fence_id)
-		*out_fence_id = -1;
-
-	return __xe_pin_fb_vma(obj, false, pin_params);
-}
-
-static int xe_fb_pin_ggtt_pin(struct drm_gem_object *obj,
-			      const struct intel_fb_pin_params *pin_params,
-			      struct i915_vma **out_ggtt_vma,
-			      u32 *out_offset,
-			      int *out_fence_id)
+int xe_fb_pin_ggtt_pin(struct drm_gem_object *obj,
+		       const struct intel_fb_pin_params *pin_params,
+		       struct i915_vma **out_ggtt_vma,
+		       u32 *out_offset,
+		       int *out_fence_id)
 {
 	struct i915_vma *ggtt_vma;
 
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.h b/drivers/gpu/drm/xe/display/xe_fb_pin.h
index 8a42d4009f5d..20dd8a99a25f 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.h
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.h
@@ -4,6 +4,18 @@
 #ifndef __XE_FB_PIN_H__
 #define __XE_FB_PIN_H__
 
+#include <linux/types.h>
+
+struct drm_gem_object;
+struct i915_vma;
+struct intel_fb_pin_params;
+
+int xe_fb_pin_ggtt_pin(struct drm_gem_object *obj,
+		       const struct intel_fb_pin_params *pin_params,
+		       struct i915_vma **out_ggtt_vma,
+		       u32 *out_offset,
+		       int *out_fence_id);
+
 extern const struct intel_display_fb_pin_interface xe_display_fb_pin_interface;
 
 #endif /* __XE_FB_PIN_H__ */
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 8e3c0c4b81fe..02b46cc3b6df 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -7,12 +7,16 @@
 
 #include "regs/xe_gtt_defs.h"
 
-#include "intel_display_types.h"
+/* FIXME move intel_remapped_info_size() & co. */
 #include "intel_fb.h"
-#include "intel_fb_pin.h"
+
+/* FIXME move intel_initial_plane_config */
+#include "intel_display_types.h"
+
 #include "xe_bo.h"
 #include "xe_display_bo.h"
 #include "xe_display_vma.h"
+#include "xe_fb_pin.h"
 #include "xe_ggtt.h"
 #include "xe_mmio.h"
 #include "xe_vram_types.h"
@@ -137,14 +141,16 @@ xe_initial_plane_setup(struct drm_plane_state *_plane_state,
 	struct intel_fb_pin_params pin_params = {
 		.view = &plane_state->view.gtt,
 	};
+	u32 offset;
+	int ret;
 
-	vma = intel_fb_pin_to_ggtt(intel_fb_bo(fb), &pin_params, NULL);
-	if (IS_ERR(vma))
-		return PTR_ERR(vma);
+	ret = xe_fb_pin_ggtt_pin(intel_fb_bo(fb), &pin_params, &vma, &offset, NULL);
+	if (ret)
+		return ret;
 
 	plane_state->ggtt_vma = vma;
 
-	plane_state->surf = xe_ggtt_node_addr(plane_state->ggtt_vma->node);
+	plane_state->surf = offset;
 
 	plane_config->vma = vma;
 
-- 
2.52.0

