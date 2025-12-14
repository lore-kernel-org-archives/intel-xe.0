Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07038D5B16C
	for <intel-xe@archiver.kernel.org>; Sun, 14 Dec 2025 19:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C2610E011;
	Sun, 14 Dec 2025 19:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgyodS4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D6710E011
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Dec 2025 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765741522; x=1797277522;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=051SH8mrMQr9FrpBZnUIjnDUx+U/KRexScQRbSSIfbM=;
 b=fgyodS4pKGubAYdkpG0wCiKF00AjsNGeQ7rs0alk7Ckok5FMxPFaYcpY
 8OrudH8Fp6CdTbXdlzT1v8KhralS3VSGwNVwAeXfV85ScJT8CfDQ8d4Z1
 yeTUlcG5c7Uy1RKOfJ9SOoXOAvVmE56G/7mrbn77qgRBh8FSUIg9OLCqk
 EKKCHl0VfJHaowpvcJb1vez+D0ctzAxbzXdgHPhJNjUOP7b9PjLOlHwHV
 5oBzGj2L25Jmncgq2O5unjBzDXa4ZGL98n6pG0/v0Zx0eM0sFEA3JtgF5
 RbCwgRheg3f0Qtz/1E2otmNaHYOp2H40h+YgsQNDPdW1lFh9/sjTl76j9 A==;
X-CSE-ConnectionGUID: nIZu/H63R8GwAX1DC4EN4Q==
X-CSE-MsgGUID: XTRdMN82SBKziyx3SuepNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="55218281"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; d="scan'208";a="55218281"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 11:45:21 -0800
X-CSE-ConnectionGUID: W3t5hstzQJiqkP8FtVDFkQ==
X-CSE-MsgGUID: 0/OqbtUQR2m4Shnu1RrAeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; d="scan'208";a="220949952"
Received: from zzombora-mobl1 (HELO fedora) ([10.245.244.10])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 11:45:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm, drm/xe: Squashed Dynamic pagemaps and multi-device SVM
Date: Sun, 14 Dec 2025 20:45:00 +0100
Message-ID: <20251214194500.28342-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

For CI only. Please don't review.

Squashed commit of the following:

commit d6047035ab690e327ba4ec0515c1def0b221199d
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Nov 25 08:48:50 2025 +0100

    drm/pagemap: Support source migration over interconnect

    Support source interconnect migration by using the copy_to_ram() op
    of the source device private pages.

    Source interconnect migration is required to flush the L2 cache of
    the source device, which among other things is a requirement for
    correct global atomic operation. It also enables the source GPU to
    potentially decompress any compressed content which is not
    understood by peers, and finally for the PCIe case, it's expected
    that writes over PCIe will be faster than reads.

    The implementation can probably be improved by coalescing subregions
    with the same source.

    v5:
    - Update waiting for the pre_migrate_fence and comments around that,
      previously in another patch. (Himal).

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit d3802f7a2c7094f6e25054b2c261291fa3cab889
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Oct 15 10:12:02 2025 +0200

    drm/pagemap, drm/xe: Support destination migration over interconnect

    Support destination migration over interconnect when migrating from
    device-private pages with the same dev_pagemap owner.

    Since we now also collect device-private pages to migrate,
    also abort migration if the range to migrate is already
    fully populated with pages from the desired pagemap.

    Finally return -EBUSY from drm_pagemap_populate_mm()
    if the migration can't be completed without first migrating all
    pages in the range to system. It is expected that the caller
    will perform that before retrying the call to
    drm_pagemap_populate_mm().

    Assume for now that the drm_pagemap implementation is *not*
    capable of migrating data within the pagemap itself. This
    restriction will be configurable in upcoming patches.

    v3:
    - Fix a bug where the p2p dma-address was never used.
    - Postpone enabling destination interconnect migration,
      since xe devices require source interconnect migration to
      ensure the source L2 cache is flushed at migration time.
    - Update the drm_pagemap_migrate_to_devmem() interface to
      pass migration details.
    v4:
    - Define XE_INTERCONNECT_P2P unconditionally (CI)
    - Include a missing header (CI)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit a102c8a490171262aab8e54e03db95c4266d3e19
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Dec 4 12:15:42 2025 +0100

    drm/xe: Use drm_gpusvm_scan_mm()

    Use drm_gpusvm_scan_mm() to avoid unnecessarily calling into
    drm_pagemap_populate_mm();

    v3:
    - New patch.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 78aa781f1ceda405dd588b55dabe2fd739fd475f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Dec 4 11:57:14 2025 +0100

    drm/gpusvm: Introduce a function to scan the current migration state

    With multi-device we are much more likely to have multiple
    drm-gpusvm ranges pointing to the same struct mm range.

    To avoid calling into drm_pagemap_populate_mm(), which is always
    very costly, introduce a much less costly drm_gpusvm function,
    drm_gpusvm_scan_mm() to scan the current migration state.
    The device fault-handler and prefetcher can use this function to
    determine whether migration is really necessary.

    There are a couple of performance improvements that can be done
    for this function if it turns out to be too costly. Those are
    documented in the code.

    v3:
    - New patch.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 8267de742adab93c2fc106f86f4f8d724394508b
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Nov 18 12:35:28 2025 +0100

    drm/pagemap, drm/xe: Clean up the use of the device-private page owner

    Use the dev_pagemap->owner field wherever possible, simplifying
    the code slightly.

    v3: New patch

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 23d0d4cb8a67faa8a9d604c88d4293913033da88
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Nov 11 12:44:29 2025 +0100

    drm/xe/svm: Document how xe keeps drm_pagemap references

    As an aid to understanding the lifetime of the drm_pagemaps used
    by the xe driver, document how the xe driver keeps the
    drm_pagemap references.

    v3:
    - Fix formatting (Matt Brost)

    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 4cb36a7385c72fe177570ed23ebb53096c6f7f60
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Oct 1 11:52:58 2025 +0200

    drm/xe/vm: Add a couple of VM debug printouts

    Add debug printouts that are valueable for pagemap prefetch,
    migration and page collection.

    v2:
    - Add additional debug prinouts around migration and page collection.
    - Require CONFIG_DRM_XE_DEBUG_VM.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

commit 9ece5635f5ad53c5070309cc2131e70cce565913
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Feb 11 12:04:03 2025 +0100

    drm/xe: Support pcie p2p dma as a fast interconnect

    Mimic the dma-buf method using dma_[map|unmap]_resource to map
    for pcie-p2p dma.

    There's an ongoing area of work upstream to sort out how this best
    should be done. One method proposed is to add an additional
    pci_p2p_dma_pagemap aliasing the device_private pagemap and use
    the corresponding pci_p2p_dma_pagemap page as input for
    dma_map_page(). However, that would incur double the amount of
    memory and latency to set up the drm_pagemap and given the huge
    amount of memory present on modern GPUs, that would really not work.
    Hence the simple approach used in this patch.

    v2:
    - Simplify xe_page_to_pcie(). (Matt Brost)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 2db203fea96e51fa1936728a7adc2c9a6207b5dc
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 9 14:59:46 2025 +0200

    drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm

    Use device file descriptors and regions to represent pagemaps on
    foreign or local devices.

    The underlying files are type-checked at madvise time, and
    references are kept on the drm_pagemap as long as there is are
    madvises pointing to it.

    Extend the madvise preferred_location UAPI to support the region
    instance to identify the foreign placement.

    v2:
    - Improve UAPI documentation. (Matt Brost)
    - Sanitize preferred_mem_loc.region_instance madvise. (Matt Brost)
    - Clarify madvise drm_pagemap vs xe_pagemap refcounting. (Matt Brost)
    - Don't allow a foreign drm_pagemap madvise without a fast
      interconnect.
    v3:
    - Add a comment about reference-counting in xe_devmem_open() and
      remove the reference-count get-and-put. (Matt Brost)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 292202b61d7860af7a4295203a273c3eb6a15b51
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 9 15:05:48 2025 +0200

    drm/xe: Simplify madvise_preferred_mem_loc()

    Simplify madvise_preferred_mem_loc by removing repetitive patterns
    in favour of local variables.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 7ba99199ad8e21ef505a2b3786d6a99fa13d8478
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Oct 24 12:05:56 2025 +0200

    drm/xe: Use the vma attibute drm_pagemap to select where to migrate

    Honor the drm_pagemap vma attribute when migrating SVM pages.
    Ensure that when the desired placement is validated as device
    memory, that we also check that the requested drm_pagemap is
    consistent with the current.

    v2:
    - Initialize a struct drm_pagemap pointer to NULL that could
      otherwise be dereferenced uninitialized. (CI)
    - Remove a redundant assignment (Matt Brost)
    - Slightly improved commit message (Matt Brost)
    - Extended drm_pagemap validation.

    v3:
    - Fix a compilation error if CONFIG_DRM_GPUSVM is not enabled.
      (kernel test robot <lkp@intel.com>)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 0cb038d8eed2045d1e16f192acf326f5a9afda74
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 30 18:41:32 2025 +0200

    drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes

    As a consequence, struct xe_vma_mem_attr() can't simply be assigned
    or freed without taking the reference count of individual members
    into account. Also add helpers to do that.

    v2:
    - Move some calls to xe_vma_mem_attr_fini() to xe_vma_free(). (Matt Brost)
    v3:
    - Rebase.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2

commit 7c2747f329ae46b45f09e3bac9cd859ad292ed82
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Feb 6 09:04:13 2025 +0100

    drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner

    Register a driver-wide owner list, provide a callback to identify
    fast interconnects and use the drm_pagemap_util helper to allocate
    or reuse a suitable owner struct. For now we consider pagemaps on
    different tiles on the same device as having fast interconnect and
    thus the same owner.

    v2:
    - Fix up the error onion unwind in xe_pagemap_create(). (Matt Brost)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit abd85218ab32ae9546d37eebcc3dd27045a39dda
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Feb 5 09:12:08 2025 +0100

    drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus

    The hmm_range_fault() and the migration helpers currently need a common
    "owner" to identify pagemaps and clients with fast interconnect.
    Add a drm_pagemap utility to setup such owners by registering
    drm_pagemaps, in a registry, and for each new drm_pagemap,
    query which existing drm_pagemaps have fast interconnects with the new
    drm_pagemap.

    The "owner" scheme is limited in that it is static at drm_pagemap creation.
    Ideally one would want the owner to be adjusted at run-time, but that
    requires changes to hmm. If the proposed scheme becomes too limited,
    we need to revisit.

    v2:
    - Improve documentation of DRM_PAGEMAP_OWNER_LIST_DEFINE(). (Matt Brost)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 4394e3ba72472e9402ebdb4a982578eaa4a82faa
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Oct 22 14:56:16 2025 +0200

    drm/pagemap: Remove the drm_pagemap_create() interface

    With the drm_pagemap_init() interface, drm_pagemap_create() is not
    used anymore.

    v2:
    - Slightly more verbose commit message. (Matt Brost)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit e68642427404f91be296bd2bdcc3103c7f14dcaa
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Oct 20 16:57:36 2025 +0200

    drm/xe: Use the drm_pagemap cache and shrinker

    Define a struct xe_pagemap that embeds all pagemap-related
    data used by xekmd, and use the drm_pagemap cache- and
    shrinker to manage lifetime.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 8a63ed28e1b9ddfe527cd807afbf21b89d93274f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Oct 22 10:39:18 2025 +0200

    drm/pagemap: Add a drm_pagemap cache and shrinker

    Pagemaps are costly to set up and tear down, and they consume a lot
    of system memory for the struct pages. Ideally they should be
    created only when needed.

    Add a caching mechanism to allow doing just that: Create the drm_pagemaps
    when needed for migration. Keep them around to avoid destruction and
    re-creation latencies and destroy inactive/unused drm_pagemaps on memory
    pressure using a shrinker.

    Only add the helper functions. They will be hooked up to the xe driver
    in the upcoming patch.

    v2:
    - Add lockdep checking for drm_pagemap_put(). (Matt Brost)
    - Add a copyright notice. (Matt Brost)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit f90500704d749ede40ee36b13fe55c0ea6ae8532
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Oct 21 11:25:45 2025 +0200

    drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes

    If a device holds a reference on a foregin device's drm_pagemap,
    and a device unbind is executed on the foreign device,
    Typically that foreign device would evict its device-private
    pages and then continue its device-managed cleanup eventually
    releasing its drm device and possibly allow for module unload.
    However, since we're still holding a reference on a drm_pagemap,
    when that reference is released and the provider module is
    unloaded we'd execute out of undefined memory.

    Therefore keep a reference on the provider device and module until
    the last drm_pagemap reference is gone.

    Note that in theory, the drm_gpusvm_helper module may be unloaded
    as soon as the final module_put() of the provider driver module is
    executed, so we need to add a module_exit() function that waits
    for the work item executing the module_put() has completed.

    v2:
    - Better commit message (Matt Brost)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit 6b74fb288df42d0c4e29a65a16036b5dcf3c670d
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Oct 20 15:32:04 2025 +0200

    drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd

    To be able to keep track of drm_pagemap usage, add a refcounted
    backpointer to struct drm_pagemap_zdd. This will keep the drm_pagemap
    reference count from dropping to zero as long as there are drm_pagemap
    pages present in a CPU address space.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

commit d2325462ab58a20921a88b9e5bc1fd203b5f37f3
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jan 3 16:08:23 2025 +0100

    drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap

    With the end goal of being able to free unused pagemaps
    and allocate them on demand, add a refcount to struct drm_pagemap,
    remove the xe embedded drm_pagemap, allocating and freeing it
    explicitly.

    v2:
    - Make the drm_pagemap pointer in drm_gpusvm_pages reference-counted.
    v3:
    - Call drm_pagemap_get() before drm_pagemap_put() in drm_gpusvm_pages
      (Himal Prasad Ghimiray)

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

commit 5f97733d22b2a165878f2ca8cf689fac219a0df7
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Dec 9 15:01:35 2025 +0100

    drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use

    In situations where no system memory is migrated to devmem, and in
    upcoming patches where another GPU is performing the migration to
    the newly allocated devmem buffer, there is nothing to ensure any
    ongoing clear to the devmem allocation or async eviction from the
    devmem allocation is complete.

    Address that by passing a struct dma_fence down to the copy
    functions, and ensure it is waited for before migration is marked
    complete.

    v3:
    - New patch.
    v4:
    - Update the logic used for determining when to wait for the
      pre_migrate_fence.
    - Update the logic used for determining when to warn for the
      pre_migrate_fence since the scheduler fences apparently
      can signal out-of-order.
    v5:
    - Fix a UAF (CI)
    - Remove references to source P2P migration (Himal)
    - Put the pre_migrate_fence after migration.

    Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.15+
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 9c9baa65ceb660a67d76a20b8883f920454736f9
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Nov 7 13:09:54 2025 +0100

    drm/xe/svm: Fix a debug printout

    Avoid spamming the log with drm_info(). Use drm_dbg() instead.

    Fixes: cc795e041034 ("drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: <stable@vger.kernel.org> # v6.17+
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Makefile             |   3 +-
 drivers/gpu/drm/drm_gpusvm.c         | 124 +++++
 drivers/gpu/drm/drm_pagemap.c        | 556 ++++++++++++++++++---
 drivers/gpu/drm/drm_pagemap_util.c   | 568 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  20 +
 drivers/gpu/drm/xe/xe_device.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_migrate.c      |   4 +-
 drivers/gpu/drm/xe/xe_svm.c          | 720 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.h          |  85 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  34 +-
 drivers/gpu/drm/xe/xe_tile.h         |  21 +
 drivers/gpu/drm/xe/xe_userptr.c      |   2 +-
 drivers/gpu/drm/xe/xe_vm.c           |  65 ++-
 drivers/gpu/drm/xe/xe_vm.h           |   1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 106 +++-
 drivers/gpu/drm/xe/xe_vm_types.h     |  21 +-
 drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
 include/drm/drm_gpusvm.h             |  29 ++
 include/drm/drm_pagemap.h            | 128 ++++-
 include/drm/drm_pagemap_util.h       |  92 ++++
 include/uapi/drm/xe_drm.h            |  18 +-
 22 files changed, 2329 insertions(+), 290 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 include/drm/drm_pagemap_util.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4b3f3ad5058a..44f2fb1fbf0b 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -109,7 +109,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 drm_gpusvm_helper-y := \
 	drm_gpusvm.o\
-	drm_pagemap.o
+	drm_pagemap.o\
+	drm_pagemap_util.o
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 39c8c50401dd..aa9a0b60e727 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -743,6 +743,127 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
 	return err ? false : true;
 }
 
