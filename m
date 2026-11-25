Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B8606A323
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BiuUJNbg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C641D10FC05;
	Wed, 25 Nov 2026 13:06:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2760710FC13
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795612004; x=1827148004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dHEWFkiOMYrGzF8ODvedrB/vHLxLd7BIvzxWlLtL6ac=;
 b=BiuUJNbgd4zkreoQ0L8AXzP6dUPeF8V9fFA06C59fgkOL5RhMFrjEcDk
 20BsdXIWMjU+m4GHcY/ZDI6PQDNdUxzXg8BNSV3CCRHPsQxoqrSmE653l
 OtaUL85V2j7eon0/zDxyfBV/m/PTif3RvlvViapXjWph/yYOGE1Od27gv
 jTCLlA+tUibICa7y9EadzEy86nF4ktZpBBXyxsnqRXD35zeBYS+J01kbr
 eSA5b6e1k4eu9H+myd6ZJ+EDPUIWc7+O+trRRjOz59Bot6WyuoNul/7IT
 OTiD8qVjIuyV/JrZjMpwue51tflwRWAOSSZssmrNlAcZFLmq17ZyAdJ38 g==;
X-CSE-ConnectionGUID: 2ZTmehpaQ5qN4LZGg1MV5g==
X-CSE-MsgGUID: Yxw8a3uKQ0WpX4kJnezNdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4507157"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4507157"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:06:41 -0800
X-CSE-ConnectionGUID: oaIA7fUHR+aFkUgFHRI4Lw==
X-CSE-MsgGUID: 09PtO9DvS9CxOEf54J6M+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12291893"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:06:38 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, hiresh.kumar.yadav@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Add debug configfs option to force OCODE load
Date: Wed, 25 Nov 2026 18:20:14 +0530
Message-ID: <20261125125011.192907-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125125011.192907-4-sk.anirban@intel.com>
References: <20261125125011.192907-4-sk.anirban@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The late-bind worker skips uploading OCODE when SysCtrl reports it is
already running.
Add a debug-only configfs attribute, ocode_force_load, under the
per-device xe configfs directory. When set, the late-bind worker skips
the "OCODE already running" check at probe and uploads the cached
OCODE payload.

The attribute must be set before binding the device:

	echo 1 > /sys/kernel/config/xe/0000:03:00.0/force_ocode_load

v2: Rename configfs (Rodrigo)
    Apply the override on both probe and resume paths (Rodrigo)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 58 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  1 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c       |  6 ++-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 2ddd707a6dbd..801b22fe3c36 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -85,6 +85,13 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Force OCODE load:
+ * -----------------
+ *
+ * With CONFIG_DRM_XE_DEBUG enabled, force an OCODE load at probe and resume
+ * even if OCODE is already running. This attribute can only be set before
+ * binding.
+ *
  * Allowed GT types:
  * -----------------
  *
@@ -302,6 +309,7 @@ struct xe_config_group_device {
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
+		bool force_ocode_load;
 		bool enable_psmi;
 		bool enable_multi_queue;
 		bool disable_vram_page_offline;
@@ -324,6 +332,7 @@ static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.migrate_ulls_period_ms = 5,
 	.survivability_mode = false,
+	.force_ocode_load = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
 	.disable_vram_page_offline = false,
@@ -429,6 +438,32 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t force_ocode_load_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->force_ocode_load);
+}
+
+static ssize_t force_ocode_load_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool force_load;
+	int ret;
+
+	ret = kstrtobool(page, &force_load);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.force_ocode_load = force_load;
+
+	return len;
+}
+
 static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -946,6 +981,7 @@ CONFIGFS_ATTR(, disable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, force_ocode_load);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
@@ -957,6 +993,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
+	&attr_force_ocode_load,
 	NULL,
 };
 
@@ -980,6 +1017,9 @@ static bool xe_config_device_is_visible(struct config_item *item,
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
+	if (attr == &attr_force_ocode_load && !IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		return false;
+
 	if (attr == &attr_survivability_mode) {
 		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
 			return false;
@@ -1240,6 +1280,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%d", force_ocode_load);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1288,6 +1329,23 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	return mode;
 }
 
+bool xe_configfs_get_force_ocode_load(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool force_load;
+
+	if (!dev || !IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		if (dev)
+			config_group_put(&dev->group);
+		return false;
+	}
+
+	force_load = dev->config.force_ocode_load;
+	config_group_put(&dev->group);
+
+	return force_load;
+}
+
 static u64 get_gt_types_allowed(struct pci_dev *pdev)
 {
 	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index d726800de26a..3f0d68bfb9c9 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -18,6 +18,7 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+bool xe_configfs_get_force_ocode_load(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index dfff1693bf1f..ad39383a7e41 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -12,6 +12,7 @@
 #include <drm/intel/intel_lb_mei_interface.h>
 #include <drm/drm_print.h>
 
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
@@ -259,7 +260,8 @@ static void xe_late_bind_work(struct work_struct *work)
 	xe_device_assert_mem_access(xe);
 
 	/* TODO: Compare the running OCODE version at probe when available. */
-	if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+	if (lbfw->type == INTEL_LB_TYPE_OCODE && !late_bind->force_ocode_load &&
+	    xe_sysctrl_is_oobmsm_fw_ready(xe)) {
 		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
 			fw_id_to_name[lbfw->id]);
 		goto out;
@@ -557,6 +559,8 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	if (err)
 		return err;
 
+	late_bind->force_ocode_load = xe_configfs_get_force_ocode_load(to_pci_dev(xe->drm.dev));
+
 	xe_late_bind_fw_load(late_bind);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index c7b3ffc743cf..2762442580fb 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -75,6 +75,8 @@ struct xe_late_bind {
 	bool component_added;
 	/** @disable: to block late binding reload during pm resume flow*/
 	bool disable;
+	/** @force_ocode_load: force OCODE loading even if already running */
+	bool force_ocode_load;
 };
 
 #endif
-- 
2.43.0

