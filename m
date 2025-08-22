Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A69CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 18:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7903E10EB85;
	Fri, 22 Aug 2025 18:34:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8799710EB85;
 Fri, 22 Aug 2025 18:34:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Move_device_sys?=
 =?utf-8?q?fs_init_to_before_GT_init?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Aug 2025 18:34:07 -0000
Message-ID: <175588764754.262270.4958113818847496007@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250822182828.107965-1-stuart.summers@intel.com>
In-Reply-To: <20250822182828.107965-1-stuart.summers@intel.com>
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

Series: drm/xe: Move device sysfs init to before GT init
URL   : https://patchwork.freedesktop.org/series/153366/
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
commit 95a52a58684f3e59609895be326ad35e4b065e18
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Fri Aug 22 18:28:28 2025 +0000

    drm/xe: Move device sysfs init to before GT init
    
    I'm seeing the following splat if running one of the fault
    injection tests in a loop for long enough:
    [  591.853234] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/lb_fan_control_version'
    [  591.853241] CPU: 6 UID: 0 PID: 10800 Comm: xe_fault_inject Kdump: loaded Not tainted 6.17.0-rc2+ #74 PREEMPT(voluntary)
    [  591.853245] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.4064.A02.2302091143 02/09/2023
    [  591.853246] Call Trace:
    [  591.853247]  <TASK>
    [  591.853249]  dump_stack_lvl+0xc2/0xf0
    [  591.853256]  dump_stack+0x10/0x20
    [  591.853258]  sysfs_warn_dup+0xd9/0x120
    [  591.853264]  sysfs_add_file_mode_ns+0x296/0x3e0
    [  591.853269]  sysfs_create_file_ns+0x12d/0x1e0
    [  591.853273]  ? __pfx_sysfs_create_file_ns+0x10/0x10
    [  591.853276]  ? pcode_mailbox_rw+0xce/0x180 [xe]
    [  591.853414]  ? mutex_unlock+0x12/0x20
    [  591.853417]  ? xe_pcode_read+0x59/0x80 [xe]
    [  591.853542]  xe_device_sysfs_init+0x2cd/0x350 [xe]
    [  591.853646]  ? __pfx_xe_device_sysfs_init+0x10/0x10 [xe]
    [  591.853750]  ? __devm_add_action+0xa6/0xe0
    [  591.853757]  xe_device_probe+0xb09/0x1bf0 [xe]
    [  591.853871]  ? add_dr+0x180/0x230
    [  591.853879]  ? __pfx_xe_device_probe+0x10/0x10 [xe]
    [  591.853994]  ? xe_pm_init_early+0x345/0x420 [xe]
    [  591.854124]  xe_pci_probe+0x8f8/0x11f0 [xe]
    [  591.854257]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
    [  591.854383]  local_pci_probe+0xe4/0x1b0
    [  591.854389]  pci_device_probe+0x5b4/0x870
    [  591.854393]  ? __pfx_pci_device_probe+0x10/0x10
    [  591.854395]  ? kernfs_put+0x1d/0x60
    [  591.854398]  ? sysfs_do_create_link_sd+0x91/0x120
    [  591.854402]  ? sysfs_create_link+0x44/0xc0
    [  591.854408]  really_probe+0x1fa/0x950
    [  591.854414]  __driver_probe_device+0x307/0x410
    [  591.854418]  device_driver_attach+0xc9/0x200
    [  591.854423]  bind_store+0xd4/0x150
    [  591.854425]  ? __pfx_bind_store+0x10/0x10
    [  591.854429]  drv_attr_store+0x6a/0xc0
    [  591.854431]  ? __pfx_sysfs_kf_write+0x10/0x10
    [  591.854435]  ? __pfx_drv_attr_store+0x10/0x10
    [  591.854437]  sysfs_kf_write+0xdc/0x130
    [  591.854441]  ? __pfx_sysfs_kf_write+0x10/0x10
    [  591.854444]  kernfs_fop_write_iter+0x373/0x550
    [  591.854449]  vfs_write+0xa5f/0x1380
    [  591.854456]  ? __pfx_vfs_write+0x10/0x10
    [  591.854464]  ? lock_acquire+0x172/0x300
    [  591.854468]  ? __kasan_check_read+0x11/0x20
    [  591.854474]  ksys_write+0x115/0x220
    [  591.854478]  ? __pfx_ksys_write+0x10/0x10
    [  591.854482]  ? __rseq_handle_notify_resume+0x56e/0xda0
    [  591.854488]  __x64_sys_write+0x72/0xc0
    [  591.854492]  x64_sys_call+0x18ec/0x2740
    [  591.854496]  do_syscall_64+0x8f/0xf70
    [  591.854501]  ? trace_irq_disable+0xd9/0x120
    [  591.854506]  ? trace_irq_enable+0xd9/0x120
    [  591.854510]  ? do_syscall_64+0x1c0/0xf70
    [  591.854513]  ? do_syscall_64+0x1c0/0xf70
    [  591.854516]  ? irqentry_exit+0x77/0xb0
    [  591.854519]  ? exc_page_fault+0x95/0x130
    [  591.854523]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [  591.854525] RIP: 0033:0x79d8b8b1c574
    [  591.854529] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
    [  591.854531] RSP: 002b:00007ffeb4a9bb48 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
    [  591.854534] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000079d8b8b1c574
    [  591.854536] RDX: 000000000000000c RSI: 00007ffeb4a9cfd0 RDI: 0000000000000005
    [  591.854537] RBP: 000000000000000c R08: 0000000000000073 R09: 0000000000000000
    [  591.854538] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffeb4a9cfd0
    [  591.854540] R13: 0000000000000005 R14: 00005d144cd2fc00 R15: 000079d8b8ff7000
    [  591.854549]  </TASK>
    
    It looks like for some reason there is a chance this can race with
    the GT teardown (based on when each of their respective drmm fini
    handlers are called). If we start the new driver quick enough (just
    a while loop with no delay), it seems like we try to create a sysfs
    entry before the one from the prior driver load has completed being
    removed.
    
    Add stricter initialization ordering between the sysfs files and the
    GT subsystem by moving the sysfs initialization earlier in the probe
    sequence.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 33e0b48d3b51ce43f9ea287881e8f8ca12981425 drm-intel
95a52a58684f drm/xe: Move device sysfs init to before GT init
-:113: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


