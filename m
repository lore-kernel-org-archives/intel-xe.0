Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08BFFEFB4D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A9210EB6F;
	Fri, 27 Feb 2026 13:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuW4NeCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEFA10EB6F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772199930; x=1803735930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XGkfy+sSaFvN47xFSJ5/gA1tMz7yXCrOOClY4PE65WA=;
 b=EuW4NeCfoPTTfS2IyKOMNSRcJawYYmY1+Z5zV1sWMvgZgayVUdbXZpwI
 2MZoVVECJVk4WB7mIZVDNuqbA+RjsBTwazseiuunppWxaMfh3VG0lPqBz
 Uy6TFVfdtDm3OjrkyUSkv3OLf4xAifbe5gydJCHE7wgEkMTEPyS2T65UW
 Glmfoaf9TvA+MLQwVfCq3FLYGOWtlrDgHDGT1Qgj6MHf84CS1JgQZ6/CG
 LuTxSgO1m5eomGXCbhaZ5lN5C178cCuNroUw3WSO96FsaYGJRUVbMLgQL
 hxW46DFfz2TaUE+Y9aZfmkXuleQh5+TzbfAkZ27yJay2cIfvc8cDd+rIH A==;
X-CSE-ConnectionGUID: sCbYXj3ERI+ZemSwpALK6g==
X-CSE-MsgGUID: wwdnsC5dQXCBiFKLTk33Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84633186"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="84633186"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:30 -0800
X-CSE-ConnectionGUID: cGOzY811TgyjVgXGzLBRvA==
X-CSE-MsgGUID: W2iXfi3ARNGZJfLE3P0lrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216021734"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:29 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V4 4/7] [DO_NOT_REVIEW]]drm/xe/cri: Add debugfs to inject
 faulty vram address
Date: Fri, 27 Feb 2026 19:14:41 +0530
Message-ID: <20260227134453.1814649-13-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
References: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
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
echo 0x1000 > /sys/kernel/debug/dri/bdf/invalid_addr_vram0
where 0x1000 is faulty adress being injected.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 49 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..2f66da81c002 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -27,6 +27,7 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
 
@@ -509,12 +510,48 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+static ssize_t addr_fault_reporting_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%lld\n", xe->mem.vram->ttm.fault_addr);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t addr_fault_reporting_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u64 addr;
+	int ret;
+
+	ret = kstrtou64_from_user(ubuf, size, 0, &addr);
+	if (ret)
+		return ret;
+
+	xe->mem.vram->ttm.fault_addr = addr;
+	xe_ttm_vram_handle_addr_fault(xe, xe->mem.vram->ttm.fault_addr);
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
 	struct drm_minor *minor = xe->drm.primary;
 	struct dentry *root = minor->debugfs_root;
 	struct ttm_resource_manager *man;
+	u8 mem_type = XE_PL_VRAM1;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 tile_id;
@@ -565,6 +602,18 @@ void xe_debugfs_register(struct xe_device *xe)
 	if (man)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
+	do {
+		man = ttm_manager_type(bdev, mem_type);
+		if (man) {
+			char name[20];
+
+			snprintf(name, sizeof(name), "invalid_addr_vram%d", mem_type - XE_PL_VRAM0);
+			debugfs_create_file(name, 0600, root, xe,
+					    &addr_fault_reporting_fops);
+		}
+		--mem_type;
+	} while (mem_type >= XE_PL_VRAM0);
+
 	for_each_tile(tile, xe, tile_id)
 		xe_tile_debugfs_register(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index e1b48db27cfd..2c69663f540a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
 	struct mutex lock;
 	/** @mem_type: The TTM memory type */
 	u32 mem_type;
+	/** @fault_addr: debugfs hook for setting faulty address */
+	u64 fault_addr;
 };
 
 /**
-- 
2.52.0

