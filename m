Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6B8FEFB4D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C4510EB76;
	Fri, 27 Feb 2026 13:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHDXvCs9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECDA10EB72
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772199934; x=1803735934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kDb7DeFstzr2Z5jJ2lvNeZfJnxMtnLaw4BqMLdBHJ7o=;
 b=CHDXvCs9MXxs4ZJYIwcJ9rSmwmCXanvIi5qhYzloFFVnhhsAt7ULqta3
 BXwLqFoW33/bdLyh0ovOEYv035Bl6YMKefZ9gh+LxbfS8NGz7qwN1nATU
 BE4Gct6HIHXCdnL8o3VzeaNmlaBPsBTzzVHI0INRsXlBfyXOhrtVi14Q7
 RxmCb0IPh16m2JUvsKql+6Ttue6SLXFs1oCCQXv5ciJzNefGMohXHXRuG
 +Tth8MntXReCw5I5/G7FUoNwlZsCo7ZdvKV+esZmY8z2iqb7//DFFe36o
 7mUzcbROy18RXBJvCI4ifVX3OCrxfajkt9DGb93PZbCKhcB+6t3mTJVom A==;
X-CSE-ConnectionGUID: 5auk1abmREWQdrkZsk0/Lg==
X-CSE-MsgGUID: OB2Hdpp2TsK6JoFW5sIYIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84633188"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="84633188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:34 -0800
X-CSE-ConnectionGUID: fV3Y9EM/SNCtEoaE48Cp4A==
X-CSE-MsgGUID: n6nlIhnBSJehp3lWBIC3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216021747"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:33 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V4 6/7] drm/xe/cri: Add sysfs interface for bad gpu vram
 pages
Date: Fri, 27 Feb 2026 19:14:43 +0530
Message-ID: <20260227134453.1814649-15-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
References: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
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
0x00000000 : 0x00001000 : R
0x00001234 : 0x00001000 : P

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c |  4 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 78 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
 3 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..796dd6bedd97 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -14,6 +14,7 @@
 #include "xe_pcode_api.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_ttm_vram_mgr.h"
 
 /**
  * DOC: Xe device sysfs
@@ -285,5 +286,8 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe_ttm_vram_sysfs_init(xe);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 42d531b1dabf..417ad563e80e 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -742,3 +742,81 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
 	return ret;
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
+
+static void xe_ttm_vram_dump_bad_pages_info(char *buf, struct xe_ttm_vram_mgr *mgr)
+{
+	const unsigned int element_size = sizeof("0xabcdabcd : 0x12345678 : R\n") - 1;
+	struct xe_ttm_offline_resource *pos, *n;
+	struct drm_buddy_block *block;
+	ssize_t s = 0;
+
+	mutex_lock(&mgr->lock);
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		block = list_first_entry(&pos->blocks,
+					 struct drm_buddy_block,
+					 link);
+		s += scnprintf(&buf[s], element_size + 1,
+			       "0x%08llx : 0x%08llx : %1s\n",
+			       drm_buddy_block_offset(block) >> PAGE_SHIFT,
+			       drm_buddy_block_size(&mgr->mm, block),
+			       "R");
+	}
+	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
+		block = list_first_entry(&pos->blocks,
+					 struct drm_buddy_block,
+					 link);
+		s += scnprintf(&buf[s], element_size + 1,
+			       "0x%08llx : 0x%08llx : %1s\n",
+			       drm_buddy_block_offset(block) >> PAGE_SHIFT,
+			       drm_buddy_block_size(&mgr->mm, block),
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
+	u8 mem_type = XE_PL_VRAM1;
+
+	do {
+		man = ttm_manager_type(&xe->ttm, mem_type);
+		struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+
+		if (man)
+			xe_ttm_vram_dump_bad_pages_info(buf, mgr);
+		--mem_type;
+	} while (mem_type >= XE_PL_VRAM0);
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
index 8cc528434ceb..6fcbe0b7fed8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr);
+int xe_ttm_vram_sysfs_init(struct xe_device *xe);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
-- 
2.52.0

