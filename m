Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F173606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZlW5jqPH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CC710E403;
	Wed, 28 Oct 2026 10:33:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0962410E403
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793183589; x=1824719589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z4Zm3ay5vFvIQTwJrCfhr/incNiYuwli00JGhFxt3Ic=;
 b=ZlW5jqPHhBebwfxA3OA877ltPeZ3A9SGdGo35CfquShsScDDewRG0SFu
 cXqkDL9tDBiKcnlXXHLs+wT2nqtxhfABilR8EagcV10W66IkarkySPlHf
 ZuVaF3hVOpAPcIFYCKckguDCx9yQgBCSrcDCHElWd9NMfbOtHF06lqKUP
 2CX+o4nzrdAtVO9rUcVaHqgS+gBoG9As5QfIGoaZ1u25ZkZ5zWAsroAHn
 UyiMu8zazu8y/ZZ26p6D9JRPEnT/KokbEAiKaOKN1V819MVuUT0TNn651
 O2nKsT8GMjpxZ61fl7hs4d9qeD5tQHGZYszV+lOQ9iGiKfGXYadSPJtjU Q==;
X-CSE-ConnectionGUID: ScCVq9+0T3q46FwK/1+eBg==
X-CSE-MsgGUID: Q+m+ZGJmSjupDDCsVJeErQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1991638"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1991638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:33:08 -0700
X-CSE-ConnectionGUID: gQtO5J8KT0mMXoHn1oK/3w==
X-CSE-MsgGUID: vKzKeY4LQJGxRa8vyGaG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5322602"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:33:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Add a per-client debugfs file reporting bo NUMA node
 distribution
Date: Wed, 28 Oct 2026 11:32:37 +0100
Message-ID: <20261028103237.70129-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When debugging NUMA placement of bo system memory, there is currently
no way to tell on which nodes the pages backing a bo reside. The
/proc/<pid>/numa_maps interface doesn't help since bo CPU mappings are
VM_PFNMAP, and clients may have thousands of bos, so a dump of all bos
is undesirable.

Add a "bo_numa" file to the drm core per-client debugfs directory,
client-<id>/. The file implements a request-response protocol per open
file: Writing a GEM handle valid for the client takes a snapshot, under
the bo's dma_resv lock, of the bo size, placement, and the number of
pages on each NUMA node. A bo whose pages are swapped out or backed
up is reported as swapped, and one whose pages are not populated as
not populated. Subsequent reads return that snapshot. Once the
snapshot has been completely read it is discarded, and a new handle
may be written. Until then writes fail with -EBUSY, so that a pending
snapshot can't be replaced before it is consumed. This allows querying
many bos using a single open file.

The write-request / read-response protocol per open file follows the
simple_transaction helpers in fs/libfs.c, used by e.g. nfsd and
selinuxfs, and amdgpu already populates the per-client debugfs
directory with its vm_pagetable_info file.

For sg bos, typically imported dma-bufs, the backing pages are owned
by the exporter and can't be inspected, so only size and placement are
reported.

Example:
  exec 3<>/sys/kernel/debug/dri/client-<id>/bo_numa
  echo <handle1> >&3
  cat <&3
  echo <handle2> >&3
  cat <&3
  exec 3>&-

The client id can be obtained from the drm-client-id fdinfo key.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_bo.c      | 109 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h      |   6 ++
 drivers/gpu/drm/xe/xe_debugfs.c | 153 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.h |   3 +
 drivers/gpu/drm/xe/xe_device.c  |   2 +
 5 files changed, 273 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 756ad0e4dcea..08ce15a59ced 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -6,12 +6,14 @@
 #include "xe_bo.h"
 
 #include <linux/dma-buf.h>
+#include <linux/nodemask.h>
 #include <linux/nospec.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -4202,6 +4204,113 @@ void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
 	list_del_init(&bo->vram_userfault_link);
 }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static void xe_bo_count_numa_pages(struct ttm_tt *tt, unsigned long *nodes)
