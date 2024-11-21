Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8492DD75BC2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 06:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DD210E191;
	Thu, 21 Nov 2024 06:34:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AB610E191;
 Thu, 21 Nov 2024 06:34:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PMU_support_for_singl?=
 =?utf-8?q?e_engine_busyness_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 06:34:10 -0000
Message-ID: <173217085018.1002826.3712977799859642555@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121063904.3033754-1-riana.tauro@intel.com>
In-Reply-To: <20241121063904.3033754-1-riana.tauro@intel.com>
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

Series: Add PMU support for single engine busyness (rev2)
URL   : https://patchwork.freedesktop.org/series/141259/
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
commit ada0bac76e3f883431654a8be420cf714f1f8eee
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Nov 21 12:09:04 2024 +0530

    drm/xe/pmu: Add PMU support for engine busyness
    
    PMU provides two counters (<engine>-busy-ticks-gt<n>,
    <engine>-total-ticks-gt<n>) to calculate engine busyness. When querying
    engine busyness, user must group these 2 counters using the perf_event
    group mechanism to ensure both counters are sampled together.
    
    To list engine busyness counters use the following
    
    ./perf list
      xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
      xe_0000_03_00.0/bcs0-total-ticks-gt0/              [Kernel PMU event]
      xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
      xe_0000_03_00.0/ccs0-total-ticks-gt0/              [Kernel PMU event]
    
    Engine busyness can then be calculated as below
    busyness % = (engine active ticks/total ticks) * 100
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch e46649e7764a9f6868ccbcba7b8b23b413303380 drm-intel
b8aef603a61e drm/xe/pmu: Enable PMU interface
-:117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#117: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 734 lines checked
a430a5e1b1b5 drm/xe/pmu: Add GT C6 events
70fb48bb38da drm/xe/pmu: Add GT frequency events
4578d302380f drm/xe: add function to convert xe hw engine class to user class
291c2c9a76b5 drm/xe: Add single engine busyness support
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

-:520: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#520: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:220:
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];

total: 0 errors, 2 warnings, 0 checks, 489 lines checked
54a038ab51da drm/xe/trace: Add trace for xe_engine_activity
-:71: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#71: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:109:
+	    TP_STRUCT__entry(

-:88: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#88: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:126:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 90 lines checked
0d21053f078f drm/xe/guc: Expose engine busyness only for supported GuC version
ada0bac76e3f drm/xe/pmu: Add PMU support for engine busyness


