Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D81C4450A
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 13:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896F310ED69;
	Tue, 14 Jul 2026 13:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXs11ciA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E654610ED68
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784036982; x=1815572982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=97U7fANcuRvWKwB56Y7zWbSOhYwWbi+OvJ3SAe0uxkc=;
 b=bXs11ciABhknEFVeB4AFEfVPNQrxy9P3pYK4yvNA7Lq4FyZrhJu+60FZ
 w1HpWp1oHYIbukDRpCS0uNaK4hR7vp9ZowWWilxQYSlgUbLfljDZR91mQ
 pDljUhdckxQw17H0LL5ArmcdGSW0FSSUuKiWcvoTorrYJR+9ArsmURJZu
 BJEc+GzXuJDLk75HaVgLX0uO7TTzK1r+lwyNegW2Md5oianbxkQNHHaQf
 6R3Xl1DASmpA+2Ch050KPMr3eX1hv2oAwX92MT1EQ2Bv88xxnsmSpNZyF
 Zk+zgkrwZQ4u5TL6RHLTSqIwlDappc7BSig+Qu17G0YGnlkaxbriN9muV Q==;
X-CSE-ConnectionGUID: Q7/umakDT6mf2Go9B7QnYg==
X-CSE-MsgGUID: DXJbDQhdT/yg4/eSByAnMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84777558"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84777558"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 06:49:42 -0700
X-CSE-ConnectionGUID: 1SucFxL9R+qM67pBMCnYlQ==
X-CSE-MsgGUID: 6+5rETbgTx63r2PfujtMpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="279138436"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 06:49:40 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V12 06/11] drm/xe/cri: Add debugfs to inject faulty vram
 address
Date: Tue, 14 Jul 2026 19:19:05 +0530
Message-ID: <20260714134900.1283308-19-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260714134900.1283308-13-tejas.upadhyay@intel.com>
References: <20260714134900.1283308-13-tejas.upadhyay@intel.com>
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

Add debugfs which can help testing feature with manual error injection.
Adding a debugfs interface to the drm/xe driver allows manual injection
of faulty VRAM addresses, facilitating the testing of the CRI memory
page offline feature before it is fully functional. The implementation
involves creating a debugfs entry, likely under
/sys/kernel/debug/dri/bdf/invalid_addr_vram0,
to accept specific faulty addresses for validation.

For example,
echo 0 > /sys/kernel/debug/dri/bdf/invalid_addr_vram0
where 0 is below address types to be tested,
enum mempage_offline_mode {
        MEMPAGE_OFFLINE_UNALLOCATED = 0,
        MEMPAGE_OFFLINE_USER_ALLOCATED = 1,
        MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED = 2,
        MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED = 3,
        MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 4,
        MEMPAGE_OFFLINE_RESERVED = 5
};

v6(Sashiko):
- Fix off-by-one in address loop boundary (<= vs <)
- Use relative offset for buddy lookup, convert to DPA for
  handle_addr_fault
- Fix continue inside scoped_guard targeting wrong loop; use break
  instead
- Use READ_ONCE for bo->q access without resv lock
- Wrap case MEMPAGE_OFFLINE_RESERVED in braces for variable
  declaration
- Add NULL check for xe_ttm_stolen_gpu_offset
v5:
- Remove redundant code
v4:
- Use scope_guard around lock, adapt bo->q and enhance warn messages
- %s/gpu_buddy_addr_to_block/gpu_buddy_allocated_addr_to_block
v3:
- Add more specific noncritical bo tests
v2:
- Add mode based automated test vs manual address feed

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 169 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 +
 2 files changed, 171 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..6a21511d3521 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -14,6 +14,7 @@
 #include "regs/xe_pmt.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_exec_queue_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
@@ -21,6 +22,7 @@
 #include "xe_guc_ads.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
+#include "xe_migrate.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
@@ -30,6 +32,8 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
+#include "xe_ttm_stolen_mgr.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
 
