Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCFFC624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB3310E59D;
	Mon, 31 Aug 2026 06:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzXC2yTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CEE10E615
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159068; x=1819695068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+3ndf57DbbOFwWdIGjUXC0pCHGqqq9W0CHV/t1Y4UMI=;
 b=lzXC2yTja91WZDrZJ3+6VgPSSiTBrb2F8MGDVhdOYqaQ7lIFWxNTxXDC
 9FiHWwZeDSeYBhM0kqjb3VUP7X3io6HH9htY3VzxHb+FGMqyd2tDUIu+G
 QdSdfZ7/u+l9KJZzR4TSzStUycxDBqLBjrwbJqJVwiWZmujnpfgLEi5qq
 KRJBJF5C0XHPIEbkGWNt0QgDKZtSZwv/72pH0rLgKneBwZ1kY2/jUhNOP
 93wo0/nfIeWZJZxhz5qgtbZl7sOodyVfsIY9n6ayMjvhWy/H46JsqI69f
 H7azELx9rU8KIeOc8Ug4a/U2KqnuMF8YzfSJvlOPOply7cUCf7GeF/9mn A==;
X-CSE-ConnectionGUID: Gf/KuDSlQayYvE0agmB5AA==
X-CSE-MsgGUID: xqt/oUC5Rl2o7TYBiS59PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106081725"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106081725"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:33 -0700
X-CSE-ConnectionGUID: zziNAco7QDyAlPYj9P5mqg==
X-CSE-MsgGUID: mncZ+8o5Qc6ZqS3pPYMY3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269302966"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:32 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V19 15/15] drm/xe: Add fault-inject based VRAM page offline
 injection
Date: Mon, 31 Aug 2026 12:19:57 +0530
Message-ID: <20260831064942.315720-32-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
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

Add a fault-inject based debugfs interface for testing VRAM page
offlining. This replaces the previous standalone debugfs approach
with the standard kernel fault-inject infrastructure.

Two debugfs entries are created under the xe debugfs root for
CRI platforms:
- inject_mempage_offline/: Standard fault-inject knobs (probability,
  times, interval, etc.) created by fault_create_debugfs_attr().
  Without CONFIG_FAULT_INJECTION_DEBUG_FS, the stub returns
  ERR_PTR(-ENODEV) and no knobs are created, making the trigger
  effectively a no-op.
- inject_mempage_offline_trigger: Write a PFN value to inject a
  specific page, or write "0" to auto-pick the last unallocated
  VRAM page

The trigger accepts:
- "0"      : auto-pick last unallocated page
- "0xPFN"  : inject fault at a specific PFN address

Usage:
  echo 100 > inject_mempage_offline/probability
  echo 1 > inject_mempage_offline/times
  echo 0 > inject_mempage_offline_trigger

  probability: likelihood of should_fail() returning true (0-100)
  times: number of times injection is allowed (-1 for unlimited)

v6(Himal):
- Add warning to rebind driver post test run
v5(Sashiko):
- exclude SRIOV and remove dpa_base addition, already absolute dpa
v4(Himal):
- Use xe_fault_mempage_offline() instead of IS_ENABLED() +
  direct should_fail(). CONFIG_FAULT_INJECTION_DEBUG_FS is now
  an implicit requirement for the trigger to function.
v3(Himal):
- Use FAULT_ACTION
v2(sashiko):
- use cond_resched()
- validate input first and fix addr < 0 case
- validate vr, move block, found var as local to scope_guard

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 48 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.h      |  2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 58 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
 4 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index cb24e001b142..80f62634fae5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -45,12 +45,18 @@
 DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
 DECLARE_FAULT_ATTR(wedge_cold_reset);
+DECLARE_FAULT_ATTR(inject_mempage_offline);
 
 static bool csc_hw_error_available(struct xe_device *xe)
 {
 	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
 }
 
