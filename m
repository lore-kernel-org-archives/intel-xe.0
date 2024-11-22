Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE86E6917E
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 16:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320E10EC0D;
	Fri, 22 Nov 2024 16:28:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113F910EC0D;
 Fri, 22 Nov 2024 16:28:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/trace=3A_improve_xe=5Fsched=5Fmsg_trace?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Nov 2024 16:28:01 -0000
Message-ID: <173229288109.1756018.17166923985206520809@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122161914.321263-4-matthew.auld@intel.com>
In-Reply-To: <20241122161914.321263-4-matthew.auld@intel.com>
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

Series: series starting with [1/3] drm/xe/trace: improve xe_sched_msg trace
URL   : https://patchwork.freedesktop.org/series/141705/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 553114143726c4e3493b19c1d26e1bcdb53b2411
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Nov 22 16:19:17 2024 +0000

    drm/xe/guc_submit: fix race around suspend_pending
    
    Currently in some testcases we can trigger:
    
    xe 0000:03:00.0: [drm] Assertion `exec_queue_destroyed(q)` failed!
    ....
    WARNING: CPU: 18 PID: 2640 at drivers/gpu/drm/xe/xe_guc_submit.c:1826 xe_guc_sched_done_handler+0xa54/0xef0 [xe]
    xe 0000:03:00.0: [drm] *ERROR* GT1: DEREGISTER_DONE: Unexpected engine state 0x00a1, guc_id=57
    
    Looking at a snippet of corresponding ftrace for this GuC id we can see:
    
    162.673311: xe_sched_msg_add:     dev=0000:03:00.0, gt=1 guc_id=57, opcode=3
    162.673317: xe_sched_msg_recv:    dev=0000:03:00.0, gt=1 guc_id=57, opcode=3
    162.673319: xe_exec_queue_scheduling_disable: dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0x29, flags=0x0
    162.674089: xe_exec_queue_kill:   dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0x29, flags=0x0
    162.674108: xe_exec_queue_close:  dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0xa9, flags=0x0
    162.674488: xe_exec_queue_scheduling_done: dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0xa9, flags=0x0
    162.678452: xe_exec_queue_deregister: dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0xa1, flags=0x0
    
    It looks like we try to suspend the queue (opcode=3), setting
    suspend_pending and triggering a disable_scheduling. The user then
    closes the queue. However closing the queue seems to forcefully signal
    the fence after killing the queue, however when the G2H response for
    disable_scheduling comes back we have now cleared suspend_pending when
    signalling the suspend fence, so the disable_scheduling now incorrectly
    tries to also deregister the queue, leading to warnings since the queue
    has yet to even be marked for destruction. We also seem to trigger
    errors later with trying to double unregister the same queue.
    
    To fix this tweak the ordering when handling the response to ensure we
    don't race with a disable_scheduling that doesn't actually intend to
    actually unregister.  The destruction path should now also correctly
    wait for any pending_disable before marking as destroyed.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3371
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch a381faddbfc974e7bd57efe953a738415afccd6a drm-intel
1cbe4629b071 drm/xe/trace: improve xe_sched_msg trace
-:33: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#33: FILE: drivers/gpu/drm/xe/xe_trace.h:299:
+		    TP_printk("dev=%s, gt=%u guc_id=%d, opcode=%u", __get_str(dev), __entry->gt_id, __entry->guc_id,

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
81e3dd175070 drm/xe/guc_submit: fix race around pending_disable
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
[drm] *ERROR* GT0: SCHED_DONE: Unexpected engine state 0x02b1, guc_id=8, runnable_state=0

-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1337:
+		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
+			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));

total: 0 errors, 1 warnings, 1 checks, 37 lines checked
553114143726 drm/xe/guc_submit: fix race around suspend_pending
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
162.673311: xe_sched_msg_add:     dev=0000:03:00.0, gt=1 guc_id=57, opcode=3

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


