Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE585C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62E10E34B;
	Thu, 16 Jul 2026 10:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wvr7Gy+t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D60D10E324
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784197307; x=1815733307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6xgIHS5PJV7NDQBuR2mbgKMPXKpgEJaXkRX6STc3jQ=;
 b=Wvr7Gy+tjpGBHOBPkqlG+aRU6nakjJLBHDLxodlMwDHxMlynJODzilvm
 9E17oKLA8pC/BIIunVM3Y3HJXfmydr0NRvL2PJGLoFW2h9x44rcnOxwSG
 BBsky4EpXcQuT6R622DDWQOpvhFh08YbKs94Ae1/yBYZRz/PnBanVoOW5
 NV86v7NLObWlfahjvJwoCkxxGY8fp90kK1chcm3UXAim0h+OSfFZ2u+35
 H0bhCFY8DmxuyUNOE2QguaEb+HLMu+ZrQ7sCW2T3c+yrIEiEmGdWmbOLe
 ObjV/b1o9CR0I5EHYX90L9B1Cfesqo1cNjFB0lxyMi+X8yFf8V+uuWKwy A==;
X-CSE-ConnectionGUID: 0Jz9ZRTlT9y1lsBMEKks1w==
X-CSE-MsgGUID: bVTfSbU/TfyvWlvLCAN88w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96367802"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96367802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:21:47 -0700
X-CSE-ConnectionGUID: YRidqoQeRYqzr8/fa9hz+Q==
X-CSE-MsgGUID: fxZsasT+RDmcwTT+uiFHMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253833872"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:21:46 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V13 11/11] drm/xe: Add fault-inject based VRAM page offline
 injection
Date: Thu, 16 Jul 2026 15:51:17 +0530
Message-ID: <20260716102110.1549938-24-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
References: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
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

Add a fault-inject based debugfs interface for testing VRAM page
offlining. This replaces the previous standalone debugfs approach
with the standard kernel fault-inject infrastructure.

Two debugfs entries are created under the xe debugfs root for
CRI platforms:
- inject_mempage_offline/: Standard fault-inject knobs (probability,
  times, interval, etc.) — only available with
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 40 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 37 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
 3 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..05d314f0f794 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -30,6 +30,7 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
 
@@ -41,6 +42,7 @@
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
+DECLARE_FAULT_ATTR(inject_mempage_offline);
 
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, const char *name, struct drm_printer *p)
@@ -564,6 +566,37 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
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
+	if (IS_ENABLED(CONFIG_FAULT_INJECTION_DEBUG_FS) &&
+	    !should_fail(&inject_mempage_offline, 1))
+		return size;
+
+	ret = kstrtou64_from_user(ubuf, size, 0, &pfn);
+	if (ret)
+		return ret;
+
+	if (pfn == 0)
+		return xe_ttm_vram_inject_fault(xe) ?: size;
+
+	/* User provided PFN — convert to DPA and inject */
+	return xe_ttm_vram_handle_addr_fault(xe,
+					     (pfn << PAGE_SHIFT) + vr->dpa_base) ?: size;
+}
+
+static const struct file_operations inject_mempage_offline_fops = {
+	.owner = THIS_MODULE,
+	.write = inject_mempage_offline_trigger,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -632,6 +665,13 @@ void xe_debugfs_register(struct xe_device *xe)
 	if (man)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		fault_create_debugfs_attr("inject_mempage_offline", root,
+					  &inject_mempage_offline);
+		debugfs_create_file("inject_mempage_offline_trigger", 0200,
+				    root, xe, &inject_mempage_offline_fops);
+	}
+
 	for_each_tile(tile, xe, tile_id)
 		xe_tile_debugfs_register(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 0e5dfbf203a3..bf9eefdbd339 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -814,6 +814,43 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
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
+	struct gpu_buddy_block *block;
+	bool found = false;
+	u64 addr;
+
+	/* Walk from end of VRAM to find last unallocated page */
+	for (addr = vr->actual_physical_size - SZ_4K;
+	     addr < vr->actual_physical_size; addr -= SZ_4K) {
+		scoped_guard(mutex, &vram_mgr->lock) {
+			block = gpu_buddy_allocated_addr_to_block(mm, addr);
+			if (!block)
+				found = true;
+		}
+		if (found)
+			return xe_ttm_vram_handle_addr_fault(xe,
+							     addr + vr->dpa_base);
+	}
+
+	return -ENOSPC;
+}
+EXPORT_SYMBOL(xe_ttm_vram_inject_fault);
+
 static int xe_ttm_vram_dump_bad_pages_info(char *buf, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_ttm_vram_offline_resource *pos;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index c33e1a8d9217..9e114c63223f 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr);
+int xe_ttm_vram_inject_fault(struct xe_device *xe);
 int xe_ttm_vram_sysfs_init(struct xe_device *xe);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
-- 
2.52.0

