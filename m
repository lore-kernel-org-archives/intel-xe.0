Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92826EB3637
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 22:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBF310E5DE;
	Mon,  2 Mar 2026 22:04:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F2D10E5DD;
 Mon,  2 Mar 2026 22:04:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Two-pass_MMU_interval_not?=
 =?utf-8?q?ifiers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 22:04:35 -0000
Message-ID: <177248907538.305661.13210464326044259032@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
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

Series: Two-pass MMU interval notifiers (rev2)
URL   : https://patchwork.freedesktop.org/series/153280/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c2e8c69404a2a73e66de3c340f9fdcb3dfcc1350
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Mar 2 17:32:48 2026 +0100

    drm/xe/userptr: Defer Waiting for TLB invalidation to the second pass if possible
    
    Now that the two-pass notifier flow uses xe_vma_userptr_do_inval() for
    the fence-wait + TLB-invalidate work, extend it to support a further
    deferred TLB wait:
    
    - xe_vma_userptr_do_inval(): when the embedded finish handle is free,
      submit the TLB invalidation asynchronously (xe_vm_invalidate_vma_submit)
      and return &userptr->finish so the mmu_notifier core schedules a third
      pass.  When the handle is occupied by a concurrent invalidation, fall
      back to the synchronous xe_vm_invalidate_vma() path.
    
    - xe_vma_userptr_complete_tlb_inval(): new helper called from
      invalidate_finish when tlb_inval_submitted is set.  Waits for the
      previously submitted batch and unmaps the gpusvm pages.
    
    xe_vma_userptr_invalidate_finish() dispatches between the two helpers
    via tlb_inval_submitted, making the three possible flows explicit:
    
      pass1 (fences pending)  -> invalidate_finish -> do_inval (sync TLB)
      pass1 (fences done)     -> do_inval -> invalidate_finish
                              -> complete_tlb_inval (deferred TLB)
      pass1 (finish occupied) -> do_inval (sync TLB, inline)
    
    In multi-GPU scenarios this allows TLB flushes to be submitted on all
    GPUs in one pass before any of them are waited on.
    
    Also adds xe_vm_invalidate_vma_submit() which submits the TLB range
    invalidation without blocking, populating a xe_tlb_inval_batch that
    the caller waits on separately.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 658ee8457333fe9f26f88f812f6cd423f800720b drm-intel
cf2abf1e0058 mm/mmu_notifier: Allow two-pass struct mmu_interval_notifiers
-:48: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#48: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.

-:48: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6 # Documentation only.'
#48: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.

total: 1 errors, 1 warnings, 0 checks, 162 lines checked
90515c84cb85 drm/xe/userptr: Convert invalidation to two-pass MMU notifier
-:32: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#32: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:32: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#32: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 179 lines checked
aba93520ca36 drm/xe: Split TLB invalidation into submit and wait steps
-:21: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#21: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:21: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#21: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 277 lines checked
c2e8c69404a2 drm/xe/userptr: Defer Waiting for TLB invalidation to the second pass if possible
-:39: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#39: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:39: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#39: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 216 lines checked


