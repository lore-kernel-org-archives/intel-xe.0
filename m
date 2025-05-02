Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A115CC3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 17:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6709D10E94A;
	Fri,  2 May 2025 17:07:10 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81C610E94A;
 Fri,  2 May 2025 17:07:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Call_svm_worker?=
 =?utf-8?q?_only_when_svm_is_enabled_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 17:07:08 -0000
Message-ID: <174620562875.36126.1707317310020790782@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502040757.1722973-1-shuicheng.lin@intel.com>
In-Reply-To: <20250502040757.1722973-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Call svm worker only when svm is enabled (rev2)
URL   : https://patchwork.freedesktop.org/series/148535/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6b20e7256f76b917a3f33d29ca0527e6ee0baf67
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Fri May 2 17:00:52 2025 +0000

    drm/xe: Add config control for svm flush work
    
    Without CONFIG_DRM_XE_GPUSVM set, GPU SVM is not initialized thus below
    warning pops. Refine the flush work code to be controlled by the config
    to avoid below warning:
    "
    [  453.132028] ------------[ cut here ]------------
    [  453.132527] WARNING: CPU: 9 PID: 4491 at kernel/workqueue.c:4205 __flush_work+0x379/0x3a0
    [  453.133355] Modules linked in: xe drm_ttm_helper ttm gpu_sched drm_buddy drm_suballoc_helper drm_gpuvm drm_exec
    [  453.134352] CPU: 9 UID: 0 PID: 4491 Comm: xe_exec_mix_mod Tainted: G     U  W           6.15.0-rc3+ #7 PREEMPT(full)
    [  453.135405] Tainted: [U]=USER, [W]=WARN
    ...
    [  453.136921] RIP: 0010:__flush_work+0x379/0x3a0
    [  453.137417] Code: 8b 45 00 48 8b 55 08 89 c7 48 c1 e8 04 83 e7 08 83 e0 0f 83 cf 02 89 c6 48 0f ba 6d 00 03 e9 d5 fe ff ff 0f 0b e9 db fd ff ff <0f> 0b 45 31 e4 e9 d1 fd ff ff 0f 0b e9 03 ff ff ff 0f 0b e9 d6 fe
    [  453.139250] RSP: 0018:ffffc90000c67b18 EFLAGS: 00010246
    [  453.139782] RAX: 0000000000000000 RBX: ffff888108a24000 RCX: 0000000000002000
    [  453.140521] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8881016d61c8
    [  453.141253] RBP: ffff8881016d61c8 R08: 0000000000000000 R09: 0000000000000000
    [  453.141985] R10: 0000000000000000 R11: 0000000008a24000 R12: 0000000000000001
    [  453.142709] R13: 0000000000000002 R14: 0000000000000000 R15: ffff888107db8c00
    [  453.143450] FS:  00007f44853d4c80(0000) GS:ffff8882f469b000(0000) knlGS:0000000000000000
    [  453.144276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  453.144853] CR2: 00007f4487629228 CR3: 00000001016aa000 CR4: 00000000000406f0
    [  453.145594] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
    [  453.146320] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
    [  453.147061] Call Trace:
    [  453.147336]  <TASK>
    [  453.147579]  ? tick_nohz_tick_stopped+0xd/0x30
    [  453.148067]  ? xas_load+0x9/0xb0
    [  453.148435]  ? xa_load+0x6f/0xb0
    [  453.148781]  __xe_vm_bind_ioctl+0xbd5/0x1500 [xe]
    [  453.149338]  ? dev_printk_emit+0x48/0x70
    [  453.149762]  ? _dev_printk+0x57/0x80
    [  453.150148]  ? drm_ioctl+0x17c/0x440
    [  453.150544]  ? __drm_dev_vprintk+0x36/0x90
    [  453.150983]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
    [  453.151575]  ? drm_ioctl_kernel+0x9f/0xf0
    [  453.151998]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
    [  453.152560]  drm_ioctl_kernel+0x9f/0xf0
    [  453.152968]  drm_ioctl+0x20f/0x440
    [  453.153332]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
    [  453.153893]  ? ioctl_has_perm.constprop.0.isra.0+0xae/0x100
    [  453.154489]  ? memory_bm_test_bit+0x5/0x60
    [  453.154935]  xe_drm_ioctl+0x47/0x70 [xe]
    [  453.155419]  __x64_sys_ioctl+0x8d/0xc0
    [  453.155824]  do_syscall_64+0x47/0x110
    [  453.156228]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    "
    
    v2 (Matt):
        refine commit message to have more details
        add Fixes tag
        move the code to xe_svm.h which already have the config
        remove a blank line per codestyle suggestion
    
    Fixes: 63f6e480d115 ("drm/xe: Add SVM garbage collector")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 0135b020716c4986b53b735e41753ebb8ed43c3e drm-intel
6b20e7256f76 drm/xe: Add config control for svm flush work