+/**
+ * drm_gpusvm_scan_mm() - Check the migration state of a drm_gpusvm_range
+ * @range: Pointer to the struct drm_gpusvm_range to check.
+ * @dev_private_owner: The struct dev_private_owner to use to determine
+ * compatible device-private pages.
+ * @pagemap: The struct dev_pagemap pointer to use for pagemap-specific
+ * checks.
+ *
+ * Scan the CPU address space corresponding to @range and return the
+ * current migration state. Note that the result may be invalid as
+ * soon as the function returns. It's an advisory check.
+ *
+ * TODO: Bail early and call hmm_range_fault() for subranges.
+ *
+ * Return: See &enum drm_gpusvm_scan_result.
+ */
+enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
+					       void *dev_private_owner,
+					       const struct dev_pagemap *pagemap)
+{
+	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
+	unsigned long start = drm_gpusvm_range_start(range);
+	unsigned long end = drm_gpusvm_range_end(range);
+	struct hmm_range hmm_range = {
+		.default_flags = 0,
+		.notifier = notifier,
+		.start = start,
+		.end = end,
+		.dev_private_owner = dev_private_owner,
+	};
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
+	unsigned long *pfns;
+	unsigned long npages = npages_in_range(start, end);
+	const struct dev_pagemap *other = NULL;
+	int err, i;
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
+		return DRM_GPUSVM_SCAN_UNPOPULATED;
+
+	hmm_range.hmm_pfns = pfns;
+
+retry:
+	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
+	mmap_read_lock(range->gpusvm->mm);
+
+	while (true) {
+		err = hmm_range_fault(&hmm_range);
+		if (err == -EBUSY) {
+			if (time_after(jiffies, timeout))
+				break;
+
+			hmm_range.notifier_seq =
+				mmu_interval_read_begin(notifier);
+			continue;
+		}
+		break;
+	}
+	mmap_read_unlock(range->gpusvm->mm);
+	if (err)
+		goto err_free;
+
+	drm_gpusvm_notifier_lock(range->gpusvm);
+	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
+		drm_gpusvm_notifier_unlock(range->gpusvm);
+		goto retry;
+	}
+
+	for (i = 0; i < npages;) {
+		struct page *page;
+		const struct dev_pagemap *cur = NULL;
+
+		if (!(pfns[i] & HMM_PFN_VALID)) {
+			state = DRM_GPUSVM_SCAN_UNPOPULATED;
+			goto err_free;
+		}
+
+		page = hmm_pfn_to_page(pfns[i]);
+		if (is_device_private_page(page) ||
+		    is_device_coherent_page(page))
+			cur = page_pgmap(page);
+
+		if (cur == pagemap) {
+			new_state = DRM_GPUSVM_SCAN_EQUAL;
+		} else if (cur && (cur == other || !other)) {
+			new_state = DRM_GPUSVM_SCAN_OTHER;
+			other = cur;
+		} else if (cur) {
+			new_state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
+		} else {
+			new_state = DRM_GPUSVM_SCAN_SYSTEM;
+		}
+
+		/*
+		 * TODO: Could use an array for state
+		 * transitions, and caller might want it
+		 * to bail early for some results.
+		 */
+		if (state == DRM_GPUSVM_SCAN_UNPOPULATED) {
+			state = new_state;
+		} else if (state != new_state) {
+			if (new_state == DRM_GPUSVM_SCAN_SYSTEM ||
+			    state == DRM_GPUSVM_SCAN_SYSTEM)
+				state = DRM_GPUSVM_SCAN_MIXED;
+			else if (state != DRM_GPUSVM_SCAN_MIXED)
+				state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
+		}
+
+		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
+	}
+
+err_free:
+	drm_gpusvm_notifier_unlock(range->gpusvm);
+
+	kvfree(pfns);
+	return state;
+}
+EXPORT_SYMBOL(drm_gpusvm_scan_mm);
+
 /**
  * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1038,6 +1159,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		flags.has_dma_mapping = false;
 		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
+		drm_pagemap_put(svm_pages->dpagemap);
 		svm_pages->dpagemap = NULL;
 	}
 }
@@ -1434,6 +1556,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 
 	if (pagemap) {
 		flags.has_devmem_pages = true;
+		drm_pagemap_get(dpagemap);
+		drm_pagemap_put(svm_pages->dpagemap);
 		svm_pages->dpagemap = dpagemap;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 22c44807e3fe..7f5ed1c5427c 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -3,11 +3,14 @@
  * Copyright © 2024-2025 Intel Corporation
  */
 
+#include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
 #include <linux/migrate.h>
 #include <linux/pagemap.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
+#include <drm/drm_print.h>
 
 /**
  * DOC: Overview
@@ -62,7 +65,7 @@
  *
  * @refcount: Reference count for the zdd
  * @devmem_allocation: device memory allocation
- * @device_private_page_owner: Device private pages owner
+ * @dpagemap: Refcounted pointer to the underlying struct drm_pagemap.
  *
  * This structure serves as a generic wrapper installed in
  * page->zone_device_data. It provides infrastructure for looking up a device
@@ -74,12 +77,12 @@
 struct drm_pagemap_zdd {
 	struct kref refcount;
 	struct drm_pagemap_devmem *devmem_allocation;
-	void *device_private_page_owner;
+	struct drm_pagemap *dpagemap;
 };
 
 /**
  * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
- * @device_private_page_owner: Device private pages owner
+ * @dpagemap: Pointer to the underlying struct drm_pagemap.
  *
  * This function allocates and initializes a new zdd structure. It sets up the
  * reference count and initializes the destroy work.
@@ -87,7 +90,7 @@ struct drm_pagemap_zdd {
  * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
  */
 static struct drm_pagemap_zdd *
-drm_pagemap_zdd_alloc(void *device_private_page_owner)
+drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap)
 {
 	struct drm_pagemap_zdd *zdd;
 
@@ -97,7 +100,7 @@ drm_pagemap_zdd_alloc(void *device_private_page_owner)
 
 	kref_init(&zdd->refcount);
 	zdd->devmem_allocation = NULL;
-	zdd->device_private_page_owner = device_private_page_owner;
+	zdd->dpagemap = drm_pagemap_get(dpagemap);
 
 	return zdd;
 }
@@ -127,6 +130,7 @@ static void drm_pagemap_zdd_destroy(struct kref *ref)
 	struct drm_pagemap_zdd *zdd =
 		container_of(ref, struct drm_pagemap_zdd, refcount);
 	struct drm_pagemap_devmem *devmem = zdd->devmem_allocation;
+	struct drm_pagemap *dpagemap = zdd->dpagemap;
 
 	if (devmem) {
 		complete_all(&devmem->detached);
@@ -134,6 +138,7 @@ static void drm_pagemap_zdd_destroy(struct kref *ref)
 			devmem->ops->devmem_release(devmem);
 	}
 	kfree(zdd);
+	drm_pagemap_put(dpagemap);
 }
 
 /**
@@ -201,11 +206,13 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 
 /**
  * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
- * @dev: The device for which the pages are being mapped
- * @pagemap_addr: Array to store DMA information corresponding to mapped pages
- * @migrate_pfn: Array of migrate page frame numbers to map
- * @npages: Number of pages to map
+ * @dev: The device performing the migration.
+ * @local_dpagemap: The drm_pagemap local to the migrating device.
+ * @pagemap_addr: Array to store DMA information corresponding to mapped pages.
+ * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
+ * @npages: Number of system pages or peer pages to map.
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ * @mdetails: Details governing the migration behaviour.
  *
  * This function maps pages of memory for migration usage in GPU SVM. It
  * iterates over each page frame number provided in @migrate_pfn, maps the
@@ -215,12 +222,14 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  * Returns: 0 on success, -EFAULT if an error occurs during mapping.
  */
 static int drm_pagemap_migrate_map_pages(struct device *dev,
+					 struct drm_pagemap *local_dpagemap,
 					 struct drm_pagemap_addr *pagemap_addr,
 					 unsigned long *migrate_pfn,
 					 unsigned long npages,
-					 enum dma_data_direction dir)
+					 enum dma_data_direction dir,
+					 const struct drm_pagemap_migrate_details *mdetails)
 {
-	unsigned long i;
+	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
@@ -231,31 +240,58 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 		if (!page)
 			goto next;
 
-		if (WARN_ON_ONCE(is_zone_device_page(page)))
-			return -EFAULT;
-
 		folio = page_folio(page);
 		order = folio_order(folio);
 
-		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
-		if (dma_mapping_error(dev, dma_addr))
-			return -EFAULT;
-
-		pagemap_addr[i] =
-			drm_pagemap_addr_encode(dma_addr,
-						DRM_INTERCONNECT_SYSTEM,
-						order, dir);
+		if (is_device_private_page(page)) {
+			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap *dpagemap = zdd->dpagemap;
+			struct drm_pagemap_addr addr;
+
+			if (dpagemap == local_dpagemap) {
+				if (!mdetails->can_migrate_same_pagemap)
+					goto next;
+
+				num_local_pages += NR_PAGES(order);
+			} else {
+				num_peer_pages += NR_PAGES(order);
+			}
+
+			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
+			if (dma_mapping_error(dev, addr.addr))
+				return -EFAULT;
+
+			pagemap_addr[i] = addr;
+		} else {
+			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
+			if (dma_mapping_error(dev, dma_addr))
+				return -EFAULT;
+
+			pagemap_addr[i] =
+				drm_pagemap_addr_encode(dma_addr,
+							DRM_INTERCONNECT_SYSTEM,
+							order, dir);
+		}
 
 next:
 		i += NR_PAGES(order);
 	}
 
+	if (num_peer_pages)
+		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
+			num_peer_pages);
+	if (num_local_pages)
+		drm_dbg(local_dpagemap->drm, "Migrating %lu local pages over interconnect.\n",
+			num_local_pages);
+
 	return 0;
 }
 
 /**
  * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
  * @dev: The device for which the pages were mapped
+ * @migrate_pfn: Array of migrate pfns set up for the mapped pages. Used to
+ * determine the drm_pagemap of a peer device private page.
  * @pagemap_addr: Array of DMA information corresponding to mapped pages
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
@@ -266,16 +302,27 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
  */
 static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 					    struct drm_pagemap_addr *pagemap_addr,
+					    unsigned long *migrate_pfn,
 					    unsigned long npages,
 					    enum dma_data_direction dir)
 {
 	unsigned long i;
 
 	for (i = 0; i < npages;) {
-		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+
+		if (!page || !pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
 			goto next;
 
-		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
+		if (is_zone_device_page(page)) {
+			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap *dpagemap = zdd->dpagemap;
+
+			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
+		} else {
+			dma_unmap_page(dev, pagemap_addr[i].addr,
+				       PAGE_SIZE << pagemap_addr[i].order, dir);
+		}
 
 next:
 		i += NR_PAGES(pagemap_addr[i].order);
@@ -288,6 +335,115 @@ npages_in_range(unsigned long start, unsigned long end)
 	return (end - start) >> PAGE_SHIFT;
 }
 
+static int
+drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
+				    struct device *remote_device,
+				    struct drm_pagemap *remote_dpagemap,
+				    unsigned long local_pfns[],
+				    struct page *remote_pages[],
+				    struct drm_pagemap_addr pagemap_addr[],
+				    unsigned long npages,
+				    const struct drm_pagemap_devmem_ops *ops,
+				    const struct drm_pagemap_migrate_details *mdetails)
+
+{
+	int err = drm_pagemap_migrate_map_pages(remote_device, remote_dpagemap,
+						pagemap_addr, local_pfns,
+						npages, DMA_FROM_DEVICE, mdetails);
+
+	if (err)
+		goto out;
+
+	err = ops->copy_to_ram(remote_pages, pagemap_addr, npages,
+			       devmem->pre_migrate_fence);
+out:
+	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
+					npages, DMA_FROM_DEVICE);
+	return err;
+}
+
+static int
+drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
+			       unsigned long sys_pfns[],
+			       struct page *local_pages[],
+			       struct drm_pagemap_addr pagemap_addr[],
+			       unsigned long npages,
+			       const struct drm_pagemap_devmem_ops *ops,
+			       const struct drm_pagemap_migrate_details *mdetails)
+{
+	int err = drm_pagemap_migrate_map_pages(devmem->dev, devmem->dpagemap,
+						pagemap_addr, sys_pfns, npages,
+						DMA_TO_DEVICE, mdetails);
+
+	if (err)
+		goto out;
+
+	err = ops->copy_to_devmem(local_pages, pagemap_addr, npages,
+				  devmem->pre_migrate_fence);
+out:
+	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
+					DMA_TO_DEVICE);
+	return err;
+}
+
+/**
+ * struct migrate_range_loc - Cursor into the loop over migrate_pfns for migrating to
+ * device.
+ * @start: The current loop index.
+ * @device: migrating device.
+ * @dpagemap: Pointer to struct drm_pagemap used by the migrating device.
+ * @ops: The copy ops to be used for the migrating device.
+ */
+struct migrate_range_loc {
+	unsigned long start;
+	struct device *device;
+	struct drm_pagemap *dpagemap;
+	const struct drm_pagemap_devmem_ops *ops;
+};
+
+static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
+				     unsigned long src_pfns[],
+				     unsigned long dst_pfns[],
+				     struct page *pages[],
+				     struct drm_pagemap_addr pagemap_addr[],
+				     struct migrate_range_loc *last,
+				     const struct migrate_range_loc *cur,
+				     const struct drm_pagemap_migrate_details *mdetails)
+{
+	int ret = 0;
+
+	if (cur->start == 0)
+		goto out;
+
+	if (cur->start <= last->start)
+		return 0;
+
+	if (cur->dpagemap == last->dpagemap && cur->ops == last->ops)
+		return 0;
+
+	if (last->dpagemap)
+		ret = drm_pagemap_migrate_remote_to_local(devmem,
+							  last->device,
+							  last->dpagemap,
+							  &dst_pfns[last->start],
+							  &pages[last->start],
+							  &pagemap_addr[last->start],
+							  cur->start - last->start,
+							  last->ops, mdetails);
+
+	else
+		ret = drm_pagemap_migrate_sys_to_dev(devmem,
+						     &src_pfns[last->start],
+						     &pages[last->start],
+						     &pagemap_addr[last->start],
+						     cur->start - last->start,
+						     last->ops, mdetails);
+
+out:
+	*last = *cur;
+	return ret;
+}
+
 /**
  * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
  * @devmem_allocation: The device memory allocation to migrate to.
@@ -297,9 +453,7 @@ npages_in_range(unsigned long start, unsigned long end)
  * @mm: Pointer to the struct mm_struct.
  * @start: Start of the virtual address range to migrate.
  * @end: End of the virtual address range to migrate.
- * @timeslice_ms: The time requested for the migrated pagemap pages to
- * be present in @mm before being allowed to be migrated back.
- * @pgmap_owner: Not used currently, since only system memory is considered.
+ * @mdetails: Details to govern the migration.
  *
  * This function migrates the specified virtual address range to device memory.
  * It performs the necessary setup and invokes the driver-specific operations for
@@ -317,17 +471,21 @@ npages_in_range(unsigned long start, unsigned long end)
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
-				  unsigned long timeslice_ms,
-				  void *pgmap_owner)
+				  const struct drm_pagemap_migrate_details *mdetails)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
+	struct dev_pagemap *pagemap = dpagemap->pagemap;
 	struct migrate_vma migrate = {
 		.start		= start,
 		.end		= end,
-		.pgmap_owner	= pgmap_owner,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.pgmap_owner	= pagemap->owner,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
+		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
 	};
 	unsigned long i, npages = npages_in_range(start, end);
+	unsigned long own_pages = 0, migrated_pages = 0;
+	struct migrate_range_loc cur, last = {.device = dpagemap->drm->dev, .ops = ops};
 	struct vm_area_struct *vas;
 	struct drm_pagemap_zdd *zdd = NULL;
 	struct page **pages;
@@ -366,11 +524,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
 	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
 
-	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
+	zdd = drm_pagemap_zdd_alloc(dpagemap);
 	if (!zdd) {
 		err = -ENOMEM;
-		goto err_free;
+		kvfree(buf);
+		goto err_out;
 	}
+	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 	migrate.vma = vas;
 	migrate.src = buf;
@@ -381,54 +541,125 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_free;
 
 	if (!migrate.cpages) {
-		err = -EFAULT;
+		/* No pages to migrate. Raced or unknown device pages. */
+		err = -EBUSY;
 		goto err_free;
 	}
 
 	if (migrate.cpages != npages) {
+		/*
+		 * Some pages to migrate. But we want to migrate all or
+		 * nothing. Raced or unknown device pages.
+		 */
 		err = -EBUSY;
-		goto err_finalize;
+		goto err_aborted_migration;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
-	if (err)
-		goto err_finalize;
+	/* Count device-private pages to migrate */
+	for (i = 0; i < npages; ++i) {
+		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
+
+		if (src_page && is_zone_device_page(src_page)) {
+			if (page_pgmap(src_page) == pagemap)
+				own_pages++;
+		}
+	}
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
-					    migrate.src, npages, DMA_TO_DEVICE);
+	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages: %lu.\n",
+		npages, own_pages);
+	if (own_pages == npages) {
+		err = 0;
+		drm_dbg(dpagemap->drm, "Migration wasn't necessary.\n");
+		goto err_aborted_migration;
+	} else if (own_pages && mdetails->can_migrate_same_pagemap) {
+		err = -EBUSY;
+		drm_dbg(dpagemap->drm, "Migration aborted due to fragmentation.\n");
+		goto err_aborted_migration;
+	}
 
