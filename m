Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F39EC19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 10:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334A110E71D;
	Wed,  5 Mar 2025 10:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghu5sQ78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EFD10E71D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741169444; x=1772705444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l5ZpTyUQnQejXtn4X0Fezcm/jyoPvbEpQGBLsrHdZHY=;
 b=ghu5sQ78HIYldHdiBiYysWMFxNTI9r+xvcmrI9FSvNOtU2edqoDeaytS
 L2/hhX6PITGt+nzc6WqLqV20LejfOrUsh8/2xOEajpSTAWy4plAQVDyb6
 I+9blp2Wd+lZvy4/o5qQXbUn1yShugMtuUR3N2CRwp9LoJ7jY7WJdFa38
 TDCya9oczJ7LR+GLpiqCrZPd4V2kPtMPpHZGgN0bYLOe9haPXEzUyerSC
 PHXOr1attNNpZ2VXXiG6XOh7x3jBNqmdWqvE3YxEQmWYXT/YO2638ZuhC
 MfHvIh4ODv8K4fDrGWP7hBJrYOoABzeRyOKfZeyJ3eeqR0cdW1BHBwqKP A==;
X-CSE-ConnectionGUID: V3El9Q3RSsiVCSOq/lICow==
X-CSE-MsgGUID: KjGHu98MR6KXIUJLHiAjjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59669152"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="59669152"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:10:43 -0800
X-CSE-ConnectionGUID: twZrGpRsShGP4HqWRlM+8A==
X-CSE-MsgGUID: J7WaRgYiQPadaQZRJkFaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123744884"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.45])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:10:41 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI] drm/xe: The xe bo shrinker series for testing
Date: Wed,  5 Mar 2025 11:10:23 +0100
Message-ID: <20250305101023.251956-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Squashed commit of the following:

commit f66aa63eb0986ac486d052388c06d0347915efa7
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 14 12:04:37 2024 +0200

    drm/xe: Increase the XE_PL_TT watermark

    The XE_PL_TT watermark was set to 50% of system memory.
    The idea behind that was unclear since the net effect is that
    TT memory will be evicted to TTM_PL_SYSTEM memory if that
    watermark is exceeded, requiring PPGTT rebinds and dma
    remapping. But there is no similar watermark for TTM_PL_1SYSTEM
    memory.

    The TTM functionality that tries to swap out system memory to
    shmem objects if a 50% limit of total system memory is reached
    is orthogonal to this, and with the shrinker added, it's no
    longer in effect.

    Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
    allowing all graphics memory to be bound to the device unless it
    has been swapped out by the shrinker.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit a0e423641ef481d289d75b384e3ced5afff3bc85
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 27 15:36:02 2024 +0100

    drm/xe: Add a shrinker for xe bos

    Rather than relying on the TTM watermark accounting add a shrinker
    for xe_bos in TT or system memory.

    Leverage the newly added TTM per-page shrinking and shmem backup
    support.

    Although xe doesn't fully support WONTNEED (purgeable) bos yet,
    introduce and add shrinker support for purgeable ttm_tts.

    v2:
    - Cleanups bugfixes and a KUNIT shrinker test.
    - Add writeback support, and activate if kswapd.
    v3:
    - Move the try_shrink() helper to core TTM.
    - Minor cleanups.
    v4:
    - Add runtime pm for the shrinker. Shrinking may require an active
      device for CCS metadata copying.
    v5:
    - Separately purge ghost- and zombie objects in the shrinker.
    - Fix a format specifier - type inconsistency. (Kernel test robot).
    v7:
    - s/long/s64/ (Christian König)
    - s/sofar/progress/ (Matt Brost)
    v8:
    - Rebase on Xe KUNIT update.
    - Add content verifying to the shrinker kunit test.
    - Split out TTM changes to a separate patch.
    - Get rid of multiple bool arguments for clarity (Matt Brost)
    - Avoid an error pointer dereference (Matt Brost)
    - Avoid an integer overflow (Matt Auld)
    - Address misc review comments by Matt Brost.
    v9:
    - Fix a compliation error.
    - Rebase.
    v10:
    - Update to new LRU walk interface.
    - Rework ghost-, zombie and purged object shrinking.
    - Rebase.
    v11:
    - Use additional TTM helpers.
    - Honor __GFP_FS and __GFP_IO
    - Rebase.
    v13:
    - Use ttm_tt_setup_backup().
    v14:
    - Don't set up backup on imported bos.
    v15:
    - Rebase on backup interface changes.

    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 568012e3af6e5165907f2ca96780832a244b56cf
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Aug 14 16:16:56 2024 +0200

    drm/ttm: Add helpers for shrinking

    Add a number of helpers for shrinking that access core TTM and
    core MM functionality in a way that make them unsuitable for
    driver open-coding.

    v11:
    - New patch (split off from previous) and additional helpers.
    v13:
    - Adapt to ttm_backup interface change.
    - Take resource off LRU when backed up.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Dave Airlie <airlied@redhat.com>
    Christian König <christian.koenig@amd.com>

commit 900a272a1e8ed00d3180d044feeff03942ad16c7
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Aug 14 16:16:56 2024 +0200

    drm/ttm: Add a macro to perform LRU iteration

    Following the design direction communicated here:

    https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

    Export a LRU walker for driver shrinker use. The walker
    initially supports only trylocking, since that's the
    method used by shrinkes. The walker makes use of
    scoped_guard() to allow exiting from the LRU walk loop
    without performing any explicit unlocking or
    cleanup.

    v8:
    - Split out from another patch.
    - Use a struct for bool arguments to increase readability (Matt Brost).
    - Unmap user-space cpu-mappings before shrinking pages.
    - Explain non-fatal error codes (Matt Brost)

    v10:
    - Instead of using the existing helper, Wrap the interface inside out and
      provide a loop to de-midlayer things the LRU iteration (Christian König).
    - Removing the R-B by Matt Brost since the patch was significantly changed.

    v11:
    - Split the patch up to include just the LRU walk helper.

    v12:
    - Indent after scoped_guard() (Matt Brost)

    v15:
    - Adapt to new definition of scoped_guard()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Dave Airlie <airlied@redhat.com>
    Acked-by: Christian König <christian.koenig@amd.com>

commit 059c7ebd2f650745c4e85cf8c36eb3e9012ddcc1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Feb 7 08:45:46 2023 +0100

    drm/ttm: Use fault-injection to test error paths

    Use fault-injection to test partial TTM swapout and interrupted swapin.
    Return -EINTR for swapin to test the callers ability to handle and
    restart the swapin, and on swapout perform a partial swapout to test that
    the swapin and release_shrunken functionality.

    v8:
    - Use the core fault-injection system.
    v9:
    - Fix compliation failure for !CONFIG_FAULT_INJECTION

    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>

commit 1ab97490a8179ff07180215730bc07221a6dec0d
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Feb 6 15:25:18 2023 +0100

    drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages

    Provide a helper to shrink ttm_tt page-vectors on a per-page
    basis. A ttm_backup backend could then in theory get away with
    allocating a single temporary page for each struct ttm_tt.

    This is accomplished by splitting larger pages before trying to
    back them up.

    In the future we could allow ttm_backup to handle backing up
    large pages as well, but currently there's no benefit in
    doing that, since the shmem backup backend would have to
    split those anyway to avoid allocating too much temporary
    memory, and if the backend instead inserts pages into the
    swap-cache, those are split on reclaim by the core.

    Due to potential backup- and recover errors, allow partially swapped
    out struct ttm_tt's, although mark them as swapped out stopping them
    from being swapped out a second time. More details in the ttm_pool.c
    DOC section.

    v2:
    - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
    - s/back_up/backup/
    - Add a writeback parameter to the exported interface.
    v8:
    - Use a struct for flags for readability (Matt Brost)
    - Address misc other review comments (Matt Brost)
    v9:
    - Update the kerneldoc for the ttm_tt::backup field.
    v10:
    - Rebase.
    v13:
    - Rebase on ttm_backup interface change. Update kerneldoc.
    - Rebase and adjust ttm_tt_is_swapped().
    v15:
    - Rebase on ttm_backup return value change.
    - Rebase on previous restructuring of ttm_pool_alloc()
    - Rework the ttm_pool backup interface (Christian König)
    - Remove cond_resched() (Christian König)
    - Get rid of the need to allocate an intermediate page array
      when restoring a multi-order page (Christian König)
    - Update documentation.

    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Christian Koenig <christian.koenig@amd.com>

commit fd15b5272034bef255b084e51a935a937c759337
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 27 12:18:08 2024 +0100

    drm/ttm: Provide a shmem backup implementation

    Provide a standalone shmem backup implementation.
    Given the ttm_backup interface, this could
    later on be extended to providing other backup
    implementation than shmem, with one use-case being
    GPU swapout to a user-provided fd.

    v5:
    - Fix a UAF. (kernel test robot, Dan Carptenter)
    v6:
    - Rename ttm_backup_shmem_copy_page() function argument
      (Matthew Brost)
    - Add some missing documentation
    v8:
    - Use folio_file_page to get to the page we want to writeback
      instead of using the first page of the folio.
    v13:
    - Remove the base class abstraction (Christian König)
    - Include ttm_backup_bytes_avail().
    v14:
    - Fix kerneldoc for ttm_backup_bytes_avail() (0-day)
    - Work around casting of __randomize_layout struct pointer (0-day)
    v15:
    - Return negative error code from ttm_backup_backup_page()
      (Christian König)
    - Doc fixes. (Christian König).

    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/Makefile         |   2 +-
 drivers/gpu/drm/ttm/ttm_backup.c     | 207 ++++++++++
 drivers/gpu/drm/ttm/ttm_bo_util.c    | 247 +++++++++++-
 drivers/gpu/drm/ttm/ttm_pool.c       | 577 ++++++++++++++++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c         |  83 ++++
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c     |   6 +-
 drivers/gpu/drm/xe/xe_bo.c           | 202 +++++++++-
 drivers/gpu/drm/xe/xe_bo.h           |  36 ++
 drivers/gpu/drm/xe/xe_device.c       |   8 +
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c     | 258 ++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h     |  18 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  |   3 +-
 include/drm/ttm/ttm_backup.h         |  74 ++++
 include/drm/ttm/ttm_bo.h             |  93 +++++
 include/drm/ttm/ttm_pool.h           |   8 +
 include/drm/ttm/ttm_tt.h             |  69 +++-
 18 files changed, 1814 insertions(+), 80 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..40d07a35293a 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -4,7 +4,7 @@
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
 	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_device.o ttm_sys_manager.o ttm_backup.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
