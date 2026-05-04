Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4D3CD3436
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF8E10E36C;
	Mon,  4 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BL4g4VsQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B9510E366
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869832; x=1809405832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=POXARUTNIS28ioqV0Mlrt+SWX5NMM02RhGbQN27SLdQ=;
 b=BL4g4VsQt+7RGZdNGtXOOjBOnoUqX/K3KQ0LSoX0HJ42vjZF6Cd4JY8u
 TaHi6o8TBdfH8vTFstioVfb52xtxD4Z9rUCA9rQRRuz1ypWoBn+UKSWEG
 rHnnTYn8zjsmNP38CqqIs5tFKLllk8SB4d+hpavPNAfgu4Rra7YPaO00W
 lPc5o9yGdBL7BRgdp/dJyfrq0kyJV4YGE/Aewj9Pdf8SNj+hHFEQG8dLF
 mU1v9aMNyBFU3sqaJxR708WyaqfJ8RKUMTms/DbdIh4V7J3++BNJvdLK4
 3220zCDzYkz8O3O2CGbdSPYYLcDcS4Ulxde+59BJMvDXxe+CGFcbUEyaW Q==;
X-CSE-ConnectionGUID: nSFIkj/kRm66Y3Qdd9yO/g==
X-CSE-MsgGUID: YiOyJdCOQBGVwaWvm9t7sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293557"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293557"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:51 -0700
X-CSE-ConnectionGUID: MQ4NUHXeQcqDITWyANSlnA==
X-CSE-MsgGUID: jFZERkBSTOGSyejYajNi1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773662"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:50 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/9] drm/xe: Rename survivability_mode to
 enable_survivability_mode
Date: Mon,  4 May 2026 04:43:38 +0000
Message-ID: <20260504044348.209625-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
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

Rename the survivability_mode field in struct xe_config_device to
enable_survivability_mode to be consistent with the enable_psmi naming
convention used for similar boolean config flags.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/xe_configfs.c           | 39 +++++++++++-----------
 drivers/gpu/drm/xe/xe_configfs.h           |  4 +--
 drivers/gpu/drm/xe/xe_survivability_mode.c |  2 +-
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..69abc69ec0f3 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -58,7 +58,7 @@
  *	│   └── ...
  *	:
  *	└── 0000:03:00.0
- *	    ├── survivability_mode
+ *	    ├── enable_survivability_mode
  *	    ├── gt_types_allowed
  *	    ├── engines_allowed
  *	    └── enable_psmi
@@ -79,7 +79,7 @@
  * Enable survivability mode on supported cards. This setting only takes
  * effect when probing the device. Example to enable it::
  *
- *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
  *
  * This attribute can only be set before binding to the device.
  *
@@ -260,7 +260,7 @@ struct xe_config_group_device {
 		u64 engines_allowed;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
-		bool survivability_mode;
+		bool enable_survivability_mode;
 		bool enable_psmi;
 		struct {
 			unsigned int max_vfs;
@@ -279,7 +279,7 @@ struct xe_config_group_device {
 static const struct xe_config_device device_defaults = {
 	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
-	.survivability_mode = false,
+	.enable_survivability_mode = false,
 	.enable_psmi = false,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
@@ -357,20 +357,21 @@ static bool is_bound(struct xe_config_group_device *dev)
 	return ret;
 }
 
-static ssize_t survivability_mode_show(struct config_item *item, char *page)
+static ssize_t enable_survivability_mode_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return sprintf(page, "%d\n", dev->survivability_mode);
+	return sprintf(page, "%d\n", dev->enable_survivability_mode);
 }
 
-static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
+static ssize_t enable_survivability_mode_store(struct config_item *item, const char *page,
+					       size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	bool survivability_mode;
+	bool enable_survivability_mode;
 	int ret;
 
-	ret = kstrtobool(page, &survivability_mode);
+	ret = kstrtobool(page, &enable_survivability_mode);
 	if (ret)
 		return ret;
 
@@ -378,7 +379,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	if (is_bound(dev))
 		return -EBUSY;
 
-	dev->config.survivability_mode = survivability_mode;
+	dev->config.enable_survivability_mode = enable_survivability_mode;
 
 	return len;
 }
@@ -815,7 +816,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
-CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, enable_survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
@@ -823,7 +824,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_psmi,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
-	&attr_survivability_mode,
+	&attr_enable_survivability_mode,
 	NULL,
 };
 
@@ -847,7 +848,7 @@ static bool xe_config_device_is_visible(struct config_item *item,
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
-	if (attr == &attr_survivability_mode) {
+	if (attr == &attr_enable_survivability_mode) {
 		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
 			return false;
 	}
@@ -1098,7 +1099,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
-	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%d", enable_survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1128,20 +1129,20 @@ void xe_configfs_check_device(struct pci_dev *pdev)
 }
 
 /**
- * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
+ * xe_configfs_get_enable_survivability_mode - get configfs survivability mode attribute
  * @pdev: pci device
  *
- * Return: survivability_mode attribute in configfs
+ * Return: enable_survivability_mode attribute in configfs
  */
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
+bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev)
 {
 	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
 	bool mode;
 
 	if (!dev)
-		return device_defaults.survivability_mode;
+		return device_defaults.enable_survivability_mode;
 
-	mode = dev->config.survivability_mode;
+	mode = dev->config.enable_survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 07d62bf0c152..517de4946d35 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -18,7 +18,7 @@ struct pci_dev;
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
@@ -37,7 +37,7 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
-static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index db64cac39c94..7c85bdb267af 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -377,7 +377,7 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE)
 		return false;
 
-	survivability_mode = xe_configfs_get_survivability_mode(pdev);
+	survivability_mode = xe_configfs_get_enable_survivability_mode(pdev);
 	/* Enable survivability mode if set via configfs */
 	if (survivability_mode)
 		return true;
-- 
2.43.0

