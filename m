Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D82C3DA6D
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 12:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3B210E2CB;
	Fri, 23 May 2025 12:34:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1BE10E2CB;
 Fri, 23 May 2025 12:34:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sched=3A_stop_re-s?=
 =?utf-8?q?ubmitting_signalled_jobs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 May 2025 12:34:25 -0000
Message-ID: <174800366570.17313.14086583767593042503@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523113608.121553-2-matthew.auld@intel.com>
In-Reply-To: <20250523113608.121553-2-matthew.auld@intel.com>
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

Series: drm/xe/sched: stop re-submitting signalled jobs
URL   : https://patchwork.freedesktop.org/series/149426/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d7625d16d7650e67acaabbe35d6010f7af3a3490
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri May 23 12:36:09 2025 +0100

    drm/xe/sched: stop re-submitting signalled jobs
    
    Customer is reporting a really subtle issue where we get random DMAR
    faults, hangs and other nasties for kernel migration jobs when stressing
    stuff like s2idle/s3/s4. The explosions seems to happen somewhere
    after resuming the system with splats looking something like:
    
    PM: suspend exit
    rfkill: input handler disabled
    xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x2, guc_id=0
    xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=24496, lrc_seqno=24496, guc_id=0, flags=0x13 in no process [-1]
    xe 0000:00:02.0: [drm] GT0: Kernel-submitted job timed out
    
    The likely cause appears to be a race between suspend cancelling the
    worker that processes the free_job()'s, such that we still have pending
    jobs to be freed after the cancel. Following from this, on resume the
    pending_list will now contain at least one already complete job, but it
    looks like we call drm_sched_resubmit_jobs(), which will then call
    run_job() on everything still on the pending_list. But if the job was
    already complete, then all the resources tied to the job, like the bb
    itself, any memory that is being accessed, the iommu mappings etc. might
    be long gone since those are usually tied to the fence signalling.
    
    This scenario can be seen in ftrace when running a slightly modified
    xe_pm (kernel was only modified to inject artificial latency into
    free_job to make the race easier to hit):
    
    xe_sched_job_run: dev=0000:00:02.0, fence=0xffff888276cc8540, seqno=0, lrc_seqno=0, gt=0, guc_id=0, batch_addr=0x000000146910 ...
    xe_exec_queue_stop:   dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
    xe_exec_queue_stop:   dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=1, guc_state=0x0, flags=0x4
    xe_exec_queue_stop:   dev=0000:00:02.0, 4:0x1, gt=1, width=1, guc_id=0, guc_state=0x0, flags=0x3
    xe_exec_queue_stop:   dev=0000:00:02.0, 1:0x1, gt=1, width=1, guc_id=1, guc_state=0x0, flags=0x3
    xe_exec_queue_stop:   dev=0000:00:02.0, 4:0x1, gt=1, width=1, guc_id=2, guc_state=0x0, flags=0x3
    xe_exec_queue_resubmit: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
    xe_sched_job_run: dev=0000:00:02.0, fence=0xffff888276cc8540, seqno=0, lrc_seqno=0, gt=0, guc_id=0, batch_addr=0x000000146910 ...
    .....
    xe_exec_queue_memory_cat_error: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x3, flags=0x13
    
    So the job_run() is clearly triggered twice, even though the first must
    have already signalled to completion during suspend. We can also see a
    CAT error after the re-submit.
    
    To prevent this try to call xe_sched_stop() to forcefully remove
    anything on the pending_list that has already signalled, before we
    re-submit.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4856
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: William Tseng <william.tseng@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch b93f7d5c722241ec6d23a3f03c99a844227c50db drm-intel
d7625d16d765 drm/xe/sched: stop re-submitting signalled jobs
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x2, guc_id=0

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