+	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_finalize;
 
+	own_pages = 0;
+
 	for (i = 0; i < npages; ++i) {
 		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
+		cur.start = i;
 
-		pages[i] = page;
+		pages[i] = NULL;
+		if (src_page && is_device_private_page(src_page)) {
+			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
+
+			if (page_pgmap(src_page) == pagemap &&
+			    !mdetails->can_migrate_same_pagemap) {
+				migrate.dst[i] = 0;
+				own_pages++;
+				continue;
+			}
+			if (mdetails->source_peer_migrates) {
+				cur.dpagemap = src_zdd->dpagemap;
+				cur.ops = src_zdd->devmem_allocation->ops;
+				cur.device = cur.dpagemap->drm->dev;
+				pages[i] = src_page;
+			}
+		}
+		if (!pages[i]) {
+			cur.dpagemap = NULL;
+			cur.ops = ops;
+			cur.device = dpagemap->drm->dev;
+			pages[i] = page;
+		}
 		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
-	}
 
-	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
+		/* If we switched the migrating drm_pagemap, migrate previous pages now */
+		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
+						pages, pagemap_addr, &last, &cur,
+						mdetails);
+		if (err)
+			goto err_finalize;
+	}
+	cur.start = npages;
+	cur.ops = NULL; /* Force migration */
+	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
+					pages, pagemap_addr, &last, &cur, mdetails);
 	if (err)
 		goto err_finalize;
 
+	drm_WARN_ON(dpagemap->drm, !!own_pages);
+
+	dma_fence_put(devmem_allocation->pre_migrate_fence);
+	devmem_allocation->pre_migrate_fence = NULL;
+
 	/* Upon success bind devmem allocation to range and zdd */
 	devmem_allocation->timeslice_expiration = get_jiffies_64() +
-		msecs_to_jiffies(timeslice_ms);
-	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
+		msecs_to_jiffies(mdetails->timeslice_ms);
 
 err_finalize:
 	if (err)
 		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
+err_aborted_migration:
 	migrate_vma_pages(&migrate);
+
+	for (i = 0; i < npages; ++i)
+		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
+			migrated_pages++;
+
+	if (!err && migrated_pages < npages - own_pages) {
+		drm_dbg(dpagemap->drm, "Raced while finalizing migration.\n");
+		err = -EBUSY;
+	}
+
 	migrate_vma_finalize(&migrate);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
-					DMA_TO_DEVICE);
 err_free:
-	if (zdd)
-		drm_pagemap_zdd_put(zdd);
+	drm_pagemap_zdd_put(zdd);
 	kvfree(buf);
+	return err;
+
 err_out:
+	devmem_allocation->ops->devmem_release(devmem_allocation);
 	return err;
 }
 EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
@@ -538,6 +769,157 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 	return -ENOMEM;
 }
 
+static void drm_pagemap_dev_unhold_work(struct work_struct *work);
+static LLIST_HEAD(drm_pagemap_unhold_list);
+static DECLARE_WORK(drm_pagemap_work, drm_pagemap_dev_unhold_work);
+
+/**
+ * struct drm_pagemap_dev_hold - Struct to aid in drm_device release.
+ * @link: Link into drm_pagemap_unhold_list for deferred reference releases.
+ * @drm: drm device to put.
+ *
+ * When a struct drm_pagemap is released, we also need to release the
+ * reference it holds on the drm device. However, typically that needs
+ * to be done separately from a system-wide workqueue.
+ * Each time a struct drm_pagemap is initialized
+ * (or re-initialized if cached) therefore allocate a separate
+ * drm_pagemap_dev_hold item, from which we put the drm device and
+ * associated module.
+ */
+struct drm_pagemap_dev_hold {
+	struct llist_node link;
+	struct drm_device *drm;
+};
+
+static void drm_pagemap_release(struct kref *ref)
+{
+	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
+	struct drm_pagemap_dev_hold *dev_hold = dpagemap->dev_hold;
+
+	/*
+	 * We know the pagemap provider is alive at this point, since
+	 * the struct drm_pagemap_dev_hold holds a reference to the
+	 * pagemap provider drm_device and its module.
+	 */
+	dpagemap->dev_hold = NULL;
+	drm_pagemap_shrinker_add(dpagemap);
+	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
+	schedule_work(&drm_pagemap_work);
+	/*
+	 * Here, either the provider device is still alive, since if called from
+	 * page_free(), the caller is holding a reference on the dev_pagemap,
+	 * or if called from drm_pagemap_put(), the direct caller is still alive.
+	 * This ensures we can't race with THIS module unload.
+	 */
+}
+
+static void drm_pagemap_dev_unhold_work(struct work_struct *work)
+{
+	struct llist_node *node = llist_del_all(&drm_pagemap_unhold_list);
+	struct drm_pagemap_dev_hold *dev_hold, *next;
+
+	/*
+	 * Deferred release of drm_pagemap provider device and module.
+	 * THIS module is kept alive during the release by the
+	 * flush_work() in the drm_pagemap_exit() function.
+	 */
+	llist_for_each_entry_safe(dev_hold, next, node, link) {
+		struct drm_device *drm = dev_hold->drm;
+		struct module *module = drm->driver->fops->owner;
+
+		drm_dbg(drm, "Releasing reference on provider device and module.\n");
+		drm_dev_put(drm);
+		module_put(module);
+		kfree(dev_hold);
+	}
+}
+
+static struct drm_pagemap_dev_hold *
+drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
+{
+	struct drm_pagemap_dev_hold *dev_hold;
+	struct drm_device *drm = dpagemap->drm;
+
+	dev_hold = kzalloc(sizeof(*dev_hold), GFP_KERNEL);
+	if (!dev_hold)
+		return ERR_PTR(-ENOMEM);
+
+	init_llist_node(&dev_hold->link);
+	dev_hold->drm = drm;
+	(void)try_module_get(drm->driver->fops->owner);
+	drm_dev_get(drm);
+
+	return dev_hold;
+}
+
+/**
+ * drm_pagemap_reinit() - Reinitialize a drm_pagemap
+ * @dpagemap: The drm_pagemap to reinitialize
+ *
+ * Reinitialize a drm_pagemap, for which drm_pagemap_release
+ * has already been called. This interface is intended for the
+ * situation where the driver caches a destroyed drm_pagemap.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
+{
+	dpagemap->dev_hold = drm_pagemap_dev_hold(dpagemap);
+	if (IS_ERR(dpagemap->dev_hold))
+		return PTR_ERR(dpagemap->dev_hold);
+
+	kref_init(&dpagemap->ref);
+	return 0;
+}
+EXPORT_SYMBOL(drm_pagemap_reinit);
+
+/**
+ * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
+ * @dpagemap: The drm_pagemap to initialize.
+ * @pagemap: The associated dev_pagemap providing the device
+ * private pages.
+ * @drm: The drm device. The drm_pagemap holds a reference on the
+ * drm_device and the module owning the drm_device until
+ * drm_pagemap_release(). This facilitates drm_pagemap exporting.
+ * @ops: The drm_pagemap ops.
+ *
+ * Initialize and take an initial reference on a drm_pagemap.
+ * After successful return, use drm_pagemap_put() to destroy.
+ *
+ ** Return: 0 on success, negative error code on error.
+ */
+int drm_pagemap_init(struct drm_pagemap *dpagemap,
+		     struct dev_pagemap *pagemap,
+		     struct drm_device *drm,
+		     const struct drm_pagemap_ops *ops)
+{
+	kref_init(&dpagemap->ref);
+	dpagemap->ops = ops;
+	dpagemap->pagemap = pagemap;
+	dpagemap->drm = drm;
+	dpagemap->cache = NULL;
+	INIT_LIST_HEAD(&dpagemap->shrink_link);
+
+	return drm_pagemap_reinit(dpagemap);
+}
+EXPORT_SYMBOL(drm_pagemap_init);
+
+/**
+ * drm_pagemap_put() - Put a struct drm_pagemap reference
+ * @dpagemap: Pointer to a struct drm_pagemap object.
+ *
+ * Puts a struct drm_pagemap reference and frees the drm_pagemap object
+ * if the refount reaches zero.
+ */
+void drm_pagemap_put(struct drm_pagemap *dpagemap)
+{
+	if (likely(dpagemap)) {
+		drm_pagemap_shrinker_might_lock(dpagemap);
+		kref_put(&dpagemap->ref, drm_pagemap_release);
+	}
+}
+EXPORT_SYMBOL(drm_pagemap_put);
+
 /**
  * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
  * @devmem_allocation: Pointer to the device memory allocation
@@ -550,6 +932,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct drm_pagemap_migrate_details mdetails = {};
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
@@ -588,15 +971,17 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (err || !mpages)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
-					    dst, npages, DMA_FROM_DEVICE);
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
+					    devmem_allocation->dpagemap, pagemap_addr,
+					    dst, npages, DMA_FROM_DEVICE,
+					    &mdetails);
 	if (err)
 		goto err_finalize;
 
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(src[i]);
 
-	err = ops->copy_to_ram(pages, pagemap_addr, npages);
+	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
 	if (err)
 		goto err_finalize;
 
@@ -605,8 +990,9 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 		drm_pagemap_migration_unlock_put_pages(npages, dst);
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
 					DMA_FROM_DEVICE);
+
 err_free:
 	kvfree(buf);
 err_out:
@@ -627,8 +1013,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
 /**
  * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
  * @vas: Pointer to the VM area structure
- * @device_private_page_owner: Device private pages owner
- * @page: Pointer to the page for fault handling (can be NULL)
+ * @page: Pointer to the page for fault handling.
  * @fault_addr: Fault address
  * @size: Size of migration
  *
@@ -639,18 +1024,18 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
  * Return: 0 on success, negative error code on failure.
  */
 static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
-					void *device_private_page_owner,
 					struct page *page,
 					unsigned long fault_addr,
 					unsigned long size)
 {
 	struct migrate_vma migrate = {
 		.vma		= vas,
-		.pgmap_owner	= device_private_page_owner,
+		.pgmap_owner	= page_pgmap(page)->owner,
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
 		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 		.fault_page	= page,
 	};
+	struct drm_pagemap_migrate_details mdetails = {};
 	struct drm_pagemap_zdd *zdd;
 	const struct drm_pagemap_devmem_ops *ops;
 	struct device *dev = NULL;
@@ -661,12 +1046,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
-	if (page) {
-		zdd = page->zone_device_data;
-		if (time_before64(get_jiffies_64(),
-				  zdd->devmem_allocation->timeslice_expiration))
-			return 0;
-	}
+	zdd = page->zone_device_data;
+	if (time_before64(get_jiffies_64(), zdd->devmem_allocation->timeslice_expiration))
+		return 0;
 
 	start = ALIGN_DOWN(fault_addr, size);
 	end = ALIGN(fault_addr + 1, size);
@@ -702,19 +1084,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (!migrate.cpages)
 		goto err_free;
 
-	if (!page) {
-		for (i = 0; i < npages; ++i) {
-			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
-				continue;
-
-			page = migrate_pfn_to_page(migrate.src[i]);
-			break;
-		}
-
-		if (!page)
-			goto err_finalize;
-	}
-	zdd = page->zone_device_data;
 	ops = zdd->devmem_allocation->ops;
 	dev = zdd->devmem_allocation->dev;
 
@@ -724,15 +1093,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
-					    DMA_FROM_DEVICE);
+	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
+					    DMA_FROM_DEVICE, &mdetails);
 	if (err)
 		goto err_finalize;
 
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(migrate.src[i]);
 
-	err = ops->copy_to_ram(pages, pagemap_addr, npages);
+	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
 	if (err)
 		goto err_finalize;
 
@@ -742,8 +1111,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	migrate_vma_pages(&migrate);
 	migrate_vma_finalize(&migrate);
 	if (dev)
-		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
-						DMA_FROM_DEVICE);
+		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
+						npages, DMA_FROM_DEVICE);
 err_free:
 	kvfree(buf);
 err_out:
@@ -779,10 +1148,11 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
 	int err;
 
+	drm_pagemap_zdd_get(zdd);
 	err = __drm_pagemap_migrate_to_ram(vmf->vma,
-					   zdd->device_private_page_owner,
 					   vmf->page, vmf->address,
 					   zdd->devmem_allocation->size);
+	drm_pagemap_zdd_put(zdd);
 
 	return err ? VM_FAULT_SIGBUS : 0;
 }
@@ -813,11 +1183,14 @@ EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
  * @ops: Pointer to the operations structure for GPU SVM device memory
  * @dpagemap: The struct drm_pagemap we're allocating from.
  * @size: Size of device memory allocation
+ * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
+ * (May be NULL).
  */
 void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     struct device *dev, struct mm_struct *mm,
 			     const struct drm_pagemap_devmem_ops *ops,
-			     struct drm_pagemap *dpagemap, size_t size)
+			     struct drm_pagemap *dpagemap, size_t size,
+			     struct dma_fence *pre_migrate_fence)
 {
 	init_completion(&devmem_allocation->detached);
 	devmem_allocation->dev = dev;
@@ -825,6 +1198,7 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 	devmem_allocation->ops = ops;
 	devmem_allocation->dpagemap = dpagemap;
 	devmem_allocation->size = size;
+	devmem_allocation->pre_migrate_fence = pre_migrate_fence;
 }
 EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
 
@@ -880,3 +1254,19 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	return err;
 }
 EXPORT_SYMBOL(drm_pagemap_populate_mm);
