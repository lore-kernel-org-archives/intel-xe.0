Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB2AC624CE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4F210E660;
	Mon, 31 Aug 2026 06:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDOU++/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2156810E61A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159068; x=1819695068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZWIITU5CMhuMDjFF09Tf42jQ5ShmVbW0cuHrSTjABlU=;
 b=cDOU++/yZHKxZ+bDMimqlXvISjDnhjOhDAMwN6KyxtsJoqetTYg7+2s3
 Jz2Qp9LGnNrKlMOhC7tea6hyt1NNXwPcq4mMB1W8Lhjqn8sBWAxjCKgLy
 PGLgQS2ScClJJ9m0kIp4UZMvB27nk7afX6sAFIgxPadCkKNpJM3h4bURB
 xNGwCEgeQuwTu5LXyein6VGcGSJ3q3px9rryE5KabePBEsCkeCXzVtZ9Y
 xkPMPjB61LZz/cewMdcBS1duHLfolT2g9AjUNN7zUA5p21Cq6+hFPYhua
 LuHoPsB4ysW9P0Iwaw5TB5yuik5d/vyhELIlUl5xR6/eVZxwbRNaq/U+J A==;
X-CSE-ConnectionGUID: PeltB219SGWM6BOx97c16g==
X-CSE-MsgGUID: M1MLLg68QTWztGU9ny0A2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106081720"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106081720"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:30 -0700
X-CSE-ConnectionGUID: PccyAmjITE+iWise/JpyyQ==
X-CSE-MsgGUID: Mk5kPsSMSuCmaRm3RXGvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269302922"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:28 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH V19 13/15] drm/xe: Expose bad VRAM pages via debugfs
Date: Mon, 31 Aug 2026 12:19:55 +0530
Message-ID: <20260831064942.315720-30-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
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
0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr

v2(Sashikoi/Michal/Himal):
-Remove block iteration, use offline and queue list only
-Move platform check inside api

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            |  3 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 59 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
 4 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 28135f84e286..cb24e001b142 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -32,6 +32,7 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
 
@@ -773,6 +774,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	if (man)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
+	xe_ttm_vram_debugfs_init(xe, root);
+
 	for_each_tile(tile, xe, tile_id)
 		xe_tile_debugfs_register(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 286c866f1d58..456ea78a31e2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/cgroup_dmem.h>
+#include <linux/debugfs.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_drv.h>
@@ -845,3 +846,61 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
+
+static int vram_bad_pages_show(struct seq_file *m, void *unused)
+{
+	struct xe_device *xe = m->private;
+	struct xe_ttm_vram_offline_resource *pos;
+	struct ttm_resource_manager *man;
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_tile *tile;
+	u8 id;
+
+	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
+	if (man)
+		/* TODO Hook with RAS to show max_pages fetched from FW */
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
+			u64 pfn;
+
+			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
+			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn, PAGE_SIZE);
+		}
+
+		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
+			u64 pfn;
+
+			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
+			seq_printf(m, "0x%016llx : 0x%016lx : %c\n",
+				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');
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
+	/*
+	 * TODO: Replace platform check with xe->info
+	 * once the feature flag is plumbed through device info.
+	 */
+	if (xe->info.platform != XE_CRESCENTISLAND)
+		return;
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

