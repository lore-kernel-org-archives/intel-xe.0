Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD9DC19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 12:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5645610E807;
	Wed,  5 Mar 2025 12:50:22 +0000 (UTC)
Received: from db0ebb060c04 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F1710E81C;
 Wed,  5 Mar 2025 12:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_The_xe_bo_shrin?=
 =?utf-8?q?ker_series_for_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 12:50:21 -0000
Message-ID: <174117902145.91893.14261431471261501339@db0ebb060c04>
X-Patchwork-Hint: ignore
References: <20250305101023.251956-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250305101023.251956-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: The xe bo shrinker series for testing
URL   : https://patchwork.freedesktop.org/series/145816/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a491e7880cc32c94d2d10ac4c97d0d8bf9906d0c
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 5 11:10:23 2025 +0100

    drm/xe: The xe bo shrinker series for testing
    
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
+ /mt/dim checkpatch cc4910a0bf99a078684b793860762c0e00c88c4b drm-intel
a491e7880cc3 drm/xe: The xe bo shrinker series for testing
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f66aa63eb0986ac486d052388c06d0347915efa7', maybe rebased or not pulled?
#11: 
commit f66aa63eb0986ac486d052388c06d0347915efa7

-:33: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#33: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:34: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#34: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:92: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#92: 
    Cc: Christian König <christian.koenig@amd.com>

-:93: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#93: 
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

-:94: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#94: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:95: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#95: 
    Cc: <dri-devel@lists.freedesktop.org>

-:96: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#96: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:96: WARNING:BAD_SIGN_OFF: Duplicate signature
#96: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:97: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#97: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:97: WARNING:BAD_SIGN_OFF: Duplicate signature
#97: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:115: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#115: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:115: WARNING:BAD_SIGN_OFF: Duplicate signature
#115: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:116: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#116: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:116: WARNING:BAD_SIGN_OFF: Duplicate signature
#116: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:117: WARNING:BAD_SIGN_OFF: Do not use whitespace before Acked-by:
#117: 
    Acked-by: Dave Airlie <airlied@redhat.com>

-:157: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#157: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:157: WARNING:BAD_SIGN_OFF: Duplicate signature
#157: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:158: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#158: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:158: WARNING:BAD_SIGN_OFF: Duplicate signature
#158: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:159: WARNING:BAD_SIGN_OFF: Do not use whitespace before Acked-by:
#159: 
    Acked-by: Dave Airlie <airlied@redhat.com>

-:159: WARNING:BAD_SIGN_OFF: Duplicate signature
#159: 
    Acked-by: Dave Airlie <airlied@redhat.com>

-:160: WARNING:BAD_SIGN_OFF: Do not use whitespace before Acked-by:
#160: 
    Acked-by: Christian König <christian.koenig@amd.com>

-:178: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#178: 
    Cc: Christian König <christian.koenig@amd.com>

-:178: WARNING:BAD_SIGN_OFF: Duplicate signature
#178: 
    Cc: Christian König <christian.koenig@amd.com>

-:179: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#179: 
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

-:179: WARNING:BAD_SIGN_OFF: Duplicate signature
#179: 
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

-:180: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#180: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:180: WARNING:BAD_SIGN_OFF: Duplicate signature
#180: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:181: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#181: 
    Cc: <dri-devel@lists.freedesktop.org>

-:181: WARNING:BAD_SIGN_OFF: Duplicate signature
#181: 
    Cc: <dri-devel@lists.freedesktop.org>

-:182: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#182: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:182: WARNING:BAD_SIGN_OFF: Duplicate signature
#182: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:183: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#183: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:183: WARNING:BAD_SIGN_OFF: Duplicate signature
#183: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:184: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#184: 
    Reviewed-by: Christian König <christian.koenig@amd.com>

-:234: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#234: 
    Cc: Christian König <christian.koenig@amd.com>

-:234: WARNING:BAD_SIGN_OFF: Duplicate signature
#234: 
    Cc: Christian König <christian.koenig@amd.com>

-:235: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#235: 
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

-:235: WARNING:BAD_SIGN_OFF: Duplicate signature
#235: 
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

-:236: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#236: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:236: WARNING:BAD_SIGN_OFF: Duplicate signature
#236: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:237: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#237: 
    Cc: <dri-devel@lists.freedesktop.org>

-:237: WARNING:BAD_SIGN_OFF: Duplicate signature
#237: 
    Cc: <dri-devel@lists.freedesktop.org>

-:238: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#238: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:238: WARNING:BAD_SIGN_OFF: Duplicate signature
#238: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:239: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#239: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:239: WARNING:BAD_SIGN_OFF: Duplicate signature
#239: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:240: WARNING:BAD_SIGN_OFF: Do not use whitespace before Acked-by:
#240: 
    Acked-by: Christian Koenig <christian.koenig@amd.com>

-:274: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#274: 
    Cc: Christian König <christian.koenig@amd.com>

-:274: WARNING:BAD_SIGN_OFF: Duplicate signature
#274: 
    Cc: Christian König <christian.koenig@amd.com>

-:275: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#275: 
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

-:275: WARNING:BAD_SIGN_OFF: Duplicate signature
#275: 
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

-:276: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#276: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:276: WARNING:BAD_SIGN_OFF: Duplicate signature
#276: 
    Cc: Matthew Brost <matthew.brost@intel.com>

-:277: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#277: 
    Cc: <dri-devel@lists.freedesktop.org>

-:277: WARNING:BAD_SIGN_OFF: Duplicate signature
#277: 
    Cc: <dri-devel@lists.freedesktop.org>

-:278: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#278: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:278: WARNING:BAD_SIGN_OFF: Duplicate signature
#278: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:279: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#279: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:279: WARNING:BAD_SIGN_OFF: Duplicate signature
#279: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:280: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#280: 
    Reviewed-by: Christian König <christian.koenig@amd.com>

-:280: WARNING:BAD_SIGN_OFF: Duplicate signature
#280: 
    Reviewed-by: Christian König <christian.koenig@amd.com>

-:282: WARNING:BAD_SIGN_OFF: Duplicate signature
#282: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:298: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#298: 
new file mode 100644

-:2576: WARNING:TABSTOP: Statements should start on a tabstop
#2576: FILE: include/drm/ttm/ttm_bo.h:531:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:2576: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#2576: FILE: include/drm/ttm/ttm_bo.h:531:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:2576: WARNING:BRACES: braces {} are not necessary for single statement blocks
#2576: FILE: include/drm/ttm/ttm_bo.h:531:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:2603: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2603: FILE: include/drm/ttm/ttm_bo.h:558:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
+		     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:2603: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_cursor' - possible side-effects?
#2603: FILE: include/drm/ttm/ttm_bo.h:558:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
+		     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:2603: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_bo' - possible side-effects?
#2603: FILE: include/drm/ttm/ttm_bo.h:558:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
+		     (_bo) = ttm_bo_lru_cursor_next(_cursor))

total: 2 errors, 67 warnings, 2 checks, 2344 lines checked


