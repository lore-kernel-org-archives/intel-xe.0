Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7CCCD5BAB
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 12:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF50410ECA9;
	Tue, 19 May 2026 12:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjoKWsBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91D210ECA9
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779193748; x=1810729748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AWRiLtq2oLlTNkl6NZKP8PzUDK8rsT9vzxDC/zFsrnA=;
 b=IjoKWsBZW/Ag5iLl52YXOW5yeSALgEv3ogbhmDOn0KonbsKaC6VxMy09
 4mIemf2iP5ezHOA6M1nMLftKj2vikPiP8Ca8rJ4siGNZtDuSEiY7T3SSE
 X1aJ8lJ4yBzXmnA6V7utucfW89xGrECWjza+GMH5nQIPXnTHq6ehBwD70
 SxcTbzamX528x/IawxYCkEeXciYx6DF2/m4MrEpzxL6Ofg+ri/8iK0Zim
 M5dmzXZtNYRZz0JKKWR8mZD7PS00atbhpoWFMTrF1/haBW/wusJzNQc7L
 z/TQ6krXqc97ThIp8WDhNXuQLWY61cChA9lCUI4UUExraTFj2tUp5Duza g==;
X-CSE-ConnectionGUID: IYNeSx70R4mI/9e1nVrDMg==
X-CSE-MsgGUID: HBKA6OjfQzaNK687p/euPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79919452"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79919452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:29:07 -0700
X-CSE-ConnectionGUID: 4HAfsqELTN2SEIeCXZZVCw==
X-CSE-MsgGUID: 2z/QP1ClQlGFHvn9sgxIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263261609"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:29:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V10 09/10] drm/xe/configfs: Add vram bad page reservation
 policy
Date: Tue, 19 May 2026 17:58:24 +0530
Message-ID: <20260519122817.45770-21-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260519122817.45770-12-tejas.upadhyay@intel.com>
References: <20260519122817.45770-12-tejas.upadhyay@intel.com>
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
index 32102600a148..e07a6a74896b 100644
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
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 0e968ae47fd9..f18eb51e98a1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -12,6 +12,7 @@
 #include <drm/ttm/ttm_range_manager.h>
 
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_lrc.h"
@@ -735,6 +736,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
 	struct gpu_buddy *mm;
+        bool policy;
 
 	vr = xe_ttm_vram_addr_to_region(xe, addr);
 	if (!vr) {
@@ -751,6 +753,14 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 			return -EEXIST;
 	}
 
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

