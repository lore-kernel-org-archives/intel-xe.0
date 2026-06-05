Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F406CD6E77
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07497112AF3;
	Fri,  5 Jun 2026 12:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYsv4Sw8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5DF112AF3
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780663158; x=1812199158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RWKbxxLEL8uhPMASgNMU6p6Gh/GgTnJOVikKOZFHdxQ=;
 b=BYsv4Sw8yfxWShzAJ8/IZeeG2ezUQvb2IieG4RAwd52W9HJpx2ykZ29/
 VuoQa5ASXQt9cRjkfvPWW6066cbDoAYnXygv7tOlVf6QDf0Hksxw0bKof
 UifKiOs8GOHwWHJAGDqqEeOyt10ZEG+/7rSoZ1AJIJCCu6r00VR4/3/cb
 N+g015pfVVpoidpqGXPpvrSWWmLJGBXMCX1lmXmqHFLhOZVZj1CSYFa3a
 qtvhDyP/lvWGgs6ngVIbxkTqRR3Rhf6U/yumOgAhIbn1ZYiBSRPm1ISgr
 +3qk5LBAqUb6XqjIR2a+Ej18VIh4ZeZyh+6KEJI8zzXsqlkuPFe/EAUWn w==;
X-CSE-ConnectionGUID: FkieE9oaRR2xQvtGfi0OXw==
X-CSE-MsgGUID: Y4xaZ4swR42f7Z12DDslnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="106937363"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="106937363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:18 -0700
X-CSE-ConnectionGUID: IRuqLWD9T9K89kGAm160fQ==
X-CSE-MsgGUID: cpFnhDFGQ02v6qNOBqV60w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249938957"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:17 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V11 10/12] drm/xe/cri: Add sysfs interface for bad gpu vram
 pages
Date: Fri,  5 Jun 2026 18:08:48 +0530
Message-ID: <20260605123839.236021-24-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605123839.236021-14-tejas.upadhyay@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
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
P: pending for reserve, this gpu page is marked as bad, will be reserved
   in next window of page_reserve.
F: unable to reserve. this gpu page can’t be reserved due to some reasons.

For example if you read using cat /sys/bus/pci/devices/bdf/vram_bad_pages,
max_pages : 10000
0x00000000 : 0x00001000 : R
0x00001234 : 0x00001000 : P

v3:
- Move FW communication in RAS code
v2:
- Add max_pages info as per updated design doc
- Rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c       |  7 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 79 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
 4 files changed, 89 insertions(+)

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
index f18eb51e98a1..35b5eaf590fa 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -765,3 +765,82 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
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
+	if (err) {
+		dev_err(xe->drm.dev, "Failed to create vram_bad_pages sysfs file: %d\n", err);
+		return 0;
+	}
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

