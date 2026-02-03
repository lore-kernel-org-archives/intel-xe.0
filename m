Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9003E83062
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 08:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801AD10E593;
	Tue,  3 Feb 2026 08:49:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562A10E147;
 Tue,  3 Feb 2026 08:49:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/gt=3A_Check_set?=
 =?utf-8?q?=5Fdefault=5Fsubmission=28=29_before_deferencing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Feb 2026 08:49:45 -0000
Message-ID: <177010858577.219828.10962263756248067304@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203044839.1555147-1-suraj.kandpal@intel.com>
In-Reply-To: <20260203044839.1555147-1-suraj.kandpal@intel.com>
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

Series: drm/i915/gt: Check set_default_submission() before deferencing (rev2)
URL   : https://patchwork.freedesktop.org/series/161051/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5c245ef3b6eb843b8360b27db387a7cf72844d1
Author: Rahul Bukte <rahul.bukte@sony.com>
Date:   Tue Feb 3 10:18:39 2026 +0530

    drm/i915/gt: Check set_default_submission() before deferencing
    
    When the i915 driver firmware binaries are not present, the
    set_default_submission pointer is not set. This pointer is
    dereferenced during suspend anyways.
    
    Add a check to make sure it is set before dereferencing.
    
    [   23.289926] PM: suspend entry (deep)
    [   23.293558] Filesystems sync: 0.000 seconds
    [   23.298010] Freezing user space processes
    [   23.302771] Freezing user space processes completed (elapsed 0.000 seconds)
    [   23.309766] OOM killer disabled.
    [   23.313027] Freezing remaining freezable tasks
    [   23.318540] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
    [   23.342038] serial 00:05: disabled
    [   23.345719] serial 00:02: disabled
    [   23.349342] serial 00:01: disabled
    [   23.353782] sd 0:0:0:0: [sda] Synchronizing SCSI cache
    [   23.358993] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
    [   23.361635] ata1.00: Entering standby power mode
    [   23.368863] ata2.00: Entering standby power mode
    [   23.445187] BUG: kernel NULL pointer dereference, address: 0000000000000000
    [   23.452194] #PF: supervisor instruction fetch in kernel mode
    [   23.457896] #PF: error_code(0x0010) - not-present page
    [   23.463065] PGD 0 P4D 0
    [   23.465640] Oops: Oops: 0010 [#1] SMP NOPTI
    [   23.469869] CPU: 8 UID: 0 PID: 211 Comm: kworker/u48:18 Tainted: G S      W           6.19.0-rc4-00020-gf0b9d8eb98df #10 PREEMPT(voluntary)
    [   23.482512] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
    [   23.496511] Workqueue: async async_run_entry_fn
    [   23.501087] RIP: 0010:0x0
    [   23.503755] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
    [   23.510324] RSP: 0018:ffffb4a60065fca8 EFLAGS: 00010246
    [   23.515592] RAX: 0000000000000000 RBX: ffff9f428290e000 RCX: 000000000000000f
    [   23.522765] RDX: 0000000000000000 RSI: 0000000000000282 RDI: ffff9f428290e000
    [   23.529937] RBP: ffff9f4282907070 R08: ffff9f4281130428 R09: 00000000ffffffff
    [   23.537111] R10: 0000000000000000 R11: 0000000000000001 R12: ffff9f42829070f8
    [   23.544284] R13: ffff9f4282906028 R14: ffff9f4282900000 R15: ffff9f4282906b68
    [   23.551457] FS:  0000000000000000(0000) GS:ffff9f466b2cf000(0000) knlGS:0000000000000000
    [   23.559588] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   23.565365] CR2: ffffffffffffffd6 CR3: 000000031c230001 CR4: 0000000000f70ef0
    [   23.572539] PKRU: 55555554
    [   23.575281] Call Trace:
    [   23.577770]  <TASK>
    [   23.579905]  intel_engines_reset_default_submission+0x42/0x60
    [   23.585695]  __intel_gt_unset_wedged+0x191/0x200
    [   23.590360]  intel_gt_unset_wedged+0x20/0x40
    [   23.594675]  gt_sanitize+0x15e/0x170
    [   23.598290]  i915_gem_suspend_late+0x6b/0x180
    [   23.602692]  i915_drm_suspend_late+0x35/0xf0
    [   23.607008]  ? __pfx_pci_pm_suspend_late+0x10/0x10
    [   23.611843]  dpm_run_callback+0x78/0x1c0
    [   23.615817]  device_suspend_late+0xde/0x2e0
    [   23.620037]  async_suspend_late+0x18/0x30
    [   23.624082]  async_run_entry_fn+0x25/0xa0
    [   23.628129]  process_one_work+0x15b/0x380
    [   23.632182]  worker_thread+0x2a5/0x3c0
    [   23.635973]  ? __pfx_worker_thread+0x10/0x10
    [   23.640279]  kthread+0xf6/0x1f0
    [   23.643464]  ? __pfx_kthread+0x10/0x10
    [   23.647263]  ? __pfx_kthread+0x10/0x10
    [   23.651045]  ret_from_fork+0x131/0x190
    [   23.654837]  ? __pfx_kthread+0x10/0x10
    [   23.658634]  ret_from_fork_asm+0x1a/0x30
    [   23.662597]  </TASK>
    [   23.664826] Modules linked in:
    [   23.667914] CR2: 0000000000000000
    [   23.671271] ------------[ cut here ]------------
    
    Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 7618bceb6305806c68d5ac7c08c82ef9ad4150ad drm-intel
a5c245ef3b6e drm/i915/gt: Check set_default_submission() before deferencing
-:91: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


