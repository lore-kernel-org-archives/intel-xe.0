Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD59C3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 17:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027E510E2FF;
	Tue, 25 Jun 2024 17:03:22 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826DD10E6E6;
 Tue, 25 Jun 2024 17:03:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Capture_per_client_stats_?=
 =?utf-8?q?when_destroying_an_exec_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 17:03:20 -0000
Message-ID: <171933500053.157680.14068268319618178261@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
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

Series: Capture per client stats when destroying an exec queue
URL   : https://patchwork.freedesktop.org/series/135372/
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
commit 41ae3685505fa8875fabef60fbf139689aec4503
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Wed Jun 26 00:58:12 2024 +0800

    drm/xe: Record utilization before destroying the exec queue
    
    Current code captures utilization at the exec queue level whenever a job
    is completed and then accumulates it into the xe file stats whenever the
    user queries for per client engine utilization. There is a case where
    utilization may be lost if the exec queue is destroyed before the user
    queries the utilization. To overcome that, record the utlization when
    the exec queue is destroyed.
    
    To do so
    
    1) Wait for release of all other references to the exec queue. The wait
       uses the same timeout as the job scheduling timeout. On timeout, only
       a debug message is printed out since this is just a best effort to
       capture the utilization prior to destroying the queue.
    2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
       record the utilization in the xe file stats.
    
    Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 61dfb30a52fac9b1bb455a250799611682334cc3 drm-intel
f5a8bcece79b drm/xe: Use a helper to get delta run ticks from the exec queue
-:41: ERROR:TRAILING_WHITESPACE: trailing whitespace
#41: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:790:
+ * xe_exec_queue_delta_run_ticks() - Get delta of queue run_ticks $

total: 1 errors, 0 warnings, 0 checks, 43 lines checked
41ae3685505f drm/xe: Record utilization before destroying the exec queue
-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:844:
+	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
+			(q->sched_props.job_timeout_ms/1000) * HZ);

-:50: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#50: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:844:
+			(q->sched_props.job_timeout_ms/1000) * HZ);
 			                              ^

total: 0 errors, 0 warnings, 2 checks, 37 lines checked


