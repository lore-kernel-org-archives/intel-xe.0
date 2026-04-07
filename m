Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772CFEDB7E7
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB9910E3B1;
	Tue,  7 Apr 2026 10:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eI+w/omV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3F10E3B1;
 Tue,  7 Apr 2026 10:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775556304; x=1807092304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z3rpLw1yl9m3GP0FR7/Ce+3tzi1f2zBywCWL+zWFzZs=;
 b=eI+w/omVxfUAvsdo2Iw/wFGE6lMcL5eSaatFPkBPujr/DTThyMvh6DSk
 9/JUpTbsoONUmkF6pKhGOUDmgg5oEu31nKJsaViMkPrlSlR9CrSIDjPon
 MTlKzzWU0PJGJBYbPLbGf2Q9bJjwsGanfjNmf5UWuL+HrP8y8qiZqqRnF
 ZPM3a/SWpYl3r/5pPUA3pk/6t6gggm9/4xNz+DZRHlqsHSrpPZB0MUeLl
 5h+m0susHCgO3DT6Rv/mpD3dk10vYRrFAky7GClGP6xfv7OO1Zwf1Iw/X
 SRC7IbAYaMT32Imj1KkE/OEMQUJnx0AsrqA/RXyVRitCYffTw3djPodcQ g==;
X-CSE-ConnectionGUID: xX0UTsUuQOKRv371A0vDqQ==
X-CSE-MsgGUID: qKUk7/UtSGe2mPDmb5exuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76705454"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76705454"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:04:48 -0700
X-CSE-ConnectionGUID: 7AAOc1/USHmXNAIxYbMoLQ==
X-CSE-MsgGUID: CBhlOsXWRNagMSfdLSAm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="224936684"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:04:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 1/3] drm/i915: move intel_fb_pin.c to i915_fb_pin.c
Date: Tue,  7 Apr 2026 13:04:35 +0300
Message-ID: <ab1ffc08bcd1364715396142f91780b6261bbe65.1775556190.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775556190.git.jani.nikula@intel.com>
References: <cover.1775556190.git.jani.nikula@intel.com>
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

intel_fb_pin.c is the final file in display/ that's specific to i915
only. Move it to i915 core, renaming it to i915_fb_pin.c. It'll still
depend on a lot of display stuff, unfortunately.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile                     |  2 +-
 .../{display/intel_fb_pin.c => i915_fb_pin.c}     | 15 ++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename drivers/gpu/drm/i915/{display/intel_fb_pin.c => i915_fb_pin.c} (97%)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 272c292f06ed..fa632f4e505c 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -80,6 +80,7 @@ i915-y += \
 	i915_display_pc8.o \
 	i915_dpt.o \
 	i915_dsb_buffer.o \
+	i915_fb_pin.o \
 	i915_hdcp_gsc.o \
 	i915_initial_plane.o \
 	i915_overlay.o \
@@ -279,7 +280,6 @@ i915-y += \
 	display/intel_drrs.o \
 	display/intel_dsb.o \
 	display/intel_fb.o \
-	display/intel_fb_pin.o \
 	display/intel_fbc.o \
 	display/intel_fdi.o \
 	display/intel_fifo_underrun.o \
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
similarity index 97%
rename from drivers/gpu/drm/i915/display/intel_fb_pin.c
rename to drivers/gpu/drm/i915/i915_fb_pin.c
index 738d77a1468a..580acbb14ada 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -9,18 +9,19 @@
 
 #include <drm/drm_print.h>
 
+#include "display/intel_display_core.h"
+#include "display/intel_display_rpm.h"
+#include "display/intel_display_types.h"
+#include "display/intel_fb.h"
+#include "display/intel_fb_pin.h"
+#include "display/intel_plane.h"
+
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_object.h"
 
+#include "i915_dpt.h"
 #include "i915_drv.h"
 #include "i915_vma.h"
-#include "intel_display_core.h"
-#include "intel_display_rpm.h"
-#include "intel_display_types.h"
-#include "i915_dpt.h"
-#include "intel_fb.h"
-#include "intel_fb_pin.h"
-#include "intel_plane.h"
 
 static struct i915_vma *
 intel_fb_pin_to_dpt(const struct drm_framebuffer *fb,
-- 
2.47.3