new file mode 100644
index 000000000000..93c007f18855
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/ttm/ttm_backup.h>
+#include <linux/page-flags.h>
+#include <linux/swap.h>
+
+/*
+ * Casting from randomized struct file * to struct ttm_backup * is fine since
+ * struct ttm_backup is never defined nor dereferenced.
+ */
+static struct file *ttm_backup_to_file(struct ttm_backup *backup)
+{
+	return (void *)backup;
+}
+
+static struct ttm_backup *ttm_file_to_backup(struct file *file)
+{
+	return (void *)file;
+}
+
+/*
+ * Need to map shmem indices to handle since a handle value
+ * of 0 means error, following the swp_entry_t convention.
+ */
+static unsigned long ttm_backup_shmem_idx_to_handle(pgoff_t idx)
+{
+	return (unsigned long)idx + 1;
+}
+
+static pgoff_t ttm_backup_handle_to_shmem_idx(pgoff_t handle)
+{
+	return handle - 1;
+}
+
+/**
+ * ttm_backup_drop() - release memory associated with a handle
+ * @backup: The struct backup pointer used to obtain the handle
+ * @handle: The handle obtained from the @backup_page function.
+ */
+void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
+{
+	loff_t start = ttm_backup_handle_to_shmem_idx(handle);
+
+	start <<= PAGE_SHIFT;
+	shmem_truncate_range(file_inode(ttm_backup_to_file(backup)), start,
+			     start + PAGE_SIZE - 1);
+}
+
+/**
+ * ttm_backup_copy_page() - Copy the contents of a previously backed
+ * up page
+ * @backup: The struct backup pointer used to back up the page.
+ * @dst: The struct page to copy into.
+ * @handle: The handle returned when the page was backed up.
+ * @intr: Try to perform waits interruptable or at least killable.
+ *
+ * Return: 0 on success, Negative error code on failure, notably
+ * -EINTR if @intr was set to true and a signal is pending.
+ */
+int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
+			 pgoff_t handle, bool intr)
+{
+	struct file *filp = ttm_backup_to_file(backup);
+	struct address_space *mapping = filp->f_mapping;
+	struct folio *from_folio;
+	pgoff_t idx = ttm_backup_handle_to_shmem_idx(handle);
+
+	from_folio = shmem_read_folio(mapping, idx);
+	if (IS_ERR(from_folio))
+		return PTR_ERR(from_folio);
+
+	copy_highpage(dst, folio_file_page(from_folio, idx));
+	folio_put(from_folio);
+
+	return 0;
+}
+
+/**
+ * ttm_backup_backup_page() - Backup a page
+ * @backup: The struct backup pointer to use.
+ * @page: The page to back up.
+ * @writeback: Whether to perform immediate writeback of the page.
+ * This may have performance implications.
+ * @idx: A unique integer for each page and each struct backup.
+ * This allows the backup implementation to avoid managing
+ * its address space separately.
+ * @page_gfp: The gfp value used when the page was allocated.
+ * This is used for accounting purposes.
+ * @alloc_gfp: The gfp to be used when allocating memory.
+ *
+ * Context: If called from reclaim context, the caller needs to
+ * assert that the shrinker gfp has __GFP_FS set, to avoid
+ * deadlocking on lock_page(). If @writeback is set to true and
+ * called from reclaim context, the caller also needs to assert
+ * that the shrinker gfp has __GFP_IO set, since without it,
+ * we're not allowed to start backup IO.
+ *
+ * Return: A handle on success. Negative error code on failure.
+ *
+ * Note: This function could be extended to back up a folio and
+ * implementations would then split the folio internally if needed.
+ * Drawback is that the caller would then have to keep track of
+ * the folio size- and usage.
+ */
+s64
+ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
+		       bool writeback, pgoff_t idx, gfp_t page_gfp,
+		       gfp_t alloc_gfp)
+{
+	struct file *filp = ttm_backup_to_file(backup);
+	struct address_space *mapping = filp->f_mapping;
+	unsigned long handle = 0;
+	struct folio *to_folio;
+	int ret;
+
+	to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
+	if (IS_ERR(to_folio))
+		return PTR_ERR(to_folio);
+
+	folio_mark_accessed(to_folio);
+	folio_lock(to_folio);
+	folio_mark_dirty(to_folio);
+	copy_highpage(folio_file_page(to_folio, idx), page);
+	handle = ttm_backup_shmem_idx_to_handle(idx);
+
+	if (writeback && !folio_mapped(to_folio) &&
+	    folio_clear_dirty_for_io(to_folio)) {
+		struct writeback_control wbc = {
+			.sync_mode = WB_SYNC_NONE,
+			.nr_to_write = SWAP_CLUSTER_MAX,
+			.range_start = 0,
+			.range_end = LLONG_MAX,
+			.for_reclaim = 1,
+		};
+		folio_set_reclaim(to_folio);
+		ret = mapping->a_ops->writepage(folio_file_page(to_folio, idx), &wbc);
+		if (!folio_test_writeback(to_folio))
+			folio_clear_reclaim(to_folio);
+		/*
+		 * If writepage succeeds, it unlocks the folio.
+		 * writepage() errors are otherwise dropped, since writepage()
+		 * is only best effort here.
+		 */
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
+/**
+ * ttm_backup_fini() - Free the struct backup resources after last use.
+ * @backup: Pointer to the struct backup whose resources to free.
+ *
+ * After a call to this function, it's illegal to use the @backup pointer.
+ */
+void ttm_backup_fini(struct ttm_backup *backup)
+{
+	fput(ttm_backup_to_file(backup));
+}
+
+/**
+ * ttm_backup_bytes_avail() - Report the approximate number of bytes of backup space
+ * left for backup.
+ *
+ * This function is intended also for driver use to indicate whether a
+ * backup attempt is meaningful.
+ *
+ * Return: An approximate size of backup space available.
+ */
+u64 ttm_backup_bytes_avail(void)
+{
+	/*
+	 * The idea behind backing up to shmem is that shmem objects may
+	 * eventually be swapped out. So no point swapping out if there
+	 * is no or low swap-space available. But the accuracy of this
+	 * number also depends on shmem actually swapping out backed-up
+	 * shmem objects without too much buffering.
+	 */
+	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
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
+	struct file *filp;
+
+	filp = shmem_file_setup("ttm shmem backup", size, 0);
+
+	return ttm_file_to_backup(filp);
+}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 917096bd5f68..15cab9bda17f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -28,7 +28,7 @@
 /*
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
-
+#include <linux/swap.h>
 #include <linux/vmalloc.h>
 
 #include <drm/ttm/ttm_bo.h>
@@ -769,12 +769,10 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	return ret;
 }
 
-static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
+static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
 				 struct ttm_buffer_object *bo,
 				 bool *needs_unlock)
 {
-	struct ttm_operation_ctx *ctx = walk->ctx;
-
 	*needs_unlock = false;
 
 	if (dma_resv_trylock(bo->base.resv)) {
@@ -877,7 +875,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		 * since if we do it the other way around, and the trylock fails,
 		 * we need to drop the lru lock to put the bo.
 		 */
-		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+		if (ttm_lru_walk_trylock(walk->ctx, bo, &bo_needs_unlock))
 			bo_locked = true;
 		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
 			 walk->trylock_only)
@@ -920,3 +918,242 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+EXPORT_SYMBOL(ttm_lru_walk_for_evict);
+
+static void ttm_bo_lru_cursor_cleanup_bo(struct ttm_bo_lru_cursor *curs)
+{
+	struct ttm_buffer_object *bo = curs->bo;
+
+	if (bo) {
+		if (curs->needs_unlock)
+			dma_resv_unlock(bo->base.resv);
+		ttm_bo_put(bo);
+		curs->bo = NULL;
+	}
+}
+
+/**
+ * ttm_bo_lru_cursor_fini() - Stop using a struct ttm_bo_lru_cursor
+ * and clean up any iteration it was used for.
+ * @curs: The cursor.
+ */
+void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+
+	ttm_bo_lru_cursor_cleanup_bo(curs);
+	spin_lock(lru_lock);
+	ttm_resource_cursor_fini(&curs->res_curs);
+	spin_unlock(lru_lock);
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
+
+/**
+ * ttm_bo_lru_cursor_init() - Initialize a struct ttm_bo_lru_cursor
+ * @curs: The ttm_bo_lru_cursor to initialize.
+ * @man: The ttm resource_manager whose LRU lists to iterate over.
+ * @ctx: The ttm_operation_ctx to govern the locking.
+ *
+ * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
+ * or prelocked buffer objects are available as detailed by
+ * @ctx::resv and @ctx::allow_res_evict. Ticketlocking is not
+ * supported.
+ *
+ * Return: Pointer to @curs. The function does not fail.
+ */
+struct ttm_bo_lru_cursor *
+ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx)
+{
+	memset(curs, 0, sizeof(*curs));
+	ttm_resource_cursor_init(&curs->res_curs, man);
+	curs->ctx = ctx;
+
+	return curs;
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
+
+static struct ttm_buffer_object *
+ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
+{
+	struct ttm_buffer_object *bo = res->bo;
+
+	if (!ttm_lru_walk_trylock(curs->ctx, bo, &curs->needs_unlock))
+		return NULL;
+
+	if (!ttm_bo_get_unless_zero(bo)) {
+		if (curs->needs_unlock)
+			dma_resv_unlock(bo->base.resv);
+		return NULL;
+	}
+
+	curs->bo = bo;
+	return bo;
+}
+
+/**
+ * ttm_bo_lru_cursor_next() - Continue iterating a manager's LRU lists
+ * to find and lock buffer object.
+ * @curs: The cursor initialized using ttm_bo_lru_cursor_init() and
+ * ttm_bo_lru_cursor_first().
+ *
+ * Return: A pointer to a locked and reference-counted buffer object,
+ * or NULL if none could be found and looping should be terminated.
+ */
+struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+	struct ttm_resource *res = NULL;
+	struct ttm_buffer_object *bo;
+
+	ttm_bo_lru_cursor_cleanup_bo(curs);
+
+	spin_lock(lru_lock);
+	for (;;) {
+		res = ttm_resource_manager_next(&curs->res_curs);
+		if (!res)
+			break;
+
+		bo = ttm_bo_from_res_reserved(res, curs);
+		if (bo)
+			break;
+	}
+
+	spin_unlock(lru_lock);
+	return res ? bo : NULL;
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
+
+/**
+ * ttm_bo_lru_cursor_first() - Start iterating a manager's LRU lists
+ * to find and lock buffer object.
+ * @curs: The cursor initialized using ttm_bo_lru_cursor_init().
+ *
+ * Return: A pointer to a locked and reference-counted buffer object,
+ * or NULL if none could be found and looping should be terminated.
+ */
+struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+	struct ttm_buffer_object *bo;
+	struct ttm_resource *res;
+
+	spin_lock(lru_lock);
+	res = ttm_resource_manager_first(&curs->res_curs);
+	if (!res) {
+		spin_unlock(lru_lock);
+		return NULL;
+	}
+
+	bo = ttm_bo_from_res_reserved(res, curs);
+	spin_unlock(lru_lock);
+
+	return bo ? bo : ttm_bo_lru_cursor_next(curs);
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
+
+/**
+ * ttm_bo_shrink() - Helper to shrink a ttm buffer object.
+ * @ctx: The struct ttm_operation_ctx used for the shrinking operation.
+ * @bo: The buffer object.
+ * @flags: Flags governing the shrinking behaviour.
+ *
+ * The function uses the ttm_tt_back_up functionality to back up or
+ * purge a struct ttm_tt. If the bo is not in system, it's first
+ * moved there.
+ *
+ * Return: The number of pages shrunken or purged, or
+ * negative error code on failure.
+ */
+long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		   const struct ttm_bo_shrink_flags flags)
+{
+	static const struct ttm_place sys_placement_flags = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = 0,
+	};
+	static struct ttm_placement sys_placement = {
+		.num_placement = 1,
+		.placement = &sys_placement_flags,
+	};
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		/* Consider -ENOMEM and -ENOSPC non-fatal. */
+		if (ret) {
+			if (ret == -ENOMEM || ret == -ENOSPC)
+				ret = -EBUSY;
+			return ret;
+		}
+	}
+
+	ttm_bo_unmap_virtual(bo);
+	lret = ttm_bo_wait_ctx(bo, ctx);
+	if (lret < 0)
+		return lret;
+
+	if (bo->bulk_move) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_del_bulk_move(bo->resource, bo);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
+	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
+			     {.purge = flags.purge,
+			      .writeback = flags.writeback});
+
+	if (lret <= 0 && bo->bulk_move) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_add_bulk_move(bo->resource, bo);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
+	if (lret < 0 && lret != -EINTR)
+		return -EBUSY;
+
+	return lret;
+}
+EXPORT_SYMBOL(ttm_bo_shrink);
+
+/**
+ * ttm_bo_shrink_suitable() - Whether a bo is suitable for shinking
+ * @ctx: The struct ttm_operation_ctx governing the shrinking.
+ * @bo: The candidate for shrinking.
+ *
+ * Check whether the object, given the information available to TTM,
+ * is suitable for shinking, This function can and should be used
+ * before attempting to shrink an object.
+ *
+ * Return: true if suitable. false if not.
+ */
+bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
+{
+	return bo->ttm && ttm_tt_is_populated(bo->ttm) && !bo->pin_count &&
+		(!ctx->no_wait_gpu ||
+		 dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP));
+}
+EXPORT_SYMBOL(ttm_bo_shrink_suitable);
+
+/**
+ * ttm_bo_shrink_avoid_wait() - Whether to avoid waiting for GPU
+ * during shrinking
+ *
+ * In some situations, like direct reclaim, waiting (in particular gpu waiting)
+ * should be avoided since it may stall a system that could otherwise make progress
+ * shrinking something else less time consuming.
+ *
+ * Return: true if gpu waiting should be avoided, false if not.
+ */
+bool ttm_bo_shrink_avoid_wait(void)
+{
+	return !current_is_kswapd();
+}
+EXPORT_SYMBOL(ttm_bo_shrink_avoid_wait);
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c9eba76d5143..83b10706ba89 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -41,12 +41,20 @@
 #include <asm/set_memory.h>
 #endif
 
