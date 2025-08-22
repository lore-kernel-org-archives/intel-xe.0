Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB44CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64A210EAAD;
	Fri, 22 Aug 2025 09:39:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2854610EAAD;
 Fri, 22 Aug 2025 09:39:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=3A_Add_GPU_work_period_s?=
 =?utf-8?q?upport_for_Xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Aug 2025 09:39:16 -0000
Message-ID: <175585555615.260017.2760760732355831065@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
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

Series: : Add GPU work period support for Xe driver
URL   : https://patchwork.freedesktop.org/series/153341/
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
commit 8c756ecf8c8172e9b050435b9211ccda16488f56
Author: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Date:   Fri Aug 22 08:59:30 2025 +0000

    Handle xe_work_period destruction
    
    This adds the xe_work_period destruction procedure.
    We iterate over all entries in the xe::work_period::users
    xarray and cancel any pending delayed work. Then destroy
    the xarray itself.
    
    Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
+ /mt/dim checkpatch cca87ca63e2f5b8a785dc59c23e526987530b27f drm-intel
f81133374464 Add a new xe_user structure
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 148 lines checked
81bc89af85cd Add xe_gt_clock_interval_to_ns function
e099678d0cff Add a trace point for GPU work period
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

-:63: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#63: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:23:
+TRACE_EVENT(gpu_work_period,
+

-:64: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#64: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:24:
+	TP_PROTO(

-:74: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#74: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:34:
+	TP_STRUCT__entry(

-:82: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#82: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:42:
+	TP_fast_assign(

-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h:51:
+	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
+		__entry->gpu_id,

total: 0 errors, 1 warnings, 5 checks, 61 lines checked
c6fa68deadc2 Modify xe_exec_queue_update_run_ticks
27b593ab84de Handle xe_user creation and removal
-:65: CHECK:SPACING: No space is necessary after a cast
#65: FILE: drivers/gpu/drm/xe/xe_device.c:115:
+			uid = (unsigned int) cred->euid.val;

-:237: CHECK:LINE_SPACING: Please don't use multiple blank lines
#237: FILE: drivers/gpu/drm/xe/xe_user.h:16:
+
+

total: 0 errors, 0 warnings, 2 checks, 199 lines checked
5a8982fc8084 Implement xe_work_period_worker
-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: drivers/gpu/drm/xe/xe_device.c:157:
+		if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))

-:107: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#107: FILE: drivers/gpu/drm/xe/xe_user.c:26:
+		schedule_delayed_work(&user->delay_work,
+				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));

-:149: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#149: FILE: drivers/gpu/drm/xe/xe_user.c:66:
+	list_for_each_entry(xef, &user->filelist, user_link) {
+

-:151: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#151: FILE: drivers/gpu/drm/xe/xe_user.c:68:
+		wait_var_event(&xef->exec_queue.pending_removal,
+		!atomic_read(&xef->exec_queue.pending_removal));

-:220: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#220: FILE: drivers/gpu/drm/xe/xe_user.h:39:
+	struct mutex lock;

total: 0 errors, 0 warnings, 5 checks, 195 lines checked
fbd760d9bee6 Add a Kconfig option for GPU work period
-:40: CHECK:SPACING: No space is necessary after a cast
#40: FILE: drivers/gpu/drm/xe/xe_device.c:116:
+				uid = (unsigned int) cred->euid.val;

-:107: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#107: FILE: drivers/gpu/drm/xe/xe_device.c:152:
+			ret = xa_alloc(&xe->work_period.users, &idx, user,
+					xa_limit_32b, GFP_KERNEL);

-:116: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#116: FILE: drivers/gpu/drm/xe/xe_device.c:161:
+			if (!schedule_delayed_work(&user->delay_work,
 					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))

-:190: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#190: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:911:
+	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
+

total: 0 errors, 0 warnings, 4 checks, 205 lines checked
8c756ecf8c81 Handle xe_work_period destruction