+
+void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim)
+{
+	if (dpagemap->ops->destroy)
+		dpagemap->ops->destroy(dpagemap, is_atomic_or_reclaim);
+	else
+		kfree(dpagemap);
+}
+
+static void drm_pagemap_exit(void)
+{
+	flush_work(&drm_pagemap_work);
+	if (WARN_ON(!llist_empty(&drm_pagemap_unhold_list)))
+		disable_work_sync(&drm_pagemap_work);
+}
+module_exit(drm_pagemap_exit);
diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
new file mode 100644
index 000000000000..413183b2e871
--- /dev/null
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -0,0 +1,568 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/slab.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
+#include <drm/drm_print.h>
+
+/**
+ * struct drm_pagemap_cache - Lookup structure for pagemaps
+ *
+ * Structure to keep track of active (refcount > 1) and inactive
+ * (refcount == 0) pagemaps. Inactive pagemaps can be made active
+ * again by waiting for the @queued completion (indicating that the
+ * pagemap has been put on the @shrinker's list of shrinkable
+ * pagemaps, and then successfully removing it from @shrinker's
+ * list. The latter may fail if the shrinker is already in the
+ * process of freeing the pagemap. A struct drm_pagemap_cache can
+ * hold a single struct drm_pagemap.
+ */
+struct drm_pagemap_cache {
+	/** @lookup_mutex: Mutex making the lookup process atomic */
+	struct mutex lookup_mutex;
+	/** @lock: Lock protecting the @dpagemap pointer */
+	spinlock_t lock;
+	/** @shrinker: Pointer to the shrinker used for this cache. Immutable. */
+	struct drm_pagemap_shrinker *shrinker;
+	/** @dpagemap: Non-refcounted pointer to the drm_pagemap */
+	struct drm_pagemap *dpagemap;
+	/**
+	 * @queued: Signals when an inactive drm_pagemap has been put on
+	 * @shrinker's list.
+	 */
+	struct completion queued;
+};
+
+/**
+ * struct drm_pagemap_shrinker - Shrinker to remove unused pagemaps
+ */
+struct drm_pagemap_shrinker {
+	/** @drm: Pointer to the drm device. */
+	struct drm_device *drm;
+	/** @lock: Spinlock to protect the @dpagemaps list. */
+	spinlock_t lock;
+	/** @dpagemaps: List of unused dpagemaps. */
+	struct list_head dpagemaps;
+	/** @num_dpagemaps: Number of unused dpagemaps in @dpagemaps. */
+	atomic_t num_dpagemaps;
+	/** @shrink: Pointer to the struct shrinker. */
+	struct shrinker *shrink;
+};
+
+static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap);
+
+static void drm_pagemap_cache_fini(void *arg)
+{
+	struct drm_pagemap_cache *cache = arg;
+	struct drm_pagemap *dpagemap;
+
+	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
+	spin_lock(&cache->lock);
+	dpagemap = cache->dpagemap;
+	if (!dpagemap) {
+		spin_unlock(&cache->lock);
+		goto out;
+	}
+
+	if (drm_pagemap_shrinker_cancel(dpagemap)) {
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+		drm_pagemap_destroy(dpagemap, false);
+	}
+
+out:
+	mutex_destroy(&cache->lookup_mutex);
+	kfree(cache);
+}
+
+/**
+ * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
+ * @shrinker: Pointer to a struct drm_pagemap_shrinker.
+ *
+ * Create a device-managed drm_pagemap cache. The cache is automatically
+ * destroyed on struct device removal, at which point any *inactive*
+ * drm_pagemap's are destroyed.
+ *
+ * Return: Pointer to a struct drm_pagemap_cache on success. Error pointer
+ * on failure.
+ */
+struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker)
+{
+	struct drm_pagemap_cache *cache = kzalloc(sizeof(*cache), GFP_KERNEL);
+	int err;
+
+	if (!cache)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&cache->lookup_mutex);
+	spin_lock_init(&cache->lock);
+	cache->shrinker = shrinker;
+	init_completion(&cache->queued);
+	err = devm_add_action_or_reset(shrinker->drm->dev, drm_pagemap_cache_fini, cache);
+	if (err)
+		return ERR_PTR(err);
+
+	return cache;
+}
+EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
+
+/**
+ * DOC: Cache lookup
+ *
+ * Cache lookup should be done under a locked mutex, so that a
+ * failed drm_pagemap_get_from_cache() and a following
+ * drm_pagemap_cache_setpagemap() are carried out as an atomic
+ * operation WRT other lookups. Otherwise, racing lookups may
+ * unnecessarily concurrently create pagemaps to fulfill a
+ * failed lookup. The API provides two functions to perform this lock,
+ * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and they
+ * should be used in the following way:
+ *
+ * .. code-block:: c
+ *
+ *		drm_pagemap_lock_lookup(cache);
+ *		dpagemap = drm_pagemap_get_from_cache(cache);
+ *		if (dpagemap)
+ *			goto out_unlock;
+ *
+ *		dpagemap = driver_create_new_dpagemap();
+ *		if (!IS_ERR(dpagemap))
+ *			drm_pagemap_cache_set_pagemap(cache, dpagemap);
+ *
+ *     out_unlock:
+ *		drm_pagemap_unlock_lookup(cache);
+ */
+
+/**
+ * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for lookup
+ * @cache: The drm_pagemap_cache to lock.
+ *
+ * Return: %-EINTR if interrupted while blocking. %0 otherwise.
+ */
+int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache)
+{
+	return mutex_lock_interruptible(&cache->lookup_mutex);
+}
+EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
+
+/**
+ * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache after lookup
+ * @cache: The drm_pagemap_cache to unlock.
+ */
+void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache)
+{
+	mutex_unlock(&cache->lookup_mutex);
+}
+EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
+
+/**
+ * drm_pagemap_get_from_cache() -  Lookup of drm_pagemaps.
+ * @cache: The cache used for lookup.
+ *
+ * If an active pagemap is present in the cache, it is immediately returned.
+ * If an inactive pagemap is present, it's removed from the shrinker list and
+ * an attempt is made to make it active.
+ * If no pagemap present or the attempt to make it active failed, %NULL is returned
+ * to indicate to the caller to create a new drm_pagemap and insert it into
+ * the cache.
+ *
+ * Return: A reference-counted pointer to a drm_pagemap if successful. An error
+ * pointer if an error occurred, or %NULL if no drm_pagemap was found and
+ * the caller should insert a new one.
+ */
+struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache)
+{
+	struct drm_pagemap *dpagemap;
+	int err;
+
+	lockdep_assert_held(&cache->lookup_mutex);
+retry:
+	spin_lock(&cache->lock);
+	dpagemap = cache->dpagemap;
+	if (drm_pagemap_get_unless_zero(dpagemap)) {
+		spin_unlock(&cache->lock);
+		return dpagemap;
+	}
+
+	if (!dpagemap) {
+		spin_unlock(&cache->lock);
+		return NULL;
+	}
+
+	if (!try_wait_for_completion(&cache->queued)) {
+		spin_unlock(&cache->lock);
+		err = wait_for_completion_interruptible(&cache->queued);
+		if (err)
+			return ERR_PTR(err);
+		goto retry;
+	}
+
+	if (drm_pagemap_shrinker_cancel(dpagemap)) {
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+		err = drm_pagemap_reinit(dpagemap);
+		if (err) {
+			drm_pagemap_destroy(dpagemap, false);
+			return ERR_PTR(err);
+		}
+		drm_pagemap_cache_set_pagemap(cache, dpagemap);
+	} else {
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+		dpagemap = NULL;
+	}
+
+	return dpagemap;
+}
+EXPORT_SYMBOL(drm_pagemap_get_from_cache);
+
+/**
+ * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a drm_pagemap_cache
+ * @cache: The cache to assign the drm_pagemap to.
+ * @dpagemap: The drm_pagemap to assign.
+ *
+ * The function must be called to populate a drm_pagemap_cache only
+ * after a call to drm_pagemap_get_from_cache() returns NULL.
+ */
+void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap)
+{
+	struct drm_device *drm = dpagemap->drm;
+
+	lockdep_assert_held(&cache->lookup_mutex);
+	spin_lock(&cache->lock);
+	dpagemap->cache = cache;
+	swap(cache->dpagemap, dpagemap);
+	reinit_completion(&cache->queued);
+	spin_unlock(&cache->lock);
+	drm_WARN_ON(drm, !!dpagemap);
+}
+EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
+
+/**
+ * drm_pagemap_get_from_cache_if_active() - Quick lookup of active drm_pagemaps
+ * @cache: The cache to lookup from.
+ *
+ * Function that should be used to lookup a drm_pagemap that is already active.
+ * (refcount > 0).
+ *
+ * Return: A pointer to the cache's drm_pagemap if it's active; %NULL otherwise.
+ */
+struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache)
+{
+	struct drm_pagemap *dpagemap;
+
+	spin_lock(&cache->lock);
+	dpagemap = drm_pagemap_get_unless_zero(cache->dpagemap);
+	spin_unlock(&cache->lock);
+
+	return dpagemap;
+}
+EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
+
+static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap)
+{
+	struct drm_pagemap_cache *cache = dpagemap->cache;
+	struct drm_pagemap_shrinker *shrinker = cache->shrinker;
+
+	spin_lock(&shrinker->lock);
+	if (list_empty(&dpagemap->shrink_link)) {
+		spin_unlock(&shrinker->lock);
+		return false;
+	}
+
+	list_del_init(&dpagemap->shrink_link);
+	atomic_dec(&shrinker->num_dpagemaps);
+	spin_unlock(&shrinker->lock);
+	return true;
+}
+
+#ifdef CONFIG_PROVE_LOCKING
+/**
+ * drm_pagemap_shrinker_might_lock() - lockdep test for drm_pagemap_shrinker_add()
+ * @dpagemap: The drm pagemap.
+ *
+ * The drm_pagemap_shrinker_add() function performs some locking.
+ * This function can be called in code-paths that might
+ * call drm_pagemap_shrinker_add() to detect any lockdep problems early.
+ */
+void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap)
+{
+	int idx;
+
+	if (drm_dev_enter(dpagemap->drm, &idx)) {
+		struct drm_pagemap_cache *cache = dpagemap->cache;
+
+		if (cache)
+			might_lock(&cache->shrinker->lock);
+
+		drm_dev_exit(idx);
+	}
+}
+#endif
+
+/**
+ * drm_pagemap_shrinker_add() - Add a drm_pagemap to the shrinker list or destroy
+ * @dpagemap: The drm_pagemap.
+ *
+ * If @dpagemap is associated with a &struct drm_pagemap_cache AND the
+ * struct device backing the drm device is still alive, add @dpagemap to
+ * the &struct drm_pagemap_shrinker list of shrinkable drm_pagemaps.
+ *
+ * Otherwise destroy the pagemap directly using drm_pagemap_destroy().
+ *
+ * This is an internal function which is not intended to be exposed to drivers.
+ */
+void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)
+{
+	struct drm_pagemap_cache *cache;
+	struct drm_pagemap_shrinker *shrinker;
+	int idx;
+
+	/*
+	 * The pagemap cache and shrinker are disabled at
+	 * pci device remove time. After that, dpagemaps
+	 * are freed directly.
+	 */
+	if (!drm_dev_enter(dpagemap->drm, &idx))
+		goto out_no_cache;
+
+	cache = dpagemap->cache;
+	if (!cache) {
+		drm_dev_exit(idx);
+		goto out_no_cache;
+	}
+
+	shrinker = cache->shrinker;
+	spin_lock(&shrinker->lock);
+	list_add_tail(&dpagemap->shrink_link, &shrinker->dpagemaps);
+	atomic_inc(&shrinker->num_dpagemaps);
+	spin_unlock(&shrinker->lock);
+	complete_all(&cache->queued);
+	drm_dev_exit(idx);
+	return;
+
+out_no_cache:
+	drm_pagemap_destroy(dpagemap, true);
+}
+
+static unsigned long
+drm_pagemap_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
+	unsigned long count = atomic_read(&shrinker->num_dpagemaps);
+
+	return count ? : SHRINK_EMPTY;
+}
+
+static unsigned long
+drm_pagemap_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
+	struct drm_pagemap *dpagemap;
+	struct drm_pagemap_cache *cache;
+	unsigned long nr_freed = 0;
+
+	sc->nr_scanned = 0;
+	spin_lock(&shrinker->lock);
+	do {
+		dpagemap = list_first_entry_or_null(&shrinker->dpagemaps, typeof(*dpagemap),
+						    shrink_link);
+		if (!dpagemap)
+			break;
+
+		atomic_dec(&shrinker->num_dpagemaps);
+		list_del_init(&dpagemap->shrink_link);
+		spin_unlock(&shrinker->lock);
+
+		sc->nr_scanned++;
+		nr_freed++;
+
+		cache = dpagemap->cache;
+		spin_lock(&cache->lock);
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+
+		drm_dbg(dpagemap->drm, "Shrinking dpagemap %p.\n", dpagemap);
+		drm_pagemap_destroy(dpagemap, true);
+		spin_lock(&shrinker->lock);
+	} while (sc->nr_scanned < sc->nr_to_scan);
+	spin_unlock(&shrinker->lock);
+
+	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
+}
+
+static void drm_pagemap_shrinker_fini(void *arg)
+{
+	struct drm_pagemap_shrinker *shrinker = arg;
+
+	drm_dbg(shrinker->drm, "Destroying dpagemap shrinker.\n");
+	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker->num_dpagemaps));
+	shrinker_free(shrinker->shrink);
+	kfree(shrinker);
+}
+
+/**
+ * drm_pagemap_shrinker_create_devm() - Create and register a pagemap shrinker
+ * @drm: The drm device
+ *
+ * Create and register a pagemap shrinker that shrinks unused pagemaps
+ * and thereby reduces memory footprint.
+ * The shrinker is drm_device managed and unregisters itself when
+ * the drm device is removed.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
+{
+	struct drm_pagemap_shrinker *shrinker;
+	struct shrinker *shrink;
+	int err;
+
+	shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
+	if (!shrinker)
+		return ERR_PTR(-ENOMEM);
+
+	shrink = shrinker_alloc(0, "drm-drm_pagemap:%s", drm->unique);
+	if (!shrink) {
+		kfree(shrinker);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	spin_lock_init(&shrinker->lock);
+	INIT_LIST_HEAD(&shrinker->dpagemaps);
+	shrinker->drm = drm;
+	shrinker->shrink = shrink;
+	shrink->count_objects = drm_pagemap_shrinker_count;
+	shrink->scan_objects = drm_pagemap_shrinker_scan;
+	shrink->private_data = shrinker;
+	shrinker_register(shrink);
+
+	err = devm_add_action_or_reset(drm->dev, drm_pagemap_shrinker_fini, shrinker);
+	if (err)
+		return ERR_PTR(err);
+
+	return shrinker;
+}
+EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
+
+/**
+ * struct drm_pagemap_owner - Device interconnect group
+ * @kref: Reference count.
+ *
+ * A struct drm_pagemap_owner identifies a device interconnect group.
+ */
+struct drm_pagemap_owner {
+	struct kref kref;
+};
+
+static void drm_pagemap_owner_release(struct kref *kref)
+{
+	kfree(container_of(kref, struct drm_pagemap_owner, kref));
+}
+
+/**
+ * drm_pagemap_release_owner() - Stop participating in an interconnect group
+ * @peer: Pointer to the struct drm_pagemap_peer used when joining the group
+ *
+ * Stop participating in an interconnect group. This function is typically
+ * called when a pagemap is removed to indicate that it doesn't need to
+ * be taken into account.
+ */
+void drm_pagemap_release_owner(struct drm_pagemap_peer *peer)
+{
+	struct drm_pagemap_owner_list *owner_list = peer->list;
+
+	if (!owner_list)
+		return;
+
+	mutex_lock(&owner_list->lock);
+	list_del(&peer->link);
+	kref_put(&peer->owner->kref, drm_pagemap_owner_release);
+	peer->owner = NULL;
+	mutex_unlock(&owner_list->lock);
+}
+EXPORT_SYMBOL(drm_pagemap_release_owner);
+
+/**
+ * typedef interconnect_fn - Callback function to identify fast interconnects
+ * @peer1: First endpoint.
+ * @peer2: Second endpont.
+ *
+ * The function returns %true iff @peer1 and @peer2 have a fast interconnect.
+ * Note that this is symmetrical. The function has no notion of client and provider,
+ * which may not be sufficient in some cases. However, since the callback is intended
+ * to guide in providing common pagemap owners, the notion of a common owner to
+ * indicate fast interconnects would then have to change as well.
+ *
+ * Return: %true iff @peer1 and @peer2 have a fast interconnect. Otherwise @false.
+ */
+typedef bool (*interconnect_fn)(struct drm_pagemap_peer *peer1, struct drm_pagemap_peer *peer2);
+
+/**
+ * drm_pagemap_acquire_owner() - Join an interconnect group
+ * @peer: A struct drm_pagemap_peer keeping track of the device interconnect
+ * @owner_list: Pointer to the owner_list, keeping track of all interconnects
+ * @has_interconnect: Callback function to determine whether two peers have a
+ * fast local interconnect.
+ *
+ * Repeatedly calls @has_interconnect for @peer and other peers on @owner_list to
+ * determine a set of peers for which @peer has a fast interconnect. That set will
+ * have common &struct drm_pagemap_owner, and upon successful return, @peer::owner
+ * will point to that struct, holding a reference, and @peer will be registered in
+ * @owner_list. If @peer doesn't have any fast interconnects to other @peers, a
+ * new unique &struct drm_pagemap_owner will be allocated for it, and that
+ * may be shared with other peers that, at a later point, are determined to have
+ * a fast interconnect with @peer.
+ *
+ * When @peer no longer participates in an interconnect group,
+ * drm_pagemap_release_owner() should be called to drop the reference on the
+ * struct drm_pagemap_owner.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
+			      struct drm_pagemap_owner_list *owner_list,
+			      interconnect_fn has_interconnect)
+{
+	struct drm_pagemap_peer *cur_peer;
+	struct drm_pagemap_owner *owner = NULL;
+	bool interconnect = false;
+
+	mutex_lock(&owner_list->lock);
+	might_alloc(GFP_KERNEL);
+	list_for_each_entry(cur_peer, &owner_list->peers, link) {
+		if (cur_peer->owner != owner) {
+			if (owner && interconnect)
+				break;
+			owner = cur_peer->owner;
+			interconnect = true;
+		}
+		if (interconnect && !has_interconnect(peer, cur_peer))
+			interconnect = false;
+	}
+
+	if (!interconnect) {
+		owner = kmalloc(sizeof(*owner), GFP_KERNEL);
+		if (!owner) {
+			mutex_unlock(&owner_list->lock);
+			return -ENOMEM;
+		}
+		kref_init(&owner->kref);
+		list_add_tail(&peer->link, &owner_list->peers);
+	} else {
+		kref_get(&owner->kref);
+		list_add_tail(&peer->link, &cur_peer->link);
+	}
+	peer->owner = owner;
+	peer->list = owner_list;
+	mutex_unlock(&owner_list->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_pagemap_acquire_owner);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cdaa1c1e73f5..e8990ddeec36 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_pagemap_util.h>
 #include <drm/drm_print.h>
 #include <uapi/drm/xe_drm.h>
 
@@ -63,6 +64,7 @@
 #include "xe_shrinker.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
+#include "xe_svm.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -376,6 +378,20 @@ static const struct file_operations xe_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
+/**
+ * xe_is_xe_file() - Is the file an xe device file?
+ * @file: The file.
+ *
+ * Checks whether the file is opened against
+ * an xe device.
+ *
+ * Return: %true if an xe file, %false if not.
+ */
+bool xe_is_xe_file(const struct file *file)
+{
+	return file->f_op == &xe_driver_fops;
+}
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -471,6 +487,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	init_rwsem(&xe->usm.lock);
 
