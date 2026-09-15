Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E96C982C4
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D4410E2CE;
	Tue, 15 Sep 2026 20:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBvwOZyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2902E10E29D;
 Tue, 15 Sep 2026 20:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502972; x=1821038972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=es82EE4SkYp2VeMe6o6kmDnNOF51GcLUssIp66m83wg=;
 b=FBvwOZyh1pbja6LCtwlgg+wpx7FXThULc+wPYp3aM8Kz8T4piinSUWP+
 Gt8QmYA+nqGtZlcJThEhQIxVLpLu0LnYQccll3/2c9i5/JXFdKYybYuEe
 +eLeJMs6KZcwvIX0pQeg16QozZMuxeah/fQNYEjizxyUoCgfexWikZ40A
 aWMP1jd6UMDN3aP2++QeSNfUApYpaxHdyxRI0gZRsvDue5/dcjpfokaaq
 qN03UeHRtQZrooUdQVQFzTHKc6rvtB6UZ5/Fu6SUo9iMq7dkKV+LNQal6
 WtavNRtpc68THHKcl+ixkgNWL0aHiD/nQ/tOUFNUvZ9Vb0frECkx5ends Q==;
X-CSE-ConnectionGUID: 2H/JXP4sQN+3x+HO2izkNQ==
X-CSE-MsgGUID: vLhyJ/OpQDKfbLTtcORpQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89014996"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89014996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:32 -0700
X-CSE-ConnectionGUID: oWrJ1fpUSIeBfIXTC7IQPw==
X-CSE-MsgGUID: wDpQpSrZSLyD65e1WfjTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272644266"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 01/10] drm/intel: move i915_gtt_view_types.h to
 include/drm/intel
Date: Tue, 15 Sep 2026 23:09:12 +0300
Message-ID: <1e6d07316d821c284888c442a8b378e22c9325c2.1789502902.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
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

The i915 and xe drivers share i915_gtt_view_types.h from i915
source. Move it to include/drm/intel/gtt_view_types.h.

Remove the i915 compat header.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h         | 2 +-
 drivers/gpu/drm/i915/i915_vma_types.h                      | 3 +--
 .../gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h   | 7 -------
 drivers/gpu/drm/xe/display/xe_fb_pin.c                     | 4 +---
 .../drm/intel/gtt_view_types.h                             | 6 +++---
 5 files changed, 6 insertions(+), 16 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h
 rename drivers/gpu/drm/i915/i915_gtt_view_types.h => include/drm/intel/gtt_view_types.h (93%)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index a5f18ac8a7d0..2a9f690c3d70 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -41,10 +41,10 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank_work.h>
+#include <drm/intel/gtt_view_types.h>
 #include <drm/intel/i915_hdcp_interface.h>
 #include <uapi/drm/i915_drm.h>
 
-#include "i915_gtt_view_types.h"
 #include "intel_bios.h"
 #include "intel_display.h"
 #include "intel_display_conversion.h"
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index a499a3bea874..83fe02833b5e 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -29,11 +29,10 @@
 #include <linux/rbtree.h>
 
 #include <drm/drm_mm.h>
+#include <drm/intel/gtt_view_types.h>
 
 #include "gem/i915_gem_object_types.h"
 
-#include "i915_gtt_view_types.h"
-
 /**
  * DOC: Global GTT views
  *
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h
deleted file mode 100644
index b261910cd6f9..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/* Copyright © 2025 Intel Corporation */
-
-#include "../../i915/i915_gtt_view_types.h"
-
-/* Partial view not supported in xe, fail build if used. */
-#define I915_GTT_VIEW_PARTIAL
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b46a2c32ac07..6fae8cc27aad 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -4,11 +4,9 @@
  */
 
 #include <drm/intel/display_parent_interface.h>
+#include <drm/intel/gtt_view_types.h>
 #include <drm/ttm/ttm_bo.h>
 
-/* FIXME move the types to parent interface? */
-#include "i915_gtt_view_types.h"
-
 /* FIXME move intel_remapped_info_size() & co. to parent interface? */
 #include "intel_fb.h"
 
diff --git a/drivers/gpu/drm/i915/i915_gtt_view_types.h b/include/drm/intel/gtt_view_types.h
similarity index 93%
rename from drivers/gpu/drm/i915/i915_gtt_view_types.h
rename to include/drm/intel/gtt_view_types.h
index 9c4f38db32ff..35a48932e5e8 100644
--- a/drivers/gpu/drm/i915/i915_gtt_view_types.h
+++ b/include/drm/intel/gtt_view_types.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: MIT */
 /* Copyright © 2025 Intel Corporation */
 
-#ifndef __I915_GTT_VIEW_TYPES_H__
-#define __I915_GTT_VIEW_TYPES_H__
+#ifndef __DRM_INTEL_GTT_VIEW_TYPES_H__
+#define __DRM_INTEL_GTT_VIEW_TYPES_H__
 
 #include <linux/types.h>
 
@@ -71,4 +71,4 @@ static inline bool i915_gtt_view_is_rotated(const struct i915_gtt_view *view)
 	return view->type == I915_GTT_VIEW_ROTATED;
 }
 
-#endif /* __I915_GTT_VIEW_TYPES_H__ */
+#endif
-- 
2.47.3

