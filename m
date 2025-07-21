Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC9FC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 23:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D745910E2E9;
	Mon, 21 Jul 2025 23:46:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACEC10E2E3;
 Mon, 21 Jul 2025 23:46:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_devcoredump=3A_Fix_circul?=
 =?utf-8?q?ar_locking_dependency_with_devcd-=3Emutex=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Jul 2025 23:46:59 -0000
Message-ID: <175314161949.178280.12500430240300183589@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250721163828.548746-1-dev@lankhorst.se>
In-Reply-To: <20250721163828.548746-1-dev@lankhorst.se>
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

Series: devcoredump: Fix circular locking dependency with devcd->mutex.
URL   : https://patchwork.freedesktop.org/series/151901/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dc51ef435412bb24f7799213c390a7776645490f
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Jul 21 18:38:28 2025 +0200

    devcoredump: Fix circular locking dependency with devcd->mutex.
    
    The original code causes a circular locking dependency found by lockdep.
    
    ======================================================
    WARNING: possible circular locking dependency detected
    6.16.0-rc6-lgci-xe-xe-pw-151626v3+ #1 Tainted: G S   U
    ------------------------------------------------------
    xe_fault_inject/5091 is trying to acquire lock:
    ffff888156815688 ((work_completion)(&(&devcd->del_wk)->work)){+.+.}-{0:0}, at: __flush_work+0x25d/0x660
    
    but task is already holding lock:
    
    ffff888156815620 (&devcd->mutex){+.+.}-{3:3}, at: dev_coredump_put+0x3f/0xa0
    which lock already depends on the new lock.
    the existing dependency chain (in reverse order) is:
    -> #2 (&devcd->mutex){+.+.}-{3:3}:
           mutex_lock_nested+0x4e/0xc0
           devcd_data_write+0x27/0x90
           sysfs_kf_bin_write+0x80/0xf0
           kernfs_fop_write_iter+0x169/0x220
           vfs_write+0x293/0x560
           ksys_write+0x72/0xf0
           __x64_sys_write+0x19/0x30
           x64_sys_call+0x2bf/0x2660
           do_syscall_64+0x93/0xb60
           entry_SYSCALL_64_after_hwframe+0x76/0x7e
    -> #1 (kn->active#236){++++}-{0:0}:
           kernfs_drain+0x1e2/0x200
           __kernfs_remove+0xae/0x400
           kernfs_remove_by_name_ns+0x5d/0xc0
           remove_files+0x54/0x70
           sysfs_remove_group+0x3d/0xa0
           sysfs_remove_groups+0x2e/0x60
           device_remove_attrs+0xc7/0x100
           device_del+0x15d/0x3b0
           devcd_del+0x19/0x30
           process_one_work+0x22b/0x6f0
           worker_thread+0x1e8/0x3d0
           kthread+0x11c/0x250
           ret_from_fork+0x26c/0x2e0
           ret_from_fork_asm+0x1a/0x30
    -> #0 ((work_completion)(&(&devcd->del_wk)->work)){+.+.}-{0:0}:
           __lock_acquire+0x1661/0x2860
           lock_acquire+0xc4/0x2f0
           __flush_work+0x27a/0x660
           flush_delayed_work+0x5d/0xa0
           dev_coredump_put+0x63/0xa0
           xe_driver_devcoredump_fini+0x12/0x20 [xe]
           devm_action_release+0x12/0x30
           release_nodes+0x3a/0x120
           devres_release_all+0x8a/0xd0
           device_unbind_cleanup+0x12/0x80
           device_release_driver_internal+0x23a/0x280
           device_driver_detach+0x14/0x20
           unbind_store+0xaf/0xc0
           drv_attr_store+0x21/0x50
           sysfs_kf_write+0x4a/0x80
           kernfs_fop_write_iter+0x169/0x220
           vfs_write+0x293/0x560
           ksys_write+0x72/0xf0
           __x64_sys_write+0x19/0x30
           x64_sys_call+0x2bf/0x2660
           do_syscall_64+0x93/0xb60
           entry_SYSCALL_64_after_hwframe+0x76/0x7e
    other info that might help us debug this:
    Chain exists of: (work_completion)(&(&devcd->del_wk)->work) --> kn->active#236 --> &devcd->mutex
     Possible unsafe locking scenario:
           CPU0                    CPU1
           ----                    ----
      lock(&devcd->mutex);
                                   lock(kn->active#236);
                                   lock(&devcd->mutex);
      lock((work_completion)(&(&devcd->del_wk)->work));
     *** DEADLOCK ***
    5 locks held by xe_fault_inject/5091:
     #0: ffff8881129f9488 (sb_writers#5){.+.+}-{0:0}, at: ksys_write+0x72/0xf0
     #1: ffff88810c755078 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x123/0x220
     #2: ffff8881054811a0 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0x55/0x280
     #3: ffff888156815620 (&devcd->mutex){+.+.}-{3:3}, at: dev_coredump_put+0x3f/0xa0
     #4: ffffffff8359e020 (rcu_read_lock){....}-{1:2}, at: __flush_work+0x72/0x660
    stack backtrace:
    CPU: 14 UID: 0 PID: 5091 Comm: xe_fault_inject Tainted: G S   U              6.16.0-rc6-lgci-xe-xe-pw-151626v3+ #1 PREEMPT_{RT,(lazy)}
    Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
    Hardware name: Micro-Star International Co., Ltd. MS-7D25/PRO Z690-A DDR4(MS-7D25), BIOS 1.10 12/13/2021
    Call Trace:
     <TASK>
     dump_stack_lvl+0x91/0xf0
     dump_stack+0x10/0x20
     print_circular_bug+0x285/0x360
     check_noncircular+0x135/0x150
     ? register_lock_class+0x48/0x4a0
     __lock_acquire+0x1661/0x2860
     lock_acquire+0xc4/0x2f0
     ? __flush_work+0x25d/0x660
     ? mark_held_locks+0x46/0x90
     ? __flush_work+0x25d/0x660
     __flush_work+0x27a/0x660
     ? __flush_work+0x25d/0x660
     ? trace_hardirqs_on+0x1e/0xd0
     ? __pfx_wq_barrier_func+0x10/0x10
     flush_delayed_work+0x5d/0xa0
     dev_coredump_put+0x63/0xa0
     xe_driver_devcoredump_fini+0x12/0x20 [xe]
     devm_action_release+0x12/0x30
     release_nodes+0x3a/0x120
     devres_release_all+0x8a/0xd0
     device_unbind_cleanup+0x12/0x80
     device_release_driver_internal+0x23a/0x280
     ? bus_find_device+0xa8/0xe0
     device_driver_detach+0x14/0x20
     unbind_store+0xaf/0xc0
     drv_attr_store+0x21/0x50
     sysfs_kf_write+0x4a/0x80
     kernfs_fop_write_iter+0x169/0x220
     vfs_write+0x293/0x560
     ksys_write+0x72/0xf0
     __x64_sys_write+0x19/0x30
     x64_sys_call+0x2bf/0x2660
     do_syscall_64+0x93/0xb60
     ? __f_unlock_pos+0x15/0x20
     ? __x64_sys_getdents64+0x9b/0x130
     ? __pfx_filldir64+0x10/0x10
     ? do_syscall_64+0x1a2/0xb60
     ? clear_bhb_loop+0x30/0x80
     ? clear_bhb_loop+0x30/0x80
     entry_SYSCALL_64_after_hwframe+0x76/0x7e
    RIP: 0033:0x76e292edd574
    Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
    RSP: 002b:00007fffe247a828 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
    RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000076e292edd574
    RDX: 000000000000000c RSI: 00006267f6306063 RDI: 000000000000000b
    RBP: 000000000000000c R08: 000076e292fc4b20 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 00006267f6306063
    R13: 000000000000000b R14: 00006267e6859c00 R15: 000076e29322a000
     </TASK>
    xe 0000:03:00.0: [drm] Xe device coredump has been deleted.
    
    Fixes: 01daccf74832 ("devcoredump : Serialize devcd_del work")
    Cc: Mukesh Ojha <quic_mojha@quicinc.com>
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Cc: Johannes Berg <johannes@sipsolutions.net>
    Cc: "Rafael J. Wysocki" <rafael@kernel.org>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: linux-kernel@vger.kernel.org
    Cc: <stable@vger.kernel.org> # v6.1+
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 617f6e11e288a649addc9471911d29947c0996c8 drm-intel
dc51ef435412 devcoredump: Fix circular locking dependency with devcd->mutex.
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
ffff888156815620 (&devcd->mutex){+.+.}-{3:3}, at: dev_coredump_put+0x3f/0xa0

-:204: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#204: FILE: drivers/base/devcoredump.c:26:
+	struct mutex init_mutex;

-:297: CHECK:LINE_SPACING: Please don't use multiple blank lines
#297: FILE: drivers/base/devcoredump.c:357:
 
+

total: 0 errors, 1 warnings, 2 checks, 161 lines checked


