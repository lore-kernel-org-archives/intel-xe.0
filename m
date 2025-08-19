Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9CECA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726C110E537;
	Tue, 19 Aug 2025 06:49:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1711610E537;
 Tue, 19 Aug 2025 06:49:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_GPU_frequency_t?=
 =?utf-8?q?racing_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 06:49:08 -0000
Message-ID: <175558614808.246498.7846833186557649044@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819063417.918666-1-s.sebinraj@intel.com>
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Series: drm/xe: GPU frequency tracing support (rev3)
URL   : https://patchwork.freedesktop.org/series/152701/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c9c08e5ca55fa195cacac4acfee11f49cfd1639a
Author: S Sebinraj <s.sebinraj@intel.com>
Date:   Tue Aug 19 12:04:17 2025 +0530

    drm/xe: Add core GPU frequency monitoring functionality
    
    Implement the core GPU frequency monitoring and tracing logic:
    
    - Workqueue-based periodic frequency sampling
    - Per-GT monitoring control (start/stop)
    - Power management integration with runtime PM and forcewake
    - Device hotplug protection using drm_dev_enter/exit
    - Automatic cleanup using DRM managed resources
    - Complete initialization with per-GT work scheduling
    
    Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
+ /mt/dim checkpatch 25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee drm-intel
2c3110bc42cf drm/xe: Add Kconfig option for GPU frequency tracing
6c07b16c459c drm/xe: Add module parameter for GPU frequency monitoring
419e46b9a894 drm/xe: Add GPU frequency tracing tracepoint definition
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h:24:
+TRACE_EVENT(gpu_frequency,
+	TP_PROTO(unsigned int state, unsigned int gpu_id),

-:52: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#52: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h:28:
+	TP_STRUCT__entry(

-:57: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#57: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h:33:
+	TP_fast_assign(

total: 0 errors, 1 warnings, 3 checks, 48 lines checked
19ad4d54b841 drm/xe: Add GPU frequency tracer interface
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
dba4fc0b9b15 drm/xe: Add basic GPU frequency tracer implementation
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

-:84: CHECK:LINE_SPACING: Please don't use multiple blank lines
#84: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:60:
+
+

-:128: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#128: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:104:
+	tracer_data->gt_data = drmm_kcalloc(&xe->drm, xe->info.gt_count,
+				       sizeof(*tracer_data->gt_data),

total: 0 errors, 1 warnings, 2 checks, 112 lines checked
1f297acc3ac9 drm/xe: Add GPU frequency tracer to build system
10a2023edfe4 drm/xe: Integrate GPU frequency tracer into device initialization
c9c08e5ca55f drm/xe: Add core GPU frequency monitoring functionality
-:76: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#76: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:132:
+		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
+			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);

-:143: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#143: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:199:
+		drm_warn(&xe->drm, "device not active, skipping frequency read for GT%u",
+			gt->info.id);

-:218: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#218: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:274:
+	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
+		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);

total: 0 errors, 0 warnings, 3 checks, 256 lines checked


