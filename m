Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D65C44514
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DC010F28F;
	Thu, 16 Jul 2026 10:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6BRQE+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608F710F28E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784198416; x=1815734416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/8hmgXnzEfjkPxugTGCpIoQ5D86C7G4MU8oo1lr9yAA=;
 b=S6BRQE+ugbqk1GIL09RT7DiyGH7m/1HC7/516iDq2Y2MLefeum+IYFlr
 vk1q88P/2pkBhLhxjENUOp3dRm5P/x9femB+2YEUZHnVuGIwqJjUyBQA5
 IXW6EDOFbedEf4JuBMTBApsh9peRFQFSB3djljtFOVQlWi9Lh3TOXrDgh
 Q/4wOmJdFAsi7uoWZThHXRlf5VP6HwDHP6AmKIeDcTXsNeIkIr1GWiS0O
 QDFk7VBjHJllwAV1HGIJrKP3zzRwkzMLuZ/17n2VmYaXfHNW+x693U0ID
 MYGtOD6zu6yN4uHd4YutJQwtnpwv5Lr/5YfH7Ewvi3QJGScL9MEMdoId8 Q==;
X-CSE-ConnectionGUID: OLk2joFCT2+vXoQUx3kibg==
X-CSE-MsgGUID: 2oZv7ap3RF+IfLgGyd5NYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84813497"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84813497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:16 -0700
X-CSE-ConnectionGUID: 6S0OBcS6SsKvBrTIM49VAw==
X-CSE-MsgGUID: stIbz5vZSP+wUAkVkfmTcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253053922"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V13 08/11] drm/xe/cri: Add sysfs interface for bad gpu vram
 pages
Date: Thu, 16 Jul 2026 16:09:56 +0530
Message-ID: <20260716103949.1554216-21-tejas.upadhyay@intel.com>
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
F: unable to reserve. this gpu page can't be reserved
   due to some reasons.

For example if you read using cat /sys/bus/pci/devices/bdf/vram_bad_pages,
max_pages : 10000
0x00000000 : 0x00001000 : R
0x00001234 : 0x00001000 : P

v4:
- Use sysfs_emit_at() instead of scnprintf() to respect PAGE_SIZE
- Use list_first_entry_or_null() with continue to handle empty lists
- Use %016llx for full 64-bit address width
- Fix inverted P/F ternary (status ? F : P)
- Return err instead of 0 on device_create_file failure
- Remove redundant element_size/maxpage_size constants

v3:
- Move FW communication in RAS code
v2:
- Add max_pages info as per updated design doc
- Rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c       |  7 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 85 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
 4 files changed, 95 insertions(+)

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
index 8506c1e0594d..e3fda0909397 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -796,3 +796,88 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
+
+static int xe_ttm_vram_dump_bad_pages_info(char *buf, struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_vram_offline_resource *pos;
+	struct gpu_buddy_block *block;
+	int s = 0;
+
+	mutex_lock(&mgr->lock);
+	s += sysfs_emit_at(buf, s, "max_pages: %d\n", mgr->max_pages);
+	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
+		block = list_first_entry_or_null(&pos->blocks,
+						 struct gpu_buddy_block,
+						 link);
+		if (!block)
+			continue;
+		s += sysfs_emit_at(buf, s, "0x%016llx : 0x%016llx : %c\n",
+				   gpu_buddy_block_offset(block) >> PAGE_SHIFT,
+				   gpu_buddy_block_size(&mgr->mm, block),
+				   'R');
+		if (s >= PAGE_SIZE)
+			break;
+	}
+	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
+		block = list_first_entry_or_null(&pos->blocks,
+						 struct gpu_buddy_block,
+						 link);
+		if (!block)
+			continue;
+		s += sysfs_emit_at(buf, s, "0x%016llx : 0x%016llx : %c\n",
+				   gpu_buddy_block_offset(block) >> PAGE_SHIFT,
+				   gpu_buddy_block_size(&mgr->mm, block),
+				   pos->status ? 'F' : 'P');
+		if (s >= PAGE_SIZE)
+			break;
+	}
+	mutex_unlock(&mgr->lock);
+
+	return s;
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
+	if (!man)
+		return 0;
+
+	mgr = to_xe_ttm_vram_mgr(man);
+
+	return xe_ttm_vram_dump_bad_pages_info(buf, mgr);
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
+ * @xe: pointer to Xe device
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
+		return err;
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
index 3ad7966798eb..c06ed244f83a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
 	struct mutex lock;
 	/** @mem_type: The TTM memory type */
 	u32 mem_type;
+	/** @max_pages: max pages that can be in offline queue retrieved from FW */
+	u16 max_pages;
 };
 
 /**
-- 
2.52.0