+{
+	pgoff_t i;
+
+	for (i = 0; i < tt->num_pages; ++i)
+		nodes[page_to_nid(tt->pages[i])]++;
+}
+
+static void xe_bo_print_numa_info_locked(struct xe_bo *bo, unsigned long *nodes,
+					 struct drm_printer *p)
+{
+	struct ttm_resource *res = bo->ttm.resource;
+	struct ttm_tt *tt = bo->ttm.ttm;
+	unsigned long total = 0;
+	const char *name;
+	int nid;
+
+	xe_bo_assert_held(bo);
+
+	name = res ? xe_mem_type_to_name[res->mem_type] : NULL;
+	drm_printf(p, "size: %zu\n", xe_bo_size(bo));
+	if (name)
+		drm_printf(p, "placement: %s\n", name);
+	else if (res)
+		drm_printf(p, "placement: mem_type %u\n", res->mem_type);
+	else
+		drm_puts(p, "placement: none\n");
+
+	/* The pages of sg bos are owned by the exporter and not visible. */
+	if (bo->ttm.type == ttm_bo_type_sg) {
+		drm_puts(p, "pages: unknown (sg bo)\n");
+		return;
+	}
+
+	if (tt && ttm_tt_is_swapped(tt)) {
+		drm_puts(p, "pages: swapped\n");
+		return;
+	}
+
+	if (tt && !ttm_tt_is_populated(tt)) {
+		drm_puts(p, "pages: not populated\n");
+		return;
+	}
+
+	if (tt)
+		xe_bo_count_numa_pages(tt, nodes);
+
+	for_each_node(nid) {
+		if (!nodes[nid] && !node_online(nid))
+			continue;
+		drm_printf(p, "node%d: %lu\n", nid, nodes[nid]);
+		total += nodes[nid];
+	}
+
+	drm_printf(p, "total: %lu\n", total);
+}
+
+/**
+ * xe_bo_print_numa_info() - Print the NUMA node distribution of a bo
+ * @file: The drm_file of the client owning @handle.
+ * @handle: The GEM handle of the bo.
+ * @p: The drm_printer to print to.
+ *
+ * Print the size and placement of the bo and, for bos with
+ * driver-allocated system pages, the number of pages residing on each
+ * NUMA node. If the bo's pages are currently swapped out or backed up,
+ * the bo is reported as swapped, and if they are not populated, as not
+ * populated. For sg bos, typically imported dma-bufs, the backing pages
+ * are owned by the exporter and are reported as unknown. The information
+ * is gathered under the bo's dma_resv lock and thus represents a
+ * consistent snapshot.
+ *
+ * Return: 0 on success, -ENOENT if @handle doesn't refer to a bo,
+ * negative error code on other failures.
+ */
+int xe_bo_print_numa_info(struct drm_file *file, u32 handle,
+			  struct drm_printer *p)
+{
+	struct drm_gem_object *obj;
+	unsigned long *nodes;
+	int ret;
+
+	nodes = kcalloc(nr_node_ids, sizeof(*nodes), GFP_KERNEL_ACCOUNT);
+	if (!nodes)
+		return -ENOMEM;
+
+	obj = drm_gem_object_lookup(file, handle);
+	if (!obj) {
+		ret = -ENOENT;
+		goto out_free;
+	}
+
+	ret = dma_resv_lock_interruptible(obj->resv, NULL);
+	if (!ret) {
+		xe_bo_print_numa_info_locked(gem_to_xe_bo(obj), nodes, p);
+		dma_resv_unlock(obj->resv);
+	}
+
+	drm_gem_object_put(obj);
+out_free:
+	kfree(nodes);
+
+	return ret;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9b8e..13197e4e0358 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -112,6 +112,7 @@ enum xe_madv_purgeable_state {
 	XE_MADV_PURGEABLE_PURGED,
 };
 
+struct drm_printer;
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
@@ -458,6 +459,11 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_device *dev,
 		      struct drm_mode_create_dumb *args);
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+int xe_bo_print_numa_info(struct drm_file *file, u32 handle,
+			  struct drm_printer *p);
+#endif
+
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
 
 int xe_bo_decompress(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 926020c7526e..3f6326ad49d3 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -11,6 +11,8 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "regs/xe_pmt.h"
 #include "xe_bo.h"
@@ -845,3 +847,154 @@ void xe_debugfs_register(struct xe_device *xe)
 	else if (IS_SRIOV_VF(xe))
 		xe_sriov_vf_debugfs_register(xe, root);
 }
