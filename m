Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB19C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 10:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BD110E4EC;
	Fri,  8 Aug 2025 10:30:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D7110E4EC;
 Fri,  8 Aug 2025 10:30:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_ANDROID=3A_Add_GPU_work_p?=
 =?utf-8?q?eriod_support_for_Xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 10:30:49 -0000
Message-ID: <175464904941.221846.6492971741411780542@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
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

Series: ANDROID: Add GPU work period support for Xe driver
URL   : https://patchwork.freedesktop.org/series/152678/
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
commit 5fc47ee2e66d4822a31ec46c6ea4305f0f4f79dc
Author: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Date:   Fri Aug 8 09:09:19 2025 +0000

    ANDROID: Add GPU work period support for Xe driver
    
    This patch implements the Android requirement GPU work
    period event for Intel Xe driver.
    
    |GpuWorkPeriodEvent| defines a non-overlapping, non-zero period
    of time from |start_time_ns| (inclusive) until |end_time_ns|
    (exclusive) for a given |uid|, and includes details of how much
    work the GPU was performing for |uid| during the period. When
    GPU work for a given |uid| runs on the GPU, the driver must track
    one or more periods that cover the time where the work was running,
    and emit events soon after.
    
    Full requirement is defined in the following file:
    https://cs.android.com/android/platform/superproject/main/+\
    /main:frameworks/native/services/gpuservice/gpuwork/bpfprogs/gpuWork.c;l=35
    
    The requirement is implemented using a timer to give periodic
    interrupts and a worker thread per user id instance to accumulate
    its run time on gpu and emit the event. Each user id instance is
    tracked using a xe_user structure and the runtime is updated at
    each timer interrupt. The timer period is hardcoded to 500 msecs.
    
    The runtime on the gpu is collected for each xe file individually
    inside the function xe_exec_queue_update_run_ticks() and accumulated
    into the corresponding xe_user active_duration_ns field. The HW
    Context timestamp field in the GTT is used to derive the runtime
    in clock ticks and then converted into nanosecs before updating the
    active duration.
    
    Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
+ /mt/dim checkpatch 0a8f74a5dde6c5327dac9522cf1441003f2ebcba drm-intel
5fc47ee2e66d ANDROID: Add GPU work period support for Xe driver
-:72: CHECK:SPACING: No space is necessary after a cast
#72: FILE: drivers/gpu/drm/xe/xe_device.c:117:
+			uid = (int) cred->euid.val;

-:99: CHECK:LINE_SPACING: Please don't use multiple blank lines
#99: FILE: drivers/gpu/drm/xe/xe_device.c:144:
+
+

-:108: CHECK:SPACING: No space is necessary after a cast
#108: FILE: drivers/gpu/drm/xe/xe_device.c:153:
+	user->uid = (unsigned int) uid;

-:309: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#309: FILE: drivers/gpu/drm/xe/xe_drm_client.c:437:
+	list_for_each_entry(xef, &user->filelist, user_link) {
+

-:311: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#311: FILE: drivers/gpu/drm/xe/xe_drm_client.c:439:
+		wait_var_event(&xef->exec_queue.pending_removal,
+		!atomic_read(&xef->exec_queue.pending_removal));

-:540: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#540: 
new file mode 100644

-:567: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#567: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:23:
+TRACE_EVENT(gpu_work_period,
+

-:568: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#568: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:24:
+	TP_PROTO(

-:578: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#578: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:34:
+	TP_STRUCT__entry(

-:586: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#586: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:42:
+	TP_fast_assign(

-:595: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#595: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:51:
+	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
+		__entry->gpu_id,

total: 0 errors, 1 warnings, 10 checks, 515 lines checked


