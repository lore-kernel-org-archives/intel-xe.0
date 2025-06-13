Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A12C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F6C10E9AE;
	Fri, 13 Jun 2025 20:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXJ+Ro9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E6910E9BA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749844847; x=1781380847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A1HIsMwh9QmvlAQg7WKJYjK+MwkRcZVRp2RSwnG/lHs=;
 b=XXJ+Ro9rCwongGpC5mtIE3fjYRg7IgMsxrdSarGlcgEcWf/Mh06fkDOm
 PkoAXypPQLOke4V2554+bbsHuJjcbRCNPx08vgr6wNhl/Xj7gG2PF//3S
 iTe85NtrYymmR5pN35fDdm9X1QqqOgTGnFjUWKZr5GJ9sa2pKMFKk5pJO
 7NPnHJwkEgifaOcbjw16IH/EEw7IJqOCEKSrBMZ/EaD7IwvZIkna+DVYZ
 d9HUSuCxPg86F0W0iRFatEe1s13BAOfYfkMhN2ayRV/cgAZYZVaddTBa1
 8iETa4WT/V9zMl044l3z6wZBCXJYQEzCIR6t30JiEmY+R3usnokb0veY9 g==;
X-CSE-ConnectionGUID: FCxD92adQaKkiwJWTzFBGQ==
X-CSE-MsgGUID: QJFNRPLwR4iDCpmBwfet6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52054315"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52054315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:47 -0700
X-CSE-ConnectionGUID: 7KwNoBJMTkS49DitK7Sd0w==
X-CSE-MsgGUID: V49Ujr6IRUu+dF8zuHEo6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152875678"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Normalize default param values
Date: Fri, 13 Jun 2025 13:00:39 -0700
Message-ID: <20250613-guc-log-level-v2-3-cb84a63e49fe@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

Document xe module params with the default values following a similar
strategy for all of them:

	1) Define a DEFAULT_* macro with the default value. When the
	   value can't be directly stringified, also define a *_STR
	   variant
	2) Use __stringify() or the _STR variant to make sure the
	   default value shows up in the param description

This allows us to show the correct default according to the
configuration. max_vfs for example was wrongly documented for
CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default
documented.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 44 +++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 192908fa074cb..2068c579d5c3b 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -19,34 +19,43 @@
 #include "xe_sched_job.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define DEFAULT_GUC_LOG_LEVEL	3
+#define DEFAULT_GUC_LOG_LEVEL		3
+#define DEFAULT_MAX_VFS			~0
+#define DEFAULT_MAX_VFS_STR		"unlimited"
 #else
-#define DEFAULT_GUC_LOG_LEVEL	1
+#define DEFAULT_GUC_LOG_LEVEL		1
+#define DEFAULT_MAX_VFS			0
+#define DEFAULT_MAX_VFS_STR		"0"
 #endif
 
+#define DEFAULT_PROBE_DISPLAY		true
+#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
+#define DEFAULT_WEDGED_MODE		1
+#define DEFAULT_SVM_NOTIFIER_SIZE	512
+
 struct xe_modparam xe_modparam = {
-	.probe_display = true,
-	.guc_log_level = DEFAULT_GUC_LOG_LEVEL,
-	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
-#ifdef CONFIG_PCI_IOV
-	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
-#endif
-	.wedged_mode = 1,
-	.svm_notifier_size = 512,
+	.probe_display =	DEFAULT_PROBE_DISPLAY,
+	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
+	.force_probe =		DEFAULT_FORCE_PROBE,
+	.max_vfs =		DEFAULT_MAX_VFS,
+	.wedged_mode =		DEFAULT_WEDGED_MODE,
+	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
 	/* the rest are 0 by default */
 };
 
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
-MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
+		 "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
 
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
-MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
+MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
+		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
 
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
-MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
+MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size [default=0])");
 
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
@@ -66,18 +75,21 @@ MODULE_PARM_DESC(gsc_firmware_path,
 
 module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
-		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
+		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
+		 "[default=" DEFAULT_FORCE_PROBE "])");
 
 #ifdef CONFIG_PCI_IOV
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
 MODULE_PARM_DESC(max_vfs,
 		 "Limit number of Virtual Functions (VFs) that could be managed. "
-		 "(0 = no VFs [default]; N = allow up to N VFs)");
+		 "(0=no VFs; N=allow up to N VFs "
+		 "[default=" DEFAULT_MAX_VFS_STR "])");
 #endif
 
 module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
 MODULE_PARM_DESC(wedged_mode,
-		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
+		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
+		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
 
 static int xe_check_nomodeset(void)
 {

-- 
2.49.0

