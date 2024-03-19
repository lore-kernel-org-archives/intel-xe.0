Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540ABC54E7C
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 14:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D752910FB35;
	Tue, 19 Mar 2024 14:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMDcS52a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3110FB2B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710859006; x=1742395006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0O02x3fQeOpFvMcNoBWQtDogNEXtw+wokMGLssvFBA=;
 b=QMDcS52akPqnKxk9GSKQ6JbUGNyT3F4xhv8VtW5I5QPw3lXTb25UojWm
 e8zAEOxpV4RDbZVAjOQFrXbW1nx/8d/BZb/Kyq17tX2N62DONxV45nSLL
 c2u9jDu/to2aN95YZc2i4Z84KJTWuqjV8oniOeXwduZfxTUoI0RwUNkq9
 NhmZTTO1e/cAZbbfHD41MeNSZN4PQ598uSFcS11r3XDl1ulKSCJREs8gq
 j05sR0bWxX+uNTaet6lXscWyGZI3BmFtXO5YSCJYvy3qUiOid8pInrAZH
 80nPRUBfEbuiUePhMz2KIW7eob08RMp47JipU8pbK7zc/QYDeitGcejF0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="31161884"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="31161884"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 07:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="18562739"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 19 Mar 2024 07:36:45 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 1/8] drm/xe/guc: Add kconfig for GuC based register capture
Date: Tue, 19 Mar 2024 07:36:14 -0700
Message-Id: <20240319143621.371087-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319143621.371087-1-zhanjun.dong@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
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

Add kconfig for GuC based register capture. This feature support of
GuC to report error-state-capture, using a list of MMIO registers the
driver registers and GuC will dump, log and notify right before a GuC
triggered engine-reset event.
This feature could be disabled to save memory.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/Kconfig          | 11 +++++++
 drivers/gpu/drm/xe/Makefile         |  1 +
 drivers/gpu/drm/xe/xe_guc.c         |  5 ++++
 drivers/gpu/drm/xe/xe_guc_capture.c | 46 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h | 15 ++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1a556d087e63..c8e5c85f81cb 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -84,6 +84,17 @@ config DRM_XE_FORCE_PROBE
 
 	  Use "!*" to block the probe of the driver for all known devices.
 
+config DRM_XE_CAPTURE_ERROR
+	bool "Enable capturing GPU state following a hang"
+	depends on DRM_XE
+	default y
+	help
+	  This option enables capturing the GPU state when a hang is detected.
+	  This information is vital for triaging hangs and assists in debugging.
+	  Please report any hang to your Intel representative to help with triaging.
+
+	  If in doubt, say "Y".
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..67c90546bfbc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -93,6 +93,7 @@ xe-y += xe_bb.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
+	xe_guc_capture.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index caa86ccbe9e7..feceba7659f3 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -18,6 +18,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ads.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
@@ -318,6 +319,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = xe_guc_capture_init(guc);
+	if (ret)
+		goto out;
+
 	ret = xe_guc_ads_init(&guc->ads);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
new file mode 100644
index 000000000000..c5fe8de8a13f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021-2022 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "abi/guc_actions_abi.h"
+#include "regs/xe_regs.h"
+#include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue_types.h"
+#include "xe_hw_engine_types.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_ct.h"
+
+#include "xe_guc_log.h"
+#include "xe_gt_mcr.h"
+#include "xe_guc_submit.h"
+#include "xe_macros.h"
+#include "xe_map.h"
+
+#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
+
+int xe_guc_capture_init(struct xe_guc *guc)
+{
+	return 0;
+}
+
+#else	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
+
+int xe_guc_capture_init(struct xe_guc *guc)
+{
+	return 0;
+}
+
+#endif	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
new file mode 100644
index 000000000000..3caea2c6fffe
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021-2021 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_H
+#define _XE_GUC_CAPTURE_H
+
+#include <linux/types.h>
+
+struct xe_guc;
+
+int xe_guc_capture_init(struct xe_guc *guc);
+
+#endif /* _XE_GUC_CAPTURE_H */
-- 
2.34.1