+#include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_bo.h>
 
 #include "ttm_module.h"
 
+#ifdef CONFIG_FAULT_INJECTION
+#include <linux/fault-inject.h>
+static DECLARE_FAULT_ATTR(backup_fault_inject);
+#else
+#define should_fail(...) false
+#endif
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -75,6 +83,35 @@ struct ttm_pool_alloc_state {
 	enum ttm_caching tt_caching;
 };
 
+/**
+ * struct ttm_pool_tt_restore - State representing restore from backup
+ * @pool: The pool used for page allocation while restoring.
+ * @snapshot_alloc: A snapshot of the most recent struct ttm_pool_alloc_state.
+ * @alloced_page: Pointer to the page most recently allocated from a pool or system.
+ * @first_dma: The dma address corresponding to @alloced_page if dma_mapping
+ * is requested.
+ * @alloced_pages: The number of allocated pages present in the struct ttm_tt
+ * page vector from this restore session.
+ * @restored_pages: The number of 4K pages restored for @alloced_page (which
+ * is typically a multi-order page).
+ * @page_caching: The struct ttm_tt requested caching
+ * @order: The order of @alloced_page.
+ *
+ * Recovery from backup might fail when we've recovered less than the
+ * full ttm_tt. In order not to loose any data (yet), keep information
+ * around that allows us to restart a failed ttm backup recovery.
+ */
+struct ttm_pool_tt_restore {
+	struct ttm_pool *pool;
+	struct ttm_pool_alloc_state snapshot_alloc;
+	struct page *alloced_page;
+	dma_addr_t first_dma;
+	pgoff_t alloced_pages;
+	pgoff_t restored_pages;
+	enum ttm_caching page_caching;
+	unsigned int order;
+};
+
 static unsigned long page_pool_size;
 
 MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
@@ -199,12 +236,11 @@ static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
 	return 0;
 }
 
-/* Map pages of 1 << order size and fill the DMA address array  */
+/* DMA Map pages of 1 << order size and return the resulting dma_address. */
 static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
-			struct page *p, dma_addr_t **dma_addr)
+			struct page *p, dma_addr_t *dma_addr)
 {
 	dma_addr_t addr;
-	unsigned int i;
 
 	if (pool->use_dma_alloc) {
 		struct ttm_pool_dma *dma = (void *)p->private;
@@ -218,10 +254,7 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
 			return -EFAULT;
 	}
 
-	for (i = 1 << order; i ; --i) {
-		*(*dma_addr)++ = addr;
-		addr += PAGE_SIZE;
-	}
+	*dma_addr = addr;
 
 	return 0;
 }
@@ -371,6 +404,196 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 	return p->private;
 }
 
