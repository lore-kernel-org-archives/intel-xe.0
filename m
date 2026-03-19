Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902F1075262
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 06:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9D210E8A7;
	Thu, 19 Mar 2026 06:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMT9DWZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC6B10E8A7
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 06:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773903244; x=1805439244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+kGIUK6gGu3BYa3a/RuQ0GRG82miHoGAu7BTLcmlAxU=;
 b=cMT9DWZe20cl6HHHtlLWfA9MBRSNa+akn4Le06vrEe8u77gA2pWjY3EY
 6RNyiLqyULFv/xHlp6viCBfnhNJIrE3ruia/PB2texOaAOrEDgvaOZfeE
 MkY8NM2SjeiTabIJtKQGIR2KGDb1kCHjfJbyLsfXlTjDikO8d2VkaU0TW
 3p7Fo2pEQt7Q21y9Bhx4FKiUexApBJciqmqs6uBy6tyPQOdTuyfThxdep
 YIckRdKmrz/CgULQ4mzhZdqavlErrKsd9Af37JWG50eEaLmAEqLNpVYes
 gbvpJFkQb3wi0gTE8ZKA8mtBCLZQYbuov8XemtPz4iWihNpQt0hPwxq4/ Q==;
X-CSE-ConnectionGUID: Jmvpmd0pQfW0ROHfb7qdLA==
X-CSE-MsgGUID: eqmf9x8MRySk1KDphHa25w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75045678"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="75045678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:54:04 -0700
X-CSE-ConnectionGUID: 3qGZPrjpSN6TMvLtWWzLOw==
X-CSE-MsgGUID: sFItFzSnTimas0uSx7rhew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="227571241"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:54:02 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V5 4/7] drm/xe/cri: Add debugfs to inject faulty vram
 address
Date: Thu, 19 Mar 2026 12:23:43 +0530
Message-ID: <20260319065340.2531231-13-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
References: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
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
        MEMPAGE_OFFLINE_KERNEL_NONCRITICAL_ALLOCATED = 2,
        MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 3,
        MEMPAGE_OFFLINE_RESERVED = 4,
};

v2:
- Add mode based automated test vs manual address feed

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 154 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 +
 2 files changed, 156 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..2c96694203fe 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -27,6 +27,8 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
+#include "xe_ttm_stolen_mgr.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
 
@@ -38,6 +40,13 @@
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
+enum mempage_offline_mode {
+	MEMPAGE_OFFLINE_UNALLOCATED = 0,
+	MEMPAGE_OFFLINE_USER_ALLOCATED = 1,
+	MEMPAGE_OFFLINE_KERNEL_NONCRITICAL_ALLOCATED = 2,
+	MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 3,
+	MEMPAGE_OFFLINE_RESERVED = 4,
+};
 
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, const char *name, struct drm_printer *p)
@@ -509,6 +518,140 @@ static const struct file_operations disable_late_binding_fops = {
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
+	struct xe_vram_region *vr = xe_device_get_root_tile(xe)->mem.vram;
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
+	addr = vr->dpa_base;
+	while (addr <= vr->dpa_base + vr->actual_physical_size) {
+		mutex_lock(&vram_mgr->lock);
+		block = gpu_buddy_addr_to_block(mm, addr);
+		if (!block && mode == MEMPAGE_OFFLINE_UNALLOCATED)
+			do_offline = true;
+		if (block && PTR_ERR(block) != -ENXIO) {
+			if (!block->private) {
+				mutex_unlock(&vram_mgr->lock);
+				addr = addr + SZ_4K;
+				do_offline = false;
+				continue;
+			}
+			tbo = block->private;
+			bo = ttm_to_xe_bo(tbo);
+			if (bo->ttm.type == ttm_bo_type_device &&
+			    bo->flags & XE_BO_FLAG_USER &&
+			    bo->flags & XE_BO_FLAG_VRAM_MASK &&
+			    /* !lrc */
+			    !(bo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) &&
+			    /* !ppgtt */
+			    !(bo->flags & XE_BO_FLAG_PAGETABLE) &&
+			      mode == MEMPAGE_OFFLINE_USER_ALLOCATED) {
+				do_offline = true;
+			} else if ((bo->ttm.type == ttm_bo_type_kernel &&
+				    bo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
+				    /* lrc */
+				    ((bo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) ||
+				     /* ppgtt */
+				      (bo->flags & XE_BO_FLAG_PAGETABLE)) &&
+				       mode == MEMPAGE_OFFLINE_KERNEL_NONCRITICAL_ALLOCATED)) {
+				do_offline = true;
+			} else if (bo->ttm.type == ttm_bo_type_kernel &&
+				   !(bo->flags & XE_BO_FLAG_FORCE_USER_VRAM) &&
+				     mode == MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED) {
+				do_offline = true;
+			}
+		}
+		if (do_offline) {
+			mutex_unlock(&vram_mgr->lock);
+			/* Report fault */
+			ret = xe_ttm_vram_handle_addr_fault(xe, addr);
+			if (ret)
+				break;
+			/* Verify addr + SZ_4K is allocated */
+			mutex_lock(&vram_mgr->lock);
+			block = gpu_buddy_addr_to_block(mm, addr);
+			if (!block || PTR_ERR(block) == -ENXIO || block->private)
+				ret = -EBUSY;
+			mutex_unlock(&vram_mgr->lock);
+			break;
+		}
+		mutex_unlock(&vram_mgr->lock);
+		addr = addr + SZ_4K;
+		if (do_offline)
+			do_offline = false;
+	}
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
+	case MEMPAGE_OFFLINE_KERNEL_NONCRITICAL_ALLOCATED:
+	case MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED:
+		ret = mempage_exec_offline(xe, mode);
+		break;
+	case MEMPAGE_OFFLINE_RESERVED:
+		u64 stolen_base;
+
+		stolen_base = xe_ttm_stolen_gpu_offset(xe);
+		ret = xe_ttm_vram_handle_addr_fault(xe, stolen_base);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	xe->mem.vram->ttm.offline_mode = mode;
+	if (!ret || (ret == -EIO &&
+		     (mode == MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED ||
+		      mode == MEMPAGE_OFFLINE_RESERVED))) {
+		drm_info(&xe->drm, "offline mode %llu passed\n", mode);
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
@@ -565,6 +708,17 @@ void xe_debugfs_register(struct xe_device *xe)
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
index 94eaf9d875f1..65245668c183 100644
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