+static bool is_crescent_island_pf(struct xe_device *xe)
+{
+	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_CRESCENTISLAND;
+}
+
 /*
  * Fault injection table.  Each entry registers a debugfs attribute; add a
  * matching FAULT_ACTION() below for every entry added here.
@@ -67,6 +73,9 @@ static struct {
 	  .is_visible = csc_hw_error_available },
 	{ .name = "wedge_cold_reset",
 	  .attr = &wedge_cold_reset },
+	{ .name = "inject_mempage_offline",
+	  .attr = &inject_mempage_offline,
+	  .is_visible = is_crescent_island_pf },
 };
 
 /*
@@ -82,6 +91,40 @@ bool xe_fault_##name(void)				\
 FAULT_ACTION(gt_reset, gt_reset_failure)
 FAULT_ACTION(csc_hw_error, inject_csc_hw_error)
 FAULT_ACTION(wedge_cold_reset, wedge_cold_reset)
+FAULT_ACTION(mempage_offline, inject_mempage_offline)
+
+static ssize_t inject_mempage_offline_trigger(struct file *f,
+					      const char __user *ubuf,
+					      size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_vram_region *vr = tile->mem.vram;
+	u64 pfn;
+	int ret;
+
+	if (!vr)
+		return -ENODEV;
+
+	ret = kstrtou64_from_user(ubuf, size, 0, &pfn);
+	if (ret)
+		return ret;
+
+	if (!xe_fault_mempage_offline())
+		return size;
+
+	xe_warn(xe, "Page offlining test interface accessed. Notice: Offlined or reserved memory pages cannot be reclaimed dynamically. A driver rebind (unbind and bind loop) is required post-test to clean up.\n");
+	if (pfn == 0)
+		return xe_ttm_vram_inject_fault(xe) ?: size;
+
+	/* User provided PFN - convert to DPA and inject */
+	return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT) ?: size;
+}
+
+static const struct file_operations inject_mempage_offline_fops = {
+	.owner = THIS_MODULE,
+	.write = inject_mempage_offline_trigger,
+};
 
 static void xe_fault_inject_debugfs_register(struct xe_device *xe,
 					     struct dentry *root)
@@ -96,6 +139,11 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
 		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
 					  xe_fault_inject_entry[i].attr);
 	}
+
+	if (is_crescent_island_pf(xe)) {
+		debugfs_create_file("inject_mempage_offline_trigger", 0200,
+				    root, xe, &inject_mempage_offline_fops);
+	}
 }
 
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 0dcd28fd7dc0..88d91c78036b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -14,11 +14,13 @@ struct xe_device;
 bool xe_fault_gt_reset(void);
 bool xe_fault_csc_hw_error(void);
 bool xe_fault_wedge_cold_reset(void);
+bool xe_fault_mempage_offline(void);
 void xe_debugfs_register(struct xe_device *xe);
 #else
 static inline bool xe_fault_gt_reset(void) { return false; }
 static inline bool xe_fault_csc_hw_error(void) { return false; }
 static inline bool xe_fault_wedge_cold_reset(void) { return false; }
+static inline bool xe_fault_mempage_offline(void) { return false; }
 static inline void xe_debugfs_register(struct xe_device *xe) { }
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index ca97fa8291c4..5ffd125e344b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -866,6 +866,64 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
 
+/**
+ * xe_ttm_vram_inject_fault - Inject a VRAM page fault for testing
+ * @xe: xe device instance
+ *
+ * Picks the last unallocated VRAM page and reports it as faulted
+ * via xe_ttm_vram_handle_addr_fault(). Used by the fault-inject
+ * debugfs interface for testing page offlining.
+ *
+ * Note: Executing this test will permanently retire the allocated
+ * memory tracking pages. The driver must be rebinded (unbind and bind)
+ * post-test execution to reclaim the reserved space, as these pages
+ * cannot be freed or reclaimed dynamically while the current instance
+ * remains active.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ttm_vram_inject_fault(struct xe_device *xe)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_vram_region *vr = tile->mem.vram;
+	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
+	struct gpu_buddy *mm = &vram_mgr->mm;
+	u64 addr;
+
+	if (vr->actual_physical_size < SZ_4K)
+		return -ENOSPC;
+
+	addr = vr->actual_physical_size - SZ_4K;
+	while (addr < vr->actual_physical_size) {
+		struct gpu_buddy_block *block;
+		bool found = false;
+
+		scoped_guard(mutex, &vram_mgr->lock) {
+			block = gpu_buddy_allocated_addr_to_block(mm, addr);
+			if (!block)
+				found = true;
+		}
+
+		/*
+		 * Intentional race window: xe_ttm_vram_handle_addr_fault()
+		 * re-acquires vram_mgr->lock internally, so we cannot hold
+		 * it here. A concurrent allocation claiming this page between
+		 * the two calls is an acceptable false negative for this
+		 * test-only path.
+		 */
+		if (found)
+			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
+
+		cond_resched();
+		if (addr == 0)
+			break;
+		addr -= SZ_4K;
+	}
+
+	return -ENOSPC;
+}
+EXPORT_SYMBOL(xe_ttm_vram_inject_fault);
+
 static int vram_bad_pages_show(struct seq_file *m, void *unused)
 {
 	struct xe_device *xe = m->private;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index f354c26c4257..8878e36292b2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -33,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+int xe_ttm_vram_inject_fault(struct xe_device *xe);
 void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
-- 
2.52.0

