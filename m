Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AF4C6FD1D
	for <intel-xe@archiver.kernel.org>; Sat, 18 Mar 2023 03:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B12410E28B;
	Sat, 18 Mar 2023 03:06:44 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975A010E28B
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Mar 2023 03:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679108802; x=1710644802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QCya0UJi1uQx49h3DzVRCzpXWAjpIusdu7NIxUYYu3U=;
 b=M/5n/CGirditgooa4WtZH6dBzyZElhWYOdcSs+ufhbeLzU52q0kNybm6
 LU9ePbwD+BIDnyfyamP3RBxJDxaXMQgk5sJuDyvWk+joGarqsLL+7fqfN
 n4uSFpdZAGZ8CkDZEv8XgMRNrXnf6MVngcq4xn4B3DH/isXkayr+5pvBH
 wSiJRjhFH1OsRbhZu4qIJgdSBXYjDOSw8DoPyyk+Gbqh1KAgt49qLFZN7
 pZ6FkTSeJwUWi910nkQMAq+tfSk+fIVAKuc9nSXea35fS0SoFVRzLIL4b
 TIvdBXGe9uGj+1l0+dRFVZwDQuWKmM75XQHBbAel27Q8nQ8Rfdl/5WcQq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340758097"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="340758097"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 20:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680500717"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="680500717"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 20:06:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 17 Mar 2023 20:06:43 -0700
Message-Id: <20230318030643.557464-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drn/xe: Drop usm lock around ASID xarray
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

Xarray's have their own locking, usm lock not needed.

Fixes lockdep splat on PVC:
[ 4204.407687] ======================================================
[ 4204.413872] WARNING: possible circular locking dependency detected
[ 4204.420053] 6.1.0-xe+ #78 Not tainted
[ 4204.423723] ------------------------------------------------------
[ 4204.429894] xe_exec_basic/1790 is trying to acquire lock:
[ 4204.435294] ffffffff8255d760 (fs_reclaim){+.+.}-{0:0}, at: xe_vm_create_ioctl+0x1c5/0x260 [xe]
[ 4204.443932]
               but task is already holding lock:
[ 4204.449758] ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
[ 4204.458032]
               which lock already depends on the new lock.

[ 4204.466195]
               the existing dependency chain (in reverse order) is:
[ 4204.473665]
               -> #2 (lock#8){+.+.}-{3:3}:
[ 4204.478977]        __mutex_lock+0x9e/0x9d0
[ 4204.483078]        xe_device_mem_access_get+0x1f/0xa0 [xe]
[ 4204.488572]        guc_ct_send_locked+0x143/0x700 [xe]
[ 4204.493719]        xe_guc_ct_send+0x3e/0x80 [xe]
[ 4204.498347]        __register_engine+0x64/0x90 [xe]
[ 4204.503233]        guc_engine_run_job+0x822/0x940 [xe]
[ 4204.508380]        drm_sched_main+0x220/0x6e0 [gpu_sched]
[ 4204.513780]        process_one_work+0x263/0x580
[ 4204.518312]        worker_thread+0x4d/0x3b0
[ 4204.522489]        kthread+0xeb/0x120
[ 4204.526153]        ret_from_fork+0x1f/0x30
[ 4204.530263]
               -> #1 (&ct->lock){+.+.}-{3:3}:
[ 4204.535835]        xe_guc_ct_init+0x14c/0x1f0 [xe]
[ 4204.540634]        xe_guc_init+0x59/0x350 [xe]
[ 4204.545089]        xe_uc_init+0x20/0x70 [xe]
[ 4204.549371]        xe_gt_init+0x161/0x3b0 [xe]
[ 4204.553826]        xe_device_probe+0x1ea/0x250 [xe]
[ 4204.558712]        xe_pci_probe+0x354/0x470 [xe]
[ 4204.563340]        pci_device_probe+0xa2/0x150
[ 4204.567785]        really_probe+0xd9/0x390
[ 4204.571884]        __driver_probe_device+0x73/0x170
[ 4204.576755]        driver_probe_device+0x19/0x90
[ 4204.581372]        __driver_attach+0x9a/0x1f0
[ 4204.585724]        bus_for_each_dev+0x73/0xc0
[ 4204.590084]        bus_add_driver+0x1a7/0x200
[ 4204.594441]        driver_register+0x8a/0xf0
[ 4204.598704]        do_one_initcall+0x53/0x2f0
[ 4204.603056]        do_init_module+0x46/0x1c0
[ 4204.607328]        __do_sys_finit_module+0xb4/0x130
[ 4204.612207]        do_syscall_64+0x38/0x90
[ 4204.616305]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
[ 4204.621878]
               -> #0 (fs_reclaim){+.+.}-{0:0}:
