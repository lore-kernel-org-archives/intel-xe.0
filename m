Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B007C04A94
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 18:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E3A10E04B;
	Mon, 31 Jul 2023 18:56:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5B610E045
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 18:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690829801; x=1722365801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CuVZndWMxO5V8uyrgx2mNcO2mMZldwtm+pH1VU584fg=;
 b=PITUbY0VrDoTFQkEww2ZAumM916HLZDsqZdZixtGkPXthcjtdWG6KKrF
 +74+UP36QqrRdA7jyxPYzFnLmTeahie4/fSAXYjasdr1BijuJDXxvjX+B
 +p2aM7CWKEK7S6OGuoL6aG9nwqdvxHNmulG6+mjOIRB7RgfE9r4EaKu+A
 Cirj2cyWWKkx8ITMFLgduBEiDeEbgdozlnJjyo8+T9pIwvQgv3TX3GSAi
 AjrvknJoILJ1Rhi2qYU+byDwt8JlL+tsdzmExCMqPpWQoKkR1evPhfq6W
 Ng2BDDjMCfvIoPx5dSdUPyLepBWpVkc7nDInUsxrPmAJmDsak5BZLOjRK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359138462"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="359138462"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 11:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722181896"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="722181896"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 11:56:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 31 Jul 2023 11:56:31 -0700
Message-ID: <20230731185631.667472-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731185631.667472-1-daniele.ceraolospurio@intel.com>
References: <20230731185631.667472-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/uc: Add GuC/HuC firmware path
 overrides
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

When testing a new binary and/or debugging binary-related issues, it is
useful to have the option to change which binary is loaded without
having to update and re-compile the kernel. To support this option, this
patch adds 2 new modparams to override the FW path for GuC and HuC. The
HuC modparam can also be set to an empty string to disable HuC loading.

Note that those modparams only take effect on platforms where we already
have a default FW, so we're sure there is support for FW loading and the
kernel isn't going to explode in an undefined path.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_module.h |  2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c  | 30 +++++++++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index de85494e2280..0660017c3e83 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
 module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
 
+char *xe_guc_firmware_path = NULL;
+module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
+MODULE_PARM_DESC(guc_firmware_path,
+		 "GuC firmware path to use instead of the default one");
+
+char *xe_huc_firmware_path = NULL;
+module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
+MODULE_PARM_DESC(huc_firmware_path,
+		 "HuC firmware path to use instead of the default one - empty string disables");
+
 char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
 module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 2c1f9199f909..e1da1e9ca5cb 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -10,4 +10,6 @@ extern bool force_execlist;
 extern bool enable_display;
 extern u32 xe_force_vram_bar_size;
 extern int xe_guc_log_level;
+extern char *xe_guc_firmware_path;
+extern char *xe_huc_firmware_path;
 extern char *xe_param_force_probe;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 729c7ed7d80d..785927987ea4 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_uc_fw.h"
 
 /*
@@ -209,6 +210,30 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	}
 }
 
+static void
+uc_fw_override(struct xe_uc_fw *uc_fw)
+{
+	char *path_override = NULL;
+
+	/* empty string disables, but it's not allowed for GuC */
+	switch (uc_fw->type) {
+	case XE_UC_FW_TYPE_GUC:
+		if (xe_guc_firmware_path && *xe_guc_firmware_path)
+			path_override = xe_guc_firmware_path;
+		break;
+	case XE_UC_FW_TYPE_HUC:
+		path_override = xe_huc_firmware_path;
+		break;
+	default:
+		break;
+	}
+
+	if (path_override) {
+		uc_fw->path = path_override;
+		uc_fw->user_overridden = true;
+	}
+}
+
 /**
  * xe_uc_fw_copy_rsa - copy fw RSA to buffer
  *
@@ -346,7 +371,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (!xe_uc_fw_is_supported(uc_fw))
 		return 0;
 
-	if (!xe_device_guc_submission_enabled(xe)) {
+	uc_fw_override(uc_fw);
+
+	/* user can provide an empty string via the override to disable */
+	if (!xe_device_guc_submission_enabled(xe) || !(*uc_fw->path)) {
 		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
 		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
 		return 0;
-- 
2.41.0