+	err = xe_pagemap_shrinker_create(xe);
+	if (err)
+		goto err;
+
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6604b89330d5..3e72fa4609f8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -200,6 +200,8 @@ void xe_file_put(struct xe_file *xef);
 
 int xe_is_injection_active(void);
 
+bool xe_is_xe_file(const struct file *file);
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 96acc43b94e1..fa47145cf7ff 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -36,6 +36,7 @@
 #define TEST_VM_OPS_ERROR
 #endif
 
+struct drm_pagemap_shrinker;
 struct intel_display;
 struct intel_dg_nvm_dev;
 struct xe_ggtt;
@@ -449,6 +450,10 @@ struct xe_device {
 #define XE_PAGEFAULT_QUEUE_COUNT	4
 		/** @usm.pf_queue: Page fault queues */
 		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
+		struct drm_pagemap_shrinker *dpagemap_shrinker;
+#endif
 	} usm;
 
 	/** @pinned: pinned BO state */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f3b66b55acfb..4edb41548000 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -35,6 +35,7 @@
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_validation.h"
@@ -2048,7 +2049,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 			u64 pte;
 
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
-				       DRM_INTERCONNECT_SYSTEM);
+				       DRM_INTERCONNECT_SYSTEM ||
+				       sram_addr[i].proto == XE_INTERCONNECT_P2P);
 			xe_tile_assert(m->tile, addr);
 			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 46977ec1e0de..e0f1fc2c18bc 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,7 +3,12 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <linux/pci-p2pdma.h>
+
 #include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
@@ -19,6 +24,38 @@
 #include "xe_vm_types.h"
 #include "xe_vram_types.h"
 
+/* Identifies subclasses of struct drm_pagemap_peer */
+#define XE_PEER_PAGEMAP ((void *)0ul)
+#define XE_PEER_VM ((void *)1ul)
+
+/**
+ * DOC: drm_pagemap reference-counting in xe:
+ *
+ * In addition to the drm_pagemap internal reference counting by its zone
+ * device data, the xe driver holds the following long-time references:
+ *
+ * - struct xe_pagemap:
+ *	The xe_pagemap struct derives from struct drm_pagemap and uses its
+ *	reference count.
+ * - SVM-enabled VMs:
+ *	SVM-enabled VMs look up and keeps a reference to all xe_pagemaps on
+ *	the same device.
+ * - VMAs:
+ *	vmas keep a reference on the drm_pagemap indicated by a gpu_madvise()
+ *	call.
+ *
+ * In addition, all drm_pagemap or xe_pagemap pointers where lifetime cannot
+ * be guaranteed by a vma reference under the vm lock should keep a reference.
+ * That includes the range->pages.dpagemap pointer.
+ */
+
+static int xe_svm_get_pagemaps(struct xe_vm *vm);
+
+void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
+{
+	return force_smem ? NULL : vm->svm.peer.owner;
+}
+
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
 	/*
@@ -287,10 +324,14 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 
 static void xe_vma_set_default_attributes(struct xe_vma *vma)
 {
-	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
-	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
-	vma->attr.pat_index = vma->attr.default_pat_index;
-	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+		.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		.pat_index = vma->attr.default_pat_index,
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+	};
+
+	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
 }
 
 static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
@@ -401,27 +442,47 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
-static struct xe_vram_region *page_to_vr(struct page *page)
+static struct xe_vram_region *xe_pagemap_to_vr(struct xe_pagemap *xpagemap)
 {
-	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
+	return xpagemap->vr;
 }
 
-static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
-				      struct page *page)
+static struct xe_pagemap *xe_page_to_pagemap(struct page *page)
 {
-	u64 dpa;
+	return container_of(page_pgmap(page), struct xe_pagemap, pagemap);
+}
+
+static struct xe_vram_region *xe_page_to_vr(struct page *page)
+{
+	return xe_pagemap_to_vr(xe_page_to_pagemap(page));
+}
+
+static u64 xe_page_to_dpa(struct page *page)
+{
+	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
+	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
+	u64 hpa_base = xpagemap->hpa_base;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
+	u64 dpa;
 
 	xe_assert(vr->xe, is_device_private_page(page));
-	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= vr->hpa_base);
+	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= hpa_base);
 
-	offset = (pfn << PAGE_SHIFT) - vr->hpa_base;
+	offset = (pfn << PAGE_SHIFT) - hpa_base;
 	dpa = vr->dpa_base + offset;
 
 	return dpa;
 }
 
+static u64 xe_page_to_pcie(struct page *page)
+{
+	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
+	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
+
+	return xe_page_to_dpa(page) - vr->dpa_base + vr->io_start;
+}
+
 enum xe_svm_copy_dir {
 	XE_SVM_COPY_TO_VRAM,
 	XE_SVM_COPY_TO_SRAM,
@@ -483,11 +544,12 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
 
 static int xe_svm_copy(struct page **pages,
 		       struct drm_pagemap_addr *pagemap_addr,
-		       unsigned long npages, const enum xe_svm_copy_dir dir)
+		       unsigned long npages, const enum xe_svm_copy_dir dir,
+		       struct dma_fence *pre_migrate_fence)
 {
 	struct xe_vram_region *vr = NULL;
 	struct xe_gt *gt = NULL;
-	struct xe_device *xe;
+	struct xe_device *xe = NULL;
 	struct dma_fence *fence = NULL;
 	unsigned long i;
 #define XE_VRAM_ADDR_INVALID	~0x0ull
@@ -496,6 +558,17 @@ static int xe_svm_copy(struct page **pages,
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
 	ktime_t start = xe_svm_stats_ktime_get();
 
+	if (pre_migrate_fence && (sram || dma_fence_is_container(pre_migrate_fence))) {
+		/*
+		 * This would typically be a composite fence operation on the destination memory,
+		 * or a p2p migration by the source GPU while the destination is being cleared.
+		 * Ensure that the other GPU operation on the destination is complete.
+		 */
+		err = dma_fence_wait(pre_migrate_fence, true);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * This flow is complex: it locates physically contiguous device pages,
 	 * derives the starting physical address, and performs a single GPU copy
@@ -520,11 +593,11 @@ static int xe_svm_copy(struct page **pages,
 			continue;
 
 		if (!vr && spage) {
-			vr = page_to_vr(spage);
+			vr = xe_page_to_vr(spage);
 			gt = xe_migrate_exec_queue(vr->migrate)->gt;
 			xe = vr->xe;
 		}
-		XE_WARN_ON(spage && page_to_vr(spage) != vr);
+		XE_WARN_ON(spage && xe_page_to_vr(spage) != vr);
 
 		/*
 		 * CPU page and device page valid, capture physical address on
@@ -532,7 +605,7 @@ static int xe_svm_copy(struct page **pages,
 		 * device pages.
 		 */
 		if (pagemap_addr[i].addr && spage) {
-			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
+			__vram_addr = xe_page_to_dpa(spage);
 			if (vram_addr == XE_VRAM_ADDR_INVALID) {
 				vram_addr = __vram_addr;
 				pos = i;
@@ -632,10 +705,28 @@ static int xe_svm_copy(struct page **pages,
 
 err_out:
 	/* Wait for all copies to complete */
-	if (fence) {
+	if (fence)
 		dma_fence_wait(fence, false);
-		dma_fence_put(fence);
+
+	/*
+	 * If migrating to devmem, we should have pipelined the migration behind
+	 * the pre_migrate_fence. Verify that this is indeed likely. If we
+	 * didn't perform any copying, just wait for the pre_migrate_fence.
+	 */
+	if (!sram && pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
+		if (xe && fence &&
+		    (pre_migrate_fence->context != fence->context ||
+		     dma_fence_is_later(pre_migrate_fence, fence))) {
+			drm_WARN(&xe->drm, true, "Unsignaled pre-migrate fence");
+			drm_warn(&xe->drm, "fence contexts: %llu %llu. container %d\n",
+				 (unsigned long long)fence->context,
+				 (unsigned long long)pre_migrate_fence->context,
+				 dma_fence_is_container(pre_migrate_fence));
+		}
+
+		dma_fence_wait(pre_migrate_fence, false);
 	}
+	dma_fence_put(fence);
 
 	/*
 	 * XXX: We can't derive the GT here (or anywhere in this functions, but
@@ -652,16 +743,20 @@ static int xe_svm_copy(struct page **pages,
 
 static int xe_svm_copy_to_devmem(struct page **pages,
 				 struct drm_pagemap_addr *pagemap_addr,
-				 unsigned long npages)
+				 unsigned long npages,
+				 struct dma_fence *pre_migrate_fence)
 {
-	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM);
+	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM,
+			   pre_migrate_fence);
 }
 
 static int xe_svm_copy_to_ram(struct page **pages,
 			      struct drm_pagemap_addr *pagemap_addr,
-			      unsigned long npages)
+			      unsigned long npages,
+			      struct dma_fence *pre_migrate_fence)
 {
-	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM);
+	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM,
+			   pre_migrate_fence);
 }
 
 static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
@@ -674,13 +769,16 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct xe_device *xe = xe_bo_device(bo);
 
+	dma_fence_put(devmem_allocation->pre_migrate_fence);
 	xe_bo_put_async(bo);
 	xe_pm_runtime_put(xe);
 }
 
-static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
+static u64 block_offset_to_pfn(struct drm_pagemap *dpagemap, u64 offset)
 {
-	return PHYS_PFN(offset + vr->hpa_base);
+	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+
+	return PHYS_PFN(offset + xpagemap->hpa_base);
 }
 
 static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
@@ -700,7 +798,8 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
 		struct drm_buddy *buddy = vram_to_buddy(vr);
-		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
+		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
+						    drm_buddy_block_offset(block));
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
@@ -717,6 +816,11 @@ static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
 
+#else
+static int xe_svm_get_pagemaps(struct xe_vm *vm)
+{
+	return 0;
+}
 #endif
 
 static const struct drm_gpusvm_ops gpusvm_ops = {
@@ -731,6 +835,48 @@ static const unsigned long fault_chunk_sizes[] = {
 	SZ_4K,
 };
 
+static void xe_pagemap_put(struct xe_pagemap *xpagemap)
+{
+	drm_pagemap_put(&xpagemap->dpagemap);
+}
+
+static void xe_svm_put_pagemaps(struct xe_vm *vm)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_pagemap *xpagemap = vm->svm.pagemaps[id];
+
+		if (xpagemap)
+			xe_pagemap_put(xpagemap);
+		vm->svm.pagemaps[id] = NULL;
+	}
+}
+
+static struct device *xe_peer_to_dev(struct drm_pagemap_peer *peer)
+{
+	if (peer->private == XE_PEER_PAGEMAP)
+		return container_of(peer, struct xe_pagemap, peer)->dpagemap.drm->dev;
+
+	return container_of(peer, struct xe_vm, svm.peer)->xe->drm.dev;
+}
+
+static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
+				struct drm_pagemap_peer *peer2)
+{
+	struct device *dev1 = xe_peer_to_dev(peer1);
+	struct device *dev2 = xe_peer_to_dev(peer2);
+
+	if (dev1 == dev2)
+		return true;
+
+	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >= 0;
+}
+
+static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
+
 /**
  * xe_svm_init() - SVM initialize
  * @vm: The VM.
@@ -749,12 +895,30 @@ int xe_svm_init(struct xe_vm *vm)
 		INIT_WORK(&vm->svm.garbage_collector.work,
 			  xe_svm_garbage_collector_work_func);
 
+		vm->svm.peer.private = XE_PEER_VM;
+		err = drm_pagemap_acquire_owner(&vm->svm.peer, &xe_owner_list,
+						xe_has_interconnect);
+		if (err)
+			return err;
+
+		err = xe_svm_get_pagemaps(vm);
+		if (err) {
+			drm_pagemap_release_owner(&vm->svm.peer);
+			return err;
+		}
+
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
 				      current->mm, 0, vm->size,
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
 				      ARRAY_SIZE(fault_chunk_sizes));
 		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+
+		if (err) {
+			xe_svm_put_pagemaps(vm);
+			drm_pagemap_release_owner(&vm->svm.peer);
+			return err;
+		}
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
 				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
@@ -774,6 +938,8 @@ void xe_svm_close(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
 	flush_work(&vm->svm.garbage_collector.work);
+	xe_svm_put_pagemaps(vm);
+	drm_pagemap_release_owner(&vm->svm.peer);
 }
 
 /**
@@ -789,13 +955,34 @@ void xe_svm_fini(struct xe_vm *vm)
 	drm_gpusvm_fini(&vm->svm.gpusvm);
 }
 
+static bool xe_svm_range_has_pagemap_locked(const struct xe_svm_range *range,
+					    const struct drm_pagemap *dpagemap)
+{
+	return range->base.pages.dpagemap == dpagemap;
+}
+
+static bool xe_svm_range_has_pagemap(struct xe_svm_range *range,
+				     const struct drm_pagemap *dpagemap)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	bool ret;
+
+	xe_svm_notifier_lock(vm);
+	ret = xe_svm_range_has_pagemap_locked(range, dpagemap);
+	xe_svm_notifier_unlock(vm);
+
+	return ret;
+}
+
 static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 				  struct xe_tile *tile,
-				  bool devmem_only)
+				  bool devmem_only,
+				  const struct drm_pagemap *dpagemap)
+
 {
 	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
 					    range->tile_invalidated) &&
-		(!devmem_only || xe_svm_range_in_vram(range)));
+		(!devmem_only || xe_svm_range_has_pagemap(range, dpagemap)));
 }
 
 /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
@@ -816,7 +1003,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
  * @vm: xe_vm pointer
  * @range: Pointer to the SVM range structure
  * @tile_mask: Mask representing the tiles to be checked
- * @devmem_preferred : if true range needs to be in devmem
+ * @dpagemap: if !%NULL, the range is expected to be present
+ * in device memory identified by this parameter.
  *
  * The xe_svm_range_validate() function checks if a range is
  * valid and located in the desired memory region.
@@ -825,14 +1013,15 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
  */
 bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
-			   u8 tile_mask, bool devmem_preferred)
+			   u8 tile_mask, const struct drm_pagemap *dpagemap)
 {
 	bool ret;
 
 	xe_svm_notifier_lock(vm);
 
-	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
-	       (devmem_preferred == range->base.pages.flags.has_devmem_pages);
+	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask;
+	if (dpagemap)
+		ret = ret && xe_svm_range_has_pagemap_locked(range, dpagemap);
 
 	xe_svm_notifier_unlock(vm);
 
@@ -867,7 +1056,13 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+	struct drm_pagemap_migrate_details mdetails = {
+		.timeslice_ms = timeslice_ms,
+		.source_peer_migrates = 1,
+	};
+	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
+	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
@@ -894,8 +1089,20 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			break;
 		}
 
+		/* Ensure that any clearing or async eviction will complete before migration. */
+		if (!dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL)) {
+			err = dma_resv_get_singleton(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+						     &pre_migrate_fence);
+			if (err)
+				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+						      false, MAX_SCHEDULE_TIMEOUT);
+			else if (pre_migrate_fence)
+				dma_fence_enable_sw_signaling(pre_migrate_fence);
+		}
+
 		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
-					&dpagemap_devmem_ops, dpagemap, end - start);
+					&dpagemap_devmem_ops, dpagemap, end - start,
+					pre_migrate_fence);
 
 		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
 		list_for_each_entry(block, blocks, link)
