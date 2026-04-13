Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FE4F34C49
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 13:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4F510E43F;
	Mon, 13 Apr 2026 13:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4EYcoKn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C4E10E43F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776086235; x=1807622235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GyWmlHBuJUUDFB7TUr15QwdBzugMU0ec5I8fkFhn65g=;
 b=C4EYcoKnXYdAU8RAiAE9JuzogRLixybhQosfOZkRol88v/8eKtYbFew5
 D32XcEaNpSKlWSogiYeA7DJ7IGip1XQScG3eL/U8VFJB5sV62rZnzvqEb
 fyQec7XfHiLrwjUgFqtoVT/Djk68YErSjd2Z0Zwa2R8lyxL5Knv6dBPiW
 PArmcunh8NiG2FpVVAAf0bLycfOuihQzDf4yjnjf/oHcljX45oiJluCPo
 zNm5Lwlrxc96xGrRofV4lcTqEeXR7V90ncETLqnxf3/RYkrDpBrDf6QOY
 JlEkuWy0JN4rudEM0M4DTQQVIoN0i4J6BOldg0OGSp4YSxjz4wLBlzmtc A==;
X-CSE-ConnectionGUID: LFg8t2W/S/e69pS4Vr5Ttw==
X-CSE-MsgGUID: ZFAxm2S4Q06h18IRhR5euA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77037319"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="77037319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:14 -0700
X-CSE-ConnectionGUID: Dveew3J1Q5OmWZEw2a3cyw==
X-CSE-MsgGUID: Z0I7ATDDTza9qdUPotJF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="260224481"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:12 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V7 9/9] drm/xe/cri: Add sysfs interface for bad gpu vram
 pages
Date: Mon, 13 Apr 2026 18:46:30 +0530
Message-ID: <20260413131623.2891528-20-tejas.upadhyay@intel.com>
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

Starting CRI, Include a sysfs interface designed to expose information
about bad VRAM pages—those identified as having hardware faults
(e.g., ECC errors). This interface allows userspace tools and
administrators to monitor the health of the GPU's local memory and
track the status of page retirement.To get details on bad gpu vram
pages can be found under /sys/bus/pci/devices/bdf/vram_bad_pages.

Where The format is, pfn : gpu page size : flags

flags:
R: reserved, this gpu page is reserved.
P: pending for reserve, this gpu page is marked as bad, will be reserved in next window of page_reserve.
F: unable to reserve. this gpu page can’t be reserved due to some reasons.

For example if you read using cat /sys/bus/pci/devices/bdf/vram_bad_pages,
max_pages : 10000
0x00000000 : 0x00001000 : R
0x00001234 : 0x00001000 : P

v2:
- Add max_pages info as per updated design doc
- Rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  7 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |  7 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 77 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
 5 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f3ace86799fd..9b535c0802cb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -848,6 +848,8 @@ static int xe_device_process_bad_pages(struct xe_device *xe)
 {
 	unsigned long offlined[1] = {0x0};
 	unsigned long queued[1] = {0x3000};
+	struct ttm_resource_manager *man;
+	struct xe_ttm_vram_mgr *mgr;
 	int n_bad_pages = ARRAY_SIZE(offlined) + ARRAY_SIZE(queued);
 	unsigned long *bad_pages;
 	bool policy;
@@ -857,6 +859,11 @@ static int xe_device_process_bad_pages(struct xe_device *xe)
 		return 0;
 
 	/* TODO: FW Integration: Query FW for offline/queued pages */
+	/* retrieve and fill max_pages from FW */
+	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
+	WARN_ON(!man);
+	mgr = to_xe_ttm_vram_mgr(man);
+	mgr->max_pages = 10000;
 
 	if (!n_bad_pages)
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..47c5be4180fe 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -8,12 +8,14 @@
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_device_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_ttm_vram_mgr.h"
 
 /**
  * DOC: Xe device sysfs
@@ -267,6 +269,7 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
 int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
+	bool policy;
 	int ret;
 
 	if (xe->d3cold.capable) {
@@ -285,5 +288,9 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
+	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(dev));
+	if (xe->info.platform == XE_CRESCENTISLAND && policy)
+		xe_ttm_vram_sysfs_init(xe);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 6808368aa5a1..71e7103e4371 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -752,3 +752,80 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	return ret;
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
+
+static void xe_ttm_vram_dump_bad_pages_info(char *buf, struct xe_ttm_vram_mgr *mgr)
+{
+	const unsigned int element_size = sizeof("0xabcdabcd : 0x12345678 : R\n") - 1;
+	const unsigned int maxpage_size = sizeof("max_pages: 10000\n") - 1;
+	struct xe_ttm_vram_offline_resource *pos, *n;
+	struct gpu_buddy_block *block;
+	ssize_t s = 0;
+
+	mutex_lock(&mgr->lock);
+	s += scnprintf(&buf[s], maxpage_size + 1, "max_pages: %d\n", mgr->max_pages);
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		block = list_first_entry(&pos->blocks,
+					 struct gpu_buddy_block,
+					 link);
+		s += scnprintf(&buf[s], element_size + 1,
+			       "0x%08llx : 0x%08llx : %1s\n",
+			       gpu_buddy_block_offset(block) >> PAGE_SHIFT,
+			       gpu_buddy_block_size(&mgr->mm, block),
+			       "R");
+	}
+	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
+		block = list_first_entry(&pos->blocks,
+					 struct gpu_buddy_block,
+					 link);
+		s += scnprintf(&buf[s], element_size + 1,
+			       "0x%08llx : 0x%08llx : %1s\n",
+			       gpu_buddy_block_offset(block) >> PAGE_SHIFT,
+			       gpu_buddy_block_size(&mgr->mm, block),
+			       pos->status ? "P" : "F");
+	}
+	mutex_unlock(&mgr->lock);
+}
+
+static ssize_t vram_bad_pages_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct ttm_resource_manager *man;
+	struct xe_ttm_vram_mgr *mgr;
+
+	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
+	if (man) {
+		mgr = to_xe_ttm_vram_mgr(man);
+		xe_ttm_vram_dump_bad_pages_info(buf, mgr);
+	}
+
+	return sysfs_emit(buf, "%s\n", buf);
+}
+static DEVICE_ATTR_RO(vram_bad_pages);
+
+static void xe_ttm_vram_sysfs_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	device_remove_file(xe->drm.dev, &dev_attr_vram_bad_pages);
+}
+
+/**
+ * xe_ttm_vram_sysfs_init - Initialize vram sysfs component
+ * @tile: Xe Tile object
+ *
+ * It needs to be initialized after the main tile component is ready
+ *
+ * Returns: 0 on success, negative error code on error.
+ */
+int xe_ttm_vram_sysfs_init(struct xe_device *xe)
+{
+	int err;
+
+	err = device_create_file(xe->drm.dev, &dev_attr_vram_bad_pages);
+	if (err)
+		return 0;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_ttm_vram_sysfs_fini, xe);
+}
+EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 8ef06d9d44f7..c33e1a8d9217 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr);
+int xe_ttm_vram_sysfs_init(struct xe_device *xe);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 07ed88b47e04..b23796066a1a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -39,6 +39,8 @@ struct xe_ttm_vram_mgr {
 	u32 mem_type;
 	/** @offline_mode: debugfs hook for setting page offline mode */
 	u64 offline_mode;
+	/** @max_pages: max pages that can be in offline queue retrieved from FW */
+	u16 max_pages;
 };
 
 /**
-- 
2.52.0

