Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E4C5CFC1
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D06310EB8B;
	Tue, 11 Aug 2026 12:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N38Lpmop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FEC892F6
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786452051; x=1817988051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qvYkej7QjqAocrMlox4ke15i7q+H7xSjsxs1Wm4DLdw=;
 b=N38Lpmopw0OiYtEitdU5rp8XegI0bfq5VUv8d0sI7U9f8bGQ2ECORhOS
 UxzO0INRDrLjf5H7uv/tmQ9AjMxnz5AUKH1ey3eoEZZkkD6jNRu2JC1bw
 Luvk0+V7PiTumTILV9sbe4z1aak+a/VHg13BJy/823xHPBbvoTGbUUyln
 J/S4pqgO9Clix9PhiT9GrLNsBZ2IC+x98sv59T9QSRAgtLK/kimfKaWB+
 kQTI9Fbu6jOZKLReNZbKQ+doeIA8V9TAIl+VPpxb9OwuusGpek5C8ulUo
 KkwuZr518VpHFApGFhmt+yWWfD2Fj6CTyNqv+PgAITbnFYb8rmo1FJrk7 g==;
X-CSE-ConnectionGUID: f08zYgt7SI+QMwZ+HKuybg==
X-CSE-MsgGUID: SyhF/pbcSU29q1CTrxUG5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86913017"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86913017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:51 -0700
X-CSE-ConnectionGUID: 6A+Mav8USPmkgplYis+Ueg==
X-CSE-MsgGUID: 5+IcUbnBSnOp9P3U+ff8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="265329966"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:50 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V15 11/14] drm/xe/vram: Use RCU for lock-free sysfs reads of
 bad page lists
Date: Tue, 11 Aug 2026 18:10:15 +0530
Message-ID: <20260811124016.3614699-27-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
MIME-Version: 1.0
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

The sysfs vram_bad_pages reader previously held mgr->lock while
formatting the entire output, blocking normal VRAM alloc/free
operations for the duration of the read.

Switch to RCU-protected list traversal for the sysfs read path:

Writer side (page offline, under mgr->lock):
  - list_add()  -> list_add_rcu()
  - list_del()  -> list_del_rcu()
  - kfree()     -> kfree_rcu()

Reader side (sysfs serialize_bad_pages):
  - Drop mgr->lock entirely
  - Use rcu_read_lock() + list_for_each_entry_rcu()
  - Use READ_ONCE() for entry counters

The writer-side xe_ttm_vram_page_already_processed() keeps
lockdep_assert_held(&mgr->lock) since it requires serialization
against concurrent page offline operations.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 161 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   4 +
 2 files changed, 155 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 6280886e2ebb..c22669955147 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -312,15 +312,15 @@ static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vra
 
 	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
 		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
-		list_del(&pos->offlined_link);
+		list_del_rcu(&pos->offlined_link);
 		--mgr->n_offlined_pages;
-		kfree(pos);
+		kfree_rcu(pos, rcu);
 	}
 	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
 		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
-		list_del(&pos->queued_link);
+		list_del_rcu(&pos->queued_link);
 		--mgr->n_queued_pages;
-		kfree(pos);
+		kfree_rcu(pos, rcu);
 	}
 }
 
@@ -657,7 +657,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 				break;
 			}
 			++vram_mgr->n_queued_pages;
-			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
+			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
 		}
 	}
 
@@ -702,11 +702,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
 				if (pos->addr == nentry->addr) {
 					--vram_mgr->n_queued_pages;
-					list_del(&pos->queued_link);
+					list_del_rcu(&pos->queued_link);
 					break;
 				}
 			}
-			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
 			/* RAS will send command to FW for offlining page based on ret value */
 			++vram_mgr->n_offlined_pages;
 			return ret;
@@ -716,7 +716,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 
 		scoped_guard(mutex, &vram_mgr->lock) {
 			++vram_mgr->n_queued_pages;
-			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
+			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
 			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
 						      size, size, &nentry->blocks,
 						      GPU_BUDDY_RANGE_ALLOCATION,
@@ -732,12 +732,12 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
 				if (pos->addr == nentry->addr) {
 					--vram_mgr->n_queued_pages;
-					list_del(&pos->queued_link);
+					list_del_rcu(&pos->queued_link);
 					break;
 				}
 			}
 			++vram_mgr->n_offlined_pages;
-			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
 			/* RAS will send command to FW for offlining page based on ret value */
 		}
 	}
@@ -825,3 +825,144 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
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
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index bdfdf6ec1218..003d3a7cb1dd 100644
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
@@ -69,6 +71,8 @@ struct xe_ttm_vram_offline_resource {
 	u64 addr;
 	/** @status: Reservation status (0=pending, 1=fail) */
 	bool status;
+	/** @rcu: RCU head for deferred freeing */
+	struct rcu_head rcu;
 };
 
 #endif
-- 
2.52.0

