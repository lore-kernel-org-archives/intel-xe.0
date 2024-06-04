Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006FFC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 14:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C08410E4A9;
	Tue,  4 Jun 2024 14:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7FLQM+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FE010E4AF
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717512437; x=1749048437;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4LxpPN8VbzxoLLGRee8idTVA6cFjw1E/SGpjJRdHaE4=;
 b=G7FLQM+LFi8u38wjnHcopWCUV8ItRChMMvyMZUCz2m+El6rOwB8M7xid
 Mi7YbKIXhypXqbjg4ArAMZsciLQ2uDOMOVkvkHl0yBRla0e085BZkB5ng
 Fn8ivFTKACvgSBE0/NBmn2quysST/7XP97VIbNVG/niQ6xP5u3G8TbNYj
 RQOLMucXWgCC8zIpjZSc/XSbcgtr7VmzKTxbfyhqicKGCmCz6+XIkuOyM
 jUqSYGu7ZSgYR+DW7DodLIgzKh9MKNo6oN8Pl1SOc+F12ssBW+GcCTGVb
 w01435S9CgKCdw/fYmps7hAatb8apmPjpsf7IGLTN2+Q52nsM9/vwhMjW A==;
X-CSE-ConnectionGUID: TtJxkfsfS6+k17azW/VLkQ==
X-CSE-MsgGUID: ugnnuWxoTdeZUlaJ/wZ8NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25464254"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="25464254"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 07:47:17 -0700
X-CSE-ConnectionGUID: oGlfqTPtTmqG6F3l9AMNRg==
X-CSE-MsgGUID: 5XRaBKV8TyChUmuZZKr9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="37321298"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.236])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 07:47:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 08/11] drm/ttm: Add a virtual base class for graphics memory
 backup
Date: Tue,  4 Jun 2024 16:46:45 +0200
Message-ID: <20240604144658.69890-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240604144658.69890-1-thomas.hellstrom@linux.intel.com>
References: <20240604144658.69890-1-thomas.hellstrom@linux.intel.com>
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

Initially intended for experimenting with different backup
solutions (shmem vs direct swap cache insertion), abstract
the backup destination using a virtual base class.

Also provide a sample implementation for shmem.

While when settling on a preferred backup solution, one could
perhaps skip the abstraction, this functionality may actually
come in handy for configurable dedicated graphics memory
backup to fast nvme files or similar, whithout affecting
swap-space. Could indeed be useful for VRAM backup on S4 and
other cases.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 +++++++++++++++++++++++++
 include/drm/ttm/ttm_backup.h           | 136 ++++++++++++++++++++++++
 3 files changed, 274 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 include/drm/ttm/ttm_backup.h

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..5e980dd90e41 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -4,7 +4,7 @@
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
 	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
