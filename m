Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB55C4829D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F74D10EE12;
	Thu,  8 Feb 2024 21:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2tlwcM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099FD10EE05
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707427161; x=1738963161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tUuTalJsZmNDu392w849Y6Sf+Ob/LKOdTrstGZ00Swc=;
 b=E2tlwcM9WzN/y2JsFtaJKtDz/JvgqtnOXn3fRI6M8dKYoz/Kd/s6hGm+
 9RlADLPc0tD5MODNM+jAk+etpYXA7nKp3Ls3mN5d78df4T78+EF2ycsOj
 LeTKc4NSVkej8vpLivn5Wo4x9hkCnSl3juxyo62e09OIENb4BtAeF3en/
 okjaj6WzlLHxh0m98RRXqNfdiyBnPAnjMYa9q2LrmNFiSTA6RDE8jmHvT
 rck0Zu835BBMafBTkWEu7BwGyIDLV6+5QP2BCbUeX3dGJGGsEmGCRd+cO
 IM2rim7X47NerqQUtKJXYviAJ3PWIg7EJTdOPs4QxVweVZAHuX4uyR8yo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18823811"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="18823811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2141868"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 08 Feb 2024 13:19:21 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 1/8] drm/xe/guc: Add kconfig for GuC based register capture
Date: Thu,  8 Feb 2024 13:19:11 -0800
Message-Id: <20240208211918.81789-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208211918.81789-1-zhanjun.dong@intel.com>
References: <20240208211918.81789-1-zhanjun.dong@intel.com>
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
index e36ae1f0d885..410d058e2573 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -83,6 +83,17 @@ config DRM_XE_FORCE_PROBE
 
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
index c531210695db..8d71c6baf0a2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -92,6 +92,7 @@ xe-y += xe_bb.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
+	xe_guc_capture.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 868208a39829..c9b629d2052f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -17,6 +17,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ads.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
@@ -290,6 +291,10 @@ int xe_guc_init(struct xe_guc *guc)
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

