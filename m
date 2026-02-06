Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E08EE2084
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 12:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BA910E76E;
	Fri,  6 Feb 2026 12:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVYwHMyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEA610E76E;
 Fri,  6 Feb 2026 12:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770380021; x=1801916021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9N/QZMHt3VPVVbCm30vz+B7gUq29t4ochRsU3HQlzAo=;
 b=BVYwHMyhBxwaZqmfocNB1AEpydl4LBRW3kdZWwPXCtvxingE0QrXk353
 0nrA4LberpEAjAWXOqbLZp2/pgHvmJ+lHFG6gkiYjBOm+7F1JtSRoAHYi
 KlgydpIZ02kDbHWQIyE1zMmwyLXoPjpRVxUmnbROITsfHYjEu+OvvRLIY
 Y9Ttk5D79P2BgI1MhvRJtuXiOEBF32C2xhTDXPZN8X3x7ri1QnhwFmqgH
 F1fveCczL1mtWOLMk7lmTmdSxNTJEuW0s03fklCAlD4jLWQZQR7pjhM+K
 UvvlhMYh/Gps7YCVGinl6O0QP2ZyjcrlC2iDTarT0Ql7my2/SDkYgIiYi A==;
X-CSE-ConnectionGUID: LKNZ2uCISL2cb5E0xHV+iA==
X-CSE-MsgGUID: /kuifrVYSHOsJSffMe3pKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71765179"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71765179"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:13:41 -0800
X-CSE-ConnectionGUID: J05MqQ/MSzCjRNLIYmk+7g==
X-CSE-MsgGUID: teI9q95YSHCpivGD+FqOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248472589"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:13:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 01/10] drm/i915/dpt: move display/intel_dpt.c to i915_dpt.c
Date: Fri,  6 Feb 2026 14:13:22 +0200
Message-ID: <bd9644ca7b110251d6454bf91e5e7a33e178ad78.1770379986.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770379986.git.jani.nikula@intel.com>
References: <cover.1770379986.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile                          |  2 +-
 .../gpu/drm/i915/{display/intel_dpt.c => i915_dpt.c}   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/i915/{display/intel_dpt.c => i915_dpt.c} (97%)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 7d726e8c21bf..1d71ecb3ca83 100644
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
index 58d953472218..e229c5e26f5f 100644
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

