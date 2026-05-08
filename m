Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51934CD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 14:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1097710F50A;
	Fri,  8 May 2026 14:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xjq6l9ot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F49F10F50B;
 Fri,  8 May 2026 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778250907; x=1809786907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t3VLFveXk3tBy3lHWjBFruXyw9LK6XPdzPhaNRAjMic=;
 b=Xjq6l9otm3gfR3W4oZ6QuatMWeOBrAmzkn+HkSN2m3NnSR1fZInMA0E2
 VCodXAGRHRi/KwjnxfGlf4rnL9ONg1FzSKBdrVtdZvUwj7vXf/k7cvaOx
 NAUTOHLR9kAtoz9mNynQ0YeCZtrB3VgRAEb+ckhO5T94CS1KD1LwwgSHN
 2a/xV8W4+lPErSrHvRwzzZKvp0v7VaWAiuNE2i5n7K3nkaJ0ho9H54Bf3
 M60BzrDyYVc6zEDTCDfZA93XMguoIyGuLKoaaDLUy9ArmvdomJBprph84
 aUASj3WpzUYiYN6SMzzFrh48BA7fpSxvSvPKiXbK/Y9cW1HhVmnbKdDA+ Q==;
X-CSE-ConnectionGUID: UjtuZS48SZmuS8J3g1UD0w==
X-CSE-MsgGUID: MjqTlRmeRqeXCEfJ114Leg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96644276"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="96644276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:35:07 -0700
X-CSE-ConnectionGUID: lLk+w0IOQWmUyVPDMawGUw==
X-CSE-MsgGUID: 905RQXInSqu4zIdqhIALEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="238566435"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:35:05 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 08/16] drm/xe: Kill the fbdev vma reuse hack
Date: Fri,  8 May 2026 17:34:18 +0300
Message-ID: <20260508143426.26504-9-ville.syrjala@linux.intel.com>
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

This fbdev vma reuse hacks is a massive layering violation. It
really does not belong in the fb pinning code. And it's in the
way of properly abstracting this stuff, so kill it.

I don't think this hack even does anything useful because the
normal view will just use bo->ggtt_node when present, and the
fbdev bo will be permanenly pinned with xe_bo_create_pin_map_at_novm()
which does set up bo->ggtt_node. So we should never end up
rebuilding the PTEs for the fbdev bo, even without the reuse hack.

v2: Pimp the commit message a a bit (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index cb987b844385..bab9b015ff8d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -10,7 +10,6 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
-#include "intel_fbdev.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_display_vma.h"
@@ -432,10 +431,7 @@ void intel_fb_unpin_vma(struct i915_vma *vma, int fence_id)
 static bool reuse_vma(struct intel_plane_state *new_plane_state,
 		      const struct intel_plane_state *old_plane_state)
 {
-	struct intel_framebuffer *fb = to_intel_framebuffer(new_plane_state->hw.fb);
 	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
-	struct xe_device *xe = to_xe_device(fb->base.dev);
-	struct intel_display *display = xe->display;
 	struct i915_vma *vma;
 
 	if (old_plane_state->hw.fb == new_plane_state->hw.fb &&
@@ -446,12 +442,6 @@ static bool reuse_vma(struct intel_plane_state *new_plane_state,
 		goto found;
 	}
 
-	if (fb == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
-		vma = intel_fbdev_vma_pointer(display->fbdev.fbdev);
-		if (vma)
-			goto found;
-	}
-
 	return false;
 
 found:
-- 
2.52.0

