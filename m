Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B216CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 16:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2719D10E7EC;
	Tue,  2 Sep 2025 16:43:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E731110E7EC;
 Tue,  2 Sep 2025 16:43:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Driver-managed_?=
 =?utf-8?q?exhaustive_eviction_for_CI_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Sep 2025 16:43:49 -0000
Message-ID: <175683142994.295208.17270109396214966423@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250902141945.78317-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250902141945.78317-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Driver-managed exhaustive eviction for CI only
URL   : https://patchwork.freedesktop.org/series/153886/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fed0f0c1b6ef4f7488884482cd9df530b585d4af
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 2 16:19:45 2025 +0200

    drm/xe: Driver-managed exhaustive eviction for CI only
    
    For CI only. Please don't review.
    
    Test-with: 20250902130029.70621-1-thomas.hellstrom@linux.intel.com
    
    Squashed commit of the following:
    
    commit cd5f581d5024d6578ef474c926eea5fed49db66f
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Tue Aug 12 14:40:20 2025 +0200
    
        drm/xe: Convert pinned suspend eviction for exhaustive eviction
    
        Pinned suspend eviction and preparation for eviction validates
        system memory for eviction buffers. Do that under a
        validation exclusive lock to avoid interfering with other
        processes validating system graphics memory.
    
        v2:
        - Avoid gotos from within xe_validation_guard().
        - Adapt to signature change of xe_validation_guard().
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 757897d72146094e6a06ca0a6195d587252467fc
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Tue Sep 2 10:58:43 2025 +0200
    
        drm/xe: Rework instances of variants of xe_bo_create_locked()
    
        A common pattern is to create a locked bo, pin it without mapping
        and then unlock it. Add a function to do that, which internally
        uses xe_validation_guard().
        With that we can remove xe_bo_create_locked_range() and add
        exhaustive eviction to stolen, pf_provision_vf_lmem and
        psmi_alloc_object.
    
        v4:
        - New patch after reorganization.
        v5:
        - Replace DRM_XE_GEM_CPU_CACHING_WB with 0. (CI).
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit e3a36ef0e0f0c32ae1b347ec14681387801fa34a
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Fri Aug 15 10:10:53 2025 +0200
    
        drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
    
        Introduce an xe_bo_create_pin_map_novm() function that does not
        take the drm_exec paramenter to simplify the conversion of many
        callsites.
        For the rest, ensure that the same drm_exec context that was used
        for locking the vm is passed down to validation.
    
        Use xe_validation_guard() where appropriate.
    
        v2:
        - Avoid gotos from within xe_validation_guard(). (Matt Brost)
        - Break out the change to pf_provision_vf_lmem8 to a separate
          patch.
        - Adapt to signature change of xe_validation_guard().
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit d9afc4319a8b9f29e5c24d5776e43a1e82d8116c
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:55:36 2025 +0200
    
        drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
    
        Most users of xe_bo_create_pin_map_at() and
        xe_bo_create_pin_map_at_aligned() are not using the vm parameter,
        and that simplifies conversion. Introduce an
        xe_bo_create_pin_map_at_novm() function and make the _aligned()
        version static. Use xe_validation_guard() for conversion.
    
        v2:
        - Adapt to signature change of xe_validation_guard(). (Matt Brost)
        - Fix up documentation.
        v4:
        - Postpone the change to i915_gem_stolen_insert_node_in_range() to
          a later patch.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    
    commit aa55a4d85e1356cbc3e39b8d494b5bfb6e90484a
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Aug 13 10:27:47 2025 +0200
    
        drm/xe: Rename ___xe_bo_create_locked()
    
        Don't start external function names with underscores.
        Rename to xe_bo_init_locked().
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 0173f06882423d52073f54b96c7058a13d08c8a3
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe: Convert xe_dma_buf.c for exhaustive eviction
    
        Convert dma-buf migration to XE_PL_TT and dma-buf import to
        support exhaustive eviction, using xe_validation_guard().
        It seems unlikely that the import would result in an -ENOMEM,
        but convert import anyway for completeness.
    
        The dma-buf map_attachment() functionality unfortunately doesn't
        support passing a drm_exec, which means that foreign devices
        validating a dma-buf that we exported will not, unless they are
        xeKMD devices, participate in the exhaustive eviction scheme.
    
        v2:
        - Avoid gotos from within xe_validation_guard(). (Matt Brost)
        - Adapt to signature change of xe_validation_guard(). (Matt Brost)
        - Remove an unneeded (void)ret. (Matt Brost)
        - Fix up an error path.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    
    commit e62ff26744cb782493beacb931d72137d4087d28
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/xe/display: Convert __xe_pin_fb_vma()
    
        Convert __xe_pin_fb_vma() for exhaustive eviction
        using xe_validation_guard().
    
        v2:
        - Avoid gotos from within xe_validation_guard(). (Matt Brost)
        - Adapt to signature change of xe_validation_guard(). (Matt Brost)
        - Use interruptible waiting, since xe_bo_migrate() already does that.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 4ab6ab17616efb76116592b7f3621bfa09456360
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Convert the CPU fault handler for exhaustive eviction
    
        The CPU fault handler may populate bos and migrate, and in doing
        so might interfere with other tasks validating.
    
        Rework the CPU fault handler completely into a fastpath
        and a slowpath. The fastpath trylocks only the validation lock
        in read-mode. If that fails, there's a fallback to the
        slowpath, where we do a full validation transaction.
    
        This mandates open-coding of bo locking, bo idling and
        bo populating, but we still call into TTM for fault
        finalizing.
    
        v2:
        - Rework the CPU fault handler to actually take part in
          the exhaustive eviction scheme (Matthew Brost).
        v3:
        - Don't return anything but VM_FAULT_RETRY if we've dropped the
          mmap_lock. Not even if a signal is pending.
        - Rebase on gpu_madvise() and split out fault migration.
        - Wait for idle after migration.
        - Check whether the resource manager uses tts to determine
          whether to map the tt or iomem.
        - Add a number of asserts.
        - Allow passing a ttm_operation_ctx to xe_bo_migrate() so that
          it's possible to try non-blocking migration.
        - Don't fall through to TTM on migration / population error
          Instead remove the gfp_retry_mayfail in mode 2 where we
          must succeed. (Matthew Brost)
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit b0b2af39e664b08bfb9ab2ee21d765b903a19221
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Thu Aug 14 14:17:37 2025 +0200
    
        drm/xe: Convert existing drm_exec transactions for exhaustive eviction
    
        Convert existing drm_exec transactions, like GT pagefault validation,
        non-LR exec() IOCTL and the rebind worker to support
        exhaustive eviction using the xe_validation_guard().
    
        v2:
        - Adapt to signature change in xe_validation_guard() (Matt Brost)
        - Avoid gotos from within xe_validation_guard() (Matt Brost)
        - Check error return from xe_validation_guard()
    
        v3:
        - Rebase on gpu_madvise()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
    
    commit f8af57733567cf7d529748856b3566abcdc15e70
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 25 10:48:44 2025 +0200
    
        drm/xe: Convert SVM validation for exhaustive eviction
    
        Convert SVM validation to support exhaustive eviction,
        using xe_validation_guard().
    
        v2:
        - Wrap also xe_vm_range_rebind (Matt Brost)
        - Adapt to argument changes of xe_validation_guard().
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 9d68655c5aeb0d5cad2e5f0eb776af5cefc894f0
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:50:53 2025 +0200
    
        drm/xe: Convert xe_bo_create_user() for exhaustive eviction
    
        Use the xe_validation_guard() to convert xe_bo_create_user()
        for exhaustive eviction.
    
        v2:
        - Adapt to argument changes of xe_validation_guard()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
    
    commit 507c1a45fb5886402ef497f242b15cfbecda9c30
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Introduce a validation wrapper xe_validation_guard() as a helper
        intended to be used around drm_exec transactions what perform
        validations. Once TTM can handle exhaustive eviction we could
        remove this wrapper or make it mostly a NO-OP unless other
        functionality is added to it.
    
        Currently the wrapper takes a read lock upon entry and if the
        transaction hits an OOM, all locks are released and the
        transaction is retried with a write-lock. If all other
        validations participate in this scheme, the transaction with
        the write lock will be the only transaction validating and
        should have access to all available non-pinned memory.
    
        There is currently a problem in that TTM converts -EDEADLOCKS to
        -ENOMEM, and with ww_mutex slowpath error injections, we can hit
        -ENOMEMs without having actually ran out of memory. We abuse
        ww_mutex internals to detect such situations until TTM is fixes
        to not convert the error code. In the meantime, injecting
        ww_mutex slowpath -EDEADLOCKs is a good way to test
        the implementation in the absence of real OOMs.
    
        Just introduce the wrapper in this commit. It will be hooked up
        to the driver in following commits.
    
        v2:
        - Mark class_xe_validation conditional so that the loop is
          skipped on initialization error.
        - Argument sanitation (Matt Brost)
        - Fix conditional execution of xe_validation_ctx_fini()
          (Matt Brost)
        - Add a no_block mode for upcoming use in the CPU fault handler.
        v4:
        - Update kerneldoc. (Xe CI).
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 6fabfb602e577ce897b1dd3bc68168ee21a1805f
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 14:41:01 2024 +0200
    
        drm/xe: Pass down drm_exec context to validation
    
        We want all validation (potential backing store allocation) to be part
        of a drm_exec transaction. Therefore add a drm_exec pointer argument
        to xe_bo_validate() and ___xe_bo_create_locked(). Upcoming patches
        will deal with making all (or nearly all) calls to these functions
        part of a drm_exec transaction. In the meantime, define special values
        of the drm_exec pointer:
    
        XE_VALIDATION_UNIMPLEMENTED: Implementation of the drm_exec transaction
        has not been done yet.
        XE_VALIDATION_UNSUPPORTED: Some Middle-layers (dma-buf) doesn't allow
        the drm_exec context to be passed down to map_attachment where
        validation takes place.
        XE_VALIDATION_OPT_OUT: May be used only for kunit tests where exhaustive
        eviction isn't crucial and the ROI of converting those is very
        small.
    
        For XE_VALIDATION_UNIMPLEMENTED and XE_VALIDATION_OPT_OUT there is also
        a lockdep check that a drm_exec transaction can indeed start at the
        location where the macro is expanded. This is to encourage
        developers to take this into consideration early in the code
        development process.
    
        v2:
        - Fix xe_vm_set_validation_exec() imbalance. Add an assert that
          hopefully catches future instances of this (Matt Brost)
        v3:
        - Extend to psmi_alloc_object
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v3
+ /mt/dim checkpatch d5da0d39eb8ec29aeb92793ad8f0c5b1bdac5331 drm-intel
fed0f0c1b6ef drm/xe: Driver-managed exhaustive eviction for CI only
-:15: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'cd5f581d5024d6578ef474c926eea5fed49db66f', maybe rebased or not pulled?
#15: 
commit cd5f581d5024d6578ef474c926eea5fed49db66f

