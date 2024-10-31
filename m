Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D0ED767DB
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2646D10E40E;
	Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6OMb+2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D69410E40E
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730387870; x=1761923870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXO4tgYrASXVgxZKervKFzwaDXI/Z+/7gsH1A/Dpcg8=;
 b=V6OMb+2K6lg+gMbYAHYXN0hdUsvy0aupjkUc6D9fGfFvucAtdkhe+uKc
 IVjdpKHgqY0ID4Y/bjvsEUfIdlRxNeLFWjcK1H500oWbHjgtDaKLIvR5e
 +GxVzJ7gl0OM+hU9p9RekWWUYggyefN72EW6G5LsrVYjXPEre1CFMll/i
 bvFZoEsLrW9Vjfqynz0Fux0m45VCjbIzoRd6Fwck0pn0Ba5XY8NyGrsNm
 aiPjdpF31lYYyGN2sLuV0cx4eaHVREggzXWXXnw+pK2nFIRYc0/kHx5st
 xwcHKTFnRwSZApFsnYX2iztbQGegdmH89Gy5uPH1xkRpnE6DDqPrU6B0m w==;
X-CSE-ConnectionGUID: pcZrM4iRQ+OUURFlYvxHMw==
X-CSE-MsgGUID: ZvgTa+rCRVyi0lxZbbJkUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29568942"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="29568942"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:48 -0700
X-CSE-ConnectionGUID: B+Pq2kVVQRCqzaMnMP4HKA==
X-CSE-MsgGUID: 32eUaQXdQHK9OE6ZulkVMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87798956"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:47 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 4/4] drm/xe/pf: Allow to view and replace VF LMEM and CCS
 state over debugfs
Date: Thu, 31 Oct 2024 16:17:25 +0100
Message-Id: <20241031151725.28315-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241031151725.28315-1-lukasz.laguna@intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
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

