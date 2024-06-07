Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34247C27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 06:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DB410E197;
	Fri,  7 Jun 2024 06:56:55 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F5F10E197;
 Fri,  7 Jun 2024 06:56:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Only_timeout_jobs_if_they?=
 =?utf-8?q?_run_longer_than_timeout_period?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 06:56:55 -0000
Message-ID: <171774341507.25386.17727859118279148422@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607065219.2264624-1-matthew.brost@intel.com>
In-Reply-To: <20240607065219.2264624-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/134593/
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
commit af9556202ba5f772a74097feece8c4b9a2a496da
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 6 23:52:19 2024 -0700

    drm/xe: Sample ctx timestamp to determine if jobs have timed out
    
    In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
    scheduling enable needs to be toggled to properly sample the timestamp.
    If a job has not been running for longer than the timeout period,
    re-enable scheduling and restart the TDR.
    
    FIXME: Wedged mode needs to be fixed
    FIXME: Use some smarts to correlate timestamp to ms
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d3c2f5c9ed23d7653741913ee6c38bb0950a8870 drm-intel
ad1295b045ae drm/xe: Add LRC ctx timestamp support functions
c5077179ee92 drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
bcf5e52ab331 drm/xe: Emit ctx timestamp copy in ring ops
c171e6f28703 drm/xe: Add ctx timestamp to LRC snapshot
af9556202ba5 drm/xe: Sample ctx timestamp to determine if jobs have timed out
-:79: WARNING:LINE_SPACING: Missing a blank line after declarations
#79: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:961:
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);

-:223: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#223: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1507:
+		if (((exec_queue_banned(q) || exec_queue_check_timeout(q))
+		    && exec_queue_destroyed(q)) ||

total: 0 errors, 1 warnings, 1 checks, 230 lines checked


