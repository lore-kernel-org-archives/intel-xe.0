Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78928D0E3F3
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 19:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3B10E3B9;
	Thu, 24 Oct 2024 19:32:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99F10E3B9;
 Thu, 24 Oct 2024 19:32:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Don=27t_short_c?=
 =?utf-8?q?ircuit_TDR_on_jobs_not_started_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 19:32:10 -0000
Message-ID: <172979833084.1328167.3620218515044687380@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024025323.1846299-1-matthew.brost@intel.com>
In-Reply-To: <20241024025323.1846299-1-matthew.brost@intel.com>
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

Series: drm/xe: Don't short circuit TDR on jobs not started (rev2)
URL   : https://patchwork.freedesktop.org/series/140410/
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
commit 2cf311d530381a204195f7112759bc5da0362ed6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 23 19:53:23 2024 -0700

    drm/xe: Don't short circuit TDR on jobs not started
    
    Short circuiting TDR on jobs not started is an optimization which is not
    required. On LNL we are facing an issue where jobs do not get scheduled
    by the GuC if it misses a GGTT page update. When this occurs let the TDR
    fire, toggle the scheduling which may get the job unstuck, and print a
    warning message. If the TDR fires twice on job that hasn't started,
    timeout the job.
    
    v2:
     - Add warning message (Paulo)
     - Add fixes tag (Paulo)
     - Timeout job which hasn't started after TDR firing twice
    v3:
     - Include local change
    
    Fixes: 7ddb9403dd74 ("drm/xe: Sample ctx timestamp to determine if jobs have timed out")
    Cc: stable@vger.kernel.org
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1feef4b713e6db15f3fb2ec11e8ce4a77892e731 drm-intel
2cf311d53038 drm/xe: Don't short circuit TDR on jobs not started
-:45: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#45: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:950:
+		return xe_sched_invalidate_job(job, 2);
+	} else {

total: 0 errors, 1 warnings, 0 checks, 35 lines checked