-:30: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#30: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:31: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#31: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:51: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#51: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:51: WARNING:BAD_SIGN_OFF: Duplicate signature
#51: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:73: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#73: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:73: WARNING:BAD_SIGN_OFF: Duplicate signature
#73: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:94: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#94: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:94: WARNING:BAD_SIGN_OFF: Duplicate signature
#94: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:95: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#95: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:95: WARNING:BAD_SIGN_OFF: Duplicate signature
#95: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:106: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#106: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:106: WARNING:BAD_SIGN_OFF: Duplicate signature
#106: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:107: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#107: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:107: WARNING:BAD_SIGN_OFF: Duplicate signature
#107: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:131: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#131: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:131: WARNING:BAD_SIGN_OFF: Duplicate signature
#131: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:132: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#132: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:132: WARNING:BAD_SIGN_OFF: Duplicate signature
#132: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:148: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#148: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:148: WARNING:BAD_SIGN_OFF: Duplicate signature
#148: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:149: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#149: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:149: WARNING:BAD_SIGN_OFF: Duplicate signature
#149: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:186: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#186: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:186: WARNING:BAD_SIGN_OFF: Duplicate signature
#186: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:206: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#206: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:206: WARNING:BAD_SIGN_OFF: Duplicate signature
#206: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:207: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#207: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

