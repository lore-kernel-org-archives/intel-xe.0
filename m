Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E9EFEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47D110EBDB;
	Fri, 27 Feb 2026 17:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEWL+0rO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D9610EBDD;
 Fri, 27 Feb 2026 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772212654; x=1803748654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/wV8RxvbZeYQ68iM4EKmPi3xZDp7NCH2XtQIcoeN50w=;
 b=nEWL+0rOrKq9jZBVnfQOO+Lg1cKG1u8c4bF72HPleCYonkkVo7JgCZ/X
 yIk+T4NpV3ArqSqrMHb+TNusZ2MjT0Eb7r9sU2agjkP3Ng1TRhydVbVPt
 3AJ0knNRPnpWLc4HOk3bGQOGhDHvQDBZzPTqZcinOq4b5aWGiQoVWA8cH
 zwGQm6Cw9sgtH9tzO+PWucbQvl2SSDHqiCXuc1G8nqLceQvgdEbzkFgVN
 Ap/s/s05sMNLmO6iKcRGOGQQQ2LuMygqGwE1GPjixH0UP5CRW9nMYFqvJ
 4WWgypiUOS6SDUCX3RqMyxzbZjSu/HjxAan+RTTC8YoO3GkPvtu/a3G1k g==;
X-CSE-ConnectionGUID: lXQombSjTvKIodcRcK8hbQ==
X-CSE-MsgGUID: YAA1aP3fRyqhgSkQ/g6Ucw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75902366"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75902366"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:33 -0800
X-CSE-ConnectionGUID: Obn8SqCYQ2WK4WfBOV++YQ==
X-CSE-MsgGUID: rqYg4DDmQ9G4FfQUxEWwcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213804065"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/4] drm/xe/compat: remove i915_vma.h from compat
Date: Fri, 27 Feb 2026 19:17:13 +0200
Message-ID: <ecd5d75981b4b21c3da3b1831faceccfe385d898.1772212579.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772212579.git.jani.nikula@intel.com>
References: <cover.1772212579.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Type: text/plain; charset=UTF-8
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

Move compat i915_vma.h to xe_display_vma.h, and remove all extra
cruft. Drop the i915_ggtt_offset() wrapper in favour of using
xe_ggtt_node_addr() directly.

The usefulness of the I915_TILING_X and I915_TILING_Y undef/define is
unclear, since uapi/drm/i915_drm.h is included in other paths as well.

The naming of struct i915_vma is a bit unfortunate in xe, but (at least
for now) a necessity for maintaining type safety on the opaque type.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h | 34 -------------------
 drivers/gpu/drm/xe/display/xe_display_vma.h   | 18 ++++++++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  6 ++--
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  4 +--
 4 files changed, 23 insertions(+), 39 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_vma.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
deleted file mode 100644
index da1d97b48fee..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef I915_VMA_H
-#define I915_VMA_H
-
-#include <uapi/drm/i915_drm.h>
-
-#include "xe_ggtt.h"
-
-#include <linux/refcount.h>
-
-/* We don't want these from i915_drm.h in case of Xe */
-#undef I915_TILING_X
-#undef I915_TILING_Y
-#define I915_TILING_X 0
-#define I915_TILING_Y 0
-
-struct xe_bo;
-
-struct i915_vma {
-	refcount_t ref;
-	struct xe_bo *bo, *dpt;
-	struct xe_ggtt_node *node;
-};
-
-static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
-{
-	return xe_ggtt_node_addr(vma->node);
-}
-
-#endif
diff --git a/drivers/gpu/drm/xe/display/xe_display_vma.h b/drivers/gpu/drm/xe/display/xe_display_vma.h
new file mode 100644
index 000000000000..28267be61ae0
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/xe_display_vma.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2026 Intel Corporation */
+
+#ifndef _XE_DISPLAY_VMA_H_
+#define _XE_DISPLAY_VMA_H_
+
+#include <linux/refcount.h>
+
+struct xe_bo;
+struct xe_ggtt_node;
+
+struct i915_vma {
+	refcount_t ref;
+	struct xe_bo *bo, *dpt;
+	struct xe_ggtt_node *node;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index f0c89f144563..dbbc61032b7f 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -5,7 +5,6 @@
 
 #include <drm/ttm/ttm_bo.h>
 
-#include "i915_vma.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
@@ -13,6 +12,7 @@
 #include "intel_fbdev.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_display_vma.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
 #include "xe_vram_types.h"
@@ -408,7 +408,7 @@ static bool reuse_vma(struct intel_plane_state *new_plane_state,
 	refcount_inc(&vma->ref);
 	new_plane_state->ggtt_vma = vma;
 
-	new_plane_state->surf = i915_ggtt_offset(new_plane_state->ggtt_vma) +
+	new_plane_state->surf = xe_ggtt_node_addr(new_plane_state->ggtt_vma->node) +
 		plane->surf_offset(new_plane_state);
 
 	return true;
@@ -438,7 +438,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 
 	new_plane_state->ggtt_vma = vma;
 
-	new_plane_state->surf = i915_ggtt_offset(new_plane_state->ggtt_vma) +
+	new_plane_state->surf = xe_ggtt_node_addr(new_plane_state->ggtt_vma->node) +
 		plane->surf_offset(new_plane_state);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index c46e9d8115bd..4be0cfb6d0c1 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -12,7 +12,6 @@
 #include "xe_ggtt.h"
 #include "xe_mmio.h"
 
-#include "i915_vma.h"
 #include "intel_crtc.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -20,6 +19,7 @@
 #include "intel_fbdev_fb.h"
 #include "intel_fb_pin.h"
 #include "xe_bo.h"
+#include "xe_display_vma.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
 
@@ -165,7 +165,7 @@ xe_initial_plane_setup(struct drm_plane_state *_plane_state,
 
 	plane_state->ggtt_vma = vma;
 
-	plane_state->surf = i915_ggtt_offset(plane_state->ggtt_vma);
+	plane_state->surf = xe_ggtt_node_addr(plane_state->ggtt_vma->node);
 
 	plane_config->vma = vma;
 
-- 
2.47.3