For feature enabling and testing purposes, allow to save VF LMEM and CCS
state and to replace it using debugfs blob file, but only under strict
debug config.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 205 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 +
 3 files changed, 292 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 05df4ab3514b..001fc6b585ee 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -422,6 +422,76 @@ static const struct file_operations guc_state_ops = {
 	.llseek		= default_llseek,
 };
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── vf1
+ *      │   │   ├── lmem_state
+ */
+static ssize_t lmem_state_read(struct file *file, char __user *buf,
+			       size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+
+	return xe_gt_sriov_pf_migration_read_lmem_state(gt, vfid, buf, count, pos);
+}
+
+static ssize_t lmem_state_write(struct file *file, const char __user *buf,
+				size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+
+	return xe_gt_sriov_pf_migration_write_lmem_state(gt, vfid, buf, count, pos);
+}
+
+static const struct file_operations lmem_state_ops = {
+	.owner		= THIS_MODULE,
+	.read		= lmem_state_read,
+	.write		= lmem_state_write,
+	.llseek		= default_llseek,
+};
+
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── vf1
+ *      │   │   ├── ccs_state
+ */
+static ssize_t ccs_state_read(struct file *file, char __user *buf,
+			      size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+
+	return xe_gt_sriov_pf_migration_read_ccs_state(gt, vfid, buf, count, pos);
+}
+
+static ssize_t ccs_state_write(struct file *file, const char __user *buf,
+			       size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+
+	return xe_gt_sriov_pf_migration_write_ccs_state(gt, vfid, buf, count, pos);
+}
+
+static const struct file_operations ccs_state_ops = {
+	.owner		= THIS_MODULE,
+	.read		= ccs_state_read,
+	.write		= ccs_state_write,
+	.llseek		= default_llseek,
+};
+
 /*
  *      /sys/kernel/debug/dri/0/
  *      ├── gt0
@@ -554,6 +624,14 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 			debugfs_create_file("config_blob",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    vfdentry, NULL, &config_blob_ops);
+			if (IS_DGFX(xe)) {
+				debugfs_create_file("lmem_state",
+						    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
+						    0600 : 0400, vfdentry, NULL, &lmem_state_ops);
+				debugfs_create_file("ccs_state",
+						    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
+						    0600 : 0400, vfdentry, NULL, &ccs_state_ops);
+			}
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index eca01c96a348..8ff6b7eebb33 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -6,7 +6,9 @@
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_sriov_abi.h"
+#include "instructions/xe_gpu_commands.h"
 #include "xe_bo.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
@@ -381,6 +383,209 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 
 	return ret;
 }
+
+static ssize_t pf_read_lmem_state(struct xe_gt *gt, unsigned int vfid, bool ccs,
+				  char __user *buf, size_t count, loff_t *pos)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	size_t lmem_size, chunk_size;
+	struct xe_bo *smem_bo;
+	struct dma_fence *fence;
+	loff_t smem_bo_pos = 0;
+	ssize_t ret;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	if (!pf_migration_supported(gt))
+		return -ENOPKG;
+
+	lmem_size = xe_gt_sriov_pf_config_get_lmem(gt, vfid);
+	if (!lmem_size)
+		return -ENODATA;
+
+	chunk_size = min(count, (ccs ? xe_device_ccs_bytes(xe, lmem_size) : lmem_size) - *pos);
+	if (!chunk_size)
+		return 0;
+
+	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(chunk_size), ttm_bo_type_kernel,
+				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				      XE_BO_FLAG_PINNED);
+	if (IS_ERR(smem_bo))
+		return PTR_ERR(smem_bo);
+
+	if (ccs)
+		fence = xe_gt_sriov_pf_migration_save_lmem(gt, vfid, NULL, 0, smem_bo, 0,
+							   *pos * NUM_BYTES_PER_CCS_BYTE(xe),
+							   chunk_size * NUM_BYTES_PER_CCS_BYTE(xe));
+	else
+		fence = xe_gt_sriov_pf_migration_save_lmem(gt, vfid, smem_bo, 0, NULL, 0, *pos,
+							   chunk_size);
+
+	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto err_smem_bo_put;
+	}
+
+	ret = simple_read_from_buffer(buf, chunk_size, &smem_bo_pos, smem_bo->vmap.vaddr,
+				      chunk_size);
+	if (ret > 0) {
+		if (ret != chunk_size)
+			xe_gt_sriov_dbg(gt, "Failed to copy the entire chunk (copied bytes: %ld, expected: %lu)\n",
+				ret, chunk_size);
+		*pos +=	ret;
+	}
+
+err_smem_bo_put:
+	xe_bo_unpin_map_no_vm(smem_bo);
+
+	return ret;
+}
+
+static ssize_t pf_write_lmem_state(struct xe_gt *gt, unsigned int vfid, bool ccs,
+				   const char __user *buf, size_t count, loff_t *pos)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_bo *smem_bo;
+	loff_t smem_bo_pos = 0;
+	struct dma_fence *fence;
+	ssize_t ret, err;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	if (!pf_migration_supported(gt))
+		return -ENOPKG;
+
+	if (!xe_gt_sriov_pf_config_get_lmem(gt, vfid))
+		return -ENOPKG;
+
+	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(count), ttm_bo_type_kernel,
+				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				      XE_BO_FLAG_PINNED);
+	if (IS_ERR(smem_bo))
+		return PTR_ERR(smem_bo);
+
+	ret = simple_write_to_buffer(smem_bo->vmap.vaddr, count, &smem_bo_pos, buf, count);
+	if (ret < 0)
+		goto err_smem_bo_put;
+	if (ret != count)
+		xe_gt_sriov_dbg(gt, "Failed to copy the entire chunk (copied bytes: %ld, expected: %lu)\n",
+				ret, count);
+
+	if (ccs)
+		fence = xe_gt_sriov_pf_migration_restore_lmem(gt, vfid, NULL, 0, smem_bo, 0,
+							      *pos * NUM_BYTES_PER_CCS_BYTE(xe),
+							      ret * NUM_BYTES_PER_CCS_BYTE(xe));
+	else
+		fence = xe_gt_sriov_pf_migration_restore_lmem(gt, vfid, smem_bo, 0, NULL, 0, *pos,
+							      ret);
+
+	err = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	dma_fence_put(fence);
+	if (!err) {
+		ret = -ETIME;
+		goto err_smem_bo_put;
+	}
+
+	*pos +=	ret;
+
+err_smem_bo_put:
+	xe_bo_unpin_map_no_vm(smem_bo);
+
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_read_lmem_state() - Read a VF LMEM state.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @buf: the user space buffer to read to
+ * @count: the maximum number of bytes to read
+ * @pos: the current position in the buffer
+ *
+ * This function is for PF only.
+ *
+ * This function reads up to @count bytes from assigned to VF LMEM buffer
+ * object at offset @pos into the user space address starting at @buf.
+ *
+ * Return: the number of bytes read or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_read_lmem_state(struct xe_gt *gt, unsigned int vfid,
+						 char __user *buf, size_t count, loff_t *pos)
+{
+	return pf_read_lmem_state(gt, vfid, false, buf, count, pos);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_write_lmem_state() - Write a VF LMEM state.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @buf: the user space buffer with VF LMEM state
+ * @count: the maximum number of bytes to write (in bytes)
+ * @pos: the current position in the buffer
+ *
+ * This function is for PF only.
+ *
+ * This function reads @count bytes of the VF LMEM state stored at offset @pos
+ * of the user space buffer @buf and writes it into a assigned to VF LMEM buffer
+ * object.
+ *
+ * Return: the number of bytes used or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_write_lmem_state(struct xe_gt *gt, unsigned int vfid,
+						  const char __user *buf, size_t count,
+						  loff_t *pos)
+{
+	return pf_write_lmem_state(gt, vfid, false, buf, count, pos);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_read_ccs_state() - Read a VF CCS state.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @buf: the user space buffer to read to
+ * @count: the maximum number of bytes to read
+ * @pos: the current position in the buffer
+ *
+ * This function is for PF only.
+ *
+ * This function reads up to @count bytes of the VF CCS data at offset @pos
+ * into the user space address starting at @buf.
+ *
+ * Return: the number of bytes read or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_read_ccs_state(struct xe_gt *gt, unsigned int vfid,
+						char __user *buf, size_t count, loff_t *pos)
+{
+	return pf_read_lmem_state(gt, vfid, true, buf, count, pos);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_write_ccs_state() - Write a VF CCS state.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @buf: the user space buffer with VF CCS state
+ * @count: the maximum number of bytes to write (in bytes)
+ * @pos: the current position in the buffer
+ *
+ * This function is for PF only.
+ *
+ * This function reads @count bytes of the VF CCS state from the user space
+ * address @buf at offset @pos and writes it into a device memory where VF CCS
+ * is stored.
+ *
+ * Return: the number of bytes used or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_write_ccs_state(struct xe_gt *gt, unsigned int vfid,
+						 const char __user *buf, size_t count, loff_t *pos)
+{
+	return pf_write_lmem_state(gt, vfid, true, buf, count, pos);
+}
 #endif /* CONFIG_DEBUG_FS */
 
 static struct dma_fence *pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index a4301574d92c..da1b067baf56 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -28,6 +28,15 @@ ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int v
 						char __user *buf, size_t count, loff_t *pos);
 ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
 						 const char __user *buf, size_t count);
+ssize_t xe_gt_sriov_pf_migration_read_lmem_state(struct xe_gt *gt, unsigned int vfid,
+						 char __user *buf, size_t count, loff_t *pos);
+ssize_t xe_gt_sriov_pf_migration_write_lmem_state(struct xe_gt *gt, unsigned int vfid,
+						  const char __user *buf, size_t count,
+						  loff_t *pos);
+ssize_t xe_gt_sriov_pf_migration_read_ccs_state(struct xe_gt *gt, unsigned int vfid,
+						char __user *buf, size_t count, loff_t *pos);
+ssize_t xe_gt_sriov_pf_migration_write_ccs_state(struct xe_gt *gt, unsigned int vfid,
+						 const char __user *buf, size_t count, loff_t *pos);
 #endif
 
 #endif
-- 
2.40.0

