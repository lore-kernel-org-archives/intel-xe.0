Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AC0C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 08:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0C610E5B5;
	Tue, 16 Jul 2024 08:08:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C5210E5B5;
 Tue, 16 Jul 2024 08:08:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/xe=3A_Wedge_the_entire_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 08:08:33 -0000
Message-ID: <172111731349.234184.15262212750875632530@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240716063902.1390130-1-matthew.brost@intel.com>
In-Reply-To: <20240716063902.1390130-1-matthew.brost@intel.com>
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

Series: series starting with [v3,1/2] drm/xe: Wedge the entire device
URL   : https://patchwork.freedesktop.org/series/136126/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 280ef91e0564e6455f51952d7f608df37c66724e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 15 23:39:02 2024 -0700

    drm/xe: Don't suspend device upon wedge
    
    When wedging a device we shouldn't be suspending device as state for
    debug will be lost.
    
    Also this appears to not work as the below stack trace pops upon trying
    to resume a wedged device:
    
    [  304.245044] INFO: task cat:12115 blocked for more than 151 seconds.
    [  304.251333]       Tainted: G        W          6.10.0-rc7-xe+ #3518
    [  304.257617] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
    [  304.265459] task:cat             state:D stack:13384 pid:12115 tgid:12115 ppid:3986   flags:0x00000006
    [  304.265465] Call Trace:
    [  304.265467]  <TASK>
    [  304.265469]  __schedule+0x3c4/0xdf0
    [  304.265478]  schedule+0x3c/0x140
    [  304.265481]  rpm_resume+0x1cc/0x740
    [  304.265484]  ? __pfx_autoremove_wake_function+0x10/0x10
    [  304.265489]  __pm_runtime_resume+0x49/0x80
    [  304.265494]  guc_info+0x6b/0xb0 [xe]
    [  304.265538]  ? __pfx___drm_printfn_seq_file+0x10/0x10
    [  304.265541]  ? __pfx___drm_puts_seq_file+0x10/0x10
    [  304.265545]  seq_read_iter+0x111/0x4c0
    [  304.265551]  seq_read+0xfc/0x140
    [  304.265556]  full_proxy_read+0x58/0x80
    [  304.265560]  vfs_read+0xa7/0x360
    [  304.265563]  ? find_held_lock+0x2b/0x80
    [  304.265568]  ksys_read+0x64/0xe0
    [  304.265571]  do_syscall_64+0x68/0x140
    [  304.265575]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [  304.265578] RIP: 0033:0x7f4254d14992
    [  304.265580] RSP: 002b:00007ffc558666f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
    [  304.265583] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f4254d14992
    [  304.265584] RDX: 0000000000020000 RSI: 00007f4254ebb000 RDI: 0000000000000003
    [  304.265586] RBP: 00007f4254ebb000 R08: 00007f4254eba010 R09: 00007f4254eba010
    [  304.265587] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000022000
    [  304.265588] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
    [  304.265593]  </TASK>
    [  304.265594]
                   Showing all locks held in the system:
    [  304.265598] 1 lock held by khungtaskd/57:
    [  304.265599]  #0: ffffffff8273b860 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x36/0x1c0
    [  304.265607] 3 locks held by kworker/6:1/90:
    [  304.265610] 1 lock held by in:imklog/547:
    [  304.265611]  #0: ffff88810498cd88 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x76/0xc0
    [  304.265620] 1 lock held by dmesg/1310:
    
    Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b6af83ceb593bc4e0d79acda73684462b13a15b9 drm-intel
793c8894ecd7 drm/xe: Wedge the entire device
280ef91e0564 drm/xe: Don't suspend device upon wedge


