Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1382ECA0FE5
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C931A10E9A4;
	Thu, 21 Aug 2025 14:03:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D34810E9A4;
 Thu, 21 Aug 2025 14:03:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Two-pass_MMU_notifier_for?=
 =?utf-8?q?_CI_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 14:03:32 -0000
Message-ID: <175578501231.257269.9072728321200792800@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250821132114.97325-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250821132114.97325-1-thomas.hellstrom@linux.intel.com>
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

Series: Two-pass MMU notifier for CI only
URL   : https://patchwork.freedesktop.org/series/153295/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 49590a511db67bc312cec103811fb56f20adae2a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Aug 21 15:21:14 2025 +0200

    Two-pass MMU notifier for CI only
    
    Squashed commit of the following:
    
    commit 44b594b3bbbdd454dcab9e499b5275aa1c9f0109
    Author: Matthew Brost <matthew.brost@intel.com>
    Date:   Thu Aug 7 22:27:10 2025 -0700
    
        drm/xe: Implement two pass MMU notifiers for SVM
    
        Implement two-pass MMU notifiers for SVM, enabling multiple VMs or
        devices with GPU mappings to pipeline costly TLB invalidations by
        issuing them in the first pass and waiting for completion in the second.
    
        v1:
        - Adjust naming.
    
        Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    
    commit c783c6dabdab4ed92085e4fc0bed2689cf9249ba
    Author: Matthew Brost <matthew.brost@intel.com>
    Date:   Thu Aug 7 22:27:10 2025 -0700
    
        drm/xe: Add fences argument to xe_vm_range_tilemask_tlb_invalidation
    
        Introduce a fences argument to xe_vm_range_tilemask_tlb_invalidation,
        allowing callers to provide fences and defer waiting to a later point.
    
        Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 9a5708c3ccd3f99102a29888eeff4fac3e5ec574
    Author: Matthew Brost <matthew.brost@intel.com>
    Date:   Thu Aug 7 22:27:09 2025 -0700
    
        drm/xe: Skip waiting on unarmed fences in xe_gt_tlb_invalidation_fence_wait
    
        Avoids unnecessary waits when the TLB invalidation fence has not been
        armed, simplifying caller logic in cases where the fence status is
        uncertain.
    
        Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 55d8d77c804087e5fad1b5ca8d2e1d8ce816b646
    Author: Matthew Brost <matthew.brost@intel.com>
    Date:   Thu Aug 7 22:27:08 2025 -0700
    
        drm/gpusvm: Add drm_gpusvm_in_notifier_* helpers
    
        Abstract drm_gpusvm_in_notifier_lock/unlock with helpers. Intended usage
        is a client side 2nd pass of a MMU notifier.
    
        Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    
    commit 087aed38ceaee2daef97acd816fde538bd53b74e
    Author: Matthew Brost <matthew.brost@intel.com>
    Date:   Thu Aug 7 22:27:07 2025 -0700
    
        drm/gpusvm, drm/xe: Update GPU SVM / Xe to twopass MMU notifier
    
        Update GPU SVM and Xe to use two-pass MMU notifiers, enabling pipelined
        TLB invalidations across VMs or multiple devices.
    
        The driver-side (Xe) implementation is not yet implemented.
    
        v1:
        - Update function naming and comments.
    
        Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    
    commit e43edf1f7e1a8fbe97157c10d0d9ec97aa7ba6e1
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sat Aug 9 15:35:06 2025 +0200
    
        mm/mmu_notifier: Allow two-pass struct mmu_interval_notifiers
    
        GPU use-cases for mmu_interval_notifiers with hmm often involve
        starting a gpu operation and then waiting for it to complete.
        These operations are typically context preemption or TLB flushing.
    
        With single-pass notifiers per GPU this doesn't scale in
        multi-gpu scenarios. In those scenarios we'd want to first start
        preemption- or TLB flushing on all GPUs and as a second pass wait
        for them to complete.
    
        One can do this on per-driver basis multiplexing per-driver
        notifiers but that would mean sharing the notifier "user" lock
        across all GPUs and that doesn't scale well either, so adding support
        for multi-pass in the core appears to be the right choice.
    
        Implement two-pass capability in the mmu_interval_notifier. Use a
        linked list for the final passes to minimize the impact for
        use-cases that don't need the multi-pass functionality by avoiding
        a second interval tree walk, and to be able to easily pass data
        between the two passes.
    
        v1:
        - Restrict to two passes (Jason Gunthorpe)
        - Improve on documentation (Jason Gunthorpe)
        - Improve on function naming (Alistair Popple)
    
        Cc: Jason Gunthorpe <jgg@ziepe.ca>
        Cc: Andrew Morton <akpm@linux-foundation.org>
        Cc: Simona Vetter <simona.vetter@ffwll.ch>
        Cc: Dave Airlie <airlied@gmail.com>
        Cc: Alistair Popple <apopple@nvidia.com>
        Cc: <dri-devel@lists.freedesktop.org>
        Cc: <linux-mm@kvack.org>
        Cc: <linux-kernel@vger.kernel.org>
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 16e133c7e6922a9f224b272a48ac172cf06e3408 drm-intel
49590a511db6 Two-pass MMU notifier for CI only
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '44b594b3bbbdd454dcab9e499b5275aa1c9f0109', maybe rebased or not pulled?
#11: 
commit 44b594b3bbbdd454dcab9e499b5275aa1c9f0109

-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
    issuing them in the first pass and waiting for completion in the second.

-:24: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#24: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:35: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#35: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:35: WARNING:BAD_SIGN_OFF: Duplicate signature
#35: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:47: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#47: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:47: WARNING:BAD_SIGN_OFF: Duplicate signature
#47: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:58: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#58: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:58: WARNING:BAD_SIGN_OFF: Duplicate signature
#58: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:74: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#74: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:74: WARNING:BAD_SIGN_OFF: Duplicate signature
#74: 
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:107: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#107: 
    Cc: Jason Gunthorpe <jgg@ziepe.ca>

-:108: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#108: 
    Cc: Andrew Morton <akpm@linux-foundation.org>

-:109: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#109: 
    Cc: Simona Vetter <simona.vetter@ffwll.ch>

-:110: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#110: 
    Cc: Dave Airlie <airlied@gmail.com>

-:111: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#111: 
    Cc: Alistair Popple <apopple@nvidia.com>

-:112: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#112: 
    Cc: <dri-devel@lists.freedesktop.org>

-:113: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#113: 
    Cc: <linux-mm@kvack.org>

-:114: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#114: 
    Cc: <linux-kernel@vger.kernel.org>

-:116: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#116: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 20 warnings, 0 checks, 508 lines checked


