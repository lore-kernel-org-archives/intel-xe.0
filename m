Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E6EF34C4E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 13:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2A510E43C;
	Mon, 13 Apr 2026 13:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFRW7jO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136DE10E43C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776086232; x=1807622232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j0cvXyowaBeu7M5sLhtsCmBHT93Ae+QH6AN7JogZlw=;
 b=IFRW7jO1pRhg2oL3rG8okFOf7e3uPzi5/HEZs8HmNBzMborjqdiX5/5T
 quMgorXFmOQgZMdJrzpXq4lYxKEWNvQ+Xkv3yjouAyV4WC1ICZxiHjY3G
 PSLWxiN5pXRItiWfUe+Eb7PvZFkabECVmE1Cl+lV4NNcVcLVp7GFNN1Jx
 nQKpzXgtuK5a3O36IuUC/B7ztxHjeIq9i/WyHD63ikTBTPGLYKXrJsNFI
 WTvt+74USEKFXQ2rImZMItIj3JxqQ7IdFjH9RvQvfZzOjbdV3jUyqtzJY
 K27M9wZgSEAUjQ3yb0uQkDoBswQNrmqjVLLfPwgbfcLUkQhLIEXfeb8mE w==;
X-CSE-ConnectionGUID: FphifNKkQyKKQEM7oe21iw==
X-CSE-MsgGUID: EA466jpQTqKN2OzJG0COMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77037318"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="77037318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:12 -0700
X-CSE-ConnectionGUID: l6zqMWtbSqyoVx4rHTzz3A==
X-CSE-MsgGUID: LufTwKZ1R7OLdszyIyLspQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="260224460"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:10 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V7 8/9] drm/xe/configfs: Add vram bad page reservation
 policy
Date: Mon, 13 Apr 2026 18:46:29 +0530
Message-ID: <20260413131623.2891528-19-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
References: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
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
"logging" only.

v2:
- Add CRI check and rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c     | 64 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h     |  2 +
 drivers/gpu/drm/xe/xe_device.c       | 44 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 11 +++++
 4 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..4ac5274a4090 100644
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
@@ -159,6 +160,16 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Bad pages reservation:
+ * ---------------------
+ *
+ * Disale vram bad pages reservation, instead just report it in dmesg.
+ *  Example to disable it::
+ *
+ *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/bad_page_reservation
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Context restore BB
  * ------------------
  *
@@ -262,6 +273,7 @@ struct xe_config_group_device {
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
+		bool bad_page_reservation;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -281,6 +293,7 @@ static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
+	.bad_page_reservation = true,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -575,6 +588,32 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
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
@@ -813,6 +852,7 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, bad_page_reservation);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -821,6 +861,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
+	&attr_bad_page_reservation,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -1098,6 +1139,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
+	PRI_CUSTOM_ATTR("%d", bad_page_reservation);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
@@ -1225,6 +1267,26 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
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
index 07d62bf0c152..c107d84b2c62 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -23,6 +23,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -42,6 +43,7 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev) { return true; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d4d7a35e089..f3ace86799fd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -25,6 +25,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
+#include "xe_configfs.h"
 #include "xe_debugfs.h"
 #include "xe_defaults.h"
 #include "xe_devcoredump.h"
@@ -69,6 +70,7 @@
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_vram.h"
@@ -842,6 +844,44 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+static int xe_device_process_bad_pages(struct xe_device *xe)
+{
+	unsigned long offlined[1] = {0x0};
+	unsigned long queued[1] = {0x3000};
+	int n_bad_pages = ARRAY_SIZE(offlined) + ARRAY_SIZE(queued);
+	unsigned long *bad_pages;
+	bool policy;
+	u8 i;
+
+	if (xe->info.platform != XE_CRESCENTISLAND)
+		return 0;
+
+	/* TODO: FW Integration: Query FW for offline/queued pages */
+
+	if (!n_bad_pages)
+		return 0;
+	bad_pages = kmalloc_array(n_bad_pages, sizeof(unsigned long), GFP_KERNEL);
+	if (!bad_pages)
+		return -ENOMEM;
+
+	for (int i = 0; i < ARRAY_SIZE(offlined); i++)
+		bad_pages[i] = offlined[i];
+	for (int i = 0; i < ARRAY_SIZE(queued); i++)
+		bad_pages[ARRAY_SIZE(offlined) + i] = queued[i];
+
+	/* Read policy from configfs */
+	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
+	for (i = 0; i < n_bad_pages; i++) {
+		if (!policy)
+			drm_err(&xe->drm, "0x%lx is reported as corrupted address by HW\n",
+				bad_pages[i]);
+		else
+			xe_ttm_vram_handle_addr_fault(xe, bad_pages[i]);
+	}
+	kfree(bad_pages);
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -911,6 +951,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_device_process_bad_pages(xe);
+	if (err)
+		return err;
+
 	/*
 	 * Now that GT is initialized (TTM in particular),
 	 * we can try to init display, and inherit the initial fb.
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index ac6f034852f7..6808368aa5a1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -12,6 +12,7 @@
 #include <drm/ttm/ttm_range_manager.h>
 
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_lrc.h"
@@ -725,6 +726,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
 	struct gpu_buddy *mm;
+	bool policy;
 	int ret;
 
 	vr = xe_ttm_vram_addr_to_region(xe, addr);
@@ -736,6 +738,15 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	}
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
+
+	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
+	if (!policy) {
+		drm_err(&xe->drm, "0x%lx is reported as corrupted address by HW\n",
+			addr);
+		/* TODO: FW Integration: Report to FW to drop addr from SRAM queue */
+		return 0;
+	}
+
 	/* Reserve page at address */
 	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
 	return ret;
-- 
2.52.0

