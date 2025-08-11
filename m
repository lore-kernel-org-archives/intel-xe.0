Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDF9C87FD2
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 09:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4898A10E3EA;
	Mon, 11 Aug 2025 09:39:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DCB10E3EA;
 Mon, 11 Aug 2025 09:39:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_GPU_frequency_t?=
 =?utf-8?q?racing_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Aug 2025 09:39:01 -0000
Message-ID: <175490514186.226107.15676420761227790687@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
In-Reply-To: <20250811083414.3863103-1-s.sebinraj@intel.com>
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

Series: drm/xe: GPU frequency tracing support (rev2)
URL   : https://patchwork.freedesktop.org/series/152701/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 341695a17dc7de36ec25c159b210d819bb8ae296
Author: S Sebinraj <s.sebinraj@intel.com>
Date:   Mon Aug 11 14:04:14 2025 +0530

    drm/xe: GPU frequency tracing support
    
    A periodic GPU frequency monitoring and tracing program for the
    Xe driver. The implementation provides periodic sampling of
    GPU frequency through the Linux ftrace infrastructure.
    
    Key features:
    - Periodic GPU frequency sampling with configurable intervals
    - Immediate frequency change reporting via tracepoints
    - Integration with Linux ftrace subsystem under 'power' events
    - Per-GT (Graphics Technology) monitoring support
    - Dedicated workqueue for non-blocking frequency sampling
    - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
    - The monitoring interval can be configured at runtime via the sysfs
      (default 5sec).
    
    The sysfs entry is at:
    /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
    
    The tracepoint is exposed at:
    /sys/kernel/debug/tracing/events/power/gpu_frequency
    
    Format: {unsigned int state, unsigned int gpu_id}
    - state: GPU frequency in KHz
    - gpu_id: GPU clock domain identifier
    
    This enables userspace tools and system monitoring applications to track
    GPU frequency changes for power management analysis, performance tuning,
    and debugging purposes.
    
    Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
+ /mt/dim checkpatch 27315c7bb830e06a1e63fe1fd656fda48365805c drm-intel
341695a17dc7 drm/xe: GPU frequency tracing support
-:131: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#131: 
new file mode 100644

-:192: CHECK:LINE_SPACING: Please don't use multiple blank lines
#192: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:57:
+
+

-:273: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#273: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:138:
+	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
+		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);

-:323: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#323: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:188:
+		xe_modparam.gpufreq_monitoring_interval_ms = XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS;

-:382: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#382: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:247:
+	tracer_data->gt_data = drmm_kcalloc(&xe->drm, xe->info.gt_count,
+				       sizeof(*tracer_data->gt_data),

-:403: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#403: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer.c:268:
+		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
+			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);

-:493: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#493: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h:24:
+TRACE_EVENT(gpu_frequency,
+	TP_PROTO(unsigned int state, unsigned int gpu_id),

-:497: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#497: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h:28:
+	TP_STRUCT__entry(

-:502: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#502: FILE: drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h:33:
+	TP_fast_assign(

total: 0 errors, 2 warnings, 7 checks, 481 lines checked