-:222: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#222: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:222: WARNING:BAD_SIGN_OFF: Duplicate signature
#222: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:223: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#223: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:223: WARNING:BAD_SIGN_OFF: Duplicate signature
#223: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-:237: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#237: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:237: WARNING:BAD_SIGN_OFF: Duplicate signature
#237: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:238: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#238: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

-:238: WARNING:BAD_SIGN_OFF: Duplicate signature
#238: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

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

-:317: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#317: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:317: WARNING:BAD_SIGN_OFF: Duplicate signature
#317: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:318: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#318: 
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v3

-:399: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#399: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:59:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

-:3192: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#3192: 
new file mode 100644

-:3626: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#3626: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while (0)

-:3648: WARNING:TABSTOP: Statements should start on a tabstop
#3648: FILE: drivers/gpu/drm/xe/xe_validation.h:168:
+	     if (_T) xe_validation_ctx_fini(_T);,

-:3648: ERROR:SPACING: space required after that ';' (ctx:VxO)
#3648: FILE: drivers/gpu/drm/xe/xe_validation.h:168:
+	     if (_T) xe_validation_ctx_fini(_T);,
 	                                       ^

-:3648: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#3648: FILE: drivers/gpu/drm/xe/xe_validation.h:168:
+	     if (_T) xe_validation_ctx_fini(_T);,

-:3668: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#3668: FILE: drivers/gpu/drm/xe/xe_validation.h:188:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
+	drm_exec_until_all_locked(_exec)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:3668: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#3668: FILE: drivers/gpu/drm/xe/xe_validation.h:188:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
+	drm_exec_until_all_locked(_exec)

total: 3 errors, 47 warnings, 1 checks, 3700 lines checked


