Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB07DCA6002
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 22:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1434E10EEBB;
	Mon,  5 Oct 2026 22:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQL0s6to";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB1F10E2A9
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 22:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791238001; x=1822774001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f5wxMvvcTPXdi6kZsa7p9y6aqTsATs7VRcZivIRN594=;
 b=UQL0s6to1CThCQ7FMd/jIrzdePOpAvVJfs3VAP/xmPu8ja/j+nyUIrby
 qsDmCvRo9YXlPU53lMUfaV6glOo/qYVYuFH/Tum8V8YI8g05OJ0TJm6bx
 f8Yny3/7JOf4RP0r5XTi7GKoHM7Jwau/5DSVZQ0K2qAKCKhH5I3Tui2Hw
 vP7NESu4vJhWRYnXl6YMo6YAFjezp3SjV/nNFjjDdnESfgYyMHubBta7O
 za+IaeJBOWf4+I/NIkB5Riqt4OHF7Jd6jDCvZ7wxc2heL+v3b0dC66gSm
 9BdGjINOrzWsUmnhFXPQ6i/Q5Fio9uKmOkh5RAOBVpx3CxOF+zsc6J2x+ g==;
X-CSE-ConnectionGUID: lB34iCzGQ/aou7aL7TNUcw==
X-CSE-MsgGUID: 6BXwCAd3RWSJ6OrcN1gLaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="109410170"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="109410170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:40 -0700
X-CSE-ConnectionGUID: PpGcQB2TTP+Aqb7gl64jxA==
X-CSE-MsgGUID: 3rcM8aWNRPSJR6c8QD8GzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274732162"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:41 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 04/15] drm/xe: Invert vram_page_offline configfs attribute
Date: Mon,  5 Oct 2026 22:06:40 +0000
Message-ID: <20261005220636.602826-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005220636.602826-17-stuart.summers@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
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

Rename disable_vram_page_offline to enable_vram_page_offline The default
is now true, matching the previous default of offlining being active.

Negative-logic flags are error prone once they get combined with other
conditions, so carry the positive sense all the way down to the RAS
consumer rather than inverting at the configfs boundary. The internal
xe->ras field is explicitly initialized for every platform since a
zeroed struct no longer means "offlining enabled".

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_configfs.c      | 44 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_configfs.h      |  2 +-
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  4 +--
 drivers/gpu/drm/xe/xe_ras.c           |  8 +++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  2 +-
 5 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 6e62fdccb4c4..0ccf163306fc 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -63,7 +63,7 @@
  *	    ├── engines_allowed
  *	    ├── migrate_ulls_period_ms
  *	    ├── enable_psmi
- *	    └── disable_vram_page_offline
+ *	    └── enable_vram_page_offline
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -161,15 +161,15 @@
  *
  * This attribute can only be set before binding to the device.
  *
- * Disable VRAM page offline:
- * ----------------------------
+ * Enable VRAM page offline:
+ * -------------------------
  *
- *  0, n, N, false - Do not disable (Offlining is active - default)
- *  1, y, Y, true  - Disable vram page offline (Logging only)
+ *  0, n, N, false - Disable vram page offline (Logging only)
+ *  1, y, Y, true  - Enable vram page offline (Offlining is active - default)
  *
  *  Example to disable VRAM offline::
  *
- *      # echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_vram_page_offline
+ *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_vram_page_offline
  *
  * This attribute can only be set on CRI before binding to the device.
  *
@@ -304,7 +304,7 @@ struct xe_config_group_device {
 		bool survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
-		bool disable_vram_page_offline;
+		bool enable_vram_page_offline;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -326,7 +326,7 @@ static const struct xe_config_device device_defaults = {
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
-	.disable_vram_page_offline = false,
+	.enable_vram_page_offline = true,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -675,15 +675,15 @@ static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
 	return len;
 }
 
-static ssize_t disable_vram_page_offline_show(struct config_item *item, char *page)
+static ssize_t enable_vram_page_offline_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return sprintf(page, "%s\n", str_yes_no(dev->disable_vram_page_offline));
+	return sprintf(page, "%s\n", str_yes_no(dev->enable_vram_page_offline));
 }
 
