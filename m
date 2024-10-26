Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4463BD10C00
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 17:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0C10E045;
	Sat, 26 Oct 2024 17:16:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B204E10E045;
 Sat, 26 Oct 2024 17:16:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_races_on_fd?=
 =?utf-8?q?info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 26 Oct 2024 17:16:14 -0000
Message-ID: <172996297472.1335516.17812320733854160247@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
In-Reply-To: <20241026170952.94670-2-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix races on fdinfo
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
commit 2bb31ce6e9c0f65ec73dc9a4de25396fe0d9de0e
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Sat Oct 26 12:08:48 2024 -0500

    drm/xe: Stop accumulating LRC timestamp on job_free
    
    The exec queue timestamp is only really useful when it's being queried
    through the fdinfo. There's no need to update it so often, on every
    job_free. Tracing a simple app like vkcube running shows an update
    rate of ~ 120Hz.
    
    The update on job_free() is used to cover a gap: if exec
    queue is created and destroyed rapidily, before a new query, the
    timestamp still needs to be accumulated and accounted on the xef.
    Initial implementation in commit 6109f24f87d7 ("drm/xe: Add helper to
    accumulate exec queue runtime") couldn't do it on the exec_queue_fini
    since the xef could be gone at that point. However since commit
    ce8c161cbad4 ("drm/xe: Add ref counting for xe_file") the xef is
    refcounted and the exec queue has a reference.
    
    Improve the fix in commit 2149ded63079 ("drm/xe: Fix use after free when
    client stats are captured") by reducing the frequency in which the
    update is needed.
    
    Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 3ec61d11c7429a65dcc3ac46b9e845f13891a306 drm-intel
2262fad6af49 drm/xe: Add trace to lrc timestamp update
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

-:86: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#86: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:24:
+	    TP_STRUCT__entry(

-:94: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#94: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:32:
+	    TP_fast_assign(

-:112: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#112: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:112: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#112: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:112: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#112: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:112: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#112: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:112: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#112: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 7 checks, 82 lines checked
4654486a329d drm/xe: Accumulate exec queue timestamp on destroy
2bb31ce6e9c0 drm/xe: Stop accumulating LRC timestamp on job_free


