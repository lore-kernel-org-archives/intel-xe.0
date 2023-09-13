Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C786EEE0210
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995D610E1FA;
	Wed, 13 Sep 2023 22:32:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A53810E1F7
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644361; x=1726180361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TWNCXGZyLRutZWphufSJNUZP+Uh/gGikmgESOAlv5ho=;
 b=lj6Obg5gyhF3PfYU9/WPBuWNPwISSlUJTylFv8MCTTGJxTLkBEmrmIu5
 BQRebZunRY0m0lf7nvJayuSUZoOvyuY01B1QJGUNgIcDPBL+/7J057W4F
 s4y1C904rdRIvnW0ojHl0eLoIor5lM9ef0sze/IOfR6DGwsgBpBMIriBQ
 7iwnlZSAvBbUkHvTAMjvc6i/1fOC2yogZ561xKulZ40mAAo8smuBEtMPK
 UdLRZQ9f90lJQkXQMuXGwAxB/jl8T0dSIBEkvN5M0mRHdwiMNCYPgIXHu
 wgWTlS3yew2oMH1HUHL0447pg8BYFcHjTy7CZ1Xa3L/Hg0z2UqofN/FtZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442829036"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="442829036"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="868004503"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="868004503"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:40 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 15:32:28 -0700
Message-ID: <20230913223228.2788706-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913223228.2788706-1-daniele.ceraolospurio@intel.com>
References: <20230913223228.2788706-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe/uc: Add GuC/HuC firmware path
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

v2: simplify comment (John),
    rebase on s/guc_submission_enabled/uc_enabled

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
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
index 015af1e20490..c0f1698cc05a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_uc_fw.h"
 
 /*
@@ -210,6 +211,30 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
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
@@ -347,7 +372,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (!xe_uc_fw_is_supported(uc_fw))
 		return 0;
 
-	if (!xe_device_uc_enabled(xe)) {
+	uc_fw_override(uc_fw);
+
+	/* an empty path means the firmware is disabled */
+	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
 		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
 		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
 		return 0;
-- 
2.41.0