-static ssize_t disable_vram_page_offline_store(struct config_item *item,
-					       const char *page, size_t len)
+static ssize_t enable_vram_page_offline_store(struct config_item *item,
+					      const char *page, size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 	bool val;
@@ -697,7 +697,7 @@ static ssize_t disable_vram_page_offline_store(struct config_item *item,
 	if (is_bound(dev))
 		return -EBUSY;
 
-	dev->config.disable_vram_page_offline = val;
+	dev->config.enable_vram_page_offline = val;
 
 	return len;
 }
@@ -946,7 +946,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, migrate_ulls_period_ms);
 CONFIGFS_ATTR(, enable_psmi);
-CONFIGFS_ATTR(, disable_vram_page_offline);
+CONFIGFS_ATTR(, enable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -957,7 +957,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_multi_queue,
 	&attr_migrate_ulls_period_ms,
 	&attr_enable_psmi,
-	&attr_disable_vram_page_offline,
+	&attr_enable_vram_page_offline,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -989,7 +989,7 @@ static bool xe_config_device_is_visible(struct config_item *item,
 			return false;
 	}
 
-	if (attr == &attr_disable_vram_page_offline) {
+	if (attr == &attr_enable_vram_page_offline) {
 		if (!dev->desc->is_dgfx || dev->desc->platform != XE_CRESCENTISLAND)
 			return false;
 	}
@@ -1242,7 +1242,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%u", migrate_ulls_period_ms);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
-	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
+	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
@@ -1417,21 +1417,21 @@ u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
 }
 
 /**
- * xe_configfs_get_disable_vram_page_offline - get configfs disable_vram_page_offline setting
+ * xe_configfs_get_enable_vram_page_offline - get configfs enable_vram_page_offline setting
  * @pdev: pci device
  *
- * Return: disable_vram_page_offline setting in configfs
+ * Return: enable_vram_page_offline setting in configfs
  */
-bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
+bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev)
 {
 	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
 	bool ret;
 
 	if (!dev)
-		return device_defaults.disable_vram_page_offline;
+		return device_defaults.enable_vram_page_offline;
 
 	scoped_guard(mutex, &dev->lock)
-		ret = dev->config.disable_vram_page_offline;
+		ret = dev->config.enable_vram_page_offline;
 	config_group_put(&dev->group);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 14e49f23306f..1d538ce0ed2c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -25,7 +25,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
-bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
+bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
 ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 					   enum xe_engine_class class,
 					   u32 *cs, size_t max_len);
diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
index 0be218ba2db7..60cbc35a6b35 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -44,8 +44,8 @@ struct xe_drm_ras {
 	/** @info: info array for all types of errors */
 	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
 
-	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
-	bool disable_vram_page_offline;
+	/** @enable_vram_page_offline: cached configfs policy, immutable after init */
+	bool enable_vram_page_offline;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..ce9b57b3eede 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -916,13 +916,15 @@ void xe_ras_init(struct xe_device *xe)
 {
 	int ret;
 
+	xe->ras.enable_vram_page_offline = true;
+
 	/*
-	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
+	 * TODO: Replace platform check with xe->info.has_vram_page_offline
 	 * once the feature flag is plumbed through device info.
 	 */
 	if (xe->info.platform == XE_CRESCENTISLAND)
-		xe->ras.disable_vram_page_offline =
-			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
+		xe->ras.enable_vram_page_offline =
+			xe_configfs_get_enable_vram_page_offline(to_pci_dev(xe->drm.dev));
 
 	xe_drm_ras_init(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9a514d983e90..1dad94a153b7 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -933,7 +933,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
-	if (xe->ras.disable_vram_page_offline) {
+	if (!xe->ras.enable_vram_page_offline) {
 		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
 		       addr);
 		return -EOPNOTSUPP;
-- 
2.43.0

