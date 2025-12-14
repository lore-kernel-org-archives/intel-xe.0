Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21F3D5B16C
	for <intel-xe@archiver.kernel.org>; Sun, 14 Dec 2025 19:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB1010E011;
	Sun, 14 Dec 2025 19:51:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD78510E011;
 Sun, 14 Dec 2025 19:51:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=2C_drm/xe=3A_Squashed?=
 =?utf-8?q?_Dynamic_pagemaps_and_multi-device_SVM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 14 Dec 2025 19:51:00 -0000
Message-ID: <176574186067.87221.11274272868540343846@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251214194500.28342-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251214194500.28342-1-thomas.hellstrom@linux.intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm, drm/xe: Squashed Dynamic pagemaps and multi-device SVM
URL   : https://patchwork.freedesktop.org/series/158984/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 57f87dc109349e3c37d1c53d0af669188e8ca4c3
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Dec 14 20:45:00 2025 +0100

    drm, drm/xe: Squashed Dynamic pagemaps and multi-device SVM
    
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
+ /mt/dim checkpatch c4e22b127f18ea8765c4fabc251d019dd3aa41a4 drm-intel
57f87dc10934 drm, drm/xe: Squashed Dynamic pagemaps and multi-device SVM
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd6047035ab690e327ba4ec0515c1def0b221199d', maybe rebased or not pulled?
#13: 
commit d6047035ab690e327ba4ec0515c1def0b221199d

-:36: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#36: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:72: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#72: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:72: WARNING:BAD_SIGN_OFF: Duplicate signature
#72: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:86: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#86: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:86: WARNING:BAD_SIGN_OFF: Duplicate signature
#86: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:110: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#110: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:110: WARNING:BAD_SIGN_OFF: Duplicate signature
#110: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:123: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#123: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:123: WARNING:BAD_SIGN_OFF: Duplicate signature
#123: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:138: WARNING:BAD_SIGN_OFF: Do not use whitespace before Suggested-by:
#138: 
    Suggested-by: Matthew Brost <matthew.brost@intel.com>

-:139: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#139: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:139: WARNING:BAD_SIGN_OFF: Duplicate signature
#139: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:140: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#140: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:155: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#155: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:155: WARNING:BAD_SIGN_OFF: Duplicate signature
#155: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:156: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#156: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

-:179: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#179: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:179: WARNING:BAD_SIGN_OFF: Duplicate signature
#179: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:180: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#180: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:180: WARNING:BAD_SIGN_OFF: Duplicate signature
#180: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:208: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#208: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:208: WARNING:BAD_SIGN_OFF: Duplicate signature
#208: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:209: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#209: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:209: WARNING:BAD_SIGN_OFF: Duplicate signature
#209: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:220: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#220: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:220: WARNING:BAD_SIGN_OFF: Duplicate signature
#220: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:221: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#221: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:221: WARNING:BAD_SIGN_OFF: Duplicate signature
#221: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:245: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#245: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:245: WARNING:BAD_SIGN_OFF: Duplicate signature
#245: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:262: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#262: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:262: WARNING:BAD_SIGN_OFF: Duplicate signature
#262: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:263: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#263: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2

-:280: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#280: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:280: WARNING:BAD_SIGN_OFF: Duplicate signature
#280: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:281: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#281: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:281: WARNING:BAD_SIGN_OFF: Duplicate signature
#281: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:304: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#304: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:304: WARNING:BAD_SIGN_OFF: Duplicate signature
#304: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:305: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#305: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:305: WARNING:BAD_SIGN_OFF: Duplicate signature
#305: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:319: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#319: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:319: WARNING:BAD_SIGN_OFF: Duplicate signature
#319: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:320: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#320: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:320: WARNING:BAD_SIGN_OFF: Duplicate signature
#320: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:332: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#332: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:332: WARNING:BAD_SIGN_OFF: Duplicate signature
#332: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:333: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#333: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:333: WARNING:BAD_SIGN_OFF: Duplicate signature
#333: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:357: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#357: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:357: WARNING:BAD_SIGN_OFF: Duplicate signature
#357: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:358: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#358: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:358: WARNING:BAD_SIGN_OFF: Duplicate signature
#358: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:386: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#386: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:386: WARNING:BAD_SIGN_OFF: Duplicate signature
#386: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:387: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#387: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:387: WARNING:BAD_SIGN_OFF: Duplicate signature
#387: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:400: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#400: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:400: WARNING:BAD_SIGN_OFF: Duplicate signature
#400: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:401: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#401: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:401: WARNING:BAD_SIGN_OFF: Duplicate signature
#401: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:420: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#420: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:420: WARNING:BAD_SIGN_OFF: Duplicate signature
#420: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:421: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#421: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

-:421: WARNING:BAD_SIGN_OFF: Duplicate signature
#421: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

-:452: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")'
#452: 
    Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")

-:453: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#453: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:454: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#454: 
    Cc: <stable@vger.kernel.org> # v6.15+

-:455: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#455: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:455: WARNING:BAD_SIGN_OFF: Duplicate signature
#455: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:465: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: cc795e041034 ("drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public")'
#465: 
    Fixes: cc795e041034 ("drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public")

-:466: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#466: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:466: WARNING:BAD_SIGN_OFF: Duplicate signature
#466: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:467: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#467: 
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:468: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#468: 
    Cc: <stable@vger.kernel.org> # v6.17+

-:469: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#469: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:469: WARNING:BAD_SIGN_OFF: Duplicate signature
#469: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:470: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#470: 
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:472: WARNING:BAD_SIGN_OFF: Duplicate signature
#472: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:1074: WARNING:LINE_SPACING: Missing a blank line after declarations
#1074: FILE: drivers/gpu/drm/drm_pagemap.c:589:
+		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
+		cur.start = i;

-:1513: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1513: 
new file mode 100644

-:4365: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#4365: FILE: include/drm/drm_pagemap_util.h:53:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	  .lock = __MUTEX_INITIALIZER((_name).lock),	\
+	  .peers = LIST_HEAD_INIT((_name).peers) }

total: 0 errors, 82 warnings, 1 checks, 3744 lines checked