@@ -905,11 +1112,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 		/* Ensure the device has a pm ref while there are device pages active. */
 		xe_pm_runtime_get_noresume(xe);
+		/* Consumes the devmem allocation ref. */
 		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-						    start, end, timeslice_ms,
-						    xe_svm_devm_owner(xe));
-		if (err)
-			xe_svm_devmem_release(&bo->devmem_allocation);
+						    start, end, &mdetails);
 		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 	}
@@ -932,23 +1137,23 @@ static bool supports_4K_migration(struct xe_device *xe)
  * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
  * @range: SVM range for which migration needs to be decided
  * @vma: vma which has range
- * @preferred_region_is_vram: preferred region for range is vram
+ * @dpagemap: The preferred struct drm_pagemap to migrate to.
  *
  * Return: True for range needing migration and migration is supported else false
  */
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
-					bool preferred_region_is_vram)
+					const struct drm_pagemap *dpagemap)
 {
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
-	if (!range->base.pages.flags.migrate_devmem || !preferred_region_is_vram)
+	if (!range->base.pages.flags.migrate_devmem || !dpagemap)
 		return false;
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
 
-	if (xe_svm_range_in_vram(range)) {
-		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+	if (xe_svm_range_has_pagemap(range, dpagemap)) {
+		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
 
@@ -1022,7 +1227,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.devmem_only = need_vram && devmem_possible,
 		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
-		.device_private_page_owner = xe_svm_devm_owner(vm->xe),
 	};
 	struct xe_validation_ctx vctx;
 	struct drm_exec exec;
@@ -1045,9 +1249,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	dpagemap = xe_vma_resolve_pagemap(vma, tile);
-	if (!dpagemap && !ctx.devmem_only)
-		ctx.device_private_page_owner = NULL;
+	dpagemap = ctx.devmem_only ? xe_tile_local_pagemap(tile) :
+		xe_vma_resolve_pagemap(vma, tile);
+	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
 	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
 	if (IS_ERR(range))
@@ -1060,7 +1264,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		goto out;
 	}
 
-	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
+	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
 		xe_svm_range_valid_fault_count_stats_incr(gt, range);
 		range_debug(range, "PAGE FAULT - VALID");
 		goto out;
@@ -1069,16 +1273,11 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	range_debug(range, "PAGE FAULT");
 
 	if (--migrate_try_count >= 0 &&
-	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
+	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
 		ktime_t migrate_start = xe_svm_stats_ktime_get();
 
-		/* TODO : For multi-device dpagemap will be used to find the
-		 * remote tile and remote device. Will need to modify
-		 * xe_svm_alloc_vram to use dpagemap for future multi-device
-		 * support.
-		 */
 		xe_svm_range_migrate_count_stats_incr(gt, range);
-		err = xe_svm_alloc_vram(tile, range, &ctx);
+		err = xe_svm_alloc_vram(range, &ctx, dpagemap);
 		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
@@ -1129,6 +1328,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
 		goto out;
+	} else if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
+		drm_dbg(&vm->xe->drm, "After page collect data location is %sin \"%s\".\n",
+			xe_svm_range_has_pagemap(range, dpagemap) ? "" : "NOT ",
+			dpagemap ? dpagemap->drm->unique : "System.");
 	}
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
@@ -1376,11 +1579,6 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
-static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
-{
-	return &tile->mem.vram->dpagemap;
-}
-
 /**
  * xe_vma_resolve_pagemap - Resolve the appropriate DRM pagemap for a VMA
  * @vma: Pointer to the xe_vma structure containing memory attributes
@@ -1400,40 +1598,69 @@ static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
  */
 struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
 {
-	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
+	struct drm_pagemap *dpagemap = vma->attr.preferred_loc.dpagemap;
+	s32 fd;
+
+	if (dpagemap)
+		return dpagemap;
+
+	fd = (s32)vma->attr.preferred_loc.devmem_fd;
 
 	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
 		return NULL;
 
 	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
-		return IS_DGFX(tile_to_xe(tile)) ? tile_local_pagemap(tile) : NULL;
+		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
 
-	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
 	return NULL;
 }
 
 /**
  * xe_svm_alloc_vram()- Allocate device memory pages for range,
  * migrating existing data.
- * @tile: tile to allocate vram from
  * @range: SVM range
  * @ctx: DRM GPU SVM context
+ * @dpagemap: The struct drm_pagemap representing the memory to allocate.
  *
  * Return: 0 on success, error code on failure.
  */
-int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx)
+int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
+		      struct drm_pagemap *dpagemap)
 {
-	struct drm_pagemap *dpagemap;
+	struct xe_vm *vm = range_to_vm(&range->base);
+	enum drm_gpusvm_scan_result migration_state;
+	struct xe_device *xe = vm->xe;
+	int err, retries = 1;
 
-	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
+	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = tile_local_pagemap(tile);
-	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
-				       xe_svm_range_end(range),
-				       range->base.gpusvm->mm,
-				       ctx->timeslice_ms);
+	migration_state = drm_gpusvm_scan_mm(&range->base,
+					     xe_svm_private_page_owner(vm, false),
+					     dpagemap->pagemap);
+
+	if (migration_state == DRM_GPUSVM_SCAN_EQUAL) {
+		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
+			drm_dbg(dpagemap->drm, "Already migrated!\n");
+		return 0;
+	}
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
+		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
+			dpagemap->drm->unique);
+
+	do {
+		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
+					      xe_svm_range_end(range),
+					      range->base.gpusvm->mm,
+					      ctx->timeslice_ms);
+
+		if (err == -EBUSY && retries)
+			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
+
+	} while (err == -EBUSY && retries--);
+
+	return err;
 }
 
 static struct drm_pagemap_addr
@@ -1443,92 +1670,363 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  unsigned int order,
 			  enum dma_data_direction dir)
 {
-	struct device *pgmap_dev = dpagemap->dev;
+	struct device *pgmap_dev = dpagemap->drm->dev;
 	enum drm_interconnect_protocol prot;
 	dma_addr_t addr;
 
 	if (pgmap_dev == dev) {
-		addr = xe_vram_region_page_to_dpa(page_to_vr(page), page);
+		addr = xe_page_to_dpa(page);
 		prot = XE_INTERCONNECT_VRAM;
 	} else {
-		addr = DMA_MAPPING_ERROR;
-		prot = 0;
+		addr = dma_map_resource(dev,
+					xe_page_to_pcie(page),
+					PAGE_SIZE << order, dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+		prot = XE_INTERCONNECT_P2P;
 	}
 
 	return drm_pagemap_addr_encode(addr, prot, order, dir);
 }
 
+static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
+					struct device *dev,
+					struct drm_pagemap_addr addr)
+{
+	if (addr.proto != XE_INTERCONNECT_P2P)
+		return;
+
+	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
+			   addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void xe_pagemap_destroy_work(struct work_struct *work)
+{
+	struct xe_pagemap *xpagemap = container_of(work, typeof(*xpagemap), destroy_work);
+	struct dev_pagemap *pagemap = &xpagemap->pagemap;
+	struct drm_device *drm = xpagemap->dpagemap.drm;
+	int idx;
+
+	/*
+	 * Only unmap / release if devm_ release hasn't run yet.
+	 * Otherwise the devm_ callbacks have already released, or
+	 * will do shortly.
+	 */
+	if (drm_dev_enter(drm, &idx)) {
+		devm_memunmap_pages(drm->dev, pagemap);
+		devm_release_mem_region(drm->dev, pagemap->range.start,
+					pagemap->range.end - pagemap->range.start + 1);
+		drm_dev_exit(idx);
+	}
+
+	drm_pagemap_release_owner(&xpagemap->peer);
+	kfree(xpagemap);
+}
+
+static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
+{
+	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+	struct xe_device *xe = to_xe_device(dpagemap->drm);
+
+	if (from_atomic_or_reclaim)
+		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
+	else
+		xe_pagemap_destroy_work(&xpagemap->destroy_work);
+}
+
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
+	.device_unmap = xe_drm_pagemap_device_unmap,
 	.populate_mm = xe_drm_pagemap_populate_mm,
+	.destroy = xe_pagemap_destroy,
 };
 
 /**
- * xe_devm_add: Remap and provide memmap backing for device memory
- * @tile: tile that the memory region belongs to
- * @vr: vram memory region to remap
+ * xe_pagemap_create() - Create a struct xe_pagemap object
+ * @xe: The xe device.
+ * @vr: Back-pointer to the struct xe_vram_region.
  *
- * This remap device memory to host physical address space and create
- * struct page to back device memory
+ * Allocate and initialize a struct xe_pagemap. On successful
+ * return, drm_pagemap_put() on the embedded struct drm_pagemap
+ * should be used to unreference.
  *
- * Return: 0 on success standard error code otherwise
+ * Return: Pointer to a struct xe_pagemap if successful. Error pointer
+ * on failure.
  */
-int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram_region *vr)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct device *dev = xe->drm.dev;
+	struct xe_pagemap *xpagemap;
+	struct dev_pagemap *pagemap;
+	struct drm_pagemap *dpagemap;
 	struct resource *res;
 	void *addr;
-	int ret;
+	int err;
+
+	xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
+	if (!xpagemap)
+		return ERR_PTR(-ENOMEM);
+
+	pagemap = &xpagemap->pagemap;
+	dpagemap = &xpagemap->dpagemap;
+	INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
+	xpagemap->vr = vr;
+	xpagemap->peer.private = XE_PEER_PAGEMAP;
+
+	err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
+	if (err)
+		goto out_no_dpagemap;
 
 	res = devm_request_free_mem_region(dev, &iomem_resource,
 					   vr->usable_size);
 	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		return ret;
+		err = PTR_ERR(res);
+		goto out_err;
 	}
 
-	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	vr->pagemap.range.start = res->start;
-	vr->pagemap.range.end = res->end;
-	vr->pagemap.nr_range = 1;
-	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
-	vr->pagemap.owner = xe_svm_devm_owner(xe);
-	addr = devm_memremap_pages(dev, &vr->pagemap);
+	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
+					xe_has_interconnect);
+	if (err)
+		goto out_no_owner;
+
+	pagemap->type = MEMORY_DEVICE_PRIVATE;
+	pagemap->range.start = res->start;
+	pagemap->range.end = res->end;
+	pagemap->nr_range = 1;
+	pagemap->owner = xpagemap->peer.owner;
+	pagemap->ops = drm_pagemap_pagemap_ops_get();
+	addr = devm_memremap_pages(dev, pagemap);
+	if (IS_ERR(addr)) {
+		err = PTR_ERR(addr);
+		goto out_no_pages;
+	}
+	xpagemap->hpa_base = res->start;
+	return xpagemap;
+
+out_no_pages:
+	drm_pagemap_release_owner(&xpagemap->peer);
+out_no_owner:
+	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
+out_err:
+	drm_pagemap_put(dpagemap);
+	return ERR_PTR(err);
+
+out_no_dpagemap:
+	kfree(xpagemap);
+	return ERR_PTR(err);
+}
 
-	vr->dpagemap.dev = dev;
-	vr->dpagemap.ops = &xe_drm_pagemap_ops;
+/**
+ * xe_pagemap_find_or_create() - Find or create a struct xe_pagemap
+ * @xe: The xe device.
+ * @cache: The struct xe_pagemap_cache.
+ * @vr: The VRAM region.
+ *
+ * Check if there is an already used xe_pagemap for this tile, and in that case,
+ * return it.
+ * If not, check if there is a cached xe_pagemap for this tile, and in that case,
+ * cancel its destruction, re-initialize it and return it.
+ * Finally if there is no cached or already used pagemap, create one and
+ * register it in the tile's pagemap cache.
+ *
+ * Note that this function is typically called from within an IOCTL, and waits are
+ * therefore carried out interruptible if possible.
+ *
+ * Return: A pointer to a struct xe_pagemap if successful, Error pointer on failure.
+ */
+static struct xe_pagemap *
+xe_pagemap_find_or_create(struct xe_device *xe, struct drm_pagemap_cache *cache,
+			  struct xe_vram_region *vr)
+{
+	struct drm_pagemap *dpagemap;
+	struct xe_pagemap *xpagemap;
+	int err;
 
-	if (IS_ERR(addr)) {
-		devm_release_mem_region(dev, res->start, resource_size(res));
-		ret = PTR_ERR(addr);
-		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
-			tile->id, ERR_PTR(ret));
-		return ret;
+	err = drm_pagemap_cache_lock_lookup(cache);
+	if (err)
+		return ERR_PTR(err);
+
+	dpagemap = drm_pagemap_get_from_cache(cache);
+	if (IS_ERR(dpagemap)) {
+		xpagemap = ERR_CAST(dpagemap);
+	} else if (!dpagemap) {
+		xpagemap = xe_pagemap_create(xe, vr);
+		if (IS_ERR(xpagemap))
+			goto out_unlock;
+		drm_pagemap_cache_set_pagemap(cache, &xpagemap->dpagemap);
+	} else {
+		xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+	}
+
+out_unlock:
+	drm_pagemap_cache_unlock_lookup(cache);
+	return xpagemap;
+}
+
+static int xe_svm_get_pagemaps(struct xe_vm *vm)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_pagemap *xpagemap;
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_vram_region *vr;
+
+		if (!((BIT(id) << 1) & xe->info.mem_region_mask))
+			continue;
+
+		vr = xe_tile_to_vr(tile);
+		xpagemap = xe_pagemap_find_or_create(xe, vr->dpagemap_cache, vr);
+		if (IS_ERR(xpagemap))
+			break;
+		vm->svm.pagemaps[id] = xpagemap;
+	}
+
+	if (IS_ERR(xpagemap)) {
+		xe_svm_put_pagemaps(vm);
+		return PTR_ERR(xpagemap);
+	}
+
+	return 0;
+}
+
+/**
+ * xe_pagemap_shrinker_create() - Create a drm_pagemap shrinker
+ * @xe: The xe device
+ *
+ * Create a drm_pagemap shrinker and register with the xe device.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int xe_pagemap_shrinker_create(struct xe_device *xe)
+{
+	xe->usm.dpagemap_shrinker = drm_pagemap_shrinker_create_devm(&xe->drm);
+	return PTR_ERR_OR_ZERO(xe->usm.dpagemap_shrinker);
+}
+
+/**
+ * xe_pagemap_cache_create() - Create a drm_pagemap cache
+ * @tile: The tile to register the cache with
+ *
+ * Create a drm_pagemap cache and register with the tile.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int xe_pagemap_cache_create(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (IS_DGFX(xe)) {
+		struct drm_pagemap_cache *cache =
+			drm_pagemap_cache_create_devm(xe->usm.dpagemap_shrinker);
+
+		if (IS_ERR(cache))
+			return PTR_ERR(cache);
+
+		tile->mem.vram->dpagemap_cache = cache;
 	}
-	vr->hpa_base = res->start;
 
-	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
-		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
 	return 0;
 }
+
+static struct drm_pagemap *xe_devmem_open(struct xe_device *xe, u32 region_instance)
+{
+	u32 tile_id = region_instance - 1;
+	struct xe_pagemap *xpagemap;
+	struct xe_vram_region *vr;
+
+	if (tile_id >= xe->info.tile_count)
+		return ERR_PTR(-ENOENT);
+
+	if (!((BIT(tile_id) << 1) & xe->info.mem_region_mask))
+		return ERR_PTR(-ENOENT);
+
+	vr = xe_tile_to_vr(&xe->tiles[tile_id]);
+
+	/* Returns a reference-counted embedded struct drm_pagemap */
+	xpagemap = xe_pagemap_find_or_create(xe, vr->dpagemap_cache, vr);
+	if (IS_ERR(xpagemap))
+		return ERR_CAST(xpagemap);
+
+	return &xpagemap->dpagemap;
+}
+
+/**
+ * xe_drm_pagemap_from_fd() - Return a drm_pagemap pointer from a
+ * (file_descriptor, region_instance) pair.
+ * @fd: An fd opened against an xe device.
+ * @region_instance: The region instance representing the device memory
+ * on the opened xe device.
+ *
+ * Opens a struct drm_pagemap pointer on the
+ * indicated device and region_instance.
+ *
+ * Return: A reference-counted struct drm_pagemap pointer on success,
+ * negative error pointer on failure.
+ */
+struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
+{
+	struct drm_pagemap *dpagemap;
+	struct file *file;
+	struct drm_file *fpriv;
+	struct drm_device *drm;
+	int idx;
+
+	if (fd <= 0)
+		return ERR_PTR(-EINVAL);
+
+	file = fget(fd);
+	if (!file)
+		return ERR_PTR(-ENOENT);
+
+	if (!xe_is_xe_file(file)) {
+		dpagemap = ERR_PTR(-ENOENT);
+		goto out;
+	}
+
+	fpriv = file->private_data;
+	drm = fpriv->minor->dev;
+	if (!drm_dev_enter(drm, &idx)) {
+		dpagemap = ERR_PTR(-ENODEV);
+		goto out;
+	}
+
+	dpagemap = xe_devmem_open(to_xe_device(drm), region_instance);
+	drm_dev_exit(idx);
+out:
+	fput(file);
+	return dpagemap;
+}
+
 #else
