Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99981C369CB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 02:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6105910E3F4;
	Fri, 18 Apr 2025 02:16:02 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7932D10E3F2;
 Fri, 18 Apr 2025 02:16:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe/eustall=3A_Resolve_a_possible_circular_locking_depen?=
 =?utf-8?q?dency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Apr 2025 02:16:01 -0000
Message-ID: <174494256148.16877.7448245879139878044@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <c896932fca84f79db2df5942911997ed77b2b9b6.1744934656.git.harish.chegondi@intel.com>
In-Reply-To: <c896932fca84f79db2df5942911997ed77b2b9b6.1744934656.git.harish.chegondi@intel.com>
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

Series: series starting with [1/1] drm/xe/eustall: Resolve a possible circular locking dependency
URL   : https://patchwork.freedesktop.org/series/147950/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cf21ca5ab5ffccd09cbb98570c9c80eab6862df5
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Thu Apr 17 17:07:17 2025 -0700

    drm/xe/eustall: Resolve a possible circular locking dependency
    
    Use a separate lock in the polling function eu_stall_data_buf_poll()
    instead of eu_stall->stream_lock. This would prevent a possible
    circular locking dependency leading to a deadlock as described below.
    This would also require additional locking with the new lock in
    the read function.
    
    <4> [787.192986] ======================================================
    <4> [787.192988] WARNING: possible circular locking dependency detected
    <4> [787.192991] 6.14.0-rc7-xe+ #1 Tainted: G     U
    <4> [787.192993] ------------------------------------------------------
    <4> [787.192994] xe_eu_stall/20093 is trying to acquire lock:
    <4> [787.192996] ffff88819847e2c0 ((work_completion)
    (&(&stream->buf_poll_work)->work)), at: __flush_work+0x1f8/0x5e0
    <4> [787.193005] but task is already holding lock:
    <4> [787.193007] ffff88814ce83ba8 (&gt->eu_stall->stream_lock){3:3},
    at: xe_eu_stall_stream_ioctl+0x41/0x6a0 [xe]
    <4> [787.193090] which lock already depends on the new lock.
    <4> [787.193093] the existing dependency chain (in reverse order) is:
    <4> [787.193095]
    -> #1 (&gt->eu_stall->stream_lock){+.+.}-{3:3}:
    <4> [787.193099]        __mutex_lock+0xb4/0xe40
    <4> [787.193104]        mutex_lock_nested+0x1b/0x30
    <4> [787.193106]        eu_stall_data_buf_poll_work_fn+0x44/0x1d0 [xe]
    <4> [787.193155]        process_one_work+0x21c/0x740
    <4> [787.193159]        worker_thread+0x1db/0x3c0
    <4> [787.193161]        kthread+0x10d/0x270
    <4> [787.193164]        ret_from_fork+0x44/0x70
    <4> [787.193168]        ret_from_fork_asm+0x1a/0x30
    <4> [787.193172]
    -> #0 ((work_completion)(&(&stream->buf_poll_work)->work)){+.+.}-{0:0}:
    <4> [787.193176]        __lock_acquire+0x1637/0x2810
    <4> [787.193180]        lock_acquire+0xc9/0x300
    <4> [787.193183]        __flush_work+0x219/0x5e0
    <4> [787.193186]        cancel_delayed_work_sync+0x87/0x90
    <4> [787.193189]        xe_eu_stall_disable_locked+0x9a/0x260 [xe]
    <4> [787.193237]        xe_eu_stall_stream_ioctl+0x5b/0x6a0 [xe]
    <4> [787.193285]        __x64_sys_ioctl+0xa4/0xe0
    <4> [787.193289]        x64_sys_call+0x131e/0x2650
    <4> [787.193292]        do_syscall_64+0x91/0x180
    <4> [787.193295]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
    <4> [787.193299]
    other info that might help us debug this:
    <4> [787.193302]  Possible unsafe locking scenario:
    <4> [787.193304]        CPU0                    CPU1
    <4> [787.193305]        ----                    ----
    <4> [787.193306]   lock(&gt->eu_stall->stream_lock);
    <4> [787.193308]                        lock((work_completion)
                                            (&(&stream->buf_poll_work)->work));
    <4> [787.193311]                        lock(&gt->eu_stall->stream_lock);
    <4> [787.193313]   lock((work_completion)
                            (&(&stream->buf_poll_work)->work));
    <4> [787.193315]
     *** DEADLOCK ***
    
    Fixes: 760edec939685 ("drm/xe/eustall: Add support to read() and poll() EU stall data")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4598
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
+ /mt/dim checkpatch 1e5b5f168ee053192ea7ec05bfe826f848be7d68 drm-intel
cf21ca5ab5ff drm/xe/eustall: Resolve a possible circular locking dependency


