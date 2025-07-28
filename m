Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665EAC87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 06:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A8010E335;
	Mon, 28 Jul 2025 06:29:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DF010E335;
 Mon, 28 Jul 2025 06:29:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Fix_VM_crash?=
 =?utf-8?q?_during_VF_driver_release_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Jul 2025 06:29:02 -0000
Message-ID: <175368414260.193023.5692123699585141857@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
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

Series: drm/xe/vf: Fix VM crash during VF driver release (rev2)
URL   : https://patchwork.freedesktop.org/series/152142/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e9cf610f3e712873ccc07cd02bab5cc94d44d0e6
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Mon Jul 28 12:10:02 2025 +0530

    drm/xe/vf: Fix VM crash during VF driver release
    
    The VF CCS save/restore series (patchwork #149108) has a dependency
    on the migration framework. A recent migration update in commit
    d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
    caused a VM crash during XE driver release for iGPU devices.
    
    Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
    xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel enabled
    CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W           6.16.0-xe+ #4 PREEMPT(voluntary)
    xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1 negotiated ABI version 1.0
    Tainted: [U]=USER, [W]=WARN
    Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
    RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
    xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF ABI 1.0
    Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
    RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
    RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX: ffff88811a028c40
    RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
    RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
    xe 0000:00:02.1: [drm] GT0: reset done
    R10: 0000000000000000 R11: 0000000000000000 R12: ffff88811a029c40
    R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
    FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00005af31328c000 CR3: 0000000114534004 CR4: 0000000000f72ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
     devm_action_release+0x12/0x30
     release_nodes+0x3a/0x120
     devres_release_all+0x96/0xd0
     device_unbind_cleanup+0x12/0x80
     device_release_driver_internal+0x23a/0x280
     device_release_driver+0x12/0x20
     pci_stop_bus_device+0x69/0x90
     pci_stop_and_remove_bus_device+0x12/0x30
     pci_iov_remove_virtfn+0xbd/0x130
     sriov_disable+0x42/0x100
     pci_disable_sriov+0x34/0x50
     xe_pci_sriov_configure+0xf71/0x1020 [xe]
     ? sriov_numvfs_store+0x78/0x160
     ? _parse_integer+0xe/0x20
     ? _kstrtoull+0x3a/0xa0
     sriov_numvfs_store+0x10c/0x160
     dev_attr_store+0x14/0x40
     sysfs_kf_write+0x4a/0x80
     kernfs_fop_write_iter+0x166/0x220
     vfs_write+0x284/0x550
     ksys_write+0x6f/0xf0
     __x64_sys_write+0x19/0x30
     x64_sys_call+0x2bf/0x2660
     do_syscall_64+0x93/0x1320
     ? ksys_dup3+0xba/0x170
     ? __x64_sys_dup2+0x2e/0x1f0
     ? do_syscall_64+0x1a2/0x1320
     ? __rseq_handle_notify_resume+0x447/0x5e0
     ? trace_hardirqs_off+0x5a/0xd0
     ? irqentry_exit_to_user_mode+0xdf/0x2f0
     ? irqentry_exit+0x77/0xb0
     entry_SYSCALL_64_after_hwframe+0x76/0x7e
    RIP: 0033:0x7e030351c574
    Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
    RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
    RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
    RDX: 0000000000000002 RSI: 00005af318d7da30 RDI: 0000000000000001
    RBP: 00007ffd34a107c0 R08: 0000000000000073 R09: 0000000000000000
    R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
    R13: 00005af318d7da30 R14: 00007e03036045c0 R15: 00007e0303601ee0
     </TASK>
    
    Update the VF CCS migration initialization sequence to align with the new
    migration framework changes, resolving the release-time crash.
    
    Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 52ac98096df0784abd379f822ad14d6998b09154 drm-intel
e9cf610f3e71 drm/xe/vf: Fix VM crash during VF driver release
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI

total: 0 errors, 1 warnings, 0 checks, 106 lines checked


