Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CBCCAC5A7
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 12:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062E210E8F8;
	Thu, 25 Sep 2025 12:27:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FEA10E8F8;
 Thu, 25 Sep 2025 12:27:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_GPU_work_period_suppo?=
 =?utf-8?q?rt_for_Xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Sep 2025 12:27:00 -0000
Message-ID: <175880322085.366377.6378716046175317490@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
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

Series: Add GPU work period support for Xe driver
URL   : https://patchwork.freedesktop.org/series/155039/
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
commit 53d310324da6feee4fe665b7c08797cc4b474749
Author: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Date:   Thu Sep 25 11:46:58 2025 +0000

    drm/xe: Handle xe_work_period destruction
    
    This adds the xe_work_period destruction procedure.
    We iterate over all entries in the xe::work_period::users
    xarray and cancel any pending delayed work. Then destroy
    the xarray itself.
    
    Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
+ /mt/dim checkpatch 7644974e648c270a56954b0344b1d0330698e1fa drm-intel
8968b14a78eb drm/xe: Add a new xe_user structure
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 148 lines checked
b1738739ca5e drm/xe: Add xe_gt_clock_interval_to_ns function
d3036ceba97d drm/xe: Add a trace point for GPU work period
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
d16b7945db6f drm/xe: Modify xe_exec_queue_update_run_ticks
1dd4d26bd60f drm/xe: Handle xe_user creation and removal
-:69: CHECK:SPACING: No space is necessary after a cast
#69: FILE: drivers/gpu/drm/xe/xe_device.c:121:
+			uid = (unsigned int) cred->euid.val;

-:197: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#197: FILE: drivers/gpu/drm/xe/xe_user.c:87:
+int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid)

-:197: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#197: FILE: drivers/gpu/drm/xe/xe_user.c:87:
+int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid)

-:199: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#199: FILE: drivers/gpu/drm/xe/xe_user.c:89:
+	struct xe_user* user = NULL;

-:219: CHECK:LINE_SPACING: Please don't use multiple blank lines
#219: FILE: drivers/gpu/drm/xe/xe_user.c:109:
+
+

-:255: CHECK:LINE_SPACING: Please don't use multiple blank lines
#255: FILE: drivers/gpu/drm/xe/xe_user.h:16:
+
+

-:276: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#276: FILE: drivers/gpu/drm/xe/xe_user.h:73:
+int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid);

-:276: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#276: FILE: drivers/gpu/drm/xe/xe_user.h:73:
+int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid);

total: 5 errors, 0 warnings, 3 checks, 218 lines checked
6796cb7f5ea4 drm/xe: Implement xe_work_period_worker
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

-:232: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#232: FILE: drivers/gpu/drm/xe/xe_user.c:216:
+void xe_user_cancel_workers(struct xe_device* xe)

-:247: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#247: FILE: drivers/gpu/drm/xe/xe_user.c:231:
+void xe_user_resume_workers(struct xe_device* xe)

-:256: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#256: FILE: drivers/gpu/drm/xe/xe_user.c:240:
+			if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))

-:288: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#288: FILE: drivers/gpu/drm/xe/xe_user.h:39:
+	struct mutex lock;

-:305: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#305: FILE: drivers/gpu/drm/xe/xe_user.h:77:
+void xe_user_cancel_workers(struct xe_device* xe);

-:307: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#307: FILE: drivers/gpu/drm/xe/xe_user.h:79:
+void xe_user_resume_workers(struct xe_device* xe);

total: 4 errors, 0 warnings, 7 checks, 258 lines checked
aa9ad33380ef drm/xe: Add a Kconfig option for GPU work period
-:46: CHECK:LINE_SPACING: Please don't use multiple blank lines
#46: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:918:
 
+

-:75: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#75: FILE: drivers/gpu/drm/xe/xe_user.h:88:
+int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid)

-:75: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#75: FILE: drivers/gpu/drm/xe/xe_user.h:88:
+int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid)

-:84: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#84: FILE: drivers/gpu/drm/xe/xe_user.h:97:
+void xe_user_cancel_workers(struct xe_device* xe)

-:88: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#88: FILE: drivers/gpu/drm/xe/xe_user.h:101:
+void xe_user_resume_workers(struct xe_device* xe)

total: 4 errors, 0 warnings, 1 checks, 87 lines checked
53d310324da6 drm/xe: Handle xe_work_period destruction
-:30: CHECK:LINE_SPACING: Please don't use multiple blank lines
#30: FILE: drivers/gpu/drm/xe/xe_device.c:439:
 
+

total: 0 errors, 0 warnings, 1 checks, 23 lines checked


