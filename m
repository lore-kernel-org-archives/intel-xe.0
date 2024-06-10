Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D8EC27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F97B10E24A;
	Mon, 10 Jun 2024 14:23:56 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2CD10E24A;
 Mon, 10 Jun 2024 14:23:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Only_timeout_jobs_if_they?=
 =?utf-8?q?_run_longer_than_timeout_period?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jun 2024 14:23:53 -0000
Message-ID: <171802943311.31853.10349300526196440282@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610141823.2605496-1-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-1-matthew.brost@intel.com>
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

Series: Only timeout jobs if they run longer than timeout period
URL   : https://patchwork.freedesktop.org/series/134679/
State : warning

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
commit 20b60b023b1b61eac219d63a5aa63f8c128c7656
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jun 10 07:18:23 2024 -0700

    drm/xe: Sample ctx timestamp to determine if jobs have timed out
    
    In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
    scheduling enable needs to be toggled to properly sample the timestamp.
    If a job has not been running for longer than the timeout period,
    re-enable scheduling and restart the TDR.
    
    v2:
     - Use GT clock to msec helper (Umesh, off list)
     - s/ctx_timestamp_job/ctx_job_timestamp
    v3:
     - Fix state machine for TDR, mainly decouple sched disable and
       deregister (testing)
     - Rebase (CI)
    v4:
     - Fix checkpatch && newline issue (CI)
     - Do not deregister on wedged or unregistered (CI)
     - Fix refcounting bugs (CI)
     - Move devcoredump above VM / kernel job check (John H)
     - Add comment for check_timeout state usage (John H)
     - Assert pending disable not inflight when enabling scheduling (John H)
     - Use enable_scheduling in other scheduling enable code (John H)
     - Add comments on a few steps in TDR (John H)
     - Add assert for timestamp overflow protection (John H)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ef92810a097c2ec72756c58e64cfc3096e6a2386 drm-intel
d9365922f989 drm/xe: Add LRC ctx timestamp support functions
d763e8cc01bf drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
42896ce2c84c drm/xe: Emit ctx timestamp copy in ring ops
85f893719d2f drm/xe: Add ctx timestamp to LRC snapshot
5ec438403d55 drm/xe: Add xe_gt_clock_interval_to_ms helper
c19f08e4c71f drm/xe: Improve unexpected state error messages
5175b9184a80 drm/xe: Add GuC state asserts to deregister_exec_queue
cbdf6ab25d88 drm/xe: Add pending disable assert to handle_sched_done
077548c091e9 drm/xe: Add killed, banned, or wedged as stick bit during GuC reset
20b60b023b1b drm/xe: Sample ctx timestamp to determine if jobs have timed out
-:89: CHECK:SPACING: No space is necessary after a cast
#89: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:951:
+#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)

-:89: ERROR:SPACING: space prohibited after that '*' (ctx:WxW)
#89: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:951:
+#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
                                 	        ^

total: 1 errors, 0 warnings, 1 checks, 420 lines checked