+/*
+ * Split larger pages so that we can free each PAGE_SIZE page as soon
+ * as it has been backed up, in order to avoid memory pressure during
+ * reclaim.
+ */
+static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct page *p)
+{
+	unsigned int order = ttm_pool_page_order(pool, p);
+	pgoff_t nr;
+
+	if (!order)
+		return;
+
+	split_page(p, order);
+	nr = 1UL << order;
+	while (nr--)
+		(p++)->private = 0;
+}
+
+/**
+ * DOC: Partial backup and restoration of a struct ttm_tt.
+ *
+ * Swapout using ttm_backup_backup_page() and swapin using
+ * ttm_backup_copy_page() may fail.
+ * The former most likely due to lack of swap-space or memory, the latter due
+ * to lack of memory or because of signal interruption during waits.
+ *
+ * Backup failure is easily handled by using a ttm_tt pages vector that holds
+ * both backup handles and page pointers. This has to be taken into account when
+ * restoring such a ttm_tt from backup, and when freeing it while backed up.
+ * When restoring, for simplicity, new pages are actually allocated from the
+ * pool and the contents of any old pages are copied in and then the old pages
+ * are released.
+ *
+ * For restoration failures, the struct ttm_pool_tt_restore holds sufficient state
+ * to be able to resume an interrupted restore, and that structure is freed once
+ * the restoration is complete. If the struct ttm_tt is destroyed while there
+ * is a valid struct ttm_pool_tt_restore attached, that is also properly taken
+ * care of.
+ */
+
+/* Is restore ongoing for the currently allocated page? */
+static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
+{
+	return restore && restore->restored_pages < (1 << restore->order);
+}
+
+/* DMA unmap and free a multi-order page, either to the relevant pool or to system. */
+static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool *pool, struct page *page,
+				       const dma_addr_t *dma_addr, enum ttm_caching caching)
+{
+	struct ttm_pool_type *pt = NULL;
+	unsigned int order;
+	pgoff_t nr;
+
+	if (pool) {
+		order = ttm_pool_page_order(pool, page);
+		nr = (1UL << order);
+		if (dma_addr)
+			ttm_pool_unmap(pool, *dma_addr, nr);
+
+		pt = ttm_pool_select_type(pool, caching, order);
+	} else {
+		order = page->private;
+		nr = (1UL << order);
+	}
+
+	if (pt)
+		ttm_pool_type_give(pt, page);
+	else
+		ttm_pool_free_page(pool, caching, order, page);
+
+	return nr;
+}
+
+/* Populate the page-array using the most recent allocated multi-order page. */
+static void ttm_pool_allocated_page_commit(struct page *allocated,
+					   dma_addr_t first_dma,
+					   struct ttm_pool_alloc_state *alloc,
+					   pgoff_t nr)
+{
+	pgoff_t i;
+
+	for (i = 0; i < nr; ++i)
+		*alloc->pages++ = allocated++;
+
+	alloc->remaining_pages -= nr;
+
+	if (!alloc->dma_addr)
+		return;
+
+	for (i = 0; i < nr; ++i) {
+		*alloc->dma_addr++ = first_dma;
+		first_dma += PAGE_SIZE;
+	}
+}
+
+/*
+ * When restoring, restore backed-up content to the newly allocated page and
+ * if successful, populate the page-table and dma-address arrays.
+ */
+static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
+				   struct ttm_backup *backup,
+				   const struct ttm_operation_ctx *ctx,
+				   struct ttm_pool_alloc_state *alloc)
+
+{
+	pgoff_t i, nr = 1UL << restore->order;
+	struct page **first_page = alloc->pages;
+	struct page *p;
+	int ret = 0;
+
+	for (i = restore->restored_pages; i < nr; ++i) {
+		p = first_page[i];
+		if (ttm_backup_page_ptr_is_handle(p)) {
+			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
+
+			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
+			    should_fail(&backup_fault_inject, 1)) {
+				ret = -EINTR;
+				break;
+			}
+
+			if (handle == 0) {
+				restore->restored_pages++;
+				continue;
+			}
+
+			ret = ttm_backup_copy_page(backup, restore->alloced_page + i,
+						   handle, ctx->interruptible);
+			if (ret)
+				break;
+
+			ttm_backup_drop(backup, handle);
+		} else if (p) {
+			/*
+			 * We could probably avoid splitting the old page
+			 * using clever logic, but ATM we don't care, as
+			 * we prioritize releasing memory ASAP. Note that
+			 * here, the old retained page is always write-back
+			 * cached.
+			 */
+			ttm_pool_split_for_swap(restore->pool, p);
+			copy_highpage(restore->alloced_page + i, p);
+			__free_pages(p, 0);
+		}
+
+		restore->restored_pages++;
+		first_page[i] = ttm_backup_handle_to_page_ptr(0);
+	}
+
+	if (ret) {
+		if (!restore->restored_pages) {
+			dma_addr_t *dma_addr = alloc->dma_addr ? &restore->first_dma : NULL;
+
+			ttm_pool_unmap_and_free(restore->pool, restore->alloced_page,
+						dma_addr, restore->page_caching);
+			restore->restored_pages = nr;
+		}
+		return ret;
+	}
+
+	ttm_pool_allocated_page_commit(restore->alloced_page, restore->first_dma,
+				       alloc, nr);
+	if (restore->page_caching == alloc->tt_caching || PageHighMem(restore->alloced_page))
+		alloc->caching_divide = alloc->pages;
+	restore->snapshot_alloc = *alloc;
+	restore->alloced_pages += nr;
+
+	return 0;
+}
+
+/* If restoring, save information needed for ttm_pool_restore_commit(). */
+static void
+ttm_pool_page_allocated_restore(struct ttm_pool *pool, unsigned int order,
+				struct page *p,
+				enum ttm_caching page_caching,
+				dma_addr_t first_dma,
+				struct ttm_pool_tt_restore *restore,
+				const struct ttm_pool_alloc_state *alloc)
+{
+	restore->pool = pool;
+	restore->order = order;
+	restore->restored_pages = 0;
+	restore->page_caching = page_caching;
+	restore->first_dma = first_dma;
+	restore->alloced_page = p;
+	restore->snapshot_alloc = *alloc;
+}
+
 /*
  * Called when we got a page, either from a pool or newly allocated.
  * if needed, dma map the page and populate the dma address array.
@@ -380,10 +603,11 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
  */
 static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 				   struct page *p, enum ttm_caching page_caching,
-				   struct ttm_pool_alloc_state *alloc)
+				   struct ttm_pool_alloc_state *alloc,
+				   struct ttm_pool_tt_restore *restore)
 {
-	pgoff_t i, nr = 1UL << order;
 	bool caching_consistent;
+	dma_addr_t first_dma;
 	int r = 0;
 
 	caching_consistent = (page_caching == alloc->tt_caching) || PageHighMem(p);
@@ -395,17 +619,20 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 	}
 
 	if (alloc->dma_addr) {
-		r = ttm_pool_map(pool, order, p, &alloc->dma_addr);
+		r = ttm_pool_map(pool, order, p, &first_dma);
 		if (r)
 			return r;
 	}
 
-	alloc->remaining_pages -= nr;
-	for (i = 0; i < nr; ++i)
-		*alloc->pages++ = p++;
+	if (restore) {
+		ttm_pool_page_allocated_restore(pool, order, p, page_caching,
+						first_dma, restore, alloc);
+	} else {
+		ttm_pool_allocated_page_commit(p, first_dma, alloc, 1UL << order);
 
-	if (caching_consistent)
-		alloc->caching_divide = alloc->pages;
+		if (caching_consistent)
+			alloc->caching_divide = alloc->pages;
+	}
 
 	return 0;
 }
@@ -428,22 +655,24 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 				pgoff_t start_page, pgoff_t end_page)
 {
 	struct page **pages = &tt->pages[start_page];
-	unsigned int order;
+	struct ttm_backup *backup = tt->backup;
 	pgoff_t i, nr;
 
 	for (i = start_page; i < end_page; i += nr, pages += nr) {
-		struct ttm_pool_type *pt = NULL;
+		struct page *p = *pages;
 
-		order = ttm_pool_page_order(pool, *pages);
-		nr = (1UL << order);
-		if (tt->dma_address)
-			ttm_pool_unmap(pool, tt->dma_address[i], nr);
+		nr = 1;
+		if (ttm_backup_page_ptr_is_handle(p)) {
+			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
 
-		pt = ttm_pool_select_type(pool, caching, order);
-		if (pt)
-			ttm_pool_type_give(pt, *pages);
-		else
-			ttm_pool_free_page(pool, caching, order, *pages);
+			if (handle != 0)
+				ttm_backup_drop(backup, handle);
+		} else if (p) {
+			dma_addr_t *dma_addr = tt->dma_address ?
+				tt->dma_address + i : NULL;
+
+			nr = ttm_pool_unmap_and_free(pool, p, dma_addr, caching);
+		}
 	}
 }
 
@@ -467,22 +696,11 @@ static unsigned int ttm_pool_alloc_find_order(unsigned int highest,
 	return min_t(unsigned int, highest, __fls(alloc->remaining_pages));
 }
 
-/**
- * ttm_pool_alloc - Fill a ttm_tt object
- *
- * @pool: ttm_pool to use
- * @tt: ttm_tt object to fill
- * @ctx: operation context
- *
- * Fill the ttm_tt object with pages and also make sure to DMA map them when
- * necessary.
- *
- * Returns: 0 on successe, negative error code otherwise.
- */
-int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
-		   struct ttm_operation_ctx *ctx)
+static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+			    const struct ttm_operation_ctx *ctx,
+			    struct ttm_pool_alloc_state *alloc,
+			    struct ttm_pool_tt_restore *restore)
 {
-	struct ttm_pool_alloc_state alloc;
 	enum ttm_caching page_caching;
 	gfp_t gfp_flags = GFP_USER;
 	pgoff_t caching_divide;
@@ -491,10 +709,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	struct page *p;
 	int r;
 
-	ttm_pool_alloc_state_init(tt, &alloc);
-
-	WARN_ON(!alloc.remaining_pages || ttm_tt_is_populated(tt));
-	WARN_ON(alloc.dma_addr && !pool->dev);
+	WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
+	WARN_ON(alloc->dma_addr && !pool->dev);
 
 	if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
 		gfp_flags |= __GFP_ZERO;
@@ -509,9 +725,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 
 	page_caching = tt->caching;
 	allow_pools = true;
-	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, &alloc);
-	     alloc.remaining_pages;
-	     order = ttm_pool_alloc_find_order(order, &alloc)) {
+	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
+	     alloc->remaining_pages;
+	     order = ttm_pool_alloc_find_order(order, alloc)) {
 		struct ttm_pool_type *pt;
 
 		/* First, try to allocate a page from a pool if one exists. */
@@ -541,30 +757,120 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 			r = -ENOMEM;
 			goto error_free_all;
 		}
-		r = ttm_pool_page_allocated(pool, order, p, page_caching, &alloc);
+		r = ttm_pool_page_allocated(pool, order, p, page_caching, alloc,
+					    restore);
 		if (r)
 			goto error_free_page;
+
+		if (ttm_pool_restore_valid(restore)) {
+			r = ttm_pool_restore_commit(restore, tt->backup, ctx, alloc);
+			if (r)
+				goto error_free_all;
+		}
 	}
 
