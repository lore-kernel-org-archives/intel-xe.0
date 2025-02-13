Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6849BC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 14:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3546410EAC6;
	Thu, 13 Feb 2025 14:19:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4DA10EAC6;
 Thu, 13 Feb 2025 14:19:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/userptr=3A_fix_EFA?=
 =?utf-8?q?ULT_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 14:19:38 -0000
Message-ID: <173945637844.1682081.9390983320023801714@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213135434.186967-2-matthew.auld@intel.com>
In-Reply-To: <20250213135434.186967-2-matthew.auld@intel.com>
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

Series: drm/xe/userptr: fix EFAULT handling
URL   : https://patchwork.freedesktop.org/series/144799/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e21c4aae253ceb67a91f2e72d82eb112b6391a7a
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Feb 13 13:54:35 2025 +0000

    drm/xe/userptr: fix EFAULT handling
    
    Currently we treat EFAULT from hmm_range_fault() as a non-fatal error
    when called from xe_vm_userptr_pin() with the idea that we want to avoid
    killing the entire vm and chucking an error, under the assumption that
    the user just did an unmap or something, and has no intention of
    actually touching that memory from the GPU.  At this point we have
    already zapped the PTEs so any access should generate a page fault, and
    if the pin fails there also it will then become fatal.
    
    However it looks like it's possible for the userptr vma to still be on
    the rebind list in preempt_rebind_work_func(), if we had to retry the
    pin again due to something happening in the caller before we did the
    rebind step, but in the meantime needing to re-validate the userptr and
    this time hitting the EFAULT.
    
    This might explain an internal user report of hitting:
    
    [  191.738349] WARNING: CPU: 1 PID: 157 at drivers/gpu/drm/xe/xe_res_cursor.h:158 xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
    [  191.738551] Workqueue: xe-ordered-wq preempt_rebind_work_func [xe]
    [  191.738616] RIP: 0010:xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
    [  191.738690] Call Trace:
    [  191.738692]  <TASK>
    [  191.738694]  ? show_regs+0x69/0x80
    [  191.738698]  ? __warn+0x93/0x1a0
    [  191.738703]  ? xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
    [  191.738759]  ? report_bug+0x18f/0x1a0
    [  191.738764]  ? handle_bug+0x63/0xa0
    [  191.738767]  ? exc_invalid_op+0x19/0x70
    [  191.738770]  ? asm_exc_invalid_op+0x1b/0x20
    [  191.738777]  ? xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
    [  191.738834]  ? ret_from_fork_asm+0x1a/0x30
    [  191.738849]  bind_op_prepare+0x105/0x7b0 [xe]
    [  191.738906]  ? dma_resv_reserve_fences+0x301/0x380
    [  191.738912]  xe_pt_update_ops_prepare+0x28c/0x4b0 [xe]
    [  191.738966]  ? kmemleak_alloc+0x4b/0x80
    [  191.738973]  ops_execute+0x188/0x9d0 [xe]
    [  191.739036]  xe_vm_rebind+0x4ce/0x5a0 [xe]
    [  191.739098]  ? trace_hardirqs_on+0x4d/0x60
    [  191.739112]  preempt_rebind_work_func+0x76f/0xd00 [xe]
    
    Followed by NPD, when running some workload, since the sg was never
    actually populated but the vma is still marked for rebind when it should
    be skipped for this special EFAULT case. And from the logs it does seem
    like we hit this special EFAULT case before the explosions.
    
    Fixes: 521db22a1d70 ("drm/xe: Invalidate userptr VMA on page pin fault")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: <stable@vger.kernel.org> # v6.10+
+ /mt/dim checkpatch dbf65862427b99b51ac5279560a1f7995779480b drm-intel
e21c4aae253c drm/xe/userptr: fix EFAULT handling


