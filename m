Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF871EE2093
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 12:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C47210E780;
	Fri,  6 Feb 2026 12:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBRzYj+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC71D10E773;
 Fri,  6 Feb 2026 12:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770380040; x=1801916040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ztLI4bsY+8OI8X3uH0La9QWBnTS4nqY5RJHs/7VpYQ=;
 b=PBRzYj+1catmbzyc0GUqADdzYtWsjc/MFa6FRtTjhg9JSuVfHYZUEYrl
 m+HzM61ajfe6ytKgfnEbaIGfwMqmViIfvv7MsGGx/G8o+OPuogeH73kYj
 R8uFZVTOsPqdUNxn8P7PlrCjxM27K90zCy3LoLvR0+n8Gi67+w3kfcm+l
 uhZztVpX/40n+snjJ4RSzQYQ3ey73+LKO8NR/5uVF1EKFQyzp/EwNXsPf
 5YwBkLZQo+fQRE4kTj5cwZmv6x23JZMHyoXTJVkHiD3bMW75DCZK193N6
 JRCJlUN/4zDYLylLjTk+fL3JCJzOvJp6TpPW1pu65o4zLOobUidB8yLoS g==;
X-CSE-ConnectionGUID: OOytwKFiS9W5G4vAPfbHqA==
X-CSE-MsgGUID: N21NUSYYSyipOmHdSdUxtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71765201"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71765201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:14:00 -0800
X-CSE-ConnectionGUID: lJDpVIx+TD6Z2GAD+zOePg==
X-CSE-MsgGUID: d4rFnQW3TxWI124iLPmDkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248472615"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:13:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 05/10] drm/i915/dpt: remove display/intel_dpt.h
Date: Fri,  6 Feb 2026 14:13:26 +0200
Message-ID: <cf5e28649d145ca9c41ad49a9b3920d60fa8b8bf.1770379986.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770379986.git.jani.nikula@intel.com>
References: <cover.1770379986.git.jani.nikula@intel.com>
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

The remaining functions declared in intel_dpt.h are i915 specific, and
so are the users, so we can move them to i915_dpt.h. There are some
useless intel_dpt.h includes around that we can remove.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  1 -
 drivers/gpu/drm/i915/display/intel_dpt.h      | 19 -------------------
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  1 -
 drivers/gpu/drm/i915/i915_dpt.c               |  2 +-
 drivers/gpu/drm/i915/i915_dpt.h               | 10 ++++++++++
 6 files changed, 12 insertions(+), 23 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_dpt.h

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 295f14416be7..6df7593c29d5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -85,7 +85,6 @@
 #include "intel_dp_tunnel.h"
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
-#include "intel_dpt.h"
 #include "intel_dpt_common.h"
 #include "intel_drrs.h"
 #include "intel_dsb.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
deleted file mode 100644
index 0482af43e946..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#ifndef __INTEL_DPT_H__
-#define __INTEL_DPT_H__
-
-#include <linux/types.h>
-
-struct i915_address_space;
-struct i915_vma;
-
-struct i915_vma *intel_dpt_pin_to_ggtt(struct i915_address_space *vm,
-				       unsigned int alignment);
-void intel_dpt_unpin_from_ggtt(struct i915_address_space *vm);
-u64 intel_dpt_offset(struct i915_vma *dpt_vma);
-
-#endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 7249b784fbba..5d4ae8be5ca6 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -17,7 +17,7 @@
 #include "intel_display_core.h"
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
-#include "intel_dpt.h"
+#include "i915_dpt.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "intel_plane.h"
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 746e942cafd2..677f1339b7f8 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -17,7 +17,6 @@
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
-#include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 28300ef898f6..597890649285 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -8,12 +8,12 @@
 
 #include "display/intel_display_core.h"
 #include "display/intel_display_rpm.h"
-#include "display/intel_dpt.h"
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
 #include "gt/gen8_ppgtt.h"
 
+#include "i915_dpt.h"
 #include "i915_drv.h"
 
 struct i915_dpt {
diff --git a/drivers/gpu/drm/i915/i915_dpt.h b/drivers/gpu/drm/i915/i915_dpt.h
index 494cd4af3bcd..9b765bc8d88b 100644
--- a/drivers/gpu/drm/i915/i915_dpt.h
+++ b/drivers/gpu/drm/i915/i915_dpt.h
@@ -4,6 +4,16 @@
 #ifndef __I915_DPT_H__
 #define __I915_DPT_H__
 
+#include <linux/types.h>
+
+struct i915_address_space;
+struct i915_vma;
+
+struct i915_vma *intel_dpt_pin_to_ggtt(struct i915_address_space *vm,
+				       unsigned int alignment);
+void intel_dpt_unpin_from_ggtt(struct i915_address_space *vm);
+u64 intel_dpt_offset(struct i915_vma *dpt_vma);
+
 extern const struct intel_display_dpt_interface i915_display_dpt_interface;
 
 #endif /* __I915_DPT_H__ */
-- 
2.47.3

