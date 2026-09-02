Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B33C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA9410F22C;
	Wed,  2 Sep 2026 14:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFMPYQZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDFF10F22C
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360909; x=1819896909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7V95YPmsnDRMfr9KOVFLu2skWE1UTUHFKEAJet9jo08=;
 b=eFMPYQZrJ1UKYsMbxCXjACIArv4yNbU6Lb6s8jp4cj84T3CgSD4DJB3j
 YmZZM0u/BSO88xtzlCe9YtngehWMuRGzgGrTEHHR4tZ4S8rW4NGxN3XnJ
 c6AbqP4u94ComJ/+HKtjdhz7dVQW4bh0Moomyq9yJOSt7O6z7uCQJFGa/
 0HywaTeXDPL02y76ZhHlQfzZlAcGsUVW4/r0xKe6L6O5wbP+K/3SZcQ/4
 2291brEA6VT89i58mw/ksi8ZHhBbin38VtmSDyC6KgKqYriBKSEuLVwNq
 Yan7c+38AVuK0Ch5121AxOqI93kqR7FzTQJv3gB4FEqgPn7wjZTZpxXzb A==;
X-CSE-ConnectionGUID: 4eMC91EFTwavs2xMAJlz8g==
X-CSE-MsgGUID: BkTnnYobSbKdkuhlTAag4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92526031"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92526031"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:09 -0700
X-CSE-ConnectionGUID: Tjm710Z5SOGWuBh/LGCw9g==
X-CSE-MsgGUID: 9HuzVkoxQ3WDX/Sd4jEXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263260088"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:04 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH V20 10/15] drm/xe/configfs: Add disable_vram_page_offline
 attribute
Date: Wed,  2 Sep 2026 20:23:53 +0530
Message-ID: <20260902145343.465686-27-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

v2(Sashiko):
- keep default value in case configfs not present

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 72 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h |  2 +
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 052cce962161..a9c72504c8a4 100644
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
+	return sprintf(page, "%s\n", str_yes_no(dev->disable_vram_page_offline));
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
index 4fbbeafba473..42cd1a491d01 100644
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
+static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
-- 
2.52.0

