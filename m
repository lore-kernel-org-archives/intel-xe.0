Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02009FEA80E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AF310E790;
	Wed, 25 Mar 2026 05:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zt4Qqg6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F6E10E782;
 Wed, 25 Mar 2026 05:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414816; x=1805950816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2CzOjzpi4ZngI9uGFWgxNHl+zbmAE4l72fWN5zMUkic=;
 b=Zt4Qqg6anGnxRNSZ96sPMUYwz/NDH6+xJPjuA77YCcyiUmEdZ+XbokGM
 sANDZlI0U6F8fhizhd1u3iEpejOBnMiFbca4zDJWW4SGzdGrSl+Iwdd5x
 GQqml3er3wFQbG38NFJptWFUAAHrjnjchD5+9ZzL6eZFa2vZzDcqYyhlf
 IIt0DZBwolJm8irqrFZftAGIZMXGgBYbh+6/Jmf0Xa/gyewSYH5N30HbS
 nyPR92UWKJmY9hHdV1LB615WCCej/JAWjFnURCFinaOPcWPsvTh/bWRgw
 VN2U0NK2waVQ3JJ5abFhfh8EhdkjoYV+v4BSqBaIGzsOMeYGn4sfrHpKS Q==;
X-CSE-ConnectionGUID: BY6eUTTqS1qVsm0LruVJYQ==
X-CSE-MsgGUID: crlFxqGuTm+EE6gaUCVuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922357"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:00:15 -0700
X-CSE-ConnectionGUID: zjJZGv9dQROhnQbY6Jhi8A==
X-CSE-MsgGUID: kOQJWnMNTYKBbhegJLUW7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580832"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 22:00:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 19/26] drm/{i915/xe}/writeback: Add a writeback helper to
 get ggtt address
Date: Wed, 25 Mar 2026 10:29:09 +0530
Message-Id: <20260325045916.984243-20-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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

We need the ggtt address offset to write in the WD_SURF register.
With i915_vma being defined in xe and i915 and both having different
ways to extract the address this poses an issue.
Add a helper so that correct function is called to extract address
depending on xe/i915 driver.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                       |  1 +
 drivers/gpu/drm/i915/display/intel_writeback.c      |  3 ++-
 .../gpu/drm/i915/display/intel_writeback_helper.c   | 12 ++++++++++++
 .../gpu/drm/i915/display/intel_writeback_helper.h   |  8 ++++++++
 drivers/gpu/drm/xe/Makefile                         |  3 ++-
 drivers/gpu/drm/xe/display/xe_writeback_helper.c    | 13 +++++++++++++
 6 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_helper.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_helper.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_writeback_helper.c

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c3c903df7699..b1fb3de1ef2a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -315,6 +315,7 @@ i915-y += \
 	display/intel_vga.o \
 	display/intel_wm.o \
 	display/intel_writeback.o \
+	display/intel_writeback_helper.o \
 	display/skl_prefill.o \
 	display/skl_scaler.o \
 	display/skl_universal_plane.o \
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 317df2bf255a..d74e5fce85d6 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2025 Intel Corporation
+ * Copyright © 2026 Intel Corporation
  */
 
 #include <linux/slab.h>
@@ -24,6 +24,7 @@
 #include "intel_display_utils.h"
 #include "intel_fb_pin.h"
 #include "intel_writeback.h"
+#include "intel_writeback_helper.h"
 #include "intel_writeback_reg.h"
 
 struct intel_writeback_connector {
diff --git a/drivers/gpu/drm/i915/display/intel_writeback_helper.c b/drivers/gpu/drm/i915/display/intel_writeback_helper.c
new file mode 100644
index 000000000000..f483ed6ffc6b
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_writeback_helper.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "i915_vma.h"
+#include "intel_writeback_helper.h"
+
+u32 intel_get_ggtt_addr(struct i915_vma *vma)
+{
+	return i915_ggtt_offset(vma);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_writeback_helper.h b/drivers/gpu/drm/i915/display/intel_writeback_helper.h
new file mode 100644
index 000000000000..b46f437c3875
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_writeback_helper.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+struct i915_vma;
+
+u32 intel_get_ggtt_addr(struct i915_vma *vma);
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e2fab320b2ca..effbc0b4753a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -225,7 +225,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_initial_plane.o \
 	display/xe_panic.o \
 	display/xe_stolen.o \
-	display/xe_tdf.o
+	display/xe_tdf.o \
+	display/xe_writeback_helper.o
 
 # Display code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
diff --git a/drivers/gpu/drm/xe/display/xe_writeback_helper.c b/drivers/gpu/drm/xe/display/xe_writeback_helper.c
new file mode 100644
index 000000000000..5898984b129c
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/xe_writeback_helper.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_ggtt.h"
+#include "xe_display_vma.h"
+#include "intel_writeback_helper.h"
+
+u32 intel_get_ggtt_addr(struct i915_vma *vma)
+{
+	return lower_32_bits(xe_ggtt_node_addr(vma->node));
+}
-- 
2.34.1

