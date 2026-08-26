Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48740C61DC6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0790110ED51;
	Wed, 26 Aug 2026 13:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXGjbOeb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B43B10ED4C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787752337; x=1819288337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rEHxRbsQqjyUDvQ8icGAyNGT/YXEzI60JKfVd8qw90U=;
 b=nXGjbOeb0idmURgjdfvdidhbDjERAzU05qurW9YToGYHWCZi6gbPDgAK
 VgL1t1sbDO1m54UsY5J9LygoEP5J/MqxdMpfwckMFYn8r6MPD88toI04H
 q1dUtXtfSx4bo8pGr0wx1cWwyoGcMXbcrMINQQaNsx0zI5lAjr7CvkKxO
 6Jq4zWHIb6ICXdHmUPItTjH50a42xbqDLQpkoZV0nKgA6OY+3VtS/Fl2F
 0gUtsDsxWxJ4kTld4p/0sYUUlRLg+UZ1kW7+3tR0/U9oCbIESipLPVOFh
 k17m2oxNgBAjgkOznWwGSgwZwMM7puz0OPSK7RnSsOLdhWEYlh96OmYy9 w==;
X-CSE-ConnectionGUID: 7j6edzSsTISk20djwsIKAQ==
X-CSE-MsgGUID: rdqF87CxTSiKzgN0Yip63g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88251050"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88251050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:16 -0700
X-CSE-ConnectionGUID: BDNItWHaRxqldCkYPpRleQ==
X-CSE-MsgGUID: vhnvcOgHQjOHM2AdeAx19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="269533528"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
Date: Wed, 26 Aug 2026 19:21:47 +0530
Message-ID: <20260826135136.204044-28-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260826135136.204044-16-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
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

Add a debugfs file "vram_bad_pages" that shows offlined and queued
VRAM pages across all tiles. Each entry displays the page frame number,
GPU page size, and status flag (R=reserved, P=pending, F=failed).

example,
cat /sys/kernel/debug/dri/0/vram_bad_pages

max_pages: 10000
0x0000000000000000 : 0x0000000000001000 : R
0x0000000000001234 : 0x0000000000001000 : P
0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr (includes tile offset)

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            |  4 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 66 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
 4 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 28135f84e286..e19eafffbb08 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -32,6 +32,7 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
 
@@ -773,6 +774,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	if (man)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe_ttm_vram_debugfs_init(xe, root);
+
 	for_each_tile(tile, xe, tile_id)
 		xe_tile_debugfs_register(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 24d134754265..af9e1fa868d7 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/cgroup_dmem.h>
+#include <linux/debugfs.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_drv.h>
@@ -874,3 +875,68 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
+
+static int vram_bad_pages_show(struct seq_file *m, void *unused)
+{
+	struct xe_device *xe = m->private;
+	struct xe_ttm_vram_offline_resource *pos;
+	struct ttm_resource_manager *man;
+	struct gpu_buddy_block *block;
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_tile *tile;
+	u8 id;
+
+	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
+	if (man)
+		seq_printf(m, "max_pages: %d\n",
+			   to_xe_ttm_vram_mgr(man)->max_pages);
+
+	for_each_tile(tile, xe, id) {
+		struct xe_vram_region *vr = tile->mem.vram;
+
+		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
+		if (!man || !vr)
+			continue;
+		mgr = to_xe_ttm_vram_mgr(man);
+
+		rcu_read_lock();
+
+		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
+			block = list_first_entry_or_null(&pos->blocks,
+							 struct gpu_buddy_block, link);
+			if (!block)
+				continue;
+
+			seq_printf(m, "0x%016llx : 0x%016llx : R\n",
+				   (gpu_buddy_block_offset(block) + vr->dpa_base) >> PAGE_SHIFT,
+				   gpu_buddy_block_size(&mgr->mm, block));
+		}
+
+		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
+			u64 pfn, blk_size;
+
+			block = list_first_entry_or_null(&pos->blocks,
+							 struct gpu_buddy_block, link);
+			if (block) {
+				pfn = (gpu_buddy_block_offset(block) + vr->dpa_base) >> PAGE_SHIFT;
+				blk_size = gpu_buddy_block_size(&mgr->mm, block);
+			} else {
+				pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
+				blk_size = PAGE_SIZE;
+			}
+
+			seq_printf(m, "0x%016llx : 0x%016llx : %c\n",
+				   pfn, blk_size, pos->status ? 'F' : 'P');
+		}
+
+		rcu_read_unlock();
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(vram_bad_pages);
+
+void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
+{
+	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index d5392beff30c..f354c26c4257 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -9,6 +9,7 @@
 #include "xe_ttm_vram_mgr_types.h"
 
 enum dma_data_direction;
+struct dentry;
 struct xe_device;
 struct xe_tile;
 struct xe_vram_region;
@@ -32,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
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