[ 4204.627538]        __lock_acquire+0x1538/0x26e0
[ 4204.632070]        lock_acquire+0xd2/0x310
[ 4204.636169]        fs_reclaim_acquire+0xa0/0xd0
[ 4204.640701]        xe_vm_create_ioctl+0x1c5/0x260 [xe]
[ 4204.645849]        drm_ioctl_kernel+0xb0/0x140
[ 4204.650293]        drm_ioctl+0x200/0x3d0
[ 4204.654212]        __x64_sys_ioctl+0x85/0xb0
[ 4204.658482]        do_syscall_64+0x38/0x90
[ 4204.662573]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
[ 4204.668146]
               other info that might help us debug this:

[ 4204.676145] Chain exists of:
                 fs_reclaim --> &ct->lock --> lock#8

[ 4204.685182]  Possible unsafe locking scenario:

[ 4204.691094]        CPU0                    CPU1
[ 4204.695623]        ----                    ----
[ 4204.700147]   lock(lock#8);
[ 4204.702939]                                lock(&ct->lock);
[ 4204.708501]                                lock(lock#8);
[ 4204.713805]   lock(fs_reclaim);
[ 4204.716943]
                *** DEADLOCK ***

[ 4204.722852] 1 lock held by xe_exec_basic/1790:
[ 4204.727288]  #0: ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
[ 4204.735988]
               stack backtrace:
[ 4204.740341] CPU: 8 PID: 1790 Comm: xe_exec_basic Not tainted 6.1.0-xe+ #78
[ 4204.747214] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0021.P16.2105280638 05/28/2021
[ 4204.757733] Call Trace:
[ 4204.760176]  <TASK>
[ 4204.762273]  dump_stack_lvl+0x57/0x81
[ 4204.765931]  check_noncircular+0x131/0x150
[ 4204.770030]  __lock_acquire+0x1538/0x26e0
[ 4204.774034]  lock_acquire+0xd2/0x310
[ 4204.777612]  ? xe_vm_create_ioctl+0x1c5/0x260 [xe]
[ 4204.782414]  ? xe_vm_create_ioctl+0x1bb/0x260 [xe]
[ 4204.787214]  fs_reclaim_acquire+0xa0/0xd0
[ 4204.791216]  ? xe_vm_create_ioctl+0x1c5/0x260 [xe]
[ 4204.796018]  xe_vm_create_ioctl+0x1c5/0x260 [xe]
[ 4204.800648]  ? xe_vm_create+0xab0/0xab0 [xe]
[ 4204.804926]  drm_ioctl_kernel+0xb0/0x140
[ 4204.808843]  drm_ioctl+0x200/0x3d0
[ 4204.812240]  ? xe_vm_create+0xab0/0xab0 [xe]
[ 4204.816523]  ? find_held_lock+0x2b/0x80
[ 4204.820362]  __x64_sys_ioctl+0x85/0xb0
[ 4204.824114]  do_syscall_64+0x38/0x90
[ 4204.827692]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[ 4204.832745] RIP: 0033:0x7fd2ad5f950b
[ 4204.836325] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
[ 4204.855066] RSP: 002b:00007fff4e3099b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 4204.862623] RAX: ffffffffffffffda RBX: 00007fff4e3099f0 RCX: 00007fd2ad5f950b
[ 4204.869746] RDX: 00007fff4e3099f0 RSI: 00000000c0206443 RDI: 0000000000000003
[ 4204.876872] RBP: 00000000c0206443 R08: 0000000000000001 R09: 0000000000000000
[ 4204.883994] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff4e309b14
[ 4204.891117] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000000
[ 4204.898243]  </TASK>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 4 ----
 drivers/gpu/drm/xe/xe_vm.c           | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index d7bf6b0a0697..76ec40567a78 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -119,11 +119,9 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	bool atomic;
 
 	/* ASID to VM */
-	mutex_lock(&xe->usm.lock);
 	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
 	if (vm)
 		xe_vm_get(vm);
-	mutex_unlock(&xe->usm.lock);
 	if (!vm || !xe_vm_in_fault_mode(vm))
 		return -EINVAL;
 
@@ -507,11 +505,9 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		return -EINVAL;
 
 	/* ASID to VM */
-	mutex_lock(&xe->usm.lock);
 	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
 	if (vm)
 		xe_vm_get(vm);
-	mutex_unlock(&xe->usm.lock);
 	if (!vm || !xe_vm_in_fault_mode(vm))
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ab036a51d17e..e7674612a57e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1377,10 +1377,8 @@ static void vm_destroy_work_func(struct work_struct *w)
 		xe_pm_runtime_put(xe);
 
 		if (xe->info.has_asid) {
-			mutex_lock(&xe->usm.lock);
 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
 			XE_WARN_ON(lookup != vm);
-			mutex_unlock(&xe->usm.lock);
 		}
 	}
 
@@ -1887,11 +1885,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (xe->info.has_asid) {
-		mutex_lock(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
 				      XA_LIMIT(0, XE_MAX_ASID - 1),
 				      &xe->usm.next_asid, GFP_KERNEL);
-		mutex_unlock(&xe->usm.lock);
 		if (err) {
 			xe_vm_close_and_put(vm);
 			return err;
-- 
2.34.1

