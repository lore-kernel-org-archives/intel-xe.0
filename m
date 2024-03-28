Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC32CD1288
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 08:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BD211236F;
	Thu, 28 Mar 2024 08:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pet7BPWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A0E112369
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711615666; x=1743151666;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=75p2Ojp4uu+WOfHfOzxLRnwpv3zOmkO6r9TxYNstiRQ=;
 b=Pet7BPWAvOaR6z6fD2xo/S7uPL+0r269legDHy8KdnAyzhQpdRYPZCWV
 YWnMsu142xSPyRdUJqqePFypD3aLt3LyqHJnkcWSXkvu2YHkPv+/EBRlk
 LN7oArqyXVqNH+dxMWvojAxR8ASL1MSdBOsCh1Wdr8Vdav2/t+eZTn/e8
 o2apJnXa7EgTa33mYhFFsaxLoAQmWK7kzWTdnnU7Fh0icA3PZYAgrJl+Y
 6lFcTKXcBLSd+RiWzkczxzOET3XRW7CI7h/KjCglYb5kDDoaR4ivSPvbS
 UR5Cimx9mSR9WoX1Ua0rQ5DzS4mSrMQuHJ7r+ENaz4nY+IEge+TcETgd1 g==;
X-CSE-ConnectionGUID: QJ8uImg3R0yczBMZ+rNRfw==
X-CSE-MsgGUID: SmJgbmSZSX6IPNsvzOgeLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6613594"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6613594"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21243686"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:47:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 5/8] drm/ttm: Add a virtual base class for graphics memory
 backup
Date: Thu, 28 Mar 2024 09:47:25 +0100
Message-ID: <20240328084728.262874-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240328084728.262874-1-thomas.hellstrom@linux.intel.com>
References: <20240328084728.262874-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 122 +++++++++++++++++++++++++
 include/drm/ttm/ttm_backup.h           |  48 ++++++++++
 3 files changed, 171 insertions(+), 1 deletion(-)
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
index 000000000000..e3596dee17d7
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/ttm/ttm_backup.h>
+#include <linux/page-flags.h>
+
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
index 000000000000..1ba80fe0cbcf
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,48 @@
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
+static inline struct page *
+ttm_backup_handle_to_page_ptr(unsigned long handle)
+{
+	return (struct page *)(handle << 1 | 1);
+}
+
+static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
+{
+	return (unsigned long)page & 1;
+}
+
+static inline unsigned long
+ttm_backup_page_ptr_to_handle(const struct page *page)
+{
+	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
+	return (unsigned long)page >> 1;
+}
+
+struct ttm_backup_ops {
+	void (*drop)(struct ttm_backup *backup, unsigned long handle);
+	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
+				   unsigned long handle, bool intr);
+	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
+				     bool writeback, pgoff_t i, gfp_t page_gfp,
+				     gfp_t alloc_gfp);
+	void (*fini)(struct ttm_backup *backup);
+};
+
+struct ttm_backup {
+	const struct ttm_backup_ops *ops;
+};
+
+struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+
+#endif
-- 
2.44.0

