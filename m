Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBBFD60CF8
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 23:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E19010E571;
	Mon, 18 Nov 2024 23:56:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13AD10E571;
 Mon, 18 Nov 2024 23:56:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_UMD_direct_submission_in_?=
 =?utf-8?q?Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 23:56:13 -0000
Message-ID: <173197417367.96817.3636818044227505791@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118233757.2374041-1-matthew.brost@intel.com>
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Series: UMD direct submission in Xe
URL   : https://patchwork.freedesktop.org/series/141524/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd7041dbc34b697461e84cd7d38b2784e7853a0f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Nov 18 15:37:57 2024 -0800

    drm/xe: Add user fence TDR
    
    We cannot let user fences exported as dma-fence run forever. Add a TDR
    to protect against this. If the TDR fires the entire VM is killed as
    dma-fences are not tied to an individual queue.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 drm-intel
3b27548d741a dma-fence: Add dma_fence_preempt base class
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 196 lines checked
f836e556d719 dma-fence: Add dma_fence_user_fence
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 111 lines checked
4c039e71cffc drm/xe: Use dma_fence_preempt base class
38341048855b drm/xe: Allocate doorbells for UMD exec queues
b7209cee2419 drm/xe: Add doorbell ID to snapshot capture
b2dee00a61e4 drm/xe: Break submission ring out into its own BO
d95585c2ee8f drm/xe: Break indirect ring state out into its own BO
a30d863635da drm/xe: Clear GGTT in xe_bo_restore_kernel
84944b9c1f1d FIXME: drm/xe: Add pad to ring and indirect state
550fa09a00fe drm/xe: Enable indirect ring on media GT
be690f2647b7 drm/xe: Don't add pinned mappings to VM bulk move
ce8d0d54124a drm/xe: Add exec queue post init extension processing
8ff7df45be74 drm/xe/mmap: Add mmap support for PCI memory barrier
86de49917d5c drm/xe: Add support for mmapping doorbells to user space
b7d96c9304d8 drm/xe: Add support for mmapping submission ring and indirect ring state to user space
1630ab640fee drm/xe/uapi: Define UMD exec queue mapping uAPI
-:8: WARNING:TYPO_SPELLING: 'addres' may be misspelled - perhaps 'address'?
#8: 
space. The ring is a VM PPGTT addres, while indirect LRC state and
                              ^^^^^^

-:67: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#67: FILE: include/uapi/drm/xe_drm.h:1160:
+	/**
+	  * @indirect_ring_state_handle: Indirect ring state buffer object

-:69: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#69: FILE: include/uapi/drm/xe_drm.h:1162:
+	  * handle. Allocated by KMD and must be closed by user.
+	 */

total: 0 errors, 3 warnings, 0 checks, 68 lines checked
b2d24cbf3b91 drm/xe: Add usermap exec queue extension
-:122: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*q->usermap)...) over kzalloc(sizeof(struct xe_exec_queue_usermap)...)
#122: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:514:
+	q->usermap = kzalloc(sizeof(struct xe_exec_queue_usermap), GFP_KERNEL);

total: 0 errors, 0 warnings, 1 checks, 321 lines checked
b134a5b875c3 drm/xe: Drop EXEC_QUEUE_FLAG_UMD_SUBMISSION flag
-:100: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#100: FILE: drivers/gpu/drm/xe/xe_lrc.c:915:
+	bool user_queue = q && xe_exec_queue_is_usermap(q);;

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
223fca1c8cba drm/xe: Do not allow usermap exec queues in exec IOCTL
0cb1042c6859 drm/xe: Teach GuC backend to kill usermap queues
-:11: WARNING:TYPO_SPELLING: 'seperate' may be misspelled - perhaps 'separate'?
#11: 
a seperate flow for now.
  ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 117 lines checked
470726cbe300 drm/xe: Enable preempt fences on usermap queues
477f8b172fd2 drm/xe/uapi: Add uAPI to convert user semaphore to / from drm syncobj
-:35: WARNING:LONG_LINE: line length of 131 exceeds 100 columns
#35: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_VM_CONVERT_FENCE		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_CONVERT_FENCE, struct drm_xe_vm_convert_fence)

total: 0 errors, 1 warnings, 0 checks, 80 lines checked
bd5175771179 drm/xe: Add user fence IRQ handler
25422eefe1b9 drm/xe: Add xe_hw_fence_user_init
a5f0a9af98c7 drm/xe: Add a message lock to the Xe GPU scheduler
-:89: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'sched' may be better as '(sched)' to avoid precedence issues
#89: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:32:
+#define xe_sched_msg_lock(sched, flags) \
+	spin_lock_irqsave(&sched->msg_lock, flags)

-:96: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'sched' may be better as '(sched)' to avoid precedence issues
#96: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:35:
+#define xe_sched_msg_unlock(sched, flags) \
+	spin_unlock_irqrestore(&sched->msg_lock, flags)

total: 0 errors, 0 warnings, 2 checks, 138 lines checked
27c8b6a6ff59 drm/xe: Always wait on preempt fences in vma_check_userptr
a56a39c0e6d2 drm/xe: Teach xe_sync layer about drm_xe_semaphore
8978b6080bfd drm/xe: Add VM convert fence IOCTL
-:291: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm' - possible side-effects?
#291: FILE: drivers/gpu/drm/xe/xe_vm.c:3558:
+#define retry_required(__tries, __vm) \
+	(IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT) ? \
+	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
+	__xe_vm_userptr_needs_repin(__vm))

total: 0 errors, 0 warnings, 1 checks, 350 lines checked
fd7041dbc34b drm/xe: Add user fence TDR
-:30: ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#30: FILE: drivers/gpu/drm/xe/xe_vm.c:340:
+	if (!(vm->flags |= XE_VM_FLAG_BANNED)) {

-:218: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kmalloc(sizeof(*tdr_items[i])...) over kmalloc(sizeof(struct tdr_item)...)
#218: FILE: drivers/gpu/drm/xe/xe_vm.c:3641:
+			tdr_items[i] = kmalloc(sizeof(struct tdr_item),

total: 1 errors, 0 warnings, 1 checks, 265 lines checked


