Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C7FD3762
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 14:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFAA10E1AB;
	Wed, 25 Feb 2026 14:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMoyY100";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E4010E7A4;
 Wed, 25 Feb 2026 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772030967; x=1803566967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5f73lHQu39RLEGfhib7ZDX6IBCLKJSHWlCQCMvxfvw0=;
 b=iMoyY100WaBrX3GSRZsfWvBMgzp5xlDlzUsnEyNV04WOsR3K6FMyiwrw
 +0K8WhRmgLUrGGk9XW4iqLPq1uy7BmlLnAtD0vr6MnQa5DI1kJiOemmaF
 J89hOus7dg4hfsFo8aAV715wlG2nVGMS/8pNdKhjYchCKwjHw2gO6NCkE
 ChFOOj8gmNlXEjj5UzM/sjJV/XRtXtFfnLz4MD0HwqE2T7cJ5t0/tFdOV
 LtGQxML+nZoNhauN6ICJriE642GWJE6Y9Fhezv4kbRQKo9mXKlz7RkTGs
 nuqhMc+0lGSqeIfn58MM32a1g8SLe5xM+47dQ2jvin+v7Msl64PbFNTBe g==;
X-CSE-ConnectionGUID: nIdQtb9YSIKeVt865KIBdA==
X-CSE-MsgGUID: GMaYsDXCQFa3+/xVtwfkFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83398616"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83398616"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:49:27 -0800
X-CSE-ConnectionGUID: nMw/m/kzSiayni0venDX8g==
X-CSE-MsgGUID: UDXu6dAUShatglwN2tJ3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213369251"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:49:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 01/10] drm/i915/dpt: move display/intel_dpt.c to i915_dpt.c
Date: Wed, 25 Feb 2026 16:49:07 +0200
Message-ID: <20a3bfb2762f39f9666d9a5752b8d2fb133583b0.1772030909.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772030909.git.jani.nikula@intel.com>
References: <cover.1772030909.git.jani.nikula@intel.com>
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

The DPT implementation is i915 specific. The xe driver has a different
implementation. Move display/intel_dpt.c to i915_dpt.c. Cleanups will
follow.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile                          |  2 +-
 .../gpu/drm/i915/{display/intel_dpt.c => i915_dpt.c}   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/i915/{display/intel_dpt.c => i915_dpt.c} (97%)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4d6c528d9881..f1f504b36374 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -77,6 +77,7 @@ i915-$(CONFIG_PERF_EVENTS) += \
 # core display adaptation
 i915-y += \
 	i915_display_pc8.o \
+	i915_dpt.o \
 	i915_dsb_buffer.o \
 	i915_hdcp_gsc.o \
 	i915_initial_plane.o \
@@ -270,7 +271,6 @@ i915-y += \
 	display/intel_dpio_phy.o \
 	display/intel_dpll.o \
 	display/intel_dpll_mgr.o \
-	display/intel_dpt.o \
 	display/intel_dpt_common.o \
 	display/intel_dram.o \
 	display/intel_drrs.o \
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
similarity index 97%
rename from drivers/gpu/drm/i915/display/intel_dpt.c
rename to drivers/gpu/drm/i915/i915_dpt.c
index da472371c7d7..3f764727025c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -5,17 +5,17 @@
 
 #include <drm/drm_print.h>
 
+#include "display/intel_display_core.h"
+#include "display/intel_display_rpm.h"
+#include "display/intel_display_types.h"
+#include "display/intel_dpt.h"
+#include "display/intel_fb.h"
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
 #include "gt/gen8_ppgtt.h"
 
 #include "i915_drv.h"
-#include "intel_display_core.h"
-#include "intel_display_rpm.h"
-#include "intel_display_types.h"
-#include "intel_dpt.h"
-#include "intel_fb.h"
 
 struct i915_dpt {
 	struct i915_address_space vm;
-- 
2.47.3

