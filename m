Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A57C87FCB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 14:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EAE10E12C;
	Tue, 12 Aug 2025 14:30:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4779A10E5FF;
 Tue, 12 Aug 2025 14:30:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Untangle_vm=5Fb?=
 =?utf-8?q?ind=5Fioctl_cleanup_order_and_fix_double_free_bug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Aug 2025 14:30:53 -0000
Message-ID: <175500905328.230492.1976485722175352716@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250812131728.42314-1-christoph.manszewski@intel.com>
In-Reply-To: <20250812131728.42314-1-christoph.manszewski@intel.com>
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

Series: drm/xe: Untangle vm_bind_ioctl cleanup order and fix double free bug
URL   : https://patchwork.freedesktop.org/series/152835/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6f9293a391ff3c575bc021f454be5d0a0c076f57
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a7da2b97165cd06da35b73ef5d125d33a7695de8
Author: Christoph Manszewski <christoph.manszewski@intel.com>
Date:   Tue Aug 12 15:17:28 2025 +0200

    drm/xe: Untangle vm_bind_ioctl cleanup order and fix double free bug
    
    If the argument check during an array bind fails, the bind_ops are freed
    twice as seen in [1]. While at it, fix the ordering of resource cleanup
    to align with reverse allocation order.
    
    [1]:
    
    ==================================================================
    BUG: KASAN: double-free in xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
    Free of addr ffff88813bb9b800 by task xe_vm/14198
    
    CPU: 5 UID: 0 PID: 14198 Comm: xe_vm Not tainted 6.16.0-xe-eudebug-cmanszew+ #520 PREEMPT(full)
    Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
    Call Trace:
     <TASK>
     dump_stack_lvl+0x82/0xd0
     print_report+0xcb/0x610
     ? __virt_addr_valid+0x19a/0x300
     ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
     kasan_report_invalid_free+0xc8/0xf0
     ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
     ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
     check_slab_allocation+0x102/0x130
     kfree+0x10d/0x440
     ? should_fail_ex+0x57/0x2f0
     ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
     xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
     ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
     ? __lock_acquire+0xab9/0x27f0
     ? lock_acquire+0x165/0x300
     ? drm_dev_enter+0x53/0xe0 [drm]
     ? find_held_lock+0x2b/0x80
     ? drm_dev_exit+0x30/0x50 [drm]
     ? drm_ioctl_kernel+0x128/0x1c0 [drm]
     drm_ioctl_kernel+0x128/0x1c0 [drm]
     ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
     ? find_held_lock+0x2b/0x80
     ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
     ? should_fail_ex+0x57/0x2f0
     ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
     drm_ioctl+0x352/0x620 [drm]
     ? __pfx_drm_ioctl+0x10/0x10 [drm]
     ? __pfx_rpm_resume+0x10/0x10
     ? do_raw_spin_lock+0x11a/0x1b0
     ? find_held_lock+0x2b/0x80
     ? __pm_runtime_resume+0x61/0xc0
     ? rcu_is_watching+0x20/0x50
     ? trace_irq_enable.constprop.0+0xac/0xe0
     xe_drm_ioctl+0x91/0xc0 [xe]
     __x64_sys_ioctl+0xb2/0x100
     ? rcu_is_watching+0x20/0x50
     do_syscall_64+0x68/0x2e0
     entry_SYSCALL_64_after_hwframe+0x76/0x7e
    RIP: 0033:0x7fa9acb24ded
    Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
    RSP: 002b:00007fff189e1370 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    RAX: ffffffffffffffda RBX: ffffffffffffff68 RCX: 00007fa9acb24ded
    RDX: 00007fff189e19f0 RSI: 0000000040886445 RDI: 0000000000000003
    RBP: 00007fff189e13c0 R08: 0000000000000000 R09: 00005561d3fb47d0
    R10: 00007fa9ace29be0 R11: 0000000000000246 R12: 00007fff189e19f0
    R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000000003
     </TASK>
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
+ /mt/dim checkpatch 6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736 drm-intel
a7da2b97165c drm/xe: Untangle vm_bind_ioctl cleanup order and fix double free bug
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
CPU: 5 UID: 0 PID: 14198 Comm: xe_vm Not tainted 6.16.0-xe-eudebug-cmanszew+ #520 PREEMPT(full)

-:136: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 55 lines checked


