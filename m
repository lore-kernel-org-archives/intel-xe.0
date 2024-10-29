Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB7ED74948
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 22:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D931210E3BA;
	Tue, 29 Oct 2024 22:30:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B074110E3BA;
 Tue, 29 Oct 2024 22:30:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_races_on_fd?=
 =?utf-8?q?info_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 22:30:41 -0000
Message-ID: <173024104171.1362048.15193662861449985577@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
In-Reply-To: <20241029214351.776293-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix races on fdinfo (rev3)
URL   : https://patchwork.freedesktop.org/series/140544/
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
commit 88eaa89a9cee0e1b517026667e35ac5d9b1c268c
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Oct 29 14:43:51 2024 -0700

    drm/xe: Wait on killed exec queues
    
    When an exec queue is killed it triggers an async process of asking the
    GuC to schedule the context out. The timestamp in the context image is
    only updated when this process completes. In case a userspace process
    kills an exec and tries to read the timestamp, it may not get an updated
    runtime.
    
    Add synchronization between the process reading the fdinfo and the exec
    queue being killed. After reading all the timestamps, wait on exec
    queues in the process of being killed. When that wait is over,
    xe_exec_queue_fini() was already called and updated the timestamps.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 drm-intel
d5ea1e0d7da0 drm/xe: Add trace to lrc timestamp update
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:87: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#87: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:24:
+	    TP_STRUCT__entry(

-:95: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#95: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:32:
+	    TP_fast_assign(

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 7 checks, 82 lines checked
ff53d2f28e68 drm/xe: Stop accumulating LRC timestamp on job_free
07544f1cb238 drm/xe: Reword exec_queue.lock doc
88eaa89a9cee drm/xe: Wait on killed exec queues


