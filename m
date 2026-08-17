Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DF2C5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 06:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0AD10E660;
	Mon, 17 Aug 2026 06:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gS1Gi3jw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B61410E660
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 06:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786949490; x=1818485490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbDRnBJ/u0rcKQYZ0vtnxo57ZQR+JftRe+3sNEFnZYs=;
 b=gS1Gi3jwNz2KAYEdirKA1+xNVmcJhCgp8od2yOGTy+VCG1/noJD6OG8O
 3aGcBR5uZfWgbhUGYMrxxgHyyzNLUJZbPYwo5yt55sYRtVhJK3VrvJkXx
 jswTJPBo2ZtsUUmlhbWp1SeEx4hJvONqJifK+Qwz+pMZdd5bxXIxuZwKS
 Dwuhl4sRz++5/dgPSkyNqdTRrf7TX6E4mvVy+inchM7/LA/BnXIgWhIDo
 hNXhMSlhKJP4Ak6d8ajgjN8sj5R1Q/GcYODhA+HRCZ9cB9syaaSusb5rs
 N1+fkRuA6BEj/qOkHYAsLu84SiFwkOf5gK1LLEu8Mar7PIrX+Fb3eZ6ha Q==;
X-CSE-ConnectionGUID: UGLDVsw/SJm4S+iRhLBkPw==
X-CSE-MsgGUID: OrRf9Te/QIqTyjfe1gFwnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91289573"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91289573"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:30 -0700
X-CSE-ConnectionGUID: lKgSZrScQMWskCBiKlhtig==
X-CSE-MsgGUID: iVHCnH1PQJi0MGi0B172Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="264383861"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:28 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V16 12/12] drm/xe: Add fault-inject based VRAM page offline
 injection
Date: Mon, 17 Aug 2026 12:21:07 +0530
Message-ID: <20260817065055.3734576-26-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
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
  times, interval, etc.) - only available with
  CONFIG_FAULT_INJECTION_DEBUG_FS
- inject_mempage_offline_trigger: Write a PFN value to inject a
  specific page, or write "0" to auto-pick the last unallocated
  VRAM page

The trigger accepts:
- "0"      : auto-pick last unallocated page
- "0xPFN"  : inject fault at a specific PFN address

On kernels with CONFIG_FAULT_INJECTION_DEBUG_FS, injection is gated
by should_fail() (probability/times must be configured first).
On kernels without it, the trigger always injects directly.

The injection reports the page as faulted via
xe_ttm_vram_handle_addr_fault(), exercising the full page offlining
path.

Usage (with CONFIG_FAULT_INJECTION_DEBUG_FS):
  echo 100 > inject_mempage_offline/probability
  echo 1 > inject_mempage_offline/times
  echo 0 > inject_mempage_offline_trigger

Usage (without CONFIG_FAULT_INJECTION_DEBUG_FS):
  echo 0 > inject_mempage_offline_trigger

v3(Himal):
- Use FAULT_ACTION
v2(sashiko):
- use cond_resched()
- validate input first and fix addr < 0 case
- validate vr, move block, found var as local to scope_guard

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 50 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.h      |  2 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 52 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
 4 files changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 28135f84e286..72258f3ce7b0 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -32,6 +32,7 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
 
@@ -44,12 +45,18 @@
 DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
 DECLARE_FAULT_ATTR(wedge_cold_reset);
+DECLARE_FAULT_ATTR(inject_mempage_offline);
 
 static bool csc_hw_error_available(struct xe_device *xe)
 {
 	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
 }
 
+static bool is_crescent_island(struct xe_device *xe)
+{
+	return xe->info.platform == XE_CRESCENTISLAND;
+}
+
 /*
  * Fault injection table.  Each entry registers a debugfs attribute; add a
  * matching FAULT_ACTION() below for every entry added here.
@@ -66,6 +73,9 @@ static struct {
 	  .is_visible = csc_hw_error_available },
 	{ .name = "wedge_cold_reset",
 	  .attr = &wedge_cold_reset },
+	{ .name = "inject_mempage_offline",
+	  .attr = &inject_mempage_offline,
+	  .is_visible = is_crescent_island },
 };
 
 /*
@@ -81,6 +91,41 @@ bool xe_fault_##name(void)				\
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
+	if (IS_ENABLED(CONFIG_FAULT_INJECTION_DEBUG_FS) &&
+	    !xe_fault_mempage_offline())
+		return size;
+
+	if (pfn == 0)
+		return xe_ttm_vram_inject_fault(xe) ?: size;
+
+	/* User provided PFN - convert to DPA and inject */
+	return xe_ttm_vram_handle_addr_fault(xe,
+					     (pfn << PAGE_SHIFT) + vr->dpa_base) ?: size;
+}
+
+static const struct file_operations inject_mempage_offline_fops = {
+	.owner = THIS_MODULE,
+	.write = inject_mempage_offline_trigger,
+};
 
 static void xe_fault_inject_debugfs_register(struct xe_device *xe,
 					     struct dentry *root)
@@ -95,6 +140,11 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
 		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
 					  xe_fault_inject_entry[i].attr);
 	}
+
+	if (is_crescent_island(xe)) {
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
index 2731bbc50864..3243600717be 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -829,6 +829,58 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
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
 static size_t serialize_bad_pages(struct xe_ttm_vram_mgr *mgr, char *buf, size_t max_len)
 {
 	struct xe_ttm_vram_offline_resource *pos;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index eb55b0f74ef3..9feb999a1f8d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+int xe_ttm_vram_inject_fault(struct xe_device *xe);
 int xe_ttm_vram_sysfs_init(struct xe_device *xe);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
-- 
2.52.0

