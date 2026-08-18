Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1589EC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33D10EAB6;
	Tue, 18 Aug 2026 10:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrDYsGpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E9D10EAC0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049731; x=1818585731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zERu3G4sWeVL1F289CsCGV+yB/Jb4dqkqx7TpDQXoZA=;
 b=JrDYsGpFflED8E2zclO9aWtFrKmSP1G5JqAdWtD4TUXyJpJpxjovJ8I/
 alCELoV6GiUZwSuCal3j+w99ZTsKWKVDpPUItQPrl07WnnJnucIi0WCbG
 g1+RYNs9u04xawN6KT7//T0fyL3qtv9Q7TGdf/saKfx9VO9wqcsbt8vfi
 svNfZmdUJy/ZZWGZZoUA3oufw4vHe3lF/FI4xMBN8J3W+OhU75aFMaKyR
 LCbALzD3CKY37cmKQmaAwNJQvsy0sNnj+DvW2LGasP3PyPUoD0uag1tBp
 RZLpEAKTtU40RzX9xbU8oWCvJ3knPn8n7JLuOnB0rdBebPoEg8MTzhDUN Q==;
X-CSE-ConnectionGUID: a9PlsNQ4R0iX9hW2EUerWQ==
X-CSE-MsgGUID: sXupZprbSXKYdlD7UaNEJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98691919"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98691919"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:42:11 -0700
X-CSE-ConnectionGUID: 1Bw6gSFHR4ywrTA7I7NL0A==
X-CSE-MsgGUID: o7aKFqcHTI65LHyObRRg3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="295117609"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:42:10 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V17 10/12] drm/xe: Add sysfs interface for bad gpu vram pages
Date: Tue, 18 Aug 2026 16:11:05 +0530
Message-ID: <20260818104055.3833974-24-tejas.upadhyay@intel.com>
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

Include a sysfs interface designed to expose information about bad
VRAM pages — those identified as having hardware faults (e.g., ECC
errors). This interface allows userspace tools and administrators to
monitor the health of the GPU's local memory and track the status of
page retirement. Details on bad gpu vram pages can be found under
/sys/bus/pci/devices/<bdf>/vram_bad_pages.

The format is: pfn : gpu_page_size : flags

flags:
  R: reserved, this gpu page is reserved.
  P: pending for reserve, this gpu page is marked as bad, will be
     reserved in next window of page_reserve.
  F: unable to reserve, this gpu page can't be reserved due to some
     reasons.

For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
  max_pages : 10000
  0x0000000000000000 : 0x0000000000001000 : R
  0x0000000000001234 : 0x0000000000001000 : P

The sysfs binary attribute is created under the PCI device kobject
when the platform supports it and the configfs bad_page_reservation
policy is enabled. Uses RCU-protected list traversal so reads never
block normal VRAM allocation operations.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 141 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 +
 4 files changed, 151 insertions(+)

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
index 51b98460481d..372bb25448f6 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -874,3 +874,144 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
+
+static size_t serialize_bad_pages(struct xe_ttm_vram_mgr *mgr, char *buf, size_t max_len)
+{
+	struct xe_ttm_vram_offline_resource *pos;
+	struct gpu_buddy_block *block;
+	size_t s = 0;
+	int printed;
+	int count = 0;
+
+	rcu_read_lock();
+
+	printed = scnprintf(buf + s, max_len - s, "max_pages: %d\n", mgr->max_pages);
+	s += printed;
+
+	list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
+		if (count >= 10000 || s >= max_len)
+			break;
+
+		block = list_first_entry_or_null(&pos->blocks, struct gpu_buddy_block, link);
+		if (!block)
+			continue;
+
+		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx : %c\n",
+				    gpu_buddy_block_offset(block) >> PAGE_SHIFT,
+				    gpu_buddy_block_size(&mgr->mm, block), 'R');
+		s += printed;
+		count++;
+	}
+	list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
+		u64 pfn, blk_size;
+
+		if (count >= 10000 || s >= max_len)
+			break;
+
+		block = list_first_entry_or_null(&pos->blocks, struct gpu_buddy_block, link);
+		if (block) {
+			pfn = gpu_buddy_block_offset(block) >> PAGE_SHIFT;
+			blk_size = gpu_buddy_block_size(&mgr->mm, block);
+		} else {
+			pfn = pos->addr >> PAGE_SHIFT;
+			blk_size = PAGE_SIZE;
+		}
+
+		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx : %c\n",
+				    pfn, blk_size, pos->status ? 'F' : 'P');
+		s += printed;
+		count++;
+	}
+
+	rcu_read_unlock();
+	return s;
+}
+
+static ssize_t vram_bad_pages_bin_read(struct file *filp, struct kobject *kobj,
+				       const struct bin_attribute *attr, char *buf,
+				       loff_t off, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct ttm_resource_manager *man;
+	struct xe_ttm_vram_mgr *mgr;
+	size_t allocation_size;
+	struct xe_device *xe;
+	size_t full_data_len;
+	int active_entries;
+	char *temp_buf;
+
+	xe = pdev_to_xe_device(pdev);
+	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
+	if (!man)
+		return -ENODEV;
+	mgr = to_xe_ttm_vram_mgr(man);
+
+	active_entries = READ_ONCE(mgr->n_offlined_pages) + READ_ONCE(mgr->n_queued_pages);
+
+	if (active_entries > 10000)
+		active_entries = 10000;
+
+	allocation_size = 64 + (active_entries * 48);
+
+	temp_buf = kvmalloc(allocation_size, GFP_KERNEL);
+	if (!temp_buf)
+		return -ENOMEM;
+
+	/* serialize_bad_pages uses rcu_read_lock internally */
+	full_data_len = serialize_bad_pages(mgr, temp_buf, allocation_size);
+
+	if (off >= full_data_len) {
+		kvfree(temp_buf);
+		return 0;
+	}
+
+	if (off + count > full_data_len)
+		count = full_data_len - off;
+
+	memcpy(buf, temp_buf + off, count);
+
+	kvfree(temp_buf);
+	return count;
+}
+
+static const struct bin_attribute bin_attr_vram_bad_pages = {
+	.attr = { .name = "vram_bad_pages", .mode = 0444 },
+	.read = vram_bad_pages_bin_read,
+	.size = 0,
+};
+
+static void xe_ttm_vram_sysfs_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	sysfs_remove_bin_file(&pdev->dev.kobj, &bin_attr_vram_bad_pages);
+}
+
+/**
+ * xe_ttm_vram_sysfs_init - Initialize vram bad pages sysfs binary file
+ * @xe: Xe Device object
+ *
+ * Creates a binary sysfs file under the PCI device for reading
+ * offlined and queued VRAM pages. Supports large entry counts
+ * via offset/count pagination.
+ *
+ * Returns: 0 on success, negative error code on error.
+ */
+int xe_ttm_vram_sysfs_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int err;
+
+	err = sysfs_create_bin_file(&pdev->dev.kobj, &bin_attr_vram_bad_pages);
+	if (err) {
+		dev_err(&pdev->dev,
+			"Failed to create vram_bad_pages sysfs: %d\n",
+			err);
+		return err;
+	}
+
+	return devm_add_action_or_reset(&pdev->dev, xe_ttm_vram_sysfs_fini, xe);
+}
+EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index d5392beff30c..eb55b0f74ef3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+int xe_ttm_vram_sysfs_init(struct xe_device *xe);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index dc97b0ad0e51..efcf3e1d4e80 100644
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

