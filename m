Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB4AFD0651
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BAB10E205;
	Wed, 11 Mar 2026 14:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKTSL+pA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F400D10E25B;
 Wed, 11 Mar 2026 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238711; x=1804774711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhmot/45xUIJvIhnIC5JqblhT488hbldI9frz9SxYaI=;
 b=JKTSL+pAN9LLvJ1W9nERXE08eXXEtDWqKXzKWLfDMB2kZeRqPYZR+aS4
 HUtMkYgRJi8Y5y3HlL8JsGdwL3bExvfZgbg0tgVb4l7HryDGxts/nKBQj
 Ozq30LJ+g2Fud/B06f8gQS1CBjwit3N2vTwsomdY9hxB5Hsdij2ZS5Wsj
 /nBn0C73fswfwOyb+44cCtc0LyLzcM3iO/FPLlcLPkdTxSYTw2NGL3nhf
 j6NGF/4DK35G8fS7cIni5mfgKwZgWUsWCkG2t4X4L2KfcPnYBtPCZdnMI
 VfwgPB2BNY7U3rYmvha5ufpsudoZm7i5RP/7jdZIT4Y6a3RMWaxxyDJ9g Q==;
X-CSE-ConnectionGUID: 4dJm9X78T2G12K1Cinmctg==
X-CSE-MsgGUID: xfX1CJWbRrmQZTclKGKy2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77913503"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77913503"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:18:30 -0700
X-CSE-ConnectionGUID: Ry6SGHveRsqhkgF1vqzFXw==
X-CSE-MsgGUID: n//Oa3+VTFmzL3JBkvEKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="225447340"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:18:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/5] drm/i915: move i915 specific bo implementation to i915
Date: Wed, 11 Mar 2026 16:18:14 +0200
Message-ID: <e159166d623899996a51a577365ca7ab9b1a0974.1773238670.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773238670.git.jani.nikula@intel.com>
References: <cover.1773238670.git.jani.nikula@intel.com>
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

The bo interface implementation is different for both i915 and xe. Move
the i915 specific implementation from display to i915 core.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile                          | 2 +-
 drivers/gpu/drm/i915/{display/intel_bo.c => i915_bo.c} | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename drivers/gpu/drm/i915/{display/intel_bo.c => i915_bo.c} (97%)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 7e9d9b666511..52a82608b8b1 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -76,6 +76,7 @@ i915-$(CONFIG_PERF_EVENTS) += \
 
 # core display adaptation
 i915-y += \
+	i915_bo.o \
 	i915_display_pc8.o \
 	i915_dpt.o \
 	i915_dsb_buffer.o \
@@ -239,7 +240,6 @@ i915-y += \
 	display/intel_atomic.o \
 	display/intel_audio.o \
 	display/intel_bios.o \
-	display/intel_bo.o \
 	display/intel_bw.o \
 	display/intel_casf.o \
 	display/intel_cdclk.o \
diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/i915_bo.c
similarity index 97%
rename from drivers/gpu/drm/i915/display/intel_bo.c
rename to drivers/gpu/drm/i915/i915_bo.c
index 2b6eaec351d8..21a4533ba341 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/i915_bo.c
@@ -3,12 +3,13 @@
 
 #include <drm/drm_panic.h>
 
+#include "display/intel_bo.h"
+
 #include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_object.h"
 #include "gem/i915_gem_object_frontbuffer.h"
 #include "pxp/intel_pxp.h"
 #include "i915_debugfs.h"
-#include "intel_bo.h"
 
 bool intel_bo_is_tiled(struct drm_gem_object *obj)
 {
-- 
2.47.3