-	r = ttm_pool_apply_caching(&alloc);
+	r = ttm_pool_apply_caching(alloc);
 	if (r)
 		goto error_free_all;
 
+	kfree(tt->restore);
+	tt->restore = NULL;
+
 	return 0;
 
 error_free_page:
 	ttm_pool_free_page(pool, page_caching, order, p);
 
 error_free_all:
-	caching_divide = alloc.caching_divide - tt->pages;
+	if (tt->restore)
+		return r;
+
+	caching_divide = alloc->caching_divide - tt->pages;
 	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
 	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide,
-			    tt->num_pages - alloc.remaining_pages);
+			    tt->num_pages - alloc->remaining_pages);
 
 	return r;
 }
+
+/**
+ * ttm_pool_alloc - Fill a ttm_tt object
+ *
+ * @pool: ttm_pool to use
+ * @tt: ttm_tt object to fill
+ * @ctx: operation context
+ *
+ * Fill the ttm_tt object with pages and also make sure to DMA map them when
+ * necessary.
+ *
+ * Returns: 0 on successe, negative error code otherwise.
+ */
+int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+		   struct ttm_operation_ctx *ctx)
+{
+	struct ttm_pool_alloc_state alloc;
+
+	if (WARN_ON(ttm_tt_is_backed_up(tt)))
+		return -EINVAL;
+
+	ttm_pool_alloc_state_init(tt, &alloc);
+
+	return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
+}
 EXPORT_SYMBOL(ttm_pool_alloc);
 
+/**
+ * ttm_pool_restore_and_alloc - Fill a ttm_tt, restoring previously backed-up
+ * content.
+ *
+ * @pool: ttm_pool to use
+ * @tt: ttm_tt object to fill
+ * @ctx: operation context
+ *
+ * Fill the ttm_tt object with pages and also make sure to DMA map them when
+ * necessary. Read in backed-up content.
+ *
+ * Returns: 0 on successe, negative error code otherwise.
+ */
+int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+			       const struct ttm_operation_ctx *ctx)
+{
+	struct ttm_pool_alloc_state alloc;
+
+	if (WARN_ON(!ttm_tt_is_backed_up(tt)))
+		return -EINVAL;
+
+	if (!tt->restore) {
+		gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
+
+		ttm_pool_alloc_state_init(tt, &alloc);
+		if (ctx->gfp_retry_mayfail)
+			gfp |= __GFP_RETRY_MAYFAIL;
+
+		tt->restore = kzalloc(sizeof(*tt->restore), gfp);
+		if (!tt->restore)
+			return -ENOMEM;
+
+		tt->restore->snapshot_alloc = alloc;
+		tt->restore->pool = pool;
+		tt->restore->restored_pages = 1;
+	} else {
+		struct ttm_pool_tt_restore *restore = tt->restore;
+		int ret;
+
+		alloc = restore->snapshot_alloc;
+		if (ttm_pool_restore_valid(tt->restore)) {
+			ret = ttm_pool_restore_commit(restore, tt->backup, ctx, &alloc);
+			if (ret)
+				return ret;
+		}
+		if (!alloc.remaining_pages)
+			return 0;
+	}
+
+	return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt->restore);
+}
+
 /**
  * ttm_pool_free - Free the backing pages from a ttm_tt object
  *
@@ -582,6 +888,169 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 }
 EXPORT_SYMBOL(ttm_pool_free);
 
+/**
+ * ttm_pool_drop_backed_up() - Release content of a swapped-out struct ttm_tt
+ * @tt: The struct ttm_tt.
+ *
+ * Release handles with associated content or any remaining pages of
+ * a backed-up struct ttm_tt.
+ */
+void ttm_pool_drop_backed_up(struct ttm_tt *tt)
+{
+	struct ttm_pool_tt_restore *restore;
+	pgoff_t start_page = 0;
+
+	WARN_ON(!ttm_tt_is_backed_up(tt));
+
+	restore = tt->restore;
+
+	/*
+	 * Unmap and free any uncommitted restore page.
+	 * any tt page-array backup entries already read back has
+	 * been cleared already
+	 */
+	if (ttm_pool_restore_valid(restore)) {
+		dma_addr_t *dma_addr = tt->dma_address ? &restore->first_dma : NULL;
+
+		ttm_pool_unmap_and_free(restore->pool, restore->alloced_page,
+					dma_addr, restore->page_caching);
+		restore->restored_pages = 1UL << restore->order;
+	}
+
+	/*
+	 * If a restore is ongoing, part of the tt pages may have a
+	 * caching different than writeback.
+	 */
+	if (restore) {
+		pgoff_t mid = restore->snapshot_alloc.caching_divide - tt->pages;
+
+		start_page = restore->alloced_pages;
+		WARN_ON(mid > start_page);
+		/* Pages that might be dma-mapped and non-cached */
+		ttm_pool_free_range(restore->pool, tt, tt->caching,
+				    0, mid);
+		/* Pages that might be dma-mapped but cached */
+		ttm_pool_free_range(restore->pool, tt, ttm_cached,
+				    mid, restore->alloced_pages);
+		kfree(restore);
+		tt->restore = NULL;
+	}
+
+	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt->num_pages);
+}
+
+/**
+ * ttm_pool_backup() - Back up or purge a struct ttm_tt
+ * @pool: The pool used when allocating the struct ttm_tt.
+ * @tt: The struct ttm_tt.
+ * @flags: Flags to govern the backup behaviour.
+ *
+ * Back up or purge a struct ttm_tt. If @purge is true, then
+ * all pages will be freed directly to the system rather than to the pool
+ * they were allocated from, making the function behave similarly to
+ * ttm_pool_free(). If @purge is false the pages will be backed up instead,
+ * exchanged for handles.
+ * A subsequent call to ttm_pool_restore_and_alloc() will then read back the content and
+ * a subsequent call to ttm_pool_drop_backed_up() will drop it.
+ * If backup of a page fails for whatever reason, @ttm will still be
+ * partially backed up, retaining those pages for which backup fails.
+ * In that case, this function can be retried, possibly after freeing up
+ * memory resources.
+ *
+ * Return: Number of pages actually backed up or freed, or negative
+ * error code on error.
+ */
+long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
+		     const struct ttm_backup_flags *flags)
+{
+	struct ttm_backup *backup = tt->backup;
+	struct page *page;
+	unsigned long handle;
+	gfp_t alloc_gfp;
+	gfp_t gfp;
+	int ret = 0;
+	pgoff_t shrunken = 0;
+	pgoff_t i, num_pages;
+
+	if (WARN_ON(ttm_tt_is_backed_up(tt)))
+		return -EINVAL;
+
+	if ((!ttm_backup_bytes_avail() && !flags->purge) ||
+	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
+		return -EBUSY;
+
+#ifdef CONFIG_X86
+	/* Anything returned to the system needs to be cached. */
+	if (tt->caching != ttm_cached)
+		set_pages_array_wb(tt->pages, tt->num_pages);
+#endif
+
+	if (tt->dma_address || flags->purge) {
+		for (i = 0; i < tt->num_pages; i += num_pages) {
+			unsigned int order;
+
+			page = tt->pages[i];
+			if (unlikely(!page)) {
+				num_pages = 1;
+				continue;
+			}
+
+			order = ttm_pool_page_order(pool, page);
+			num_pages = 1UL << order;
+			if (tt->dma_address)
+				ttm_pool_unmap(pool, tt->dma_address[i],
+					       num_pages);
+			if (flags->purge) {
+				shrunken += num_pages;
+				page->private = 0;
+				__free_pages(page, order);
+				memset(tt->pages + i, 0,
+				       num_pages * sizeof(*tt->pages));
+			}
+		}
+	}
+
+	if (flags->purge)
+		return shrunken;
+
+	if (pool->use_dma32)
+		gfp = GFP_DMA32;
+	else
+		gfp = GFP_HIGHUSER;
+
+	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
+
+	num_pages = tt->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+	if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
+		s64 shandle;
+
+		page = tt->pages[i];
+		if (unlikely(!page))
+			continue;
+
+		ttm_pool_split_for_swap(pool, page);
+
+		shandle = ttm_backup_backup_page(backup, page, flags->writeback, i,
+						 gfp, alloc_gfp);
+		if (shandle < 0) {
+			/* We allow partially shrunken tts */
+			ret = shandle;
+			break;
+		}
+		handle = shandle;
+		tt->pages[i] = ttm_backup_handle_to_page_ptr(handle);
+		put_page(page);
+		shrunken++;
+	}
+
+	return shrunken ? shrunken : ret;
+}
+
 /**
  * ttm_pool_init - Initialize a pool
  *
@@ -843,6 +1312,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_globals_fops);
 	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
 			    &ttm_pool_debugfs_shrink_fops);
+#ifdef CONFIG_FAULT_INJECTION
+	fault_create_debugfs_attr("backup_fault_inject", ttm_debugfs_root,
+				  &backup_fault_inject);
+#endif
 #endif
 
 	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 3baf215eca23..df0aa6c4b8b8 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -40,6 +40,7 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
 #include <drm/drm_util.h>
+#include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_tt.h>
 
@@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm->swap_storage = NULL;
 	ttm->sg = bo->sg;
 	ttm->caching = caching;
+	ttm->restore = NULL;
+	ttm->backup = NULL;
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -182,6 +185,13 @@ void ttm_tt_fini(struct ttm_tt *ttm)
 		fput(ttm->swap_storage);
 	ttm->swap_storage = NULL;
 
+	if (ttm_tt_is_backed_up(ttm))
+		ttm_pool_drop_backed_up(ttm);
+	if (ttm->backup) {
+		ttm_backup_fini(ttm->backup);
+		ttm->backup = NULL;
+	}
+
 	if (ttm->pages)
 		kvfree(ttm->pages);
 	else
@@ -253,6 +263,49 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
 }
 EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
 
+/**
+ * ttm_tt_backup() - Helper to back up a struct ttm_tt.
+ * @bdev: The TTM device.
+ * @tt: The struct ttm_tt.
+ * @flags: Flags that govern the backup behaviour.
+ *
+ * Update the page accounting and call ttm_pool_shrink_tt to free pages
+ * or back them up.
+ *
+ * Return: Number of pages freed or swapped out, or negative error code on
+ * error.
+ */
+long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
+		   const struct ttm_backup_flags flags)
+{
+	long ret;
+
+	if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
+		return 0;
+
+	ret = ttm_pool_backup(&bdev->pool, tt, &flags);
+	if (ret > 0) {
+		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
+		tt->page_flags |= TTM_TT_FLAG_BACKED_UP;
+	}
+
+	return ret;
+}
+
+int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
+		   const struct ttm_operation_ctx *ctx)
+{
+	int ret = ttm_pool_restore_and_alloc(&bdev->pool, tt, ctx);
+
+	if (ret)
+		return ret;
+
+	tt->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
+
+	return 0;
+}
+EXPORT_SYMBOL(ttm_tt_restore);
+
 /**
  * ttm_tt_swapout - swap out tt object
  *
@@ -348,6 +401,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
 		goto error;
 
 	ttm->page_flags |= TTM_TT_FLAG_PRIV_POPULATED;
+	ttm->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
 	if (unlikely(ttm->page_flags & TTM_TT_FLAG_SWAPPED)) {
 		ret = ttm_tt_swapin(ttm);
 		if (unlikely(ret != 0)) {
@@ -477,3 +531,32 @@ unsigned long ttm_tt_pages_limit(void)
 	return ttm_pages_limit;
 }
 EXPORT_SYMBOL(ttm_tt_pages_limit);
+
+/**
+ * ttm_tt_setup_backup() - Allocate and assign a backup structure for a ttm_tt
+ * @tt: The ttm_tt for wich to allocate and assign a backup structure.
+ *
+ * Assign a backup structure to be used for tt backup. This should
+ * typically be done at bo creation, to avoid allocations at shrinking
+ * time.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int ttm_tt_setup_backup(struct ttm_tt *tt)
+{
+	struct ttm_backup *backup =
+		ttm_backup_shmem_create(((loff_t)tt->num_pages) << PAGE_SHIFT);
+
+	if (WARN_ON_ONCE(!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)))
+		return -EINVAL;
+
+	if (IS_ERR(backup))
+		return PTR_ERR(backup);
+
+	if (tt->backup)
+		ttm_backup_fini(tt->backup);
+
+	tt->backup = backup;
+	return 0;
+}
+EXPORT_SYMBOL(ttm_tt_setup_backup);
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 856b14fe1c4d..1d52224355f1 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -100,6 +100,7 @@ xe-y += xe_bb.o \
 	xe_rtp.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_shrinker.o \
 	xe_step.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 6795d1d916e4..9fde67ca989f 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -514,8 +514,13 @@ static int shrink_test_run_device(struct xe_device *xe)
 		 * other way around, they may not be subject to swapping...
 		 */
 		if (alloced < purgeable) {
+			xe_ttm_tt_account_subtract(&xe_tt->ttm);
 			xe_tt->purgeable = true;
+			xe_ttm_tt_account_add(&xe_tt->ttm);
 			bo->ttm.priority = 0;
+			spin_lock(&bo->ttm.bdev->lru_lock);
+			ttm_bo_move_to_lru_tail(&bo->ttm);
+			spin_unlock(&bo->ttm.bdev->lru_lock);
 		} else {
 			int ret = shrink_test_fill_random(bo, &prng, link);
 
@@ -570,7 +575,6 @@ static int shrink_test_run_device(struct xe_device *xe)
 				if (ret == -EINTR)
 					intr = true;
 			} while (ret == -EINTR && !signal_pending(current));
