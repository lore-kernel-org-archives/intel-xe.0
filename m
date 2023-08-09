Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F807C04A94
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B0310E49B;
	Wed,  9 Aug 2023 19:05:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764910E49B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691607937; x=1723143937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Ern5qQoVjD5G8mb7JfN0Yu22ZACjRzxfT3H7xS01Q4=;
 b=mkgiHr22Nu/5r9bZf2fTV0NjjG5Ijs7XF/OI7HWbqDcW6IxFKACUe/Dh
 Q0khtNmR2fmfz5pbzs9sREgrU1YUSDVBNNV2K9adWsqxWUXURClMbrYma
 L1biXMC/0dj7jA9Uq+Fqc4UmCkOs7lLq7pXe+jLrdhqCgcjz1peUySp8J
 oNVy/LfCSY4Qkpxz/BGlI0lH+CmG6L7gu2M/CBosD+Aup+yxuJ/sWVbpc
 CDZZjnUUSfbBigkg2IwtuY9zthxxXE1ISdQFhOdiNGnMWc6pQE6w6BSr+
 lv3cxcPzMxvkH+Ec3XTb+2zfBBdCvHuFSjOPDSwOqeWoykUk1S/2hYJHK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370108234"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="370108234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905768053"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="905768053"
Received: from rbujor-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.48])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 22:04:51 +0300
Message-Id: <20230809190453.1927134-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809190453.1927134-1-jani.nikula@intel.com>
References: <20230809190453.1927134-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/9] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

While it would be preferrable to get rid of the file altogether, in the
mean time rename ext/intel_device_info.c to ext/i915_utils.c to better
reflect what it's about.

v2: Rebase, retain __i915_inject_probe_error()

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  4 +-
 drivers/gpu/drm/xe/display/ext/i915_utils.c   | 22 +++++++++
 .../drm/xe/display/ext/intel_device_info.c    | 46 -------------------
 3 files changed, 24 insertions(+), 48 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/display/ext/i915_utils.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_device_info.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c91bb7ddcf1d..1353d65fee5c 100644
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
index 000000000000..981edc2788bc
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: MIT
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
+
+/* i915 specific, just put here for shutting it up */
+int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
+			      const char *func, int line)
+{
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
deleted file mode 100644
index fcea9cd93aba..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ /dev/null
@@ -1,46 +0,0 @@
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
-
-/* i915 specific, just put here for shutting it up */
-int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
-							  const char *func, int line)
-{
-	return 0;
-}
-- 
2.39.2

