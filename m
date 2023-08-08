Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C23C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9410E158;
	Tue,  8 Aug 2023 11:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E4E10E158
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495171; x=1723031171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pg8UBg+wsXVyYRoeiB1ihvJAIeNuugLolmYu3DxH8mQ=;
 b=IFoNjsN+vXexV1/ojJ9urh2jvkC+68D284YC7nwAwrB/oljgmcK2fA4y
 ZVuDUdGV0HiUOPwJ+mLAFmr8upz49Zat/aWUz3bPgHxoL1/d91TjwuxHv
 rgTFsDHw5CVlbXAVa5O3Fd2rA6NUTErLghao/byZ9h/zQ5tlwfLdx1yDg
 mithtSq4u4u0JB6ttTfnfEQ3S9qLtBI17eBFuMS2QYbcb7fnoXRBR7ehm
 UZRGym7CBr8CAfAyJJOxpzFDhsqnuZHLBSNv+JsW+iLsb1cxKt//3f5x4
 6UzUW+T36V41HwTwhpIn+QBo9qS03X79Nko2q1jqJN+ts1fiXn3W/anLm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401758759"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401758759"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905196711"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="905196711"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 14:45:33 +0300
Message-Id: <20230808114535.1600595-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808114535.1600595-1-jani.nikula@intel.com>
References: <20230808114535.1600595-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

While it would be preferrable to get rid of the file altogether, in the
mean time rename ext/intel_device_info.c to ext/i915_utils.c to better
reflect what it's about.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  4 +-
 drivers/gpu/drm/xe/display/ext/i915_utils.c   | 15 +++++++
 .../drm/xe/display/ext/intel_device_info.c    | 39 -------------------
 3 files changed, 17 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/display/ext/i915_utils.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_device_info.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1b59702cd9f9..a05bd3d3179f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -147,8 +147,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
 	display/ext/i915_irq.o \
-	display/ext/intel_clock_gating.o \
-	display/ext/intel_device_info.o
+	display/ext/i915_utils.o \
+	display/ext/intel_clock_gating.o
 
 # SOC code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
new file mode 100644
index 000000000000..f97c909e931f
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "i915_drv.h"
+
+bool i915_vtd_active(struct drm_i915_private *i915)
+{
+	if (device_iommu_mapped(i915->drm.dev))
+		return true;
+
+	/* Running as a guest, we assume the host is enforcing VT'd */
+	return i915_run_as_guest();
+}
diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
deleted file mode 100644
index 5adda84dab31..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * Copyright © 2016 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
- */
-
-#include "intel_cdclk.h"
-#include "intel_de.h"
-#include "intel_display.h"
-#include "i915_drv.h"
-#include "i915_reg.h"
-#include <drm/drm_drv.h>
-
-bool i915_vtd_active(struct drm_i915_private *i915)
-{
-	if (device_iommu_mapped(i915->drm.dev))
-		return true;
-
-	/* Running as a guest, we assume the host is enforcing VT'd */
-	return i915_run_as_guest();
-}
-- 
2.39.2