-
 			if (!ret && !purgeable)
 				failed = shrink_test_verify(test, bo, count, &prng, link);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 25761924a8b4..c21e6bca3141 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -11,6 +11,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -29,6 +30,7 @@
 #include "xe_preempt_fence.h"
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
+#include "xe_shrinker.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -307,9 +309,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	}
 }
 
+/* struct xe_ttm_tt - Subclassed ttm_tt for xe */
 struct xe_ttm_tt {
 	struct ttm_tt ttm;
-	struct device *dev;
+	/** @xe - The xe device */
+	struct xe_device *xe;
 	struct sg_table sgt;
 	struct sg_table *sg;
 	/** @purgeable: Whether the content of the pages of @ttm is purgeable. */
@@ -322,7 +326,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	unsigned long num_pages = tt->num_pages;
 	int ret;
 
-	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+		   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE));
 
 	if (xe_tt->sg)
 		return 0;
@@ -330,13 +335,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
 						num_pages, 0,
 						(u64)num_pages << PAGE_SHIFT,
-						xe_sg_segment_size(xe_tt->dev),
+						xe_sg_segment_size(xe_tt->xe->drm.dev),
 						GFP_KERNEL);
 	if (ret)
 		return ret;
 
 	xe_tt->sg = &xe_tt->sgt;
-	ret = dma_map_sgtable(xe_tt->dev, xe_tt->sg, DMA_BIDIRECTIONAL,
+	ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
 			      DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret) {
 		sg_free_table(xe_tt->sg);
@@ -352,7 +357,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
 	if (xe_tt->sg) {
-		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
+		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
 				  DMA_BIDIRECTIONAL, 0);
 		sg_free_table(xe_tt->sg);
 		xe_tt->sg = NULL;
@@ -367,21 +372,47 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
 	return xe_tt->sg;
 }
 
+/*
+ * Account ttm pages against the device shrinker's shrinkable and
+ * purgeable counts.
+ */
+static void xe_ttm_tt_account_add(struct ttm_tt *tt)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, tt->num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, tt->num_pages, 0);
+}
+
+static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, -(long)tt->num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
+}
+
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 				       u32 page_flags)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_ttm_tt *tt;
+	struct xe_ttm_tt *xe_tt;
+	struct ttm_tt *tt;
 	unsigned long extra_pages;
 	enum ttm_caching caching = ttm_cached;
 	int err;
 
-	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
-	if (!tt)
+	xe_tt = kzalloc(sizeof(*xe_tt), GFP_KERNEL);
+	if (!xe_tt)
 		return NULL;
 
-	tt->dev = xe->drm.dev;
+	tt = &xe_tt->ttm;
+	xe_tt->xe = xe;
 
 	extra_pages = 0;
 	if (xe_bo_needs_ccs_pages(bo))
@@ -427,42 +458,66 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
-	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
+	if (ttm_bo->type != ttm_bo_type_sg)
+		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+
+	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
-		kfree(tt);
+		kfree(xe_tt);
 		return NULL;
 	}
 
-	return &tt->ttm;
+	if (ttm_bo->type != ttm_bo_type_sg) {
+		err = ttm_tt_setup_backup(tt);
+		if (err) {
+			ttm_tt_fini(tt);
+			kfree(xe_tt);
+			return NULL;
+		}
+	}
+
+	return tt;
 }
 
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 			      struct ttm_operation_ctx *ctx)
 {
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 	int err;
 
 	/*
 	 * dma-bufs are not populated with pages, and the dma-
 	 * addresses are set up when moved to XE_PL_TT.
 	 */
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return 0;
 
-	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
+	if (ttm_tt_is_backed_up(tt) && !xe_tt->purgeable) {
+		err = ttm_tt_restore(ttm_dev, tt, ctx);
+	} else {
+		ttm_tt_clear_backed_up(tt);
+		err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
+	}
 	if (err)
 		return err;
 
-	return err;
+	xe_tt->purgeable = false;
+	xe_ttm_tt_account_add(tt);
+
+	return 0;
 }
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return;
 
 	xe_tt_unmap_sg(tt);
 
-	return ttm_pool_free(&ttm_dev->pool, tt);
+	ttm_pool_free(&ttm_dev->pool, tt);
+	xe_ttm_tt_account_subtract(tt);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -912,6 +967,111 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	return ret;
 }
 
