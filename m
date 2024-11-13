Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9C0D462A7
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 14:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5C410E710;
	Wed, 13 Nov 2024 14:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWASInMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B199510E709;
 Wed, 13 Nov 2024 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731506779; x=1763042779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDNcx9SKQqtHwv/EBmWUxnxVtg6/tqbJqnWUUsou3tg=;
 b=FWASInMb7LMQ+FnQUiC3PUAbRFaciltSMG8ccQ4dbTP6rs2fYFdqf7Zm
 iLRF2RPP1wcyLEkjGkr9MXppp0zCzlEtQX8SvKQpYLwZUjNLm/fBc0XqK
 fVAu3IL32/2sgPHAV8eDZobPDab5y7kY9yK6Lc/Ws+JAZWTRrcqmQXYFh
 6t42fCj9IRxyKdz4ZEXcgibPGHfS56aES3ADISZIrpsMssJROVR9TYPad
 kvR767yTk0+GepHmTFdH+nW21pkcBUHYSscEmwaDGdQNX/su76m930nU+
 4TScoCx9URmgd1i2tCc8JbqIavT7CWIwBscyczqLAh95yB2WExqPXLq+x Q==;
X-CSE-ConnectionGUID: 2B/uNRfcQUWhSSS6NhLGOg==
X-CSE-MsgGUID: /kU6uQioQ1qziJqc1LkiaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30792356"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="30792356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:19 -0800
X-CSE-ConnectionGUID: iAyXlJ5sSCW1taT+ftPQxw==
X-CSE-MsgGUID: 313oEkM+SqW81bgsVSDTaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92654141"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:17 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 2/4] include/drm-uapi-experimental: Move i915_drm_local.h to
 drm-uapi-experimental
Date: Wed, 13 Nov 2024 19:40:10 +0530
Message-Id: <20241113141012.1362064-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
References: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
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

