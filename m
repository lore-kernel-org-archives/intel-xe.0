Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C77C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 19:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBEF10E1E2;
	Mon, 10 Apr 2023 19:02:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22C1510E1E2;
 Mon, 10 Apr 2023 19:02:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1AF7CA9932;
 Mon, 10 Apr 2023 19:02:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 10 Apr 2023 19:02:45 -0000
Message-ID: <168115336510.22959.12396385964223554428@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230410183219.191543-1-jose.souza@intel.com>
In-Reply-To: <20230410183219.191543-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5Bv3=2C1/6=5D_drm/i915=3A_Initialize_d?=
 =?utf-8?q?kl=5Fphy_spin_lock_from_display_code_path?=
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

Series: series starting with [v3,1/6] drm/i915: Initialize dkl_phy spin lock from display code path
URL   : https://patchwork.freedesktop.org/series/116275/
State : success

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
Applying: drm/i915: Initialize dkl_phy spin lock from display code path
Applying: drm/i915: Only initialize dlk phy lock in display 12 and newer
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: TEMPORARY: drm/xe/display: Enable modular fia in TGL
Applying: drm/xe/display: Disable PSR HW tracking by default in all display versions
Applying: drm/xe: Enable Raptorlake-P


