Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2C2D41C35
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 04:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DA410E797;
	Thu, 14 Nov 2024 04:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8uJRZfC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2894310E797;
 Thu, 14 Nov 2024 04:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731560330; x=1763096330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDNcx9SKQqtHwv/EBmWUxnxVtg6/tqbJqnWUUsou3tg=;
 b=b8uJRZfC6wfhfPxe6J4LetaUfYLsA+Y2XPh8iylQXyWhLV84VbdndHDP
 q3UtyHIeXft6etjpdMT2cNcY1C8zdfbMqV4uTVRCmgQ4+igyPD5Gn2vZK
 B8A4KfKrjAIHnCCeNi819qe+/l+zcBd1B0p1DpUI9uBxEKjJm210HX9HJ
 1oDkiY8q9+5X19BMyKCL69UKtf/vNYIJwrUsB6AmqKmTzE3dtPmtUa7ug
 wrxOSaaxo1g+JCffWNtWkmJaoszlMk2OlOrHf/yAK39cgwI2BThwYzwDM
 R1WWzWtYmx9A8tUvJDn34pJX8NZEm223XWATwhizVn259ddgkknzgweFK w==;
X-CSE-ConnectionGUID: q8bMvbY4SyitffhjfHqlVw==
X-CSE-MsgGUID: zds5b9j/TkWrPvzZck4liQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35409531"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="35409531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:58:50 -0800
X-CSE-ConnectionGUID: bgv5gL0sSPWW37ZaE+Qy5A==
X-CSE-MsgGUID: SczhlTWfTzu6MH4i8lgGQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92139111"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:58:48 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t 2/4] include/drm-uapi-experimental: Move i915_drm_local.h to
 drm-uapi-experimental
Date: Thu, 14 Nov 2024 10:31:27 +0530
Message-Id: <20241114050129.1381711-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
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

Move i915_drm_local.h to drm-uapi-experimental/intel_drm_local.h

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 .../drm-uapi-experimental/intel_drm_local.h   | 27 +++++++++++++++++++
 lib/i915/gem_scheduler.c                      |  2 +-
 lib/i915/intel_memory_region.h                |  2 +-
 lib/igt_gt.h                                  |  2 +-
 tools/i915-perf/i915_perf_recorder.c          |  2 +-
 5 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 include/drm-uapi-experimental/intel_drm_local.h

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
new file mode 100644
index 000000000..1773c649b
--- /dev/null
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+#ifndef _INTEL_DRM_LOCAL_H_
+#define _INTEL_DRM_LOCAL_H_
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * It is necessary on occasion to add uapi declarations to IGT before they
+ * appear in imported kernel uapi headers. This header is provided for this
+ * purpose.
+
+ * Early uapi declarations should be added here exactly as they are
+ * expected to appear in the kernel uapi headers, i.e. without the LOCAL_
+ * or local_ prefix and without any #ifndef's. Attempt should be made to
+ * clean these up when kernel uapi headers are sync'd.
+ */
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _INTEL_DRM_LOCAL_H_ */
diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
index 0087df902..7c4eea983 100644
--- a/lib/i915/gem_scheduler.c
+++ b/lib/i915/gem_scheduler.c
@@ -25,10 +25,10 @@
 #include <string.h>
 #include <sys/ioctl.h>
 
+#include "drm-uapi-experimental/intel_drm_local.h"
 #include "igt_core.h"
 #include "ioctl_wrappers.h"
 
-#include "i915/i915_drm_local.h"
 #include "i915/gem_scheduler.h"
 #include "i915/gem_submission.h"
 
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 9e24bd8fb..ce187f426 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -22,7 +22,7 @@
  */
 #include "i915_drm.h"
 #include "igt_collection.h"
-#include "i915_drm_local.h"
+#include "intel_drm_local.h"
 
 #ifndef INTEL_MEMORY_REGION_H
 #define INTEL_MEMORY_REGION_H
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index d3213123d..82ed22be7 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -24,11 +24,11 @@
 #ifndef IGT_GT_H
 #define IGT_GT_H
 
+#include "drm-uapi-experimental/intel_drm_local.h"
 #include "igt_debugfs.h"
 #include "igt_dummyload.h"
 #include "igt_core.h"
 
-#include "i915/i915_drm_local.h"
 #include "i915_drm.h"
 
 struct pci_device;
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index ca4354832..5dc5eb65d 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -44,7 +44,7 @@
 
 #include <i915_drm.h>
 
-#include "i915/i915_drm_local.h"
+#include "drm-uapi-experimental/intel_drm_local.h"
 
 #include "igt_core.h"
 #include "intel_chipset.h"
-- 
2.34.1

