Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04F6CA1009
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 07:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A6F10E431;
	Wed,  3 Sep 2025 07:58:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BF710E431;
 Wed,  3 Sep 2025 07:58:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_GPU_frequency_tracepo?=
 =?utf-8?q?int?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 07:58:07 -0000
Message-ID: <175688628780.297199.7004176598413130725@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903074528.69159-1-s.sebinraj@intel.com>
In-Reply-To: <20250903074528.69159-1-s.sebinraj@intel.com>
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

Series: Add GPU frequency tracepoint
URL   : https://patchwork.freedesktop.org/series/153925/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 70381771add3789ef90e85ee85da90cb2ceb5b7c
Author: S Sebinraj <s.sebinraj@intel.com>
Date:   Wed Sep 3 13:15:28 2025 +0530

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
+ /mt/dim checkpatch fc0851a57d35ddfcdb673270da6ca17626dafc08 drm-intel
af932c8a44c5 drm: Add GPU frequency tracepoint at DRM level
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:108: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#108: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:24:
+	    TP_STRUCT__entry(

-:112: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#112: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:28:
+	    TP_fast_assign(

-:129: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#129: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                              ^

-:129: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#129: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                                 ^

-:129: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#129: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                                         ^

-:129: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#129: FILE: drivers/gpu/drm/drm_gpu_frequency_trace.h:45:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
                                             ^

total: 0 errors, 1 warnings, 6 checks, 87 lines checked
70381771add3 drm/xe: Add DRM GPU frequency tracepoint to Xe
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 77 lines checked


