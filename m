Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C567FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 09:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4B10EAC5;
	Tue, 28 Apr 2026 09:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkIH/BnV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A10210EAC4;
 Tue, 28 Apr 2026 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777369893; x=1808905893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5GtjBVe++kZJzMtRmtKM9b9RVFpGC6zHg6Ad/yPCjw=;
 b=BkIH/BnV3J3U8gXFuAuN143JW1V1xPihKqucZRKkFWhvCkIE61RG3Y1K
 5lG4FJRJSP0I5g/8nazr38SxlH8GIpden2ly6yDTsOKnUWMhPWuqM0fYq
 +acTQf+9SF8JWkPC6f8Rq2ykUi2TYP8w5ORI7+NHoNxF1vvZdrBjdQRfa
 +ZUwuNvLA8GmwgZV9MgzVkurFIfM6y5mszQqYq9eH7Ua6Ob+jc4cSKQSy
 eePP21yPqFlkRfkDvS2p5wtHQnnorCGZulJR19zK5nseZ+fWfACP+FZax
 hhVPm+TRfAfY56F0R80a5DIQ3jUbgT3T3q6ctghYHiZPvXeSIWR3AznDw g==;
X-CSE-ConnectionGUID: zjPoPJLFQJiLx2lXhwy/Hg==
X-CSE-MsgGUID: ZinXKYk+RH6/8lIFEqSL3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78385108"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78385108"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:51:32 -0700
X-CSE-ConnectionGUID: RaLc3KnFR2KjdQ8WdcubSQ==
X-CSE-MsgGUID: PbeGXjkmQk63zx+Q61i3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="238891828"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.243])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:51:30 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v5 1/8] drm/i915: move SKL clock gating init to display
Date: Tue, 28 Apr 2026 12:48:19 +0300
Message-ID: <20260428095104.818360-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428095104.818360-1-luciano.coelho@intel.com>
References: <20260428095104.818360-1-luciano.coelho@intel.com>
MIME-Version: 1.0
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

Move the SKL-specific display clock gating programming into a new file
inside display.

This removes dependency from intel_clock_gating.c to the display's
intel_pch.h file, so we can remove the include statement.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../i915/display/intel_display_clock_gating.c | 19 +++++++++++++++++++
 .../i915/display/intel_display_clock_gating.h | 13 +++++++++++++
 drivers/gpu/drm/i915/intel_clock_gating.c     |  8 ++------
 4 files changed, 35 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index fa632f4e505c..07802a7f4ce5 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -256,6 +256,7 @@ i915-y += \
 	display/intel_cursor.o \
 	display/intel_dbuf_bw.o \
 	display/intel_de.o \
+	display/intel_display_clock_gating.o \
 	display/intel_display.o \
 	display/intel_display_conversion.o \
 	display/intel_display_driver.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
new file mode 100644
index 000000000000..4a94593335e0
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Intel Corporation
+ */
+
+#include <drm/intel/intel_gmd_misc_regs.h>
+
+#include "intel_de.h"
+#include "intel_display_clock_gating.h"
+#include "intel_display_regs.h"
+
+void intel_display_skl_init_clock_gating(struct intel_display *display)
+{
+	/*
+	 * WaFbcTurnOffFbcWatermark:skl
+	 * Display WA #0562: skl
+	 */
+	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
new file mode 100644
index 000000000000..00f416db7f47
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2026 Intel Corporation
+ */
+
+#ifndef __INTEL_DISPLAY_CLOCK_GATING_H__
+#define __INTEL_DISPLAY_CLOCK_GATING_H__
+
+struct intel_display;
+
+void intel_display_skl_init_clock_gating(struct intel_display *display);
+
+#endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 515f83c82abc..ad28ceee012b 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -32,9 +32,9 @@
 
 #include "display/i9xx_plane_regs.h"
 #include "display/intel_display.h"
+#include "display/intel_display_clock_gating.h"
 #include "display/intel_display_core.h"
 #include "display/intel_display_regs.h"
-#include "display/intel_pch.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_mcr.h"
@@ -349,11 +349,7 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
 	/* WAC6entrylatency:skl */
 	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
 
-	/*
-	 * WaFbcTurnOffFbcWatermark:skl
-	 * Display WA #0562: skl
-	 */
-	intel_uncore_rmw(&i915->uncore, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
+	intel_display_skl_init_clock_gating(i915->display);
 }
 
 static void bdw_init_clock_gating(struct drm_i915_private *i915)
-- 
2.53.0

