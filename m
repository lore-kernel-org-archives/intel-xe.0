Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624B4C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 15:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EDC10E0B7;
	Mon, 10 Apr 2023 15:46:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4262610E0A9;
 Mon, 10 Apr 2023 15:46:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E7C4EAADE6;
 Mon, 10 Apr 2023 15:46:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Mon, 10 Apr 2023 15:46:22 -0000
Message-ID: <168114158294.22958.10442116559470136445@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230406143133.29474-1-jose.souza@intel.com>
In-Reply-To: <20230406143133.29474-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_series_starting_with_=5Bv2=2Crebased=2C1/6=5D_drm/i915=3A_Nu?=
 =?utf-8?q?ke_unused_dsparb=5Flock_=28rev2=29?=
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

Series: series starting with [v2,rebased,1/6] drm/i915: Nuke unused dsparb_lock (rev2)
URL   : https://patchwork.freedesktop.org/series/116198/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 17b798712cb3b49de59b077c560e3195b12c8492
Author:     Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
AuthorDate: Fri Apr 7 13:55:22 2023 -0700
Commit:     Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CommitDate: Fri Apr 7 22:13:56 2023 -0700

    drm/xe: Fix memory use after free
    
    The wait_event_timeout() on g2h_fence.wq which is declared on
    stack can return before the wake_up() gets called, resulting in a
    stack out of bound access when wake_up() accesses the g2h_fene.wq.
    
    Do not declare g2h_fence related wait_queue_head_t on stack.
    
    Fixes the below KASAN BUG and associated kernel crashes.
    
    BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0
    Read of size 4 at addr ffff88826252f4ac by task kworker/u128:5/467
    
    CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
    Workqueue: events_unbound g2h_worker_func [xe]
    Call Trace:
     <TASK>
     dump_stack_lvl+0x64/0xb0
     print_report+0xc2/0x600
     kasan_report+0x96/0xc0
     do_raw_spin_lock+0x6f/0x1e0
     _raw_spin_lock_irqsave+0x47/0x60
     __wake_up_common_lock+0xc0/0x150
     dequeue_one_g2h+0x20f/0x6a0 [xe]
     g2h_worker_func+0xa9/0x180 [xe]
     process_one_work+0x527/0x990
     worker_thread+0x2d1/0x640
     kthread+0x174/0x1b0
     ret_from_fork+0x29/0x50
     </TASK>
    
    Tested-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
=== git am output follows ===
error: corrupt patch at line 39
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/i915: Nuke unused dsparb_lock
Applying: drm/i915: Initialize dkl_phy spin lock from display code path
Applying: drm/i915: Only initialize dlk phy lock in display 12 and newer
Applying: drm/xe/display: Enable modular fia in TGL
Applying: drm/xe/display: Disable PSR HW tracking for DG2 and MTL
Patch failed at 0005 drm/xe/display: Disable PSR HW tracking for DG2 and MTL
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


