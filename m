Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA06C5DF7E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D137310EAC0;
	Tue, 18 Aug 2026 10:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7HFgFeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4CA10EAC0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049730; x=1818585730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P7aAJklfSk/akMe5ZOGRFRXUhXkqcoLNFYKwlN92jKg=;
 b=H7HFgFeQLVSLHi19qyw1daQWvTfz/U8UOPJMIqbWlOYZiJcnt1Ui5xNt
 XlJg+KYJ/FLyYtsBiPYSLBVLeSQ2cc/3OQiXDEcWkbUp+M1hMJ1HLneHI
 yaIpvGb2KlxIOkJ0lOGVgVbUwDxCbYQnIqhMijI5e37T8GUT47dLPLmE+
 z/E/znUT4YUD5pV5wcC1aNIDkMclm9rIwGHsV7BFrR5UOOV2UCem6k4qz
 POgePBsBGSto5ATP7vARDekZjRVHgsruU+5Z4F5svI79Brh6JwflfWO9R
 ToV5GyOsxQaeQd1TiSii675+teJnM/QfesgFv/KBgKFgwEilkOCyza5Ed w==;
X-CSE-ConnectionGUID: aorEI/5tR/CkXqQCnHk1nA==
X-CSE-MsgGUID: k/xEDphpQ06ckXh7nY2gVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98691916"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98691916"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:42:10 -0700
X-CSE-ConnectionGUID: EI3w7YoERWSn3AdJ4tqUCA==
X-CSE-MsgGUID: gIZXyRbXTxaVEe1dmzjQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="295117600"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:42:08 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V17 09/12] drm/xe/configfs: Add vram bad page reservation
 policy
Date: Tue, 18 Aug 2026 16:11:04 +0530
Message-ID: <20260818104055.3833974-23-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
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

The interface enables setting the policy for how bad pages are
handled in VRAM. This is crucial for maintaining system
stability in scenarios where VRAM degradation occurs.

By default policy will be "reserve", which can be changed to
"logging" only. val 0 means Logging only, 1 means logging and
offlining.

v4:
- document val 0/1 meaning (Himal)
v3:
- All FW communication moved under RAS
v2:
- Add CRI check and rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c     | 67 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h     |  2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 10 +++++
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 052cce962161..ead59208858f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -61,7 +61,8 @@
  *	    ├── survivability_mode
  *	    ├── gt_types_allowed
  *	    ├── engines_allowed
- *	    └── enable_psmi
+ *          ├── enable_psmi
+ *          └── bad_page_reservation
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -159,6 +160,19 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Bad pages reservation:
+ * ---------------------
+ *
+ * Controls how bad VRAM pages are handled:
+ *  0 - Logging only (report in dmesg, no offlining)
+ *  1 - Logging and offlining (default)
+ *
+ *  Example to disable offlining::
+ *
+ *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/bad_page_reservation
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Context restore BB
  * ------------------
  *
@@ -275,6 +289,7 @@ struct xe_config_group_device {
 		bool survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
+		bool bad_page_reservation;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -295,6 +310,7 @@ static const struct xe_config_device device_defaults = {
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
+	.bad_page_reservation = true,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -616,6 +632,32 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t bad_page_reservation_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->bad_page_reservation);
+}
+
+static ssize_t bad_page_reservation_store(struct config_item *item, const char *page, size_t len)
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
+	dev->config.bad_page_reservation = val;
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
+CONFIGFS_ATTR(, bad_page_reservation);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -864,6 +907,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
+	&attr_bad_page_reservation,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -1142,6 +1186,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
+	PRI_CUSTOM_ATTR("%d", bad_page_reservation);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
@@ -1290,6 +1335,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_bad_page_reservation - get configfs bad_page_reservation setting
+ * @pdev: pci device
+ *
+ * Return: bad_page_reservation setting in configfs
+ */
+bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return device_defaults.bad_page_reservation;
+
+	ret = dev->config.bad_page_reservation;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 4fbbeafba473..7405cc5f3207 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -44,6 +45,7 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev) { return true; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9311aa3728f8..51b98460481d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -16,6 +16,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_lrc.h"
@@ -841,6 +842,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
 	struct gpu_buddy *mm;
+	bool policy;
 
 	vr = xe_ttm_vram_addr_to_region(xe, addr);
 	if (IS_ERR(vr)) {
@@ -860,6 +862,14 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
+	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
+	if (!policy) {
+		drm_err(&xe->drm, "0x%llx is reported as corrupted address by HW\n",
+			addr);
+		/* Let RAS report to FW to drop addr from SRAM queue */
+		return -EOPNOTSUPP;
+	}
+
 	/* Reserve page at address */
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
 }
-- 
2.52.0