+static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
+			       struct ttm_buffer_object *bo,
+			       unsigned long *scanned)
+{
+	long lret;
+
+	/* Fake move to system, without copying data. */
+	if (bo->resource->mem_type != XE_PL_SYSTEM) {
+		struct ttm_resource *new_resource;
+
+		lret = ttm_bo_wait_ctx(bo, ctx);
+		if (lret)
+			return lret;
+
+		lret = ttm_bo_mem_space(bo, &sys_placement, &new_resource, ctx);
+		if (lret)
+			return lret;
+
+		xe_tt_unmap_sg(bo->ttm);
+		ttm_bo_move_null(bo, new_resource);
+	}
+
+	*scanned += bo->ttm->num_pages;
+	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
+			     {.purge = true,
+			      .writeback = false,
+			      .allow_move = false});
+
+	if (lret > 0)
+		xe_ttm_tt_account_subtract(bo->ttm);
+
+	return lret;
+}
+
+/**
+ * xe_bo_shrink() - Try to shrink an xe bo.
+ * @ctx: The struct ttm_operation_ctx used for shrinking.
+ * @bo: The TTM buffer object whose pages to shrink.
+ * @flags: Flags governing the shrink behaviour.
+ * @scanned: Pointer to a counter of the number of pages
+ * attempted to shrink.
+ *
+ * Try to shrink- or purge a bo, and if it succeeds, unmap dma.
+ * Note that we need to be able to handle also non xe bos
+ * (ghost bos), but only if the struct ttm_tt is embedded in
+ * a struct xe_ttm_tt. When the function attempts to shrink
+ * the pages of a buffer object, The value pointed to by @scanned
+ * is updated.
+ *
+ * Return: The number of pages shrunken or purged, or negative error
+ * code on failure.
+ */
+long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		  const struct xe_bo_shrink_flags flags,
+		  unsigned long *scanned)
+{
+	struct ttm_tt *tt = bo->ttm;
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
+	struct xe_device *xe = xe_tt->xe;
+	bool needs_rpm;
+	long lret = 0L;
+
+	if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
+	    (flags.purge && !xe_tt->purgeable))
+		return -EBUSY;
+
+	if (!ttm_bo_eviction_valuable(bo, &place))
+		return -EBUSY;
+
+	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
+		return xe_bo_shrink_purge(ctx, bo, scanned);
+
+	if (xe_tt->purgeable) {
+		if (bo->resource->mem_type != XE_PL_SYSTEM)
+			lret = xe_bo_move_notify(xe_bo, ctx);
+		if (!lret)
+			lret = xe_bo_shrink_purge(ctx, bo, scanned);
+		goto out_unref;
+	}
+
+	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM */
+	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type != XE_PL_SYSTEM &&
+		     xe_bo_needs_ccs_pages(xe_bo));
+	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
+		goto out_unref;
+
+	*scanned += tt->num_pages;
+	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
+			     {.purge = false,
+			      .writeback = flags.writeback,
+			      .allow_move = true});
+	if (needs_rpm)
+		xe_pm_runtime_put(xe);
+
+	if (lret > 0)
+		xe_ttm_tt_account_subtract(tt);
+
+out_unref:
+	xe_bo_put(xe_bo);
+
+	return lret;
+}
+
 /**
  * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
  * @bo: The buffer object to move.
@@ -1929,6 +2089,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1988,6 +2150,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -2022,6 +2186,8 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -2045,6 +2211,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 		spin_unlock(&xe->pinned.lock);
 	}
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a25340949415..2a7240c45511 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -148,6 +148,28 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
 
 void xe_bo_put(struct xe_bo *bo);
 
+/*
+ * xe_bo_get_unless_zero() - Conditionally obtain a GEM object refcount on an
+ * xe bo
+ * @bo: The bo for which we want to obtain a refcount.
+ *
+ * There is a short window between where the bo's GEM object refcount reaches
+ * zero and where we put the final ttm_bo reference. Code in the eviction- and
+ * shrinking path should therefore attempt to grab a gem object reference before
+ * trying to use members outside of the base class ttm object. This function is
+ * intended for that purpose. On successful return, this function must be paired
+ * with an xe_bo_put().
+ *
+ * Return: @bo on success, NULL on failure.
+ */
+static inline __must_check struct xe_bo *xe_bo_get_unless_zero(struct xe_bo *bo)
+{
+	if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
+		return NULL;
+
+	return bo;
+}
+
 static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
 {
 	if (bo)
@@ -349,6 +371,20 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 	return round_down(max / 2, PAGE_SIZE);
 }
 
+/**
+ * struct xe_bo_shrink_flags - flags governing the shrink behaviour.
+ * @purge: Only purging allowed. Don't shrink if bo not purgeable.
+ * @writeback: Attempt to immediately move content to swap.
+ */
+struct xe_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+};
+
+long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		  const struct xe_bo_shrink_flags flags,
+		  unsigned long *scanned);
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9454b51f7ad8..539da525aa14 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -52,6 +52,7 @@
 #include "xe_pmu.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_shrinker.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -396,6 +397,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
+		xe_shrinker_destroy(xe->mem.shrinker);
+
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
@@ -428,6 +432,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+	xe->mem.shrinker = xe_shrinker_create(xe);
+	if (IS_ERR(xe->mem.shrinker))
+		return ERR_CAST(xe->mem.shrinker);
+
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a3..604a69c494e5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -372,6 +372,8 @@ struct xe_device {
 		struct xe_vram_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.sys_mgr: system memory shrinker. */
+		struct xe_shrinker *shrinker;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
new file mode 100644
index 000000000000..8184390f9c7b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/shrinker.h>
+
+#include <drm/ttm/ttm_backup.h>
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_tt.h>
+
+#include "xe_bo.h"
+#include "xe_pm.h"
+#include "xe_shrinker.h"
+
+/**
+ * struct xe_shrinker - per-device shrinker
+ * @xe: Back pointer to the device.
+ * @lock: Lock protecting accounting.
+ * @shrinkable_pages: Number of pages that are currently shrinkable.
+ * @purgeable_pages: Number of pages that are currently purgeable.
+ * @shrink: Pointer to the mm shrinker.
+ * @pm_worker: Worker to wake up the device if required.
+ */
+struct xe_shrinker {
+	struct xe_device *xe;
+	rwlock_t lock;
+	long shrinkable_pages;
+	long purgeable_pages;
+	struct shrinker *shrink;
+	struct work_struct pm_worker;
+};
+
+static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
+{
+	return shrink->private_data;
+}
+
+/**
+ * xe_shrinker_mod_pages() - Modify shrinker page accounting
+ * @shrinker: Pointer to the struct xe_shrinker.
+ * @shrinkable: Shrinkable pages delta. May be negative.
+ * @purgeable: Purgeable page delta. May be negative.
+ *
+ * Modifies the shrinkable and purgeable pages accounting.
+ */
+void
+xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable)
+{
+	write_lock(&shrinker->lock);
+	shrinker->shrinkable_pages += shrinkable;
+	shrinker->purgeable_pages += purgeable;
+	write_unlock(&shrinker->lock);
+}
+
+static s64 xe_shrinker_walk(struct xe_device *xe,
+			    struct ttm_operation_ctx *ctx,
+			    const struct xe_bo_shrink_flags flags,
+			    unsigned long to_scan, unsigned long *scanned)
+{
+	unsigned int mem_type;
+	s64 freed = 0, lret;
+
+	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
+		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
+		struct ttm_bo_lru_cursor curs;
+		struct ttm_buffer_object *ttm_bo;
+
+		if (!man || !man->use_tt)
+			continue;
+
+		ttm_bo_lru_for_each_reserved_guarded(&curs, man, ctx, ttm_bo) {
+			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
+				continue;
+
+			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
+			if (lret < 0)
+				return lret;
+
+			freed += lret;
+			if (*scanned >= to_scan)
+				break;
+		}
+	}
+
+	return freed;
+}
+
+static unsigned long
+xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	unsigned long num_pages;
+	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
+
+	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
+	read_lock(&shrinker->lock);
+
+	if (can_backup)
+		num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
+	else
+		num_pages = 0;
+
+	num_pages += shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
+/*
+ * Check if we need runtime pm, and if so try to grab a reference if
+ * already active. If grabbing a reference fails, queue a worker that
+ * does it for us outside of reclaim, but don't wait for it to complete.
+ * If bo shrinking needs an rpm reference and we don't have it (yet),
+ * that bo will be skipped anyway.
+ */
+static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
+				       unsigned long nr_to_scan, bool can_backup)
+{
+	struct xe_device *xe = shrinker->xe;
+
+	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
+	    !ttm_backup_bytes_avail())
+		return false;
+
+	if (!force) {
+		read_lock(&shrinker->lock);
+		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
+		read_unlock(&shrinker->lock);
+		if (!force)
+			return false;
+	}
+
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait()) {
+			xe_pm_runtime_get(xe);
+			return true;
+		}
+		queue_work(xe->unordered_wq, &shrinker->pm_worker);
+		return false;
+	}
+
+	return true;
+}
+
+static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
+{
+	if (runtime_pm)
+		xe_pm_runtime_put(shrinker->xe);
+}
+
+static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
+	};
+	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
+	struct xe_bo_shrink_flags shrink_flags = {
+		.purge = true,
+		/* Don't request writeback without __GFP_IO. */
+		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
+	};
+	bool runtime_pm;
+	bool purgeable;
+	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
+	s64 lret;
+
+	nr_to_scan = sc->nr_to_scan;
+
+	read_lock(&shrinker->lock);
+	purgeable = !!shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	/* Might need runtime PM. Try to wake early if it looks like it. */
+	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
+
+	if (purgeable && nr_scanned < nr_to_scan) {
+		lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+					nr_to_scan, &nr_scanned);
+		if (lret >= 0)
+			freed += lret;
+	}
+
+	sc->nr_scanned = nr_scanned;
+	if (nr_scanned >= nr_to_scan || !can_backup)
+		goto out;
+
+	/* If we didn't wake before, try to do it now if needed. */
+	if (!runtime_pm)
+		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
+
+	shrink_flags.purge = false;
+	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+				nr_to_scan, &nr_scanned);
+	if (lret >= 0)
+		freed += lret;
+
+	sc->nr_scanned = nr_scanned;
+out:
+	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
+	return nr_scanned ? freed : SHRINK_STOP;
+}
+
+/* Wake up the device for shrinking. */
+static void xe_shrinker_pm(struct work_struct *work)
+{
+	struct xe_shrinker *shrinker =
+		container_of(work, typeof(*shrinker), pm_worker);
+
+	xe_pm_runtime_get(shrinker->xe);
+	xe_pm_runtime_put(shrinker->xe);
+}
+
+/**
+ * xe_shrinker_create() - Create an xe per-device shrinker
+ * @xe: Pointer to the xe device.
+ *
+ * Returns: A pointer to the created shrinker on success,
+ * Negative error code on failure.
+ */
+struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
+{
+	struct xe_shrinker *shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
+
+	if (!shrinker)
+		return ERR_PTR(-ENOMEM);
+
+	shrinker->shrink = shrinker_alloc(0, "xe system shrinker");
+	if (!shrinker->shrink) {
+		kfree(shrinker);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
+	shrinker->xe = xe;
+	rwlock_init(&shrinker->lock);
+	shrinker->shrink->count_objects = xe_shrinker_count;
+	shrinker->shrink->scan_objects = xe_shrinker_scan;
+	shrinker->shrink->private_data = shrinker;
+	shrinker_register(shrinker->shrink);
+
+	return shrinker;
+}
+
+/**
+ * xe_shrinker_destroy() - Destroy an xe per-device shrinker
+ * @shrinker: Pointer to the shrinker to destroy.
+ */
+void xe_shrinker_destroy(struct xe_shrinker *shrinker)
+{
+	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
+	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
+	shrinker_free(shrinker->shrink);
+	flush_work(&shrinker->pm_worker);
+	kfree(shrinker);
+}
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
new file mode 100644
index 000000000000..28a038f4fcbf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_SHRINKER_H_
+#define _XE_SHRINKER_H_
+
+struct xe_shrinker;
+struct xe_device;
+
+void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
+
+struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
+
+void xe_shrinker_destroy(struct xe_shrinker *shrinker);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe1..d38b91872da3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	u64 gtt_size;
 
 	si_meminfo(&si);
+	/* Potentially restrict amount of TT memory here. */
 	gtt_size = (u64)si.totalram * si.mem_unit;
-	/* TTM limits allocation of all TTM devices by 50% of system memory */
-	gtt_size /= 2;
 
 	man->use_tt = true;
 	man->func = &xe_ttm_sys_mgr_func;
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
new file mode 100644
index 000000000000..24ad120b8827
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,74 @@
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
+void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
+
+int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
+			 pgoff_t handle, bool intr);
+
+s64
+ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
+		       bool writeback, pgoff_t idx, gfp_t page_gfp,
+		       gfp_t alloc_gfp);
+
+void ttm_backup_fini(struct ttm_backup *backup);
+
+u64 ttm_backup_bytes_avail(void);
+
+struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+
+#endif
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8ea11cd8df39..903cd1030110 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -225,6 +225,27 @@ struct ttm_lru_walk {
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
+/**
+ * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
+ * @purge: Purge the content rather than backing it up.
+ * @writeback: Attempt to immediately write content to swap space.
+ * @allow_move: Allow moving to system before shrinking. This is typically
+ * not desired for zombie- or ghost objects (with zombie object meaning
+ * objects with a zero gem object refcount)
+ */
+struct ttm_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+	u32 allow_move : 1;
+};
+
+long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		   const struct ttm_bo_shrink_flags flags);
+
+bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx);
+
+bool ttm_bo_shrink_avoid_wait(void);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
@@ -467,4 +488,76 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx);
 