+
+/*
+ * Per-client "bo_numa" file: Report the NUMA node distribution of the
+ * system pages backing a single bo.
+ *
+ * The file implements a request-response protocol: write() takes a GEM
+ * handle, valid for the client, and takes a snapshot of the bo's page
+ * distribution under the bo's dma_resv lock. Subsequent read()s return
+ * that snapshot. Once the snapshot has been completely read, it is
+ * discarded and a new handle may be written. Until then, writes return
+ * -EBUSY, so that a pending snapshot is never replaced before it is
+ * consumed.
+ *
+ * See xe_bo_print_numa_info() for the snapshot contents.
+ */
+struct bo_numa_snapshot {
+	/* Serializes reads and writes on the open file. */
+	struct mutex lock;
+	/* The pending formatted snapshot, or NULL if none. */
+	char *buf;
+	/* Length of the formatted snapshot. */
+	size_t len;
+};
+
+static int bo_numa_open(struct inode *inode, struct file *f)
+{
+	struct bo_numa_snapshot *snap;
+
+	snap = kzalloc_obj(*snap, GFP_KERNEL_ACCOUNT);
+	if (!snap)
+		return -ENOMEM;
+
+	mutex_init(&snap->lock);
+	f->private_data = snap;
+
+	return nonseekable_open(inode, f);
+}
+
+static int bo_numa_release(struct inode *inode, struct file *f)
+{
+	struct bo_numa_snapshot *snap = f->private_data;
+
+	kvfree(snap->buf);
+	mutex_destroy(&snap->lock);
+	kfree(snap);
+
+	return 0;
+}
+
+static ssize_t bo_numa_read(struct file *f, char __user *ubuf, size_t size,
+			    loff_t *pos)
+{
+	struct bo_numa_snapshot *snap = f->private_data;
+	ssize_t ret = 0;
+
+	mutex_lock(&snap->lock);
+	if (snap->buf) {
+		ret = simple_read_from_buffer(ubuf, size, pos, snap->buf,
+					      snap->len);
+		if (*pos >= snap->len) {
+			kvfree(snap->buf);
+			snap->buf = NULL;
+		}
+	}
+	mutex_unlock(&snap->lock);
+
+	return ret;
+}
+
+static ssize_t bo_numa_write(struct file *f, const char __user *ubuf,
+			     size_t size, loff_t *pos)
+{
+	struct drm_file *file = file_inode(f)->i_private;
+	struct bo_numa_snapshot *snap = f->private_data;
+	struct drm_print_iterator iter;
+	struct drm_printer p;
+	size_t bufsize = PAGE_SIZE / 2;
+	char *buf = NULL;
+	u32 handle;
+	int ret;
+
+	ret = kstrtou32_from_user(ubuf, size, 0, &handle);
+	if (ret)
+		return ret;
+
+	ret = mutex_lock_interruptible(&snap->lock);
+	if (ret)
+		return ret;
+
+	if (snap->buf) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	/* Retry with a larger buffer until the snapshot fits. */
+	do {
+		kvfree(buf);
+		bufsize *= 2;
+		buf = kvzalloc(bufsize, GFP_KERNEL_ACCOUNT);
+		if (!buf) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
+
+		iter = (struct drm_print_iterator) {
+			.data = buf,
+			.remain = bufsize,
+		};
+		p = drm_coredump_printer(&iter);
+		ret = xe_bo_print_numa_info(file, handle, &p);
+		if (ret)
+			goto out_free;
+	} while (!iter.remain);
+
+	snap->buf = buf;
+	snap->len = bufsize - iter.remain;
+	*pos = 0;
+	buf = NULL;
+
+out_free:
+	kvfree(buf);
+out_unlock:
+	mutex_unlock(&snap->lock);
+
+	return ret ?: size;
+}
+
+static const struct file_operations bo_numa_fops = {
+	.owner = THIS_MODULE,
+	.open = bo_numa_open,
+	.release = bo_numa_release,
+	.read = bo_numa_read,
+	.write = bo_numa_write,
+};
+
+/**
+ * xe_debugfs_client_add() - Add xe-specific per-client debugfs files
+ * @file: The drm_file of the client.
+ *
+ * Populate the drm core per-client debugfs directory with xe-specific
+ * files. The files are removed by the drm core together with the
+ * directory when @file is released.
+ */
+void xe_debugfs_client_add(struct drm_file *file)
+{
+	if (IS_ERR_OR_NULL(file->debugfs_client))
+		return;
+
+	debugfs_create_file("bo_numa", 0600, file->debugfs_client, file,
+			    &bo_numa_fops);
+}
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 88d91c78036b..90effba271d9 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct drm_file;
 struct xe_device;
 
 #ifdef CONFIG_DEBUG_FS
@@ -16,12 +17,14 @@ bool xe_fault_csc_hw_error(void);
 bool xe_fault_wedge_cold_reset(void);
 bool xe_fault_mempage_offline(void);
 void xe_debugfs_register(struct xe_device *xe);
+void xe_debugfs_client_add(struct drm_file *file);
 #else
 static inline bool xe_fault_gt_reset(void) { return false; }
 static inline bool xe_fault_csc_hw_error(void) { return false; }
 static inline bool xe_fault_wedge_cold_reset(void) { return false; }
 static inline bool xe_fault_mempage_offline(void) { return false; }
 static inline void xe_debugfs_register(struct xe_device *xe) { }
+static inline void xe_debugfs_client_add(struct drm_file *file) { }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index db0b883322ef..ea5df6469a58 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -125,6 +125,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 		put_task_struct(task);
 	}
 
+	xe_debugfs_client_add(file);
+
 	return 0;
 }
 
-- 
2.56.0

