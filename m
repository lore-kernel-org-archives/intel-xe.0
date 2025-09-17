Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE95CAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 08:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2CC10E195;
	Wed, 17 Sep 2025 08:56:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C62910E183;
 Wed, 17 Sep 2025 08:56:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Add_GPU_frequency_?=
 =?utf-8?q?tracepoint_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Sep 2025 08:56:13 -0000
Message-ID: <175809937336.340651.3422051467661750307@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250917084135.2049550-1-s.sebinraj@intel.com>
In-Reply-To: <20250917084135.2049550-1-s.sebinraj@intel.com>
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

Series: drm: Add GPU frequency tracepoint (rev3)
URL   : https://patchwork.freedesktop.org/series/154188/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 498effb52b4e7ba442fd1ca9bef99d8bdaf7439a
Author: S Sebinraj <s.sebinraj@intel.com>
Date:   Wed Sep 17 14:11:35 2025 +0530

    drm/xe: Add DRM GPU frequency tracepoint to Xe
    
    Integrate xe PMU with the DRM-level GPU frequency tracepoint to provide
    efficient frequency monitoring with change detection.
    
    Key changes:
    - Add frequency change detection
    - Implement per-GT frequency tracking using last_act_freq array
    - Only trace when GPU frequency actually changes per GT
    
    The integration traces actual GPU frequency changes from xe_pmu during
    XE_PMU_EVENT_GT_ACTUAL_FREQUENCY reads.
    
    Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
+ /mt/dim checkpatch 982ea59d889e38d422f37ff9cc2a41a713917ff6 drm-intel
8547d17de860 drm: Add GPU frequency tracepoint at DRM level
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
- DRM-level tracepoint exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/

-:56: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
new file mode 100644

-:106: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#106: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:24:
+	    TP_STRUCT__entry(

-:110: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#110: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:28:
+	    TP_fast_assign(

-:127: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#127: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                              ^

-:127: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#127: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                                 ^

-:127: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#127: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                                         ^

-:127: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#127: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                                             ^

total: 0 errors, 2 warnings, 6 checks, 87 lines checked
498effb52b4e drm/xe: Add DRM GPU frequency tracepoint to Xe
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:140: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#140: FILE: include/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../include/drm
                              ^

-:140: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#140: FILE: include/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../include/drm
                                 ^

-:140: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#140: FILE: include/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../include/drm
                                         ^

total: 0 errors, 1 warnings, 3 checks, 92 lines checked