+/* Driver LRU walk helpers initially targeted for shrinking. */
+
+/**
+ * struct ttm_bo_lru_cursor - Iterator cursor for TTM LRU list looping
+ */
+struct ttm_bo_lru_cursor {
+	/** @res_curs: Embedded struct ttm_resource_cursor. */
+	struct ttm_resource_cursor res_curs;
+	/**
+	 * @ctx: The struct ttm_operation_ctx used while looping.
+	 * governs the locking mode.
+	 */
+	struct ttm_operation_ctx *ctx;
+	/**
+	 * @bo: Buffer object pointer if a buffer object is refcounted,
+	 * NULL otherwise.
+	 */
+	struct ttm_buffer_object *bo;
+	/**
+	 * @needs_unlock: Valid iff @bo != NULL. The bo resv needs
+	 * unlock before the next iteration or after loop exit.
+	 */
+	bool needs_unlock;
+};
+
+void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
+
+struct ttm_bo_lru_cursor *
+ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx);
+
+struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs);
+
+struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs);
+
+/*
+ * Defines needed to use autocleanup (linux/cleanup.h) with struct ttm_bo_lru_cursor.
+ */
+DEFINE_CLASS(ttm_bo_lru_cursor, struct ttm_bo_lru_cursor *,
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },
+	     ttm_bo_lru_cursor_init(curs, man, ctx),
+	     struct ttm_bo_lru_cursor *curs, struct ttm_resource_manager *man,
+	     struct ttm_operation_ctx *ctx);
+static inline void *
+class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
+{ return *_T; }
+#define class_ttm_bo_lru_cursor_is_conditional false
+
+/**
+ * ttm_bo_lru_for_each_reserved_guarded() - Iterate over buffer objects owning
+ * resources on LRU lists.
+ * @_cursor: struct ttm_bo_lru_cursor to use for the iteration.
+ * @_man: The resource manager whose LRU lists to iterate over.
+ * @_ctx: The struct ttm_operation_context to govern the @_bo locking.
+ * @_bo: The struct ttm_buffer_object pointer pointing to the buffer object
+ * for the current iteration.
+ *
+ * Iterate over all resources of @_man and for each resource, attempt to
+ * reference and lock (using the locking mode detailed in @_ctx) the buffer
+ * object it points to. If successful, assign @_bo to the address of the
+ * buffer object and update @_cursor. The iteration is guarded in the
+ * sense that @_cursor will be initialized before looping start and cleaned
+ * up at looping termination, even if terminated prematurely by, for
+ * example a return or break statement. Exiting the loop will also unlock
+ * (if needed) and unreference @_bo.
+ */
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
+		     (_bo) = ttm_bo_lru_cursor_next(_cursor))
+
 #endif
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 160d954a261e..54cd34a6e4c0 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -33,6 +33,7 @@
 
 struct device;
 struct seq_file;
+struct ttm_backup_flags;
 struct ttm_operation_ctx;
 struct ttm_pool;
 struct ttm_tt;
@@ -89,6 +90,13 @@ void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
 
+void ttm_pool_drop_backed_up(struct ttm_tt *tt);
+
+long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *ttm,
+		     const struct ttm_backup_flags *flags);
+int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+			       const struct ttm_operation_ctx *ctx);
+
 int ttm_pool_mgr_init(unsigned long num_pages);
 void ttm_pool_mgr_fini(void);
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 991edafdb2dd..13cf47f3322f 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -32,11 +32,13 @@
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
 
+struct ttm_backup;
 struct ttm_device;
 struct ttm_tt;
 struct ttm_resource;
 struct ttm_buffer_object;
 struct ttm_operation_ctx;
+struct ttm_pool_tt_restore;
 
 /**
  * struct ttm_tt - This is a structure holding the pages, caching- and aperture
@@ -85,17 +87,22 @@ struct ttm_tt {
 	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
 	 * used to assure pgprot always matches.
 	 *
+	 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
+	 * struct ttm_tt has been (possibly partially) backed up.
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
+	 *
 	 */
 #define TTM_TT_FLAG_SWAPPED		BIT(0)
 #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
 #define TTM_TT_FLAG_EXTERNAL		BIT(2)
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
 #define TTM_TT_FLAG_DECRYPTED		BIT(4)
+#define TTM_TT_FLAG_BACKED_UP	        BIT(5)
 
-#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
+#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
@@ -105,11 +112,20 @@ struct ttm_tt {
 	dma_addr_t *dma_address;
 	/** @swap_storage: Pointer to shmem struct file for swap storage. */
 	struct file *swap_storage;
+	/**
+	 * @backup: Pointer to backup struct for backed up tts.
+	 * Could be unified with @swap_storage. Meanwhile, the driver's
+	 * ttm_tt_create() callback is responsible for assigning
+	 * this field.
+	 */
+	struct ttm_backup *backup;
 	/**
 	 * @caching: The current caching state of the pages, see enum
 	 * ttm_caching.
 	 */
 	enum ttm_caching caching;
+	/** @restore: Partial restoration from backup state. TTM private */
+	struct ttm_pool_tt_restore *restore;
 };
 
 /**
@@ -129,9 +145,38 @@ static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
 	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
 }
 
+/**
+ * ttm_tt_is_swapped() - Whether the ttm_tt is swapped out or backed up
+ * @tt: The struct ttm_tt.
+ *
+ * Return: true if swapped or backed up, false otherwise.
+ */
 static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
 {
-	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
+	return tt->page_flags & (TTM_TT_FLAG_SWAPPED | TTM_TT_FLAG_BACKED_UP);
+}
+
+/**
+ * ttm_tt_is_backed_up() - Whether the ttm_tt backed up
+ * @tt: The struct ttm_tt.
+ *
+ * Return: true if swapped or backed up, false otherwise.
+ */
+static inline bool ttm_tt_is_backed_up(const struct ttm_tt *tt)
+{
+	return tt->page_flags & TTM_TT_FLAG_BACKED_UP;
+}
+
+/**
+ * ttm_tt_clear_backed_up() - Clear the ttm_tt backed-up status
+ * @tt: The struct ttm_tt.
+ *
+ * Drivers can use this functionto clear the backed-up status,
+ * for example before destroying or re-validating a purged tt.
+ */
+static inline void ttm_tt_clear_backed_up(struct ttm_tt *tt)
+{
+	tt->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
 }
 
 /**
@@ -235,6 +280,26 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
 struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
 					    struct ttm_tt *tt);
 unsigned long ttm_tt_pages_limit(void);
+
+/**
+ * struct ttm_backup_flags - Flags to govern backup behaviour.
+ * @purge: Free pages without backing up. Bypass pools.
+ * @writeback: Attempt to copy contents directly to swap space, even
+ * if that means blocking on writes to external memory.
+ */
+struct ttm_backup_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+};
+
+long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
+		   const struct ttm_backup_flags flags);
+
+int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
+		   const struct ttm_operation_ctx *ctx);
+
+int ttm_tt_setup_backup(struct ttm_tt *tt);
+
 #if IS_ENABLED(CONFIG_AGP)
 #include <linux/agp_backend.h>
 
-- 
2.48.1

