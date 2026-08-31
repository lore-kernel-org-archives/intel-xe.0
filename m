Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0646C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0C810E622;
	Mon, 31 Aug 2026 06:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8O/7l3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1F310E615
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159068; x=1819695068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+WRxIc4bFlriIAV0ap+cWyX/sachRgz9AVBc/PY3lo=;
 b=F8O/7l3ZHpAIL9Gw/vi/zTnir6LmGgcalaMa0dSRD28CwdtDNlzwfWWW
 EFgMLSFPI29XHc4Tnm+nYR26grftQYnsHlo13DAUVepaVzw+w9dqHW2qF
 +Tnbu8UTgGiXJxPa+NiFtJb+kDnSh+HXhsOpi+BtS3og7+w3ztf3I4NUd
 gNuQfxtT9v7vypSimbK09aVUo2poNAchuLn/OuLXtJ+NTCdkpj1RJP9jP
 Yk8F4OzzdxqiefvYW7nJibpnwLWnRM6c5IXvIRI0Qg6YnZecC9QGxthKU
 xbYTKQ1ZLujlCRLOr0oELmPQHsAhnYBfxa5qbY+DDgFnt1QA99tKfZLEK Q==;
X-CSE-ConnectionGUID: D3nZI8DiRMmQWFAtujvLwA==
X-CSE-MsgGUID: TQr/eD5GSiCnf9UapaxIFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106081714"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106081714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:24 -0700
X-CSE-ConnectionGUID: qUcyN0sPS4yqSQZKsmDQ1A==
X-CSE-MsgGUID: UceT8u2VQLeQw1EJAbNo8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269302876"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH V19 10/15] drm/xe/configfs: Add disable_vram_page_offline
 attribute
Date: Mon, 31 Aug 2026 12:19:52 +0530
Message-ID: <20260831064942.315720-27-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
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

Add a new configfs attribute 'disable_vram_page_offline' to control
how bad VRAM pages are handled:
  0, n, N, false - Do not disable (Offlining is active - default)
  1, y, Y, true  - Disable vram page offline (Logging only)

The attribute can only be set before binding to the device and defaults
to false (offlining enabled). This gives administrators control over
whether corrupted VRAM pages detected by hardware (e.g., ECC errors)
are actively offlined or only logged.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 72 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h |  2 +
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 052cce962161..f1b1c33ec1e1 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -61,7 +61,8 @@
  *	    ├── survivability_mode
  *	    ├── gt_types_allowed
  *	    ├── engines_allowed
- *	    └── enable_psmi
+ *	    ├── enable_psmi
+ *	    └── disable_vram_page_offline
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -157,6 +158,18 @@
  *
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
  *
+ * This attribute can only be set on CRI before binding to the device.
+ *
+ * Disable VRAM page offline:
+ * ----------------------------
+ *
+ *  0, n, N, false - Do not disable (Offlining is active - default)
+ *  1, y, Y, true  - Disable vram page offline (Logging only)
+ *
+ *  Example to disable VRAM offline::
+ *
+ *      # echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_vram_page_offline
+ *
  * This attribute can only be set before binding to the device.
  *
  * Context restore BB
@@ -275,6 +288,7 @@ struct xe_config_group_device {
 		bool survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
+		bool disable_vram_page_offline;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -295,6 +309,7 @@ static const struct xe_config_device device_defaults = {
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
+	.disable_vram_page_offline = false,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -616,6 +631,33 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t disable_vram_page_offline_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%s\n", str_yes_no(!dev->disable_vram_page_offline));
+}
+
+static ssize_t disable_vram_page_offline_store(struct config_item *item,
+					       const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.disable_vram_page_offline = val;
+
+	return len;
+}
+
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -855,6 +897,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, disable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -864,6 +907,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
+	&attr_disable_vram_page_offline,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -895,6 +939,11 @@ static bool xe_config_device_is_visible(struct config_item *item,
 			return false;
 	}
 
+	if (attr == &attr_disable_vram_page_offline) {
+		if (!dev->desc->is_dgfx || dev->desc->platform != XE_CRESCENTISLAND)
+			return false;
+	}
+
 	return true;
 }
 
@@ -1142,6 +1191,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
+	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
@@ -1290,6 +1340,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_disable_vram_page_offline - get configfs disable_vram_page_offline setting
+ * @pdev: pci device
+ *
+ * Return: disable_vram_page_offline setting in configfs
+ */
+bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return device_defaults.disable_vram_page_offline;
+
+	ret = dev->config.disable_vram_page_offline;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 4fbbeafba473..9b43cb149fe8 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -44,6 +45,7 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return true; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
-- 
2.52.0

