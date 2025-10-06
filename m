Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1394CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2CD10E341;
	Mon,  6 Oct 2025 15:03:02 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1710E239;
 Mon,  6 Oct 2025 15:03:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=3A_Add_GPU_work_period_s?=
 =?utf-8?q?upport_for_Xe_driver_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 15:03:01 -0000
Message-ID: <175976298190.7930.4412896411151853073@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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

Series: : Add GPU work period support for Xe driver (rev5)
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
commit 2b915419bb39680c7b54422f0e5758d4482f5e60
Author: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Date:   Mon Oct 6 14:20:29 2025 +0000

    Hack patch: Do not merge
    
    This patch is only added so that our files are built and tested
    on the CI
    
    Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
+ /mt/dim checkpatch 5d520fdf951167ca881c7ebf831dedff629e6ccf drm-intel
5be750f5e1ef drm/xe: Add a new xe_user structure
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

-:57: CHECK:LINE_SPACING: Please don't use multiple blank lines
#57: FILE: drivers/gpu/drm/xe/xe_user.c:8:
+
+

-:99: CHECK:LINE_SPACING: Please don't use multiple blank lines
#99: FILE: drivers/gpu/drm/xe/xe_user.c:50:
+
+

-:101: CHECK:LINE_SPACING: Please don't use multiple blank lines
#101: FILE: drivers/gpu/drm/xe/xe_user.c:52:
+
+

total: 0 errors, 1 warnings, 3 checks, 175 lines checked
a1fd14ab84d2 drm/xe: Add xe_gt_clock_interval_to_ns function
da0485cff781 drm/xe: Modify xe_exec_queue_update_run_ticks
ae75c2113d9a drm/xe: Handle xe_user creation and removal
-:65: CHECK:SPACING: No space is necessary after a cast
#65: FILE: drivers/gpu/drm/xe/xe_device.c:119:
+			uid = (unsigned int) cred->euid.val;

-:216: CHECK:LINE_SPACING: Please don't use multiple blank lines
#216: FILE: drivers/gpu/drm/xe/xe_user.c:142:
+
+

-:249: CHECK:LINE_SPACING: Please don't use multiple blank lines
#249: FILE: drivers/gpu/drm/xe/xe_user.h:11:
+
+

total: 0 errors, 0 warnings, 3 checks, 212 lines checked
d54ea215aa4b drm/xe: Implement xe_work_period_worker
-:117: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#117: FILE: drivers/gpu/drm/xe/xe_user.c:68:
+		schedule_delayed_work(&user->delay_work,
+				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));

-:150: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#150: FILE: drivers/gpu/drm/xe/xe_user.c:101:
+	if (xe_pm_runtime_get_if_active(xe)) {
+

-:152: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#152: FILE: drivers/gpu/drm/xe/xe_user.c:103:
+		list_for_each_entry(xef, &user->filelist, user_link) {
+

-:154: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#154: FILE: drivers/gpu/drm/xe/xe_user.c:105:
+			wait_var_event(&xef->exec_queue.pending_removal,
+			!atomic_read(&xef->exec_queue.pending_removal));

-:207: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#207: FILE: drivers/gpu/drm/xe/xe_user.c:241:
+		if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))

-:245: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#245: FILE: drivers/gpu/drm/xe/xe_user.c:277:
+			if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))

-:273: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#273: FILE: drivers/gpu/drm/xe/xe_user.h:35:
+	struct mutex lock;

total: 0 errors, 0 warnings, 7 checks, 243 lines checked
b40dc4d05d50 drm/xe: Add a Kconfig option for GPU work period
-:46: CHECK:LINE_SPACING: Please don't use multiple blank lines
#46: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:944:
 
+

total: 0 errors, 0 warnings, 1 checks, 72 lines checked
4a3f6df57b32 drm/xe: Handle xe_work_period destruction
2b915419bb39 Hack patch: Do not merge
-:33: WARNING:IF_1: Consider removing the #if 1 and its #endif
#33: FILE: drivers/gpu/drm/xe/xe_user.h:71:
+#if 1

-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:77: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#77: FILE: include/trace/gpu_work_period.h:15:
+TRACE_EVENT(gpu_work_period,
+

-:78: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#78: FILE: include/trace/gpu_work_period.h:16:
+	TP_PROTO(

-:88: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#88: FILE: include/trace/gpu_work_period.h:26:
+	TP_STRUCT__entry(

-:96: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#96: FILE: include/trace/gpu_work_period.h:34:
+	TP_fast_assign(

-:105: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#105: FILE: include/trace/gpu_work_period.h:43:
+	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
+		__entry->gpu_id,

total: 0 errors, 2 warnings, 5 checks, 90 lines checked


