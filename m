Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEF1606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 14:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DB610EF52;
	Mon, 26 Oct 2026 14:58:33 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3839310EF52;
 Mon, 26 Oct 2026 14:58:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/svm=3A_Take_write_?=
 =?utf-8?q?access_only_for_GC_attribute_resets?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 14:58:33 -0000
Message-ID: <179302671322.71419.5552652231396507820@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026122045.2709500-1-arvind.yadav@intel.com>
In-Reply-To: <20261026122045.2709500-1-arvind.yadav@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe/svm: Take write access only for GC attribute resets
URL   : https://patchwork.freedesktop.org/series/176860/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f05d9604ecdb7550641e08bc31a680171ccc0c79
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Mon Oct 26 17:50:45 2026 +0530

    drm/xe/svm: Take write access only for GC attribute resets
    
    Fault service holds vm->lock for read while using a VMA. SVM garbage
    collection also runs under the read lock and can reset AUTORESET
    attributes. The reset can split or merge VMAs and immediately free a
    VMA that another fault worker is still using. The GC mutex serializes
    collectors but does not protect VMA readers.
    
    Keep backing collection under read access when no attribute change is
    needed. Defer ranges requiring a reset and return -EAGAIN so the caller
    can release its read-side state and collect with write access.
    
    In fault service, discard the old VMA pointer before releasing the read
    lock. After acquiring write access, recheck VM state and collect the
    queued ranges. Downgrade to read and repeat VMA lookup, permission checks
    and advice-dependent setup.
    
    Drain GC under the existing write lock before madvise, bind and attribute
    query. Require write access for VMA changes while retaining parallel
    fault service when no reset is needed.
    
    [ 2163.042338] ==================================================================
    [ 2163.042353] BUG: KASAN: slab-use-after-free in __xe_svm_handle_pagefault+0x297/0x1460 [xe]
    [ 2163.042815] Read of size 8 at addr ffff88813f879b70 by task kworker/u65:3/3115
    
    [ 2163.042834] CPU: 0 UID: 0 PID: 3115 Comm: kworker/u65:3 Kdump: loaded Tainted: G S      W  O        7.3.0-lgci-xe-svm-22oct #16 PREEMPT(full)
    [ 2163.042841] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN, [O]=OOT_MODULE
    [ 2163.042842] Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 1002 03/31/2023
    [ 2163.042845] Workqueue: xe_page_fault_work_queue xe_pagefault_queue_work [xe]
    [ 2163.043326] Call Trace:
    [ 2163.043327]  <TASK>
    [ 2163.043330]  dump_stack_lvl+0x91/0xf0
    [ 2163.043336]  print_report+0xd1/0x610
    [ 2163.043340]  ? __xe_svm_handle_pagefault+0x297/0x1460 [xe]
    [ 2163.043825]  ? __virt_addr_valid+0x1b2/0x350
    [ 2163.043831]  ? kasan_complete_mode_report_info+0x6a/0x210
    [ 2163.043836]  ? __xe_svm_handle_pagefault+0x297/0x1460 [xe]
    [ 2163.044340]  kasan_report+0xa3/0xe0
    [ 2163.044344]  ? __xe_svm_handle_pagefault+0x297/0x1460 [xe]
    [ 2163.044881]  __asan_load8+0x8b/0xe0
    [ 2163.044885]  __xe_svm_handle_pagefault+0x297/0x1460 [xe]
    [ 2163.045456]  ? lock_acquire+0x1b0/0x320
    [ 2163.045461]  ? xe_vm_find_overlapping_vma+0x88/0x310 [xe]
    [ 2163.046072]  ? __pfx___xe_svm_handle_pagefault+0x10/0x10 [xe]
    [ 2163.046679]  ? rcu_is_watching+0x21/0x60
    [ 2163.046684]  ? __mutex_lock+0x1172/0x18b0
    [ 2163.046690]  ? find_held_lock+0x31/0x90
    [ 2163.046696]  ? xe_vm_find_overlapping_vma+0xa1/0x310 [xe]
    [ 2163.047273]  ? __kasan_check_write+0x14/0x30
    [ 2163.047278]  ? __mutex_unlock_slowpath+0x10f/0x660
    [ 2163.047285]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
    [ 2163.047295]  ? mutex_unlock+0x12/0x20
    [ 2163.047299]  ? xe_vm_find_overlapping_vma+0xa1/0x310 [xe]
    [ 2163.047844]  xe_svm_handle_pagefault+0x5c/0x140 [xe]
    [ 2163.048355]  xe_pagefault_queue_work+0x19ad/0x2450 [xe]
    [ 2163.048843]  process_one_work+0x5ae/0xdd0
    [ 2163.048847]  ? __lock_acquire+0x58a/0x2820
    [ 2163.048850]  ? __schedule+0x22a6/0x3670
    [ 2163.048858]  ? __pfx_process_one_work+0x10/0x10
    [ 2163.048866]  ? __pfx_xe_pagefault_queue_work+0x10/0x10 [xe]
    [ 2163.049345]  ? assign_work+0xe4/0x1d0
    [ 2163.049350]  worker_thread+0x3b4/0x6a0
    [ 2163.049357]  ? __pfx_worker_thread+0x10/0x10
    [ 2163.049361]  kthread+0x204/0x250
    [ 2163.049364]  ? kthread+0xf1/0x250
    [ 2163.049369]  ? __pfx_kthread+0x10/0x10
    [ 2163.049372]  ret_from_fork+0x465/0x6a0
    [ 2163.049377]  ? __pfx_ret_from_fork+0x10/0x10
    [ 2163.049381]  ? __switch_to+0x26f/0x740
    [ 2163.049386]  ? __pfx_kthread+0x10/0x10
    [ 2163.049390]  ret_from_fork_asm+0x1a/0x30
    [ 2163.049399]  </TASK>
    
    [ 2163.049654] Allocated by task 522570:
    [ 2163.049662]  kasan_save_stack+0x26/0x60
    [ 2163.049668]  kasan_save_track+0x14/0x40
    [ 2163.049672]  kasan_save_alloc_info+0x37/0x60
    [ 2163.049677]  __kasan_kmalloc+0xc3/0xd0
    [ 2163.049681]  __kmalloc_cache_noprof+0x2b4/0x6c0
    [ 2163.049686]  xe_vma_create+0xe3/0xe60 [xe]
    [ 2163.050170]  new_vma+0x416/0x540 [xe]
    [ 2163.050654]  vm_bind_ioctl_ops_parse+0xc3e/0x1110 [xe]
    [ 2163.051139]  xe_vm_alloc_vma+0x243/0xd60 [xe]
    [ 2163.051623]  xe_vm_alloc_madvise_vma+0x92/0xd0 [xe]
    [ 2163.052107]  xe_vm_madvise_ioctl+0x783/0x14f0 [xe]
    [ 2163.052591]  drm_ioctl_kernel+0x143/0x200
    [ 2163.052597]  drm_ioctl+0x419/0x790
    [ 2163.052600]  xe_drm_ioctl+0x9e/0xf0 [xe]
    [ 2163.053074]  __x64_sys_ioctl+0xd5/0x130
    [ 2163.053079]  x64_sys_call+0x2b5/0x27e0
    [ 2163.053084]  do_syscall_64+0xef/0x6c0
    [ 2163.053088]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    
    [ 2163.053098] Freed by task 17929:
    [ 2163.053105]  kasan_save_stack+0x26/0x60
    [ 2163.053110]  kasan_save_track+0x14/0x40
    [ 2163.053114]  kasan_save_free_info+0x3b/0x60
    [ 2163.053118]  __kasan_slab_free+0x6f/0xa0
    [ 2163.053123]  kfree+0x2bb/0x600
    [ 2163.053127]  xe_vma_free+0x5a/0x70 [xe]
    [ 2163.053610]  xe_vma_destroy_late+0xae/0xf0 [xe]
    [ 2163.054093]  xe_vma_destroy+0xda/0xf20 [xe]
    [ 2163.054576]  xe_vm_alloc_vma+0x304/0xd60 [xe]
    [ 2163.055059]  xe_vm_alloc_cpu_addr_mirror_vma+0x8f/0xd0 [xe]
    [ 2163.055543]  xe_svm_garbage_collector+0x388/0x5d0 [xe]
    [ 2163.056028]  xe_svm_garbage_collector_work_func+0x2a/0x40 [xe]
    [ 2163.056512]  process_one_work+0x5ae/0xdd0
    [ 2163.056517]  worker_thread+0x3b4/0x6a0
    [ 2163.056521]  kthread+0x204/0x250
    [ 2163.056525]  ret_from_fork+0x465/0x6a0
    [ 2163.056530]  ret_from_fork_asm+0x1a/0x30
    
    Fixes: 941bcc1a4bbf ("drm/xe: Fine grained page fault locking")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Assisted-by: LLM
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 3543fd9d737a3f30b44d036b5de64c379d1c376f drm-intel
f05d9604ecdb drm/xe/svm: Take write access only for GC attribute resets
-:410: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#410: FILE: drivers/gpu/drm/xe/xe_svm.c:1398:
+				xe_pagefault_set_error(pf,
+						      XE_PAGEFAULT_ERROR_SVM_GARBAGE_COLLECTOR);

total: 0 errors, 0 warnings, 1 checks, 536 lines checked