@@ -41,6 +45,14 @@
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
+enum mempage_offline_mode {
+	MEMPAGE_OFFLINE_UNALLOCATED = 0,
+	MEMPAGE_OFFLINE_USER_ALLOCATED = 1,
+	MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED = 2,
+	MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED = 3,
+	MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 4,
+	MEMPAGE_OFFLINE_RESERVED = 5,
+};
 
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, const char *name, struct drm_printer *p)
@@ -564,6 +576,152 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+static ssize_t addr_fault_reporting_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%lld\n", xe->mem.vram->ttm.offline_mode);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static int mempage_exec_offline(struct xe_device *xe, u64 mode)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_vram_region *vr = tile->mem.vram;
+	struct ttm_buffer_object *tbo = NULL;
+	struct xe_ttm_vram_mgr *vram_mgr;
+	struct gpu_buddy_block *block;
+	bool do_offline = false;
+	struct gpu_buddy *mm;
+	struct xe_bo *bo;
+	u64 addr = 0x0;
+	int ret = 0;
+
+	vram_mgr = &vr->ttm;
+	mm = &vram_mgr->mm;
+	while (addr < vr->actual_physical_size) {
+		do_offline = false;
+		scoped_guard(mutex, &vram_mgr->lock) {
+			block = gpu_buddy_allocated_addr_to_block(mm, addr);
+			if (!block && mode == MEMPAGE_OFFLINE_UNALLOCATED)
+				do_offline = true;
+			if (block && PTR_ERR(block) != -ENXIO) {
+				if (!block->private)
+					break;
+				tbo = block->private;
+				bo = ttm_to_xe_bo(tbo);
+				if (bo->ttm.type == ttm_bo_type_device &&
+				    bo->flags & XE_BO_FLAG_USER &&
+				    bo->flags & XE_BO_FLAG_VRAM_MASK &&
+				    mode == MEMPAGE_OFFLINE_USER_ALLOCATED) {
+					do_offline = true;
+				} else if (READ_ONCE(bo->q) &&
+					   mode == MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED) {
+					/* lrc */
+					struct xe_vm *migrate_vm;
+
+					migrate_vm = xe_migrate_get_vm(tile->migrate);
+					if (migrate_vm != READ_ONCE(bo->q)->vm)
+						do_offline = true;
+					xe_vm_put(migrate_vm);
+				} else if (bo->ttm.type == ttm_bo_type_kernel &&
+					   bo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
+					   bo->flags & XE_BO_FLAG_PAGETABLE &&
+					   mode == MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED) {
+					/* ppgtt */
+					do_offline = true;
+				} else if (bo->ttm.type == ttm_bo_type_kernel &&
+					   !(bo->flags & XE_BO_FLAG_FORCE_USER_VRAM) &&
+					   mode == MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED) {
+					do_offline = true;
+				}
+			}
+		}
+		if (do_offline) {
+			/* Report fault — convert relative to DPA */
+			ret = xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
+			if (ret) {
+				if ((ret == -EIO) &&
+				    mode == MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED) {
+					addr += SZ_4K;
+					continue;
+				}
+				break;
+			}
+			/* Verify page is now reserved */
+			scoped_guard(mutex, &vram_mgr->lock) {
+				block = gpu_buddy_allocated_addr_to_block(mm, addr);
+				if (!block || PTR_ERR(block) == -ENXIO || block->private)
+					ret = -EBUSY;
+			}
+			break;
+		}
+		addr += SZ_4K;
+	}
+	if (!do_offline)
+		drm_warn(&xe->drm, "no such object, ret:%d\n", ret);
+
+	return ret;
+}
+
+static ssize_t addr_fault_reporting_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	int ret = 0;
+	u64 mode;
+
+	ret = kstrtou64_from_user(ubuf, size, 0, &mode);
+	if (ret)
+		return ret;
+
+	switch (mode) {
+	case MEMPAGE_OFFLINE_UNALLOCATED:
+	case MEMPAGE_OFFLINE_USER_ALLOCATED:
+	case MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED:
+	case MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED:
+	case MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED:
+		ret = mempage_exec_offline(xe, mode);
+		break;
+	case MEMPAGE_OFFLINE_RESERVED: {
+		u64 stolen_base;
+
+		stolen_base = xe_ttm_stolen_gpu_offset(xe);
+		if (!stolen_base) {
+			ret = -ENODEV;
+			break;
+		}
+		ret = xe_ttm_vram_handle_addr_fault(xe, stolen_base);
+		break;
+	}
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	xe->mem.vram->ttm.offline_mode = mode;
+	if (!ret || (ret == -EIO &&
+		     (mode == MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED ||
+		      mode == MEMPAGE_OFFLINE_RESERVED))) {
+		drm_info(&xe->drm, "offline mode %llu passed ret:%d\n", mode, ret);
+	} else {
+		drm_warn(&xe->drm, "offline mode %llu failed, ret:%d\n", mode, ret);
+		return ret;
+	}
+
+	return size;
+}
+
+static const struct file_operations addr_fault_reporting_fops = {
+	.owner = THIS_MODULE,
+	.read = addr_fault_reporting_show,
+	.write = addr_fault_reporting_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -632,6 +790,17 @@ void xe_debugfs_register(struct xe_device *xe)
 	if (man)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		man = ttm_manager_type(bdev, XE_PL_VRAM0);
+		if (man) {
+			char name[20];
+
+			snprintf(name, sizeof(name), "invalid_addr_vram%d", 0);
+			debugfs_create_file(name, 0600, root, xe,
+					    &addr_fault_reporting_fops);
+		}
+	}
+
 	for_each_tile(tile, xe, tile_id)
 		xe_tile_debugfs_register(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 3ad7966798eb..07ed88b47e04 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
 	struct mutex lock;
 	/** @mem_type: The TTM memory type */
 	u32 mem_type;
+	/** @offline_mode: debugfs hook for setting page offline mode */
+	u64 offline_mode;
 };
 
 /**
-- 
2.52.0

