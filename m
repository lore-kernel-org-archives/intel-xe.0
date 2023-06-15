Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D1AEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0565110E501;
	Thu, 15 Jun 2023 14:17:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6EC5010E501;
 Thu, 15 Jun 2023 14:17:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6B4C8AA3D8;
 Thu, 15 Jun 2023 14:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Thu, 15 Jun 2023 14:17:00 -0000
Message-ID: <168683862043.10724.2336214500021489320@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_engine_scheduler_control_interface?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Add engine scheduler control interface
URL   : https://patchwork.freedesktop.org/series/119392/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e966556bbabe3e96d6c1dbc049be18d88c435ba4
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Jun 15 19:49:33 2023 +0530

    drm/xe: Add min/max cap for engine scheduler properties
    
    Add sysfs entries for the min, max, and defaults for each of
    engine scheduler controls for every hardware engine class.
    
    Non-elevated user IOCTLs to set these controls must be within
    the min-max ranges of the sysfs entries, elevated user can set
    these controls to any value.
    
    Introducing compile time CONFIG min-max values which restricts elevated
    user to be in compile time min-max range if at all sysfs min/max
    are violated.
    
    Sysfs entries examples are,
    DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
    job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
    job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
    
    DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
    .defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
    job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 6d2981d42cd891965094ec7d173203520cfa36f7 drm-intel
3938e4f64 drm/xe: Add sysfs entries for engines under its GT
-:46: WARNING:CONST_STRUCT: struct kobj_type should normally be const
#46: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:30:
+static struct kobj_type kobj_xe_engine_type = {

-:93: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hwe->class == XE_ENGINE_CLASS_OTHER'
#93: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:77:
+		if ((hwe->class == XE_ENGINE_CLASS_OTHER) ||
+		    (hwe->class == XE_ENGINE_CLASS_MAX))

-:93: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hwe->class == XE_ENGINE_CLASS_MAX'
#93: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:77:
+		if ((hwe->class == XE_ENGINE_CLASS_OTHER) ||
+		    (hwe->class == XE_ENGINE_CLASS_MAX))

total: 0 errors, 1 warnings, 2 checks, 120 lines checked
3fb11cb89 drm/xe: Add sysfs for default engine scheduler properties
-:52: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#52: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:36:
+static ssize_t job_timeout_default(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)

total: 0 errors, 0 warnings, 1 checks, 204 lines checked
bd6f915bc drm/xe: Add job timeout engine property to sysfs
-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:36:
+static ssize_t job_timeout_store(struct kobject *kobj,
+		struct kobj_attribute *attr,

-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:56:
+static ssize_t job_timeout_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)

total: 0 errors, 0 warnings, 2 checks, 49 lines checked
c2685e795 drm/xe: Add timeslice duration engine property to sysfs
-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:36:
+static ssize_t timeslice_duration_store(struct kobject *kobj,
+		struct kobj_attribute *attr,

-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:56:
+static ssize_t timeslice_duration_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)

-:54: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#54: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:65:
+__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
+timeslice_duration_store);

total: 0 errors, 0 warnings, 3 checks, 50 lines checked
7b81a3a37 drm/xe: Add sysfs for preempt reset timeout
e966556bb drm/xe: Add min/max cap for engine scheduler properties
-:19: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#19: 
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us

-:40: WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
#40: FILE: drivers/gpu/drm/xe/Kconfig:90:
+        source "drivers/gpu/drm/xe/Kconfig.profile"

-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 646 lines checked


