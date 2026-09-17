Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26224C982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 21:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD97410ED04;
	Thu, 17 Sep 2026 21:21:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F88510ED04;
 Thu, 17 Sep 2026 21:21:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Skip_schedule_d?=
 =?utf-8?q?isable_for_an_already_reset_exec_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Sep 2026 21:21:17 -0000
Message-ID: <178968007744.177999.17114143352304520538@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917193838.564857-2-jagmeet.randhawa@intel.com>
In-Reply-To: <20260917193838.564857-2-jagmeet.randhawa@intel.com>
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

Series: drm/xe: Skip schedule disable for an already reset exec queue
URL   : https://patchwork.freedesktop.org/series/174456/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 74ba7937ff99e05fb13e239d10135892c27a2e04
Author: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Date:   Fri Sep 18 03:38:39 2026 +0800

    drm/xe: Skip schedule disable for an already reset exec queue
    
    A memory CAT error causes GuC to reset the offending context and notify
    the driver. xe_guc_exec_queue_memory_cat_error_handler() treats this the
    same as an engine reset and calls xe_guc_exec_queue_reset_trigger_cleanup(),
    which sets EXEC_QUEUE_STATE_RESET.
    
    Roughly 200us later the TDR runs for the same queue. It reads
    exec_queue_reset(), uses the result only to set err = -EIO, and then sends
    a schedule disable (H2G SCHED_CONTEXT_MODE_SET) anyway. GuC has already
    destroyed the context, so no SCHED_DONE is ever returned. The TDR then
    waits out its HZ*5 timeout, reports "Schedule disable failed to respond"
    and calls xe_gt_reset_async(), escalating a per-context failure into a
    full GT reset that kills every context on the tile and reloads GuC.
    
    The failure is intermittent because the enclosing guard is
    (exec_queue_enabled || exec_queue_pending_disable): it is a race between
    the CAT error cleanup and the TDR. When cleanup wins the block is skipped
    and recovery is clean; when the TDR wins the disable is sent and the
    timeout fires.
    
    Skip the handshake entirely when the context has already been reset. The
    send, the HZ*5 wait and the GT reset escalation all live in the same block,
    so a single condition removes all three. err = -EIO is preserved so
    userspace still receives the correct error, and execution falls through to
    the normal cleanup path, which performs the deregistration.
    
    This matches existing behaviour elsewhere in the driver:
    xe_guc_exec_queue_reset_handler() calls the same
    xe_guc_exec_queue_reset_trigger_cleanup() and performs no disable
    handshake at all. The TDR path was simply inconsistent with it.
    
    Evidence, captured with existing ftrace events only (no instrumentation):
    
      Healthy acknowledgements take ~350us:
        4806.244755 xe_exec_queue_scheduling_enable  guc_id=2 guc_state=0x7
        4806.245126 xe_exec_queue_scheduling_done    guc_id=2 guc_state=0x7
    
      The failure:
        4806.245395 xe_exec_queue_memory_cat_error   guc_id=2 guc_state=0x3
        4806.245592 xe_exec_queue_scheduling_disable guc_id=2 guc_state=0x249
                    <5.18s, no scheduling_done for any guc_id>
        4811.425872 xe_sched_job_timedout            guc_id=2 guc_state=0x200
    
      guc_state=0x249 is REGISTERED|PENDING_DISABLE|RESET|BANNED. The RESET bit
      confirms the exec_queue_reset() branch was taken and the disable was sent
      regardless. scheduling_done never fires, so handle_sched_done() never runs
      and the acknowledgement genuinely never arrives.
    
      With the fix, scheduling_disable is traced at guc_state=0x2d9
      (adds DESTROYED|KILLED), i.e. it now originates from
      disable_scheduling_deregister() on the normal cleanup path, and GuC
      acknowledges it every time.
    
    Testing:
      igt@xe_exec_reset@multi-queue-cancel               0/10 failures
                                                         (baseline 10/10 failures)
      igt@xe_exec_reset@multi-queue-cancel-on-secondary  passing
      Subtest runtime drops from ~5.2s to ~85ms.
    
    Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
+ /mt/dim checkpatch 1687195a722fb2a8bfa0af9b739a0485034fefcb drm-intel
74ba7937ff99 drm/xe: Skip schedule disable for an already reset exec queue
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
same as an engine reset and calls xe_guc_exec_queue_reset_trigger_cleanup(),

-:51: WARNING:TYPO_SPELLING: 'acknowledgement' may be misspelled - perhaps 'acknowledgment'?
#51: 
  and the acknowledgement genuinely never arrives.
          ^^^^^^^^^^^^^^^

total: 0 errors, 2 warnings, 0 checks, 24 lines checked


