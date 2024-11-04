Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7182ED132DF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 15:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB6C10E46A;
	Mon,  4 Nov 2024 15:20:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB95810E46B;
 Mon,  4 Nov 2024 15:20:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_races_on_fd?=
 =?utf-8?q?info_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 15:20:51 -0000
Message-ID: <173073365196.1391678.8951521888874005647@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
In-Reply-To: <20241104143815.2112272-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix races on fdinfo (rev4)
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
commit de9c0b9637c6b132c7f146d6b778e0acff2cc198
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Nov 4 06:38:15 2024 -0800

    drm/xe: Sample gpu timestamp closer to exec queues
    
    Move the force_wake_get to the beginning of the function so the gpu
    timestamp can be closer to the sampled value for exec queues. This
    avoids additional delays waiting for force wake ack which can make the
    proportion between cycles/total_cycles fluctuate either to more or to
    less than the real value, depending if the delay happened in the first
    or second sample of a top-like application:
    
            sample 0:
                    read_exec_queue_timestamp
                                            <<<< (A)
                    read_gpu_timestamp
            sample 1:
                    read_exec_queue_timestamp
                                            <<<<< (B)
                    read_gpu_timestamp
    
    Additional delay in (A) will cause the utilization to be bigger
    than it should. Additional delay in (B) will cause the utilization to be
    smaller than it should.
    
    With this a LNL system that was failing after ~60 iterations, get to run
    to 100 without a failure. This is still not perfect, and it's easy to
    introduce errors by just loading the CPU with `stress --cpu $(nproc)` -
    the same igt test in this case fails after 2 or 3 iterations.
    
    Although not perfect, this could be viewed as just extracting that ugly
    loop to "find the forcewake for any available engine" into a separate
    function, and at the same time improving the results a little bit.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 0a6cc4357ae4d824f909468ca1deed28ae5ac96f drm-intel
59b392093863 drm/xe: Add trace to lrc timestamp update
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

-:89: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#89: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:24:
+	    TP_STRUCT__entry(

-:97: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#97: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:32:
+	    TP_fast_assign(

-:115: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#115: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:115: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#115: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:115: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#115: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:115: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#115: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:115: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#115: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 7 checks, 82 lines checked
58c3cda26252 drm/xe: Stop accumulating LRC timestamp on job_free
f59a9bcc80e0 drm/xe: Reword exec_queue and vm lock doc
deec55c6f35f drm/xe: Wait on killed exec queues
de9c0b9637c6 drm/xe: Sample gpu timestamp closer to exec queues


