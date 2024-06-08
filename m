Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30A1C27C53
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82C410E1CF;
	Sat,  8 Jun 2024 00:25:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F33E10E1CF;
 Sat,  8 Jun 2024 00:25:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Only_timeout_jobs_if_they?=
 =?utf-8?q?_run_longer_than_timeout_period?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Jun 2024 00:25:25 -0000
Message-ID: <171780632512.29060.18034390153620778239@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240608002103.2371696-1-matthew.brost@intel.com>
In-Reply-To: <20240608002103.2371696-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/134642/
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
commit 107c719d6355955d423aa91acbfb9d3b7a15f64b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jun 7 17:21:03 2024 -0700

    drm/xe: Sample ctx timestamp to determine if jobs have timed out
    
    In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
    scheduling enable needs to be toggled to properly sample the timestamp.
    If a job has not been running for longer than the timeout period,
    re-enable scheduling and restart the TDR.
    
    v2:
     - Use GT clock to msec helper (Umesh, off list)
     - s/ctx_timestamp_job/ctx_job_timestamp
    v3:
     - Fix state machine for TDR, mainly decouple sched disable and deregister (testing)
     - Rebase (CI)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2bea08bd31298d60d416b2a6ed346bb53dd28037 drm-intel
86153b6a388e drm/xe: Add LRC ctx timestamp support functions
229c3d3a0283 drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
c36e5b54fa6f drm/xe: Emit ctx timestamp copy in ring ops
80d3505422f9 drm/xe: Add ctx timestamp to LRC snapshot
bd787e03d74e drm/xe: Add xe_gt_clock_interval_to_ms helper
107c719d6355 drm/xe: Sample ctx timestamp to determine if jobs have timed out
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
 - Fix state machine for TDR, mainly decouple sched disable and deregister (testing)

-:67: CHECK:SPACING: No space is necessary after a cast
#67: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:940:
+#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)

-:67: ERROR:SPACING: space prohibited after that '*' (ctx:WxW)
#67: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:940:
+#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
                                 	        ^

-:308: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#308: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1566:
+		if (((exec_queue_banned(q) || exec_queue_check_timeout(q))
+		    && exec_queue_destroyed(q)) ||

total: 1 errors, 1 warnings, 2 checks, 318 lines checked