new file mode 100644
index 000000000000..79c2f552863a
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/ttm/ttm_backup.h>
+#include <linux/page-flags.h>
+
+/**
+ * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
+ * @backup: The base struct ttm_backup
+ * @filp: The associated shmem object
+ */
+struct ttm_backup_shmem {
+	struct ttm_backup backup;
+	struct file *filp;
+};
+
+static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup *backup)
+{
+	return container_of(backup, struct ttm_backup_shmem, backup);
+}
+
+static void ttm_backup_shmem_drop(struct ttm_backup *backup, unsigned long handle)
+{
+	handle -= 1;
+	shmem_truncate_range(file_inode(to_backup_shmem(backup)->filp), handle,
+			     handle + 1);
+}
+
+static int ttm_backup_shmem_copy_page(struct ttm_backup *backup, struct page *dst,
+				      unsigned long handle, bool killable)
+{
+	struct file *filp = to_backup_shmem(backup)->filp;
+	struct address_space *mapping = filp->f_mapping;
+	struct folio *from_folio;
+
+	handle -= 1;
+	from_folio = shmem_read_folio(mapping, handle);
+	if (IS_ERR(from_folio))
+		return PTR_ERR(from_folio);
+
+	/* Note: Use drm_memcpy_from_wc? */
+	copy_highpage(dst, folio_file_page(from_folio, handle));
+	folio_put(from_folio);
+
+	return 0;
+}
+
+static unsigned long
+ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct page *page,
+			     bool writeback, pgoff_t i, gfp_t page_gfp,
+			     gfp_t alloc_gfp)
+{
+	struct file *filp = to_backup_shmem(backup)->filp;
+	struct address_space *mapping = filp->f_mapping;
+	unsigned long handle = 0;
+	struct folio *to_folio;
+	int ret;
+
+	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
+	if (IS_ERR(to_folio))
+		return handle;
+
+	folio_mark_accessed(to_folio);
+	folio_lock(to_folio);
+	folio_mark_dirty(to_folio);
+	copy_highpage(folio_file_page(to_folio, i), page);
+	handle = i + 1;
+
+	if (writeback && !folio_mapped(to_folio) && folio_clear_dirty_for_io(to_folio)) {
+		struct writeback_control wbc = {
+			.sync_mode = WB_SYNC_NONE,
+			.nr_to_write = SWAP_CLUSTER_MAX,
+			.range_start = 0,
+			.range_end = LLONG_MAX,
+			.for_reclaim = 1,
+		};
+		folio_set_reclaim(to_folio);
+		ret = mapping->a_ops->writepage(folio_page(to_folio, 0), &wbc);
+		if (!folio_test_writeback(to_folio))
+			folio_clear_reclaim(to_folio);
+		/* If writepage succeeds, it unlocks the folio */
+		if (ret)
+			folio_unlock(to_folio);
+	} else {
+		folio_unlock(to_folio);
+	}
+
+	folio_put(to_folio);
+
+	return handle;
+}
+
+static void ttm_backup_shmem_fini(struct ttm_backup *backup)
+{
+	struct ttm_backup_shmem *sbackup = to_backup_shmem(backup);
+
+	fput(sbackup->filp);
+	kfree(sbackup);
+}
+
+static const struct ttm_backup_ops ttm_backup_shmem_ops = {
+	.drop = ttm_backup_shmem_drop,
+	.copy_backed_up_page = ttm_backup_shmem_copy_page,
+	.backup_page = ttm_backup_shmem_backup_page,
+	.fini = ttm_backup_shmem_fini,
+};
+
+/**
+ * ttm_backup_shmem_create() - Create a shmem-based struct backup.
+ * @size: The maximum size (in bytes) to back up.
+ *
+ * Create a backup utilizing shmem objects.
+ *
+ * Return: A pointer to a struct ttm_backup on success,
+ * an error pointer on error.
+ */
+struct ttm_backup *ttm_backup_shmem_create(loff_t size)
+{
+	struct ttm_backup_shmem *sbackup =
+		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
+
+	if (!sbackup)
+		return ERR_PTR(-ENOMEM);
+
+	sbackup->filp = shmem_file_setup("ttm shmem backup", size, 0);
+	if (IS_ERR(sbackup->filp)) {
+		kfree(sbackup);
+		return ERR_CAST(sbackup->filp);
+	}
+
+	sbackup->backup.ops = &ttm_backup_shmem_ops;
+
+	return &sbackup->backup;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
new file mode 100644
index 000000000000..88e8b97a6fdc
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _TTM_BACKUP_H_
+#define _TTM_BACKUP_H_
+
+#include <linux/mm_types.h>
+#include <linux/shmem_fs.h>
+
+struct ttm_backup;
+
+/**
+ * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
+ * @handle: The handle to convert.
+ *
+ * Converts an opaque handle received from the
+ * struct ttm_backoup_ops::backup_page() function to an (invalid)
+ * struct page pointer suitable for a struct page array.
+ *
+ * Return: An (invalid) struct page pointer.
+ */
+static inline struct page *
+ttm_backup_handle_to_page_ptr(unsigned long handle)
+{
+	return (struct page *)(handle << 1 | 1);
+}
+
+/**
+ * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
+ * @page: The struct page pointer to check.
+ *
+ * Return: true if the struct page pointer is a handld returned from
+ * ttm_backup_handle_to_page_ptr(). False otherwise.
+ */
+static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
+{
+	return (unsigned long)page & 1;
+}
+
+/**
+ * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
+ * @page: The struct page pointer to convert
+ *
+ * Return: The handle that was previously used in
+ * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
+ * for use as argument in the struct ttm_backup_ops drop() or
+ * copy_backed_up_page() functions.
+ */
+static inline unsigned long
+ttm_backup_page_ptr_to_handle(const struct page *page)
+{
+	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
+	return (unsigned long)page >> 1;
+}
+
+/** struct ttm_backup_ops - A struct ttm_backup backend operations */
+struct ttm_backup_ops {
+	/**
+	 * drop - release memory associated with a handle
+	 * @backup: The struct backup pointer used to obtain the handle
+	 * @handle: The handle obtained from the @backup_page function.
+	 */
+	void (*drop)(struct ttm_backup *backup, unsigned long handle);
+
+	/**
+	 * copy_backed_up_page - Copy the contents of a previously backed
+	 * up page
+	 * @backup: The struct backup pointer used to back up the page.
+	 * @dst: The struct page to copy into.
+	 * @handle: The handle returned when the page was backed up.
+	 * @intr: Try to perform waits interruptable or at least killable.
+	 *
+	 * Return: 0 on success, Negative error code on failure, notably
+	 * -EINTR if @intr was set to true and a signal is pending.
+	 */
+	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
+				   unsigned long handle, bool intr);
+
+	/**
+	 * backup_page - Backup a page
+	 * @backup: The struct backup pointer to use.
+	 * @page: The page to back up.
+	 * @writeback: Whether to perform immediate writeback of the page.
+	 * This may have performance implications.
+	 * @i: A unique integer for each page and each struct backup.
+	 * This is a hint allowing the backup backend to avoid managing
+	 * its address space separately.
+	 * @page_gfp: The gfp value used when the page was allocated.
+	 * This is used for accounting purposes.
+	 * @alloc_gfp: The gpf to be used when the backend needs to allocaete
+	 * memory.
+	 *
+	 * Return: A handle on success. 0 on failure.
+	 * (This is following the swp_entry_t convention).
+	 *
+	 * Note: This function could be extended to back up a folio and
+	 * backends would then split the folio internally if needed.
+	 * Drawback is that the caller would then have to keep track of
+	 */
+	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
+				     bool writeback, pgoff_t i, gfp_t page_gfp,
+				     gfp_t alloc_gfp);
+	/**
+	 * fini - Free the struct backup resources after last use.
+	 * @backup: Pointer to the struct backup whose resources to free.
+	 *
+	 * After a call to @fini, it's illegal to use the @backup pointer.
+	 */
+	void (*fini)(struct ttm_backup *backup);
+};
+
+/**
+ * struct ttm_backup - Abstract a backup backend.
+ * @ops: The operations as described above.
+ *
+ * The struct ttm_backup is intended to be subclassed by the
+ * backend implementation.
+ */
+struct ttm_backup {
+	const struct ttm_backup_ops *ops;
+};
+
+/**
+ * ttm_backup_shmem_create() - Create a shmem-based struct backup.
+ * @size: The maximum size (in bytes) to back up.
+ *
+ * Create a backup utilizing shmem objects.
+ *
+ * Return: A pointer to a struct ttm_backup on success,
+ * an error pointer on error.
+ */
+struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+
+#endif
-- 
2.44.0