-int xe_svm_alloc_vram(struct xe_tile *tile,
-		      struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx)
+
+int xe_pagemap_shrinker_create(struct xe_device *xe)
 {
-	return -EOPNOTSUPP;
+	return 0;
 }
 
-int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+int xe_pagemap_cache_create(struct xe_tile *tile)
 {
 	return 0;
 }
 
+int xe_svm_alloc_vram(struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx,
+		      struct drm_pagemap *dpagemap)
+{
+	return -EOPNOTSUPP;
+}
+
 struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
 {
 	return NULL;
 }
+
+struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index fa757dd07954..b7b8eeacf196 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,29 +6,22 @@
 #ifndef _XE_SVM_H_
 #define _XE_SVM_H_
 
-struct xe_device;
-
-/**
- * xe_svm_devm_owner() - Return the owner of device private memory
- * @xe: The xe device.
- *
- * Return: The owner of this device's device private memory to use in
- * hmm_range_fault()-
- */
-static inline void *xe_svm_devm_owner(struct xe_device *xe)
-{
-	return xe;
-}
-
 #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 
 #include <drm/drm_pagemap.h>
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap_util.h>
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
+#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
+
+struct drm_device;
+struct drm_file;
 
 struct xe_bo;
 struct xe_gt;
+struct xe_device;
+struct xe_vram_region;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
@@ -55,6 +48,24 @@ struct xe_svm_range {
 	u8 tile_invalidated;
 };
 
+/**
+ * struct xe_pagemap - Manages xe device_private memory for SVM.
+ * @pagemap: The struct dev_pagemap providing the struct pages.
+ * @dpagemap: The drm_pagemap managing allocation and migration.
+ * @destroy_work: Handles asnynchronous destruction and caching.
+ * @peer: Used for pagemap owner computation.
+ * @hpa_base: The host physical address base for the managemd memory.
+ * @vr: Backpointer to the xe_vram region.
+ */
+struct xe_pagemap {
+	struct dev_pagemap pagemap;
+	struct drm_pagemap dpagemap;
+	struct work_struct destroy_work;
+	struct drm_pagemap_peer peer;
+	resource_size_t hpa_base;
+	struct xe_vram_region *vr;
+};
+
 /**
  * xe_svm_range_pages_valid() - SVM range pages valid
  * @range: SVM range
@@ -84,8 +95,8 @@ int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 
-int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx);
+int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
+		      struct drm_pagemap *dpagemap);
 
 struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
@@ -94,13 +105,13 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
-					bool preferred_region_is_vram);
+					const struct drm_pagemap *dpagemap);
 
 void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
 
 bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
-			   u8 tile_mask, bool devmem_preferred);
+			   u8 tile_mask, const struct drm_pagemap *dpagemap);
 
 u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
 
@@ -110,6 +121,8 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
 
 struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
 
+void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -171,6 +184,12 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 
 void xe_svm_flush(struct xe_vm *vm);
 
+int xe_pagemap_shrinker_create(struct xe_device *xe);
+
+int xe_pagemap_cache_create(struct xe_tile *tile);
+
+struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance);
+
 #else
 #include <linux/interval_tree.h>
 #include "xe_vm.h"
@@ -179,13 +198,14 @@ struct drm_pagemap_addr;
 struct drm_gpusvm_ctx;
 struct drm_gpusvm_range;
 struct xe_bo;
-struct xe_gt;
+struct xe_device;
 struct xe_vm;
 struct xe_vma;
 struct xe_tile;
 struct xe_vram_region;
 
 #define XE_INTERCONNECT_VRAM 1
+#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
 
 struct xe_svm_range {
 	struct {
@@ -260,8 +280,8 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 }
 
 static inline int
-xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
-		  const struct drm_gpusvm_ctx *ctx)
+xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
+		  struct drm_pagemap *dpagemap)
 {
 	return -EOPNOTSUPP;
 }
@@ -302,7 +322,7 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 
 static inline
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
-					u32 region)
+					const struct drm_pagemap *dpagemap)
 {
 	return false;
 }
@@ -343,9 +363,30 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 	return NULL;
 }
 
+static inline void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
+{
+	return NULL;
+}
+
 static inline void xe_svm_flush(struct xe_vm *vm)
 {
 }
+
+static inline int xe_pagemap_shrinker_create(struct xe_device *xe)
+{
+	return 0;
+}
+
+static inline int xe_pagemap_cache_create(struct xe_tile *tile)
+{
+	return 0;
+}
+
+static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 #define xe_svm_range_has_dma_mapping(...) false
 #endif /* CONFIG_DRM_XE_GPUSVM */
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 63c060c2ea5c..eb262aad11da 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -6,6 +6,7 @@
 #include <linux/fault-inject.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -180,17 +181,19 @@ ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
+	int err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
-	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, tile->mem.vram);
+	err = xe_pagemap_cache_create(tile);
+	if (err)
+		return err;
 
 	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
-		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
-
+		err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
 		if (err)
 			return err;
+
 		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
 	}
 
@@ -220,3 +223,26 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
 {
 	xe_migrate_wait(tile->migrate);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+/**
+ * xe_tile_local_pagemap() - Return a pointer to the tile's local drm_pagemap if any
+ * @tile: The tile.
+ *
+ * Return: A pointer to the tile's local drm_pagemap, or NULL if local pagemap
+ * support has been compiled out.
+ */
+struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
+{
+	struct drm_pagemap *dpagemap =
+		drm_pagemap_get_from_cache_if_active(xe_tile_to_vr(tile)->dpagemap_cache);
+
+	if (dpagemap) {
+		xe_assert(tile_to_xe(tile), kref_read(&dpagemap->ref) >= 2);
+		drm_pagemap_put(dpagemap);
+	}
+
+	return dpagemap;
+}
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index dceb6297aa01..734132eddda5 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -8,6 +8,7 @@
 
 #include "xe_device_types.h"
 
+struct xe_pagemap;
 struct xe_tile;
 
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
@@ -23,4 +24,24 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
 	return tile->id == 0;
 }
 
+/**
+ * xe_tile_to_vr() - Return the struct xe_vram_region pointer from a
+ * struct xe_tile pointer
+ * @tile: Pointer to the struct xe_tile.
+ *
+ * Return: Pointer to the struct xe_vram_region embedded in *@tile.
+ */
+static inline struct xe_vram_region *xe_tile_to_vr(struct xe_tile *tile)
+{
+	return tile->mem.vram;
+}
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile);
+#else
+static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
+{
+	return NULL;
+}
+#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 0d9130b1958a..e120323c43bc 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -55,7 +55,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
-		.device_private_page_owner = xe_svm_devm_owner(xe),
+		.device_private_page_owner = xe_svm_private_page_owner(vm, false),
 		.allow_mixed = true,
 	};
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bd787aae4248..8620c796e18f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -957,14 +957,37 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	return fence;
 }
 
+static void xe_vma_mem_attr_fini(struct xe_vma_mem_attr *attr)
+{
+	drm_pagemap_put(attr->preferred_loc.dpagemap);
+}
+
 static void xe_vma_free(struct xe_vma *vma)
 {
+	xe_vma_mem_attr_fini(&vma->attr);
+
 	if (xe_vma_is_userptr(vma))
 		kfree(to_userptr_vma(vma));
 	else
 		kfree(vma);
 }
 
+/**
+ * xe_vma_mem_attr_copy() - copy an xe_vma_mem_attr structure.
+ * @to: Destination.
+ * @from: Source.
+ *
+ * Copies an xe_vma_mem_attr structure taking care to get reference
+ * counting of individual members right.
+ */
+void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from)
+{
+	xe_vma_mem_attr_fini(to);
+	*to = *from;
+	if (to->preferred_loc.dpagemap)
+		drm_pagemap_get(to->preferred_loc.dpagemap);
+}
+
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
 				    u64 bo_offset_or_userptr,
@@ -1015,8 +1038,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->attr = *attr;
-
+	xe_vma_mem_attr_copy(&vma->attr, attr);
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
 
@@ -2317,7 +2339,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			struct xe_tile *tile;
 			struct xe_svm_range *svm_range;
 			struct drm_gpusvm_ctx ctx = {};
-			struct drm_pagemap *dpagemap;
+			struct drm_pagemap *dpagemap = NULL;
 			u8 id, tile_mask = 0;
 			u32 i;
 
@@ -2335,23 +2357,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
 			op->prefetch_range.ranges_count = 0;
-			tile = NULL;
 
 			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
 				dpagemap = xe_vma_resolve_pagemap(vma,
 								  xe_device_get_root_tile(vm->xe));
-				/*
-				 * TODO: Once multigpu support is enabled will need
-				 * something to dereference tile from dpagemap.
-				 */
-				if (dpagemap)
-					tile = xe_device_get_root_tile(vm->xe);
 			} else if (prefetch_region) {
 				tile = &vm->xe->tiles[region_to_mem_type[prefetch_region] -
 						      XE_PL_VRAM0];
+				dpagemap = xe_tile_local_pagemap(tile);
 			}
 
-			op->prefetch_range.tile = tile;
+			op->prefetch_range.dpagemap = dpagemap;
 alloc_next_range:
 			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
 
@@ -2370,7 +2386,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				goto unwind_prefetch_ops;
 			}
 
-			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!tile)) {
+			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				goto check_next_range;
 			}
@@ -2892,7 +2908,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
-	struct xe_tile *tile = op->prefetch_range.tile;
+	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
 	int err = 0;
 
 	struct xe_svm_range *svm_range;
@@ -2905,15 +2921,22 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
-	ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
+	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!tile)
+		if (!dpagemap)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
-			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
+		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
+			drm_dbg(&vm->xe->drm,
+				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
+				dpagemap ? dpagemap->drm->unique : "system",
+				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
+		}
+
+		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
+			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
@@ -4318,7 +4341,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 	struct drm_gpuva_op *__op;
 	unsigned int vma_flags = 0;
 	bool remap_op = false;
-	struct xe_vma_mem_attr tmp_attr;
+	struct xe_vma_mem_attr tmp_attr = {};
 	u16 default_pat;
 	int err;
 
@@ -4413,7 +4436,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			 * VMA, so they can be assigned to newly MAP created vma.
 			 */
 			if (is_madvise)
-				tmp_attr = vma->attr;
+				xe_vma_mem_attr_copy(&tmp_attr, &vma->attr);
 
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_MAP) {
@@ -4423,12 +4446,13 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			 * copy them to new vma.
 			 */
 			if (is_madvise)
-				vma->attr = tmp_attr;
+				xe_vma_mem_attr_copy(&vma->attr, &tmp_attr);
 		}
 	}
 
 	xe_vm_unlock(vm);
 	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	xe_vma_mem_attr_fini(&tmp_attr);
 	return 0;
 
 unwind_ops:
@@ -4526,3 +4550,4 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 
 	return xe_vm_alloc_vma(vm, &map_req, false);
 }
+
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 361f10b3c453..7d11ca47d73e 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -414,4 +414,5 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
+void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index cad3cf627c3f..add9a6ca2390 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -22,6 +22,19 @@ struct xe_vmas_in_madvise_range {
 	bool has_svm_userptr_vmas;
 };
 
+/**
+ * struct xe_madvise_details - Argument to madvise_funcs
+ * @dpagemap: Reference-counted pointer to a struct drm_pagemap.
+ *
+ * The madvise IOCTL handler may, in addition to the user-space
+ * args, have additional info to pass into the madvise_func that
+ * handles the madvise type. Use a struct_xe_madvise_details
+ * for that and extend the struct as necessary.
+ */
+struct xe_madvise_details {
+	struct drm_pagemap *dpagemap;
+};
+
 static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
 {
 	u64 addr = madvise_range->addr;
@@ -74,34 +87,41 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
 
 static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 				      struct xe_vma **vmas, int num_vmas,
-				      struct drm_xe_madvise *op)
+				      struct drm_xe_madvise *op,
+				      struct xe_madvise_details *details)
 {
 	int i;
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
 
 	for (i = 0; i < num_vmas; i++) {
+		struct xe_vma *vma = vmas[i];
+		struct xe_vma_preferred_loc *loc = &vma->attr.preferred_loc;
+
 		/*TODO: Extend attributes to bo based vmas */
-		if ((vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
-		     vmas[i]->attr.preferred_loc.migration_policy ==
-		     op->preferred_mem_loc.migration_policy) ||
-		    !xe_vma_is_cpu_addr_mirror(vmas[i])) {
-			vmas[i]->skip_invalidation = true;
+		if ((loc->devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		     loc->migration_policy == op->preferred_mem_loc.migration_policy) ||
+		    !xe_vma_is_cpu_addr_mirror(vma)) {
+			vma->skip_invalidation = true;
 		} else {
-			vmas[i]->skip_invalidation = false;
-			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			vma->skip_invalidation = false;
+			loc->devmem_fd = op->preferred_mem_loc.devmem_fd;
 			/* Till multi-device support is not added migration_policy
 			 * is of no use and can be ignored.
 			 */
-			vmas[i]->attr.preferred_loc.migration_policy =
-						op->preferred_mem_loc.migration_policy;
+			loc->migration_policy = op->preferred_mem_loc.migration_policy;
+			drm_pagemap_put(loc->dpagemap);
+			loc->dpagemap = NULL;
+			if (details->dpagemap)
+				loc->dpagemap = drm_pagemap_get(details->dpagemap);
 		}
 	}
 }
 
 static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
-			   struct drm_xe_madvise *op)
+			   struct drm_xe_madvise *op,
+			   struct xe_madvise_details *details)
 {
 	struct xe_bo *bo;
 	int i;
@@ -142,7 +162,8 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 			      struct xe_vma **vmas, int num_vmas,
-			      struct drm_xe_madvise *op)
+			      struct drm_xe_madvise *op,
+			      struct xe_madvise_details *details)
 {
 	int i;
 
@@ -160,7 +181,8 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
-			     struct drm_xe_madvise *op);
+			     struct drm_xe_madvise *op,
+			     struct xe_madvise_details *details);
 
 static const madvise_func madvise_funcs[] = {
 	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
@@ -244,11 +266,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
 			return false;
 
-		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
-				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
+		if (XE_IOCTL_DBG(xe, fd <= DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
+				 args->preferred_mem_loc.region_instance != 0))
 			return false;
 
-		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
+				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
 			return false;
 
 		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.reserved))
@@ -294,6 +317,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 	return true;
 }
 
+static int xe_madvise_details_init(struct xe_vm *vm, const struct drm_xe_madvise *args,
+				   struct xe_madvise_details *details)
+{
+	struct xe_device *xe = vm->xe;
+
+	memset(details, 0, sizeof(*details));
+
+	if (args->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
+		int fd = args->preferred_mem_loc.devmem_fd;
+		struct drm_pagemap *dpagemap;
+
+		if (fd <= 0)
+			return 0;
+
+		dpagemap = xe_drm_pagemap_from_fd(args->preferred_mem_loc.devmem_fd,
+						  args->preferred_mem_loc.region_instance);
+		if (XE_IOCTL_DBG(xe, IS_ERR(dpagemap)))
+			return PTR_ERR(dpagemap);
+
+		/* Don't allow a foreign placement without a fast interconnect! */
+		if (XE_IOCTL_DBG(xe, dpagemap->pagemap->owner != vm->svm.peer.owner)) {
+			drm_pagemap_put(dpagemap);
+			return -ENOLINK;
+		}
+		details->dpagemap = dpagemap;
+	}
+
+	return 0;
+}
+
+static void xe_madvise_details_fini(struct xe_madvise_details *details)
+{
+	drm_pagemap_put(details->dpagemap);
+}
+
 static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
 				   int num_vmas, u32 atomic_val)
 {
@@ -347,6 +405,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct drm_xe_madvise *args = data;
 	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
 							 .range =  args->range, };
