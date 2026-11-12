Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A21606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nE8cHemG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301BC10EA09;
	Thu, 12 Nov 2026 21:35:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC710EA09
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794519317; x=1826055317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ejhZL0mL7/b9soBDdcNUvoBe6zhY0WdsrEeB8RfX8OE=;
 b=nE8cHemG8BlJdXmIKP7r0J49oXweiMWmLKcQ7tWzzxjg0NOIPce2lhla
 D3lvdgMcpL+xv2fmQm4qOe9L2Mlx09dvtXkWH0ZruEuRe2fzP5ESse28z
 IeGGXQuZCsqAhL/AYZOs94ONam5x2LS+1rcHhhJ719FIjCEU1T0uhpCNC
 G2npdDim9ORQxWKL6A+YkswAKiFR2XTlYVDwGiLfBfbj3YeLz/05uUI0i
 ZMqc7SjL34lnbIDgUHTiMW0p3nSd4QUOmM3RgBM2KXRzUW5Yd8MHNyXH0
 uV0kJgPUn5LiGJWLGKU7N+hqSw603MhUYIpBLultGs61FkvKbKVECpwMi A==;
X-CSE-ConnectionGUID: Eg1IK1J7TS6ZPyOUDOrPHQ==
X-CSE-MsgGUID: HHmgjRlmSDqPPJdWcR2pDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3351724"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3351724"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
X-CSE-ConnectionGUID: u12NCuE3TmuuSL1EGJPnLw==
X-CSE-MsgGUID: WeRWIs4VSriTrw+F9nichQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8754527"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/8] drm/xe: Invert vram_page_offline configfs attribute
Date: Thu, 12 Nov 2026 21:35:09 +0000
Message-ID: <20261112213508.457213-14-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
References: <20261112213508.457213-10-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Rename disable_vram_page_offline to enable_vram_page_offline The default
is now true, matching the previous default of offlining being active.

Negative-logic flags are error prone once they get combined with other
conditions, so carry the positive sense all the way down to the RAS
consumer rather than inverting at the configfs boundary. The internal
xe->ras field is explicitly initialized for every platform since a
zeroed struct no longer means "offlining enabled".

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c     | 44 ++++++++++++++--------------
 drivers/gpu/drm/xe/xe_configfs.h     |  2 +-
 drivers/gpu/drm/xe/xe_ras.c          | 18 +++++++-----
 drivers/gpu/drm/xe/xe_ras.h          |  2 +-
 drivers/gpu/drm/xe/xe_ras_types.h    |  4 +--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
 6 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index c4fbf737b907..68d537cabef2 100644
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
index 98154beabd5a..fb92362907ef 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -24,7 +24,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
-bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
+bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
 ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 					   enum xe_engine_class class,
 					   u32 *cs, size_t max_len);
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..824031f807a8 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -328,7 +328,7 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	}
 
 	/* User policy set to disable page offlining */
-	if (xe_ras_get_disable_vram_page_offline(xe)) {
+	if (!xe_ras_get_enable_vram_page_offline(xe)) {
 		action = XE_RAS_PAGE_ACTION_REMOVE;
 		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
 		goto notify;
@@ -1265,14 +1265,14 @@ static void ras_fini(void *arg)
 }
 
 /**
- * xe_ras_get_disable_vram_page_offline - Get the vram page offline user policy
+ * xe_ras_get_enable_vram_page_offline - Get the vram page offline user policy
  * @xe: xe device instance
  *
- * Return: true if the vram page offline policy is disabled, false otherwise.
+ * Return: true if the vram page offline policy is enabled, false otherwise.
  */
-bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe)
+bool xe_ras_get_enable_vram_page_offline(struct xe_device *xe)
 {
-	return xe->ras.state.disable_vram_page_offline;
+	return xe->ras.state.enable_vram_page_offline;
 }
 
 /**
@@ -1319,17 +1319,19 @@ int xe_ras_init(struct xe_device *xe)
 	struct xe_ras_state *state = &xe->ras.state;
 	int ret;
 
+	state->enable_vram_page_offline = true;
+
 	xe_drm_ras_init(xe);
 
 	if (!xe->info.has_sysctrl)
 		return 0;
 
 	/*
-	 * TODO: Replace with xe->info.has_disable_vram_page_offline once the feature flag is
+	 * TODO: Replace with xe->info.has_vram_page_offline once the feature flag is
 	 * plumbed through device info.
 	 */
-	xe->ras.state.disable_vram_page_offline =
-		xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
+	xe->ras.state.enable_vram_page_offline =
+		xe_configfs_get_enable_vram_page_offline(to_pci_dev(xe->drm.dev));
 
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index f7b587ac84e3..baeff7602ed8 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -21,7 +21,7 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
 int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
 int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
-bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
+bool xe_ras_get_enable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *response);
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 0ff5803d495b..bdfd91927d76 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -416,8 +416,8 @@ struct xe_ras_set_health_response {
 struct xe_ras_state {
 	/** @aer_internal_error: true if an uncorrectable internal error was reported via AER */
 	bool aer_internal_error;
-	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
-	bool disable_vram_page_offline;
+	/** @enable_vram_page_offline: cached configfs policy, immutable after init */
+	bool enable_vram_page_offline;
 	/** @max_pages: Total number of pages that can be stored by firmware */
 	u32 max_pages;
 	/** @offlined_pages: XArray of pages offlined by firmware */
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 36d47de8b11b..58e9612e5486 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -954,7 +954,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
-	if (xe_ras_get_disable_vram_page_offline(xe)) {
+	if (!xe_ras_get_enable_vram_page_offline(xe)) {
 		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
 		       addr);
 		return -EOPNOTSUPP;
-- 
2.43.0

