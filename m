Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F256CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0410E03B;
	Fri, 26 Sep 2025 11:59:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52FF10E03B;
 Fri, 26 Sep 2025 11:59:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=3A_Add_GPU_work_period_s?=
 =?utf-8?q?upport_for_Xe_driver_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Sep 2025 11:59:52 -0000
Message-ID: <175888799293.370490.8867356572445777412@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
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

Series: : Add GPU work period support for Xe driver (rev4)
URL   : https://patchwork.freedesktop.org/series/153341/
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
commit cc9a35b299376e98d33059e9d8356b3754d5405f
Author: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Date:   Fri Sep 26 10:45:20 2025 +0000

    Hack patch: Do not merge
    
    This patch is only added so that our files are built and tested
    on the CI
+ /mt/dim checkpatch d557b14c00c4ab027e66c1c7bf512cf479ff8c24 drm-intel
9834b0e91419 drm/xe: Add a new xe_user structure
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 148 lines checked
1cb7ee31f5c1 drm/xe: Add xe_gt_clock_interval_to_ns function
f9b5b4375416 drm/xe: Add a trace point for GPU work period
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

-:55: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#55: FILE: include/trace/gpu_work_period.h:15:
+TRACE_EVENT(gpu_work_period,
+

-:56: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#56: FILE: include/trace/gpu_work_period.h:16:
+	TP_PROTO(

-:66: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#66: FILE: include/trace/gpu_work_period.h:26:
+	TP_STRUCT__entry(

-:74: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#74: FILE: include/trace/gpu_work_period.h:34:
+	TP_fast_assign(

-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: include/trace/gpu_work_period.h:43:
+	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
+		__entry->gpu_id,

total: 0 errors, 1 warnings, 5 checks, 59 lines checked
d3dc915a407f drm/xe: Modify xe_exec_queue_update_run_ticks
a506ede6f6e4 drm/xe: Handle xe_user creation and removal
-:69: CHECK:SPACING: No space is necessary after a cast
#69: FILE: drivers/gpu/drm/xe/xe_device.c:121:
+			uid = (unsigned int) cred->euid.val;

-:219: CHECK:LINE_SPACING: Please don't use multiple blank lines
#219: FILE: drivers/gpu/drm/xe/xe_user.c:109:
+
+

-:255: CHECK:LINE_SPACING: Please don't use multiple blank lines
#255: FILE: drivers/gpu/drm/xe/xe_user.h:16:
+
+

total: 0 errors, 0 warnings, 3 checks, 218 lines checked
8e8e744db2a3 drm/xe: Implement xe_work_period_worker
-:122: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#122: FILE: drivers/gpu/drm/xe/xe_user.c:26:
+		schedule_delayed_work(&user->delay_work,
+				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));

-:162: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#162: FILE: drivers/gpu/drm/xe/xe_user.c:64:
+	if (xe_pm_runtime_get_if_active(xe)) {
+

-:164: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#164: FILE: drivers/gpu/drm/xe/xe_user.c:66:
+		list_for_each_entry(xef, &user->filelist, user_link) {
+

-:166: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#166: FILE: drivers/gpu/drm/xe/xe_user.c:68:
+			wait_var_event(&xef->exec_queue.pending_removal,
+			!atomic_read(&xef->exec_queue.pending_removal));

-:218: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#218: FILE: drivers/gpu/drm/xe/xe_user.c:204:
+		if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))

-:256: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#256: FILE: drivers/gpu/drm/xe/xe_user.c:240:
+			if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))

-:288: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#288: FILE: drivers/gpu/drm/xe/xe_user.h:39:
+	struct mutex lock;

total: 0 errors, 0 warnings, 7 checks, 258 lines checked
48f9d6fc544d drm/xe: Add a Kconfig option for GPU work period
-:46: CHECK:LINE_SPACING: Please don't use multiple blank lines
#46: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:918:
 
+

total: 0 errors, 0 warnings, 1 checks, 87 lines checked
93b8831e528a drm/xe: Handle xe_work_period destruction
-:30: CHECK:LINE_SPACING: Please don't use multiple blank lines
#30: FILE: drivers/gpu/drm/xe/xe_device.c:439:
 
+

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
cc9a35b29937 Hack patch: Do not merge
-:31: WARNING:IF_1: Consider removing the #if 1 and its #endif
#31: FILE: drivers/gpu/drm/xe/xe_user.h:75:
+#if 1

-:34: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 16 lines checked


