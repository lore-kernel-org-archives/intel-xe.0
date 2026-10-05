Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A556CA5FFD
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3EE10EE73;
	Mon,  5 Oct 2026 19:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTyBksTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D5710EE45
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227177; x=1822763177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MPO35lqZEHOOQwNB+bRZIEm4/1j4KInOJVu6TDznnZw=;
 b=MTyBksTptoX39pfFXLhvK6e1u65R1n8c/jK+httWqxfmiGRipcnQVD/2
 CNDQyvoIGKl6zar+cAZVRyIARHFcCUbr1K4oLF4AkTxuWMbq7Ec4HTj6O
 OtZSIx8y/zxJqL7PyLo0cQij+yb9BF3GkbRx/hsxsGpUhsfAI9Diuw9JE
 3BG9Xxfekioe2oS0ATjILwj0FSLH62CN+uwkfAB8M1HFTeemDvkUdE4QC
 h6o1AeRUvPqUpB9sdUWhkWmmF1JImgIGeVdWlbOdpnBRdpSGn2nPIqwoC
 94qUH5MQchxsoXLzCmxRpeFa9TVUYXpqrAMG6sJcwhnl30vq6GYsvBAai g==;
X-CSE-ConnectionGUID: LNiHUGunSpKCcEWQbjMd1w==
X-CSE-MsgGUID: oaTNvRGST4ukDvzas+THZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578430"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:17 -0700
X-CSE-ConnectionGUID: /v3WFWdGTtOPtfWKeMNUTw==
X-CSE-MsgGUID: cfnBZRQBQDiUiA0DuiV56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690901"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:17 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 15/15] drm/xe: Add enable_media module parameter
Date: Mon,  5 Oct 2026 19:06:25 +0000
Message-ID: <20261005190611.332940-32-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
References: <20261005190611.332940-17-stuart.summers@intel.com>
MIME-Version: 1.0
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

The gt_types_allowed configfs attribute is debug-only, so provide a
supported way to disable the media GT on production builds. The
modparam takes precedence over configfs so a single knob is enough to
guarantee the media GT is left alone.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_configfs_debug.c |  3 +++
 drivers/gpu/drm/xe/xe_defaults.h       |  1 +
 drivers/gpu/drm/xe/xe_module.c         |  6 ++++++
 drivers/gpu/drm/xe/xe_module.h         |  1 +
 drivers/gpu/drm/xe/xe_pci.c            | 19 ++++++++++++++++---
 5 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index aa8b73cb2a64..e6a0b1f960bc 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -184,6 +184,9 @@
  * will always return one GT type per line. "primary" and "media" are the
  * GT type names supported by this interface.
  *
+ * Note that the ``enable_media=0`` module parameter takes precedence over
+ * this attribute: it disables the media GT even if "media" is listed here.
+ *
  * This attribute can only be set before binding to the device.
  *
  * Examples:
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 20292e682bf9..fdb12ebfa4e4 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -18,6 +18,7 @@
 /* Sentinel value for guc_log_level configfs: not set, fall back to module param */
 #define XE_GUC_LOG_LEVEL_UNSET			-1
 
+#define XE_DEFAULT_ENABLE_MEDIA			true
 #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 897724cb5cfb..be6a3a439cb0 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -22,6 +22,7 @@
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
+	.enable_media =		XE_DEFAULT_ENABLE_MEDIA,
 	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
 	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		XE_DEFAULT_FORCE_PROBE,
@@ -38,6 +39,11 @@ module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600)
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
 		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
 
+module_param_named(enable_media, xe_modparam.enable_media, bool, 0444);
+MODULE_PARM_DESC(enable_media, "Enable the media GT, when present. Disabling overrides any "
+		 "media GT selected via the gt_types_allowed configfs attribute "
+		 "[default=" __stringify(XE_DEFAULT_ENABLE_MEDIA) "])");
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 6272d9e41207..b10010e0a007 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@ struct work_struct;
 
 /* Module modprobe variables */
 struct xe_modparam {
+	bool enable_media;
 	bool probe_display;
 	int force_vram_bar_size;
 	int guc_log_level;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 18fa9d4f2f6d..6544c373af8c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -613,6 +613,19 @@ enum xe_gmdid_type {
 	GMDID_MEDIA
 };
 
+/*
+ * The media GT is usable only if both the enable_media modparam and the
+ * gt_types_allowed configfs attribute allow it; the modparam takes
+ * precedence and disables the media GT regardless of the configfs setting.
+ */
+static bool media_gt_allowed(struct xe_device *xe)
+{
+	if (!xe_modparam.enable_media)
+		return false;
+
+	return xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev));
+}
+
 static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
@@ -634,7 +647,7 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
 		int err;
 
 		/* Don't try to read media ver if media GT is not allowed */
-		if (type == GMDID_MEDIA && !xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
+		if (type == GMDID_MEDIA && !media_gt_allowed(xe)) {
 			*ver = *revid = 0;
 			return 0;
 		}
@@ -929,8 +942,8 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
-	if (!xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
-		xe_tile_info(tile, "Media GT disabled via configfs\n");
+	if (!media_gt_allowed(xe)) {
+		xe_tile_info(tile, "Media GT disabled\n");
 		return NULL;
 	}
 
-- 
2.43.0

