Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7052DC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BF310F28E;
	Thu, 16 Jul 2026 10:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbcelW0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0983710F28E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784198415; x=1815734415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SeX39dTMkwEKNg634sylCPh7nFDIIkU+sc7x9CJda4I=;
 b=VbcelW0oiw/TvAH9ax6o4OclTwEn1ntemmbFp091CtCCYUrYGddmq5Ag
 An9GcnVvPiUb26hGiKXSsIy87TdDePZWiSR7T2CeJ2+HcHpj+FRwIrGIK
 3SX2fUqbkP4b42gmpRKwgdGclPTOnLBL5Po98RiP51CYw8xoGyayjW/zy
 pvD81GX6H+LF15wX38W4LC2iWtGIyin0AuYNVuzbilL68TxaE3b/mPUCn
 hRGeo24RWI++dRs0ly84S45933+qHvn50DrkPeh4XdQ7+XCUpFTJexgx0
 aSPyOPw4CIedutQ/PEEsIWyK9rYMFWTwIApnbV2kO4CEe78Zs8rw7Kpkh Q==;
X-CSE-ConnectionGUID: KBTwDqYKRN+SjDErboHGtA==
X-CSE-MsgGUID: QqscKYS9QLejL9EYt+aW0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84813489"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84813489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:15 -0700
X-CSE-ConnectionGUID: X/MhqgULRJ2A4CdFBhZKUA==
X-CSE-MsgGUID: cFQ74xjsQPiotNdNA+iX0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253053915"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V13 07/11] drm/xe/configfs: Add vram bad page reservation
 policy
Date: Thu, 16 Jul 2026 16:09:55 +0530
Message-ID: <20260716103949.1554216-20-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
References: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
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

v3:
- All FW communication moved under RAS
v2:
- Add CRI check and rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c     | 64 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h     |  2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 10 +++++
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 052cce962161..c4f386d4bf09 100644
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
+ * Disable vram bad pages reservation, instead just report it in dmesg.
+ *  Example to disable it::
+ *
+ *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/bad_page_reservation
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Context restore BB
  * ------------------
  *
@@ -275,6 +286,7 @@ struct xe_config_group_device {
 		bool survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
+		bool bad_page_reservation;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -295,6 +307,7 @@ static const struct xe_config_device device_defaults = {
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
+	.bad_page_reservation = true,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -616,6 +629,32 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
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
@@ -855,6 +894,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, bad_page_reservation);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -864,6 +904,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
+	&attr_bad_page_reservation,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -1142,6 +1183,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
+	PRI_CUSTOM_ATTR("%d", bad_page_reservation);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
@@ -1290,6 +1332,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
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
index 61c5d4ef8a07..8506c1e0594d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -12,6 +12,7 @@
 #include <drm/ttm/ttm_range_manager.h>
 
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_lrc.h"
@@ -771,6 +772,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
 	struct gpu_buddy *mm;
+	bool policy;
 
 	vr = xe_ttm_vram_addr_to_region(xe, addr);
 	if (!vr) {
@@ -782,6 +784,14 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
+	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
+	if (!policy) {
+		drm_err(&xe->drm, "0x%lx is reported as corrupted address by HW\n",
+			addr);
+		/* Let RAS report to FW to drop addr from SRAM queue */
+		return -EOPNOTSUPP;
+	}
+
 	/* Reserve page at address */
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
 }
-- 
2.52.0