+	struct xe_madvise_details details;
 	struct xe_vm *vm;
 	struct drm_exec exec;
 	int err, attr_type;
@@ -371,13 +430,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		goto unlock_vm;
 	}
 
-	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	err = xe_madvise_details_init(vm, args, &details);
 	if (err)
 		goto unlock_vm;
 
+	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	if (err)
+		goto madv_fini;
+
 	err = get_vmas(vm, &madvise_range);
 	if (err || !madvise_range.num_vmas)
-		goto unlock_vm;
+		goto madv_fini;
 
 	if (madvise_range.has_bo_vmas) {
 		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
@@ -385,7 +448,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 						    madvise_range.num_vmas,
 						    args->atomic.val)) {
 				err = -EINVAL;
-				goto unlock_vm;
+				goto madv_fini;
 			}
 		}
 
@@ -411,7 +474,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	}
 
 	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
-	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
+	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
+				 &details);
 
 	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
 
@@ -423,6 +487,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		drm_exec_fini(&exec);
 	kfree(madvise_range.vmas);
 	madvise_range.vmas = NULL;
+madv_fini:
+	xe_madvise_details_fini(&details);
 unlock_vm:
 	up_write(&vm->lock);
 put_vm:
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3bf912bfbdcc..5d4b31e7a149 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_gpusvm.h>
 #include <drm/drm_gpuvm.h>
+#include <drm/drm_pagemap_util.h>
 
 #include <linux/dma-resv.h>
 #include <linux/kref.h>
@@ -19,6 +20,8 @@
 #include "xe_range_fence.h"
 #include "xe_userptr.h"
 
+struct drm_pagemap;
+
 struct xe_bo;
 struct xe_svm_range;
 struct xe_sync_entry;
@@ -53,7 +56,7 @@ struct xe_vm_pgtable_update_op;
  */
 struct xe_vma_mem_attr {
 	/** @preferred_loc: preferred memory_location */
-	struct {
+	struct xe_vma_preferred_loc {
 		/** @preferred_loc.migration_policy: Pages migration policy */
 		u32 migration_policy;
 
@@ -64,6 +67,13 @@ struct xe_vma_mem_attr {
 		 * closest device memory respectively.
 		 */
 		u32 devmem_fd;
+		/**
+		 * @preferred_loc.dpagemap: Reference-counted pointer to the drm_pagemap preferred
+		 * for migration on a SVM page-fault. The pointer is protected by the
+		 * vm lock, and is %NULL if @devmem_fd should be consulted for special
+		 * values.
+		 */
+		struct drm_pagemap *dpagemap;
 	} preferred_loc;
 
 	/**
@@ -191,6 +201,9 @@ struct xe_vm {
 			 */
 			struct work_struct work;
 		} garbage_collector;
+		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
+		/** @svm.peer: Used for pagemap connectivity computations. */
+		struct drm_pagemap_peer peer;
 	} svm;
 
 	struct xe_device *xe;
@@ -395,10 +408,10 @@ struct xe_vma_op_prefetch_range {
 	/** @ranges_count: number of svm ranges to map */
 	u32 ranges_count;
 	/**
-	 * @tile: Pointer to the tile structure containing memory to prefetch.
-	 *        NULL if prefetch requested region is smem
+	 * @dpagemap: Pointer to the dpagemap structure containing memory to prefetch.
+	 * NULL if prefetch requested region is smem
 	 */
-	struct xe_tile *tile;
+	struct drm_pagemap *dpagemap;
 };
 
 /** enum xe_vma_op_flags - flags for VMA operation */
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 83772dcbf1af..646e3c12ae9f 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -66,19 +66,8 @@ struct xe_vram_region {
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	/** @migrate: Back pointer to migrate */
 	struct xe_migrate *migrate;
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
+	/** @dpagemap_cache: drm_pagemap cache. */
+	struct drm_pagemap_cache *dpagemap_cache;
 #endif
 };
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 632e100e6efb..2578ac92a8d4 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -328,6 +328,35 @@ void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
 			   struct drm_gpusvm_pages *svm_pages,
 			   unsigned long npages);
 
+/**
+ * enum drm_gpusvm_scan_result - Scan result from the drm_gpusvm_scan_mm() function.
+ * @DRM_GPUSVM_SCAN_UNPOPULATED: At least one page was not present or inaccessible.
+ * @DRM_GPUSVM_SCAN_EQUAL: All pages belong to the struct dev_pagemap indicated as
+ * the @pagemap argument to the drm_gpusvm_scan_mm() function.
+ * @DRM_GPUSVM_SCAN_OTHER: All pages belong to exactly one dev_pagemap, which is
+ * *NOT* the @pagemap argument to the drm_gpusvm_scan_mm(). All pages belong to
+ * the same device private owner.
+ * @DRM_GPUSVM_SCAN_SYSTEM: All pages are present and system pages.
+ * @DRM_GPUSVM_SCAN_MIXED_DEVICE: All pages are device pages and belong to at least
+ * two different struct dev_pagemaps. All pages belong to the same device private
+ * owner.
+ * @DRM_GPUSVM_SCAN_MIXED: Pages are present and are a mix of system pages
+ * and device-private pages. All device-private pages belong to the same device
+ * private owner.
+ */
+enum drm_gpusvm_scan_result {
+	DRM_GPUSVM_SCAN_UNPOPULATED,
+	DRM_GPUSVM_SCAN_EQUAL,
+	DRM_GPUSVM_SCAN_OTHER,
+	DRM_GPUSVM_SCAN_SYSTEM,
+	DRM_GPUSVM_SCAN_MIXED_DEVICE,
+	DRM_GPUSVM_SCAN_MIXED,
+};
+
+enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
+					       void *dev_private_owner,
+					       const struct dev_pagemap *pagemap);
+
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index f6e7e234c089..46e9c58f09e0 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -8,7 +8,10 @@
 
 #define NR_PAGES(order) (1U << (order))
 
+struct dma_fence;
 struct drm_pagemap;
+struct drm_pagemap_cache;
+struct drm_pagemap_dev_hold;
 struct drm_pagemap_zdd;
 struct device;
 
@@ -123,17 +126,49 @@ struct drm_pagemap_ops {
 			   unsigned long start, unsigned long end,
 			   struct mm_struct *mm,
 			   unsigned long timeslice_ms);
+	/**
+	 * @destroy: Destroy the drm_pagemap and associated resources.
+	 * @dpagemap: The drm_pagemap to destroy.
+	 * @is_atomic_or_reclaim: The function may be called from
+	 * atomic- or reclaim context.
+	 *
+	 * The implementation should take care not to attempt to
+	 * destroy resources that may already have been destroyed
+	 * using devm_ callbacks, since this function may be called
+	 * after the underlying struct device has been unbound.
+	 * If the implementation defers the execution to a work item
+	 * to avoid locking issues, then it must make sure the work
+	 * items are flushed before module exit. If the destroy call
+	 * happens after the provider's pci_remove() callback has
+	 * been executed, a module reference and drm device reference is
+	 * held across the destroy callback.
+	 */
+	void (*destroy)(struct drm_pagemap *dpagemap,
+			bool is_atomic_or_reclaim);
 };
 
 /**
  * struct drm_pagemap: Additional information for a struct dev_pagemap
  * used for device p2p handshaking.
  * @ops: The struct drm_pagemap_ops.
- * @dev: The struct drevice owning the device-private memory.
+ * @ref: Reference count.
+ * @drm: The struct drm device owning the device-private memory.
+ * @pagemap: Pointer to the underlying dev_pagemap.
+ * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
+ * device referencing.
+ * @cache: Back-pointer to the &struct drm_pagemap_cache used for this
+ * &struct drm_pagemap. May be NULL if no cache is used.
+ * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
+ * used if also using a pagemap cache.
  */
 struct drm_pagemap {
 	const struct drm_pagemap_ops *ops;
-	struct device *dev;
+	struct kref ref;
+	struct drm_device *drm;
+	struct dev_pagemap *pagemap;
+	struct drm_pagemap_dev_hold *dev_hold;
+	struct drm_pagemap_cache *cache;
+	struct list_head shrink_link;
 };
 
 struct drm_pagemap_devmem;
@@ -174,6 +209,8 @@ struct drm_pagemap_devmem_ops {
 	 * @pages: Pointer to array of device memory pages (destination)
 	 * @pagemap_addr: Pointer to array of DMA information (source)
 	 * @npages: Number of pages to copy
+	 * @pre_migrate_fence: dma-fence to wait for before migration start.
+	 * May be NULL.
 	 *
 	 * Copy pages to device memory. If the order of a @pagemap_addr entry
 	 * is greater than 0, the entry is populated but subsequent entries
@@ -183,13 +220,16 @@ struct drm_pagemap_devmem_ops {
 	 */
 	int (*copy_to_devmem)(struct page **pages,
 			      struct drm_pagemap_addr *pagemap_addr,
-			      unsigned long npages);
+			      unsigned long npages,
+			      struct dma_fence *pre_migrate_fence);
 
 	/**
 	 * @copy_to_ram: Copy to system RAM (required for migration)
 	 * @pages: Pointer to array of device memory pages (source)
 	 * @pagemap_addr: Pointer to array of DMA information (destination)
 	 * @npages: Number of pages to copy
+	 * @pre_migrate_fence: dma-fence to wait for before migration start.
+	 * May be NULL.
 	 *
 	 * Copy pages to system RAM. If the order of a @pagemap_addr entry
 	 * is greater than 0, the entry is populated but subsequent entries
@@ -199,9 +239,60 @@ struct drm_pagemap_devmem_ops {
 	 */
 	int (*copy_to_ram)(struct page **pages,
 			   struct drm_pagemap_addr *pagemap_addr,
-			   unsigned long npages);
+			   unsigned long npages,
+			   struct dma_fence *pre_migrate_fence);
 };
 
+int drm_pagemap_init(struct drm_pagemap *dpagemap,
+		     struct dev_pagemap *pagemap,
+		     struct drm_device *drm,
+		     const struct drm_pagemap_ops *ops);
+
+struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
+				       struct dev_pagemap *pagemap,
+				       const struct drm_pagemap_ops *ops);
+
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+
+void drm_pagemap_put(struct drm_pagemap *dpagemap);
+
+#else
+
+static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
+
+/**
+ * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
+ * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
+ *
+ * Return: Pointer to the struct drm_pagemap, or NULL.
+ */
+static inline struct drm_pagemap *
+drm_pagemap_get(struct drm_pagemap *dpagemap)
+{
+	if (likely(dpagemap))
+		kref_get(&dpagemap->ref);
+
+	return dpagemap;
+}
+
+/**
+ * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pagemap
+ * unless the current reference count is zero.
+ * @dpagemap: Pointer to the drm_pagemap or NULL.
+ *
+ * Return: A pointer to @dpagemap if the reference count was successfully
+ * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
+ */
+static inline struct drm_pagemap * __must_check
+drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
+{
+	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : NULL;
+}
+
 /**
  * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
  *
@@ -212,6 +303,8 @@ struct drm_pagemap_devmem_ops {
  * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
  * @size: Size of device memory allocation
  * @timeslice_expiration: Timeslice expiration in jiffies
+ * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
+ * (May be NULL).
  */
 struct drm_pagemap_devmem {
 	struct device *dev;
@@ -221,13 +314,30 @@ struct drm_pagemap_devmem {
 	struct drm_pagemap *dpagemap;
 	size_t size;
 	u64 timeslice_expiration;
+	struct dma_fence *pre_migrate_fence;
+};
+
+/**
+ * struct drm_pagemap_migrate_details - Details to govern migration.
+ * @timeslice_ms: The time requested for the migrated pagemap pages to
+ * be present in @mm before being allowed to be migrated back.
+ * @can_migrate_same_pagemap: Whether the copy function as indicated by
+ * the @source_peer_migrates flag, can migrate device pages within a
+ * single drm_pagemap.
+ * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
+ * should use the copy_to_ram() callback rather than the destination
+ * drm_pagemap should use the copy_to_devmem() callback.
+ */
+struct drm_pagemap_migrate_details {
+	unsigned long timeslice_ms;
+	u32 can_migrate_same_pagemap : 1;
+	u32 source_peer_migrates : 1;
 };
 
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
-				  unsigned long timeslice_ms,
-				  void *pgmap_owner);
+				  const struct drm_pagemap_migrate_details *mdetails);
 
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
 
@@ -238,11 +348,15 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
 void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     struct device *dev, struct mm_struct *mm,
 			     const struct drm_pagemap_devmem_ops *ops,
-			     struct drm_pagemap *dpagemap, size_t size);
+			     struct drm_pagemap *dpagemap, size_t size,
+			     struct dma_fence *pre_migrate_fence);
 
 int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			    unsigned long start, unsigned long end,
 			    struct mm_struct *mm,
 			    unsigned long timeslice_ms);
 
+void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
+
+int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
 #endif
diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
new file mode 100644
index 000000000000..19169b42b891
--- /dev/null
+++ b/include/drm/drm_pagemap_util.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _DRM_PAGEMAP_UTIL_H_
+#define _DRM_PAGEMAP_UTIL_H_
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+struct drm_device;
+struct drm_pagemap;
+struct drm_pagemap_cache;
+struct drm_pagemap_owner;
+struct drm_pagemap_shrinker;
+
+/**
+ * struct drm_pagemap_peer - Structure representing a fast interconnect peer
+ * @list: Pointer to a &struct drm_pagemap_owner_list used to keep track of peers
+ * @link: List link for @list's list of peers.
+ * @owner: Pointer to a &struct drm_pagemap_owner, common for a set of peers having
+ * fast interconnects.
+ * @private: Pointer private to the struct embedding this struct.
+ */
+struct drm_pagemap_peer {
+	struct drm_pagemap_owner_list *list;
+	struct list_head link;
+	struct drm_pagemap_owner *owner;
+	void *private;
+};
+
+/**
+ * struct drm_pagemap_owner_list - Keeping track of peers and owners
+ * @peer: List of peers.
+ *
+ * The owner list defines the scope where we identify peers having fast interconnects
+ * and a common owner. Typically a driver has a single global owner list to
+ * keep track of common owners for the driver's pagemaps.
+ */
+struct drm_pagemap_owner_list {
+	/** @lock: Mutex protecting the @peers list. */
+	struct mutex lock;
+	/** @peers: List of peers. */
+	struct list_head peers;
+};
+
+/*
+ * Convenience macro to define an owner list.
+ * Typically the owner list statically declared
+ * driver-wide.
+ */
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	  .lock = __MUTEX_INITIALIZER((_name).lock),	\
+	  .peers = LIST_HEAD_INIT((_name).peers) }
+
+void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
+
+int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
+
+void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache);
+
+struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
+
+struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker);
+
+struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
+
+void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
+
+struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);
+
+#ifdef CONFIG_PROVE_LOCKING
+
+void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap);
+
+#else
+
+static inline void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap)
+{
+}
+
+#endif /* CONFIG_PROVE_LOCKING */
+
+void drm_pagemap_release_owner(struct drm_pagemap_peer *peer);
+
+int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
+			      struct drm_pagemap_owner_list *owner_list,
+			      bool (*has_interconnect)(struct drm_pagemap_peer *peer1,
+						       struct drm_pagemap_peer *peer2));
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bd6154e3b728..ae86906b3478 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2119,7 +2119,13 @@ struct drm_xe_madvise {
 		struct {
 #define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
 #define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
-			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+			/**
+			 * @preferred_mem_loc.devmem_fd:
+			 * Device file-descriptor of the device where the
+			 * preferred memory is located, or one of the
+			 * above special values. Please also see
+			 * @preferred_mem_loc.region_instance below.
+			 */
 			__u32 devmem_fd;
 
 #define DRM_XE_MIGRATE_ALL_PAGES		0
@@ -2127,8 +2133,14 @@ struct drm_xe_madvise {
 			/** @preferred_mem_loc.migration_policy: Page migration policy */
 			__u16 migration_policy;
 
-			/** @preferred_mem_loc.pad : MBZ */
-			__u16 pad;
+			/**
+			 * @preferred_mem_loc.region_instance : Region instance.
+			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
+			 * Otherwise should point to the desired device
+			 * VRAM instance of the device indicated by
+			 * @preferred_mem_loc.devmem_fd.
+			 */
+			__u16 region_instance;
 
 			/** @preferred_mem_loc.reserved : Reserved */
 			__u64 reserved;
-- 
2.51.1

