Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDC8EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 12:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE2110E1F4;
	Mon, 26 Jun 2023 12:48:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7447510E1F4;
 Mon, 26 Jun 2023 12:48:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 71922A0BA8;
 Mon, 26 Jun 2023 12:48:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Date: Mon, 26 Jun 2023 12:48:39 -0000
Message-ID: <168778371946.5707.9654956045137551460@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_engine_scheduler_control_interface_=28rev2=29?=
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

Series: drm/xe: Add engine scheduler control interface (rev2)
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
commit 90b785b43af3b206e3182799938b44de03401110
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Jun 26 15:46:48 2023 +0530

    drm/xe: Add min/max cap for engine scheduler properties
    
    Add sysfs entries for the min, max, and defaults for each of
    engine scheduler controls for every hardware engine class.
    
    Non-elevated user IOCTLs to set these controls must be within
    the min-max ranges of the sysfs entries, elevated user can set
    these controls to any value. However, introduced compile time
    CONFIG min-max values which restricts elevated user to be in
    compile time min-max range if at all sysfs min/max are violated.
    
    Sysfs entries examples are,
    DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
    job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
    job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
    
    DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
    .defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
    job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
    
    V2 :
       - Restric min/max setting to #define default min/max for
         elevated user - Himal
       - Remove unrelated changes from patch - Niranjana
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch d3fc5af59c7c17ad1a0272c49dbff84534d9d606 drm-intel
55f9a9bf2 drm/xe: Add sysfs entries for engines under its GT
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
3ba8b0e5c drm/xe: Add sysfs for default engine scheduler properties
2086c31bb drm/xe: Add job timeout engine property to sysfs
2890ce043 drm/xe: Add timeslice duration engine property to sysfs
-:57: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#57: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:67:
+__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
+		timeslice_duration_store);

total: 0 errors, 0 warnings, 1 checks, 45 lines checked
fec2b0e63 drm/xe: Add sysfs for preempt reset timeout
90b785b43 drm/xe: Add min/max cap for engine scheduler properties
-:17: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#17: 
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us

-:43: WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
#43: FILE: drivers/gpu/drm/xe/Kconfig:90:
+        source "drivers/gpu/drm/xe/Kconfig.profile"

-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 690 lines checked


