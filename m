Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598E3E7D0B6
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 22:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CCB10E064;
	Thu, 21 Sep 2023 22:41:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0015510E064;
 Thu, 21 Sep 2023 22:41:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 03C1EAADDD;
 Thu, 21 Sep 2023 22:41:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Thu, 21 Sep 2023 22:41:31 -0000
Message-ID: <169533609101.7232.16064811086861423544@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230921220500.994558-1-fei.yang@intel.com>
In-Reply-To: <20230921220500.994558-1-fei.yang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_timeout_needs_to_be_a_signed_value?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: timeout needs to be a signed value
URL   : https://patchwork.freedesktop.org/series/124082/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7412a22149ce21809a21ac04babcc20e18ae3f80
Author: Fei Yang <fei.yang@intel.com>
Date:   Thu Sep 21 15:05:00 2023 -0700

    drm/xe: timeout needs to be a signed value
    
    In xe_wait_user_fence_ioctl, the timeout is currently defined as
    unsigned long. That could potentially pass a negative value to
    the schedule_timeout() call because nsecs_to_jiffies() returns an
    unsigned long which gets used as signed long.
    
    [ 187.732238] schedule_timeout: wrong timeout value fffffffffffffc18
    [ 187.733180] CPU: 0 PID: 792 Comm: test_thread_dim Tainted: G U 6.4.0-xe #1
    [ 187.734251] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
    [ 187.735019] Call Trace:
    [ 187.735373] <TASK>
    [ 187.735687] dump_stack_lvl+0x92/0xb0
    [ 187.736193] schedule_timeout+0x348/0x430
    [ 187.736739] ? __might_fault+0x67/0xd0
    [ 187.737255] ? check_chain_key+0x224/0x2d0
    [ 187.737812] ? __pfx_schedule_timeout+0x10/0x10
    [ 187.738429] ? __might_fault+0x6b/0xd0
    [ 187.738946] ? __pfx_lock_release+0x10/0x10
    [ 187.739512] ? __pfx_lock_release+0x10/0x10
    [ 187.740080] wait_woken+0x86/0x100
    [ 187.740556] xe_wait_user_fence_ioctl+0x34b/0xe00 [xe]
    [ 187.741281] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
    [ 187.742075] ? lock_acquire+0x169/0x3d0
    [ 187.742601] ? check_chain_key+0x224/0x2d0
    [ 187.743158] ? drm_dev_enter+0x9/0xe0 [drm]
    [ 187.743740] ? __pfx_woken_wake_function+0x10/0x10
    [ 187.744388] ? drm_dev_exit+0x11/0x50 [drm]
    [ 187.744969] ? __pfx_lock_release+0x10/0x10
    [ 187.745536] ? __might_fault+0x67/0xd0
    [ 187.746052] ? check_chain_key+0x224/0x2d0
    [ 187.746610] drm_ioctl_kernel+0x172/0x250 [drm]
    [ 187.747242] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
    [ 187.748037] ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
    [ 187.748729] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
    [ 187.749524] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
    [ 187.750319] drm_ioctl+0x35e/0x620 [drm]
    [ 187.750871] ? __pfx_drm_ioctl+0x10/0x10 [drm]
    [ 187.751495] ? restore_fpregs_from_fpstate+0x99/0x140
    [ 187.752172] ? __pfx_restore_fpregs_from_fpstate+0x10/0x10
    [ 187.752901] ? mark_held_locks+0x24/0x90
    [ 187.753438] __x64_sys_ioctl+0xb4/0xf0
    [ 187.753954] do_syscall_64+0x3f/0x90
    [ 187.754450] entry_SYSCALL_64_after_hwframe+0x72/0xdc
    [ 187.755127] RIP: 0033:0x7f4e6651aaff
    [ 187.755623] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
    [ 187.757995] RSP: 002b:00007fff05f37a50 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    [ 187.758995] RAX: ffffffffffffffda RBX: 000055eca47c8130 RCX: 00007f4e6651aaff
    [ 187.759935] RDX: 00007fff05f37b60 RSI: 00000000c050644b RDI: 0000000000000004
    [ 187.760874] RBP: 0000000000000017 R08: 0000000000000017 R09: 7fffffffffffffff
    [ 187.761814] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
    [ 187.762753] R13: 0000000000000000 R14: 0000000000000000 R15: 00007f4e65d19ce0
    [ 187.763694] </TASK>
    
    Fixes: 9f801f10c0d6 ("drm/xe: Use nanoseconds instead of jiffies in uapi for user fence")
    Signed-off-by: Fei Yang <fei.yang@intel.com>
    Cc: Andi Shyti <andi.shyti@linux.intel.com>
    Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
+ /mt/dim checkpatch 7e0d40e7aa56f19a9b3e9bc492003085f9be01c3 drm-intel
7412a2214 drm/xe: timeout needs to be a signed value
-:16: WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
#16: 
[ 187.734251] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007

-:61: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '9f801f10c0d6', maybe rebased or not pulled?
#61: 
Fixes: 9f801f10c0d6 ("drm/xe: Use nanoseconds instead of jiffies in uapi for user fence")

total: 0 errors, 2 warnings, 0 checks, 77 lines checked


