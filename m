Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA6C44500
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9662C10E0C7;
	Wed, 21 Jan 2026 21:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQ4nYux+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECB910E88D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769031753; x=1800567753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Jk7EE+gbpuQYL/QEZ8xtg+XM0gpwqzTTOakovTe3Rg=;
 b=LQ4nYux+oPOMw2WGSkYCNe+g4z3HhsTVQgrtrmtFqHrMGiOPZe9WsJOT
 JmGETm4MGJ6PRO62IQY1qy0LP0vxDmxy9KQyPoqSJh9HzutVvRuFabXOG
 UN21TuP5dBuIDfud+cbsKOR8Li2Nh+5BlISImsSPmvthdmm2mibusgC8u
 nIrEs+N3IpM2UAqMabm2AJtxW/l/L2vOX6EstUZBI4ex08vDPmlyM6M0I
 /HjdhHFYGSkDrSl1Nm3iqiiAyD6Bax7v3FcKoYf01CD/w58B/JbJsMgdx
 JlfCUsCo3sj71BZpJnqkjIQbSuqOPxvXQBjDtIW6XOBR3NJLDHYq7OyzW w==;
X-CSE-ConnectionGUID: EQ017yy8TSSZTx0pKSeylA==
X-CSE-MsgGUID: PBb4F2PuSoCjl04SaOV59Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70433937"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70433937"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:33 -0800
X-CSE-ConnectionGUID: nOl4XJ4rSeCQjrv0NPp08Q==
X-CSE-MsgGUID: zlutv//9Rf6khUSafvoKLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="205691612"
Received: from lalin-p14sg4.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.33.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/5] drm/xe: Keep all defaults in single header
Date: Wed, 21 Jan 2026 22:42:12 +0100
Message-ID: <20260121214218.2817-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121214218.2817-1-michal.wajdeczko@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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

We already have most of Xe defaults defined in xe_module.c,
where we use them for the modparam initializations, but some
were defined elsewhere, which breaks the consistency.

Introduce xe_defaults.h file, that will act as a placeholder
for all our default values, and can be used from other places.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_defaults.h     | 25 +++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h |  3 --
 drivers/gpu/drm/xe/xe_module.c       | 42 ++++++++++------------------
 4 files changed, 41 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_defaults.h

diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
new file mode 100644
index 000000000000..9183d05b96e1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_DEFAULTS_H_
+#define _XE_DEFAULTS_H_
+
+#include "xe_device_types.h"
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define XE_DEFAULT_GUC_LOG_LEVEL		3
+#else
+#define XE_DEFAULT_GUC_LOG_LEVEL		1
+#endif
+
+#define XE_DEFAULT_PROBE_DISPLAY		true
+#define XE_DEFAULT_VRAM_BAR_SIZE		0
+#define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
+#define XE_DEFAULT_MAX_VFS			~0
+#define XE_DEFAULT_MAX_VFS_STR			"unlimited"
+#define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
+#define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
+#define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index aad4aa53a51f..17f4d048c8b9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -26,6 +26,7 @@
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_debugfs.h"
+#include "xe_defaults.h"
 #include "xe_devcoredump.h"
 #include "xe_device_sysfs.h"
 #include "xe_dma_buf.h"
@@ -743,7 +744,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	assert_lmem_ready(xe);
 
 	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
-			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
+			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
 	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
 		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 34feef79fa4e..b4600c5069a9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -62,9 +62,6 @@ enum xe_wedged_mode {
 	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
 };
 
-#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
-#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
-
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index a0048f64ed12..903d3b433421 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_module.h>
 
+#include "xe_defaults.h"
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_configfs.h"
@@ -19,51 +20,36 @@
 #include "xe_observation.h"
 #include "xe_sched_job.h"
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define DEFAULT_GUC_LOG_LEVEL		3
-#else
-#define DEFAULT_GUC_LOG_LEVEL		1
-#endif
-
-#define DEFAULT_PROBE_DISPLAY		true
-#define DEFAULT_VRAM_BAR_SIZE		0
-#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
-#define DEFAULT_MAX_VFS			~0
-#define DEFAULT_MAX_VFS_STR		"unlimited"
-#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
-#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
-#define DEFAULT_SVM_NOTIFIER_SIZE	512
-
 struct xe_modparam xe_modparam = {
-	.probe_display =	DEFAULT_PROBE_DISPLAY,
-	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
-	.force_probe =		DEFAULT_FORCE_PROBE,
+	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
+	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
+	.force_probe =		XE_DEFAULT_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
-	.max_vfs =		DEFAULT_MAX_VFS,
+	.max_vfs =		XE_DEFAULT_MAX_VFS,
 #endif
-	.wedged_mode =		DEFAULT_WEDGED_MODE,
-	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
+	.wedged_mode =		XE_DEFAULT_WEDGED_MODE,
+	.svm_notifier_size =	XE_DEFAULT_SVM_NOTIFIER_SIZE,
 	/* the rest are 0 by default */
 };
 
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
-		 "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
+		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
 
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
-		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
+		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
 
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
-		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
+		 "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE) "])");
 
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
-		 "[default=" __stringify(DEFAULT_GUC_LOG_LEVEL) "])");
+		 "[default=" __stringify(XE_DEFAULT_GUC_LOG_LEVEL) "])");
 
 module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,
@@ -80,20 +66,20 @@ MODULE_PARM_DESC(gsc_firmware_path,
 module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
-		 "[default=" DEFAULT_FORCE_PROBE "])");
+		 "[default=" XE_DEFAULT_FORCE_PROBE "])");
 
 #ifdef CONFIG_PCI_IOV
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
 MODULE_PARM_DESC(max_vfs,
 		 "Limit number of Virtual Functions (VFs) that could be managed. "
 		 "(0=no VFs; N=allow up to N VFs "
-		 "[default=" DEFAULT_MAX_VFS_STR "])");
+		 "[default=" XE_DEFAULT_MAX_VFS_STR "])");
 #endif
 
 module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
 MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
-		 "[default=" DEFAULT_WEDGED_MODE_STR "])");
+		 "[default=" XE_DEFAULT_WEDGED_MODE_STR "])");
 
 static int xe_check_nomodeset(void)
 {
-- 
2.47.1

