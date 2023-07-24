Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F98C001DE
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 09:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD65E10E1CC;
	Mon, 24 Jul 2023 09:43:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06FE910E1CC;
 Mon, 24 Jul 2023 09:43:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 03802AA01E;
 Mon, 24 Jul 2023 09:43:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 24 Jul 2023 09:43:53 -0000
Message-ID: <169019183301.30101.7995121934438577728@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230724094733.720266-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230724094733.720266-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_engine_scheduler_control_interface_=28rev6=29?=
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

Series: drm/xe: Add engine scheduler control interface (rev6)
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
commit feb439aeb59d7b104b0a1ce8a8bb2b754818f781
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Jul 24 15:17:33 2023 +0530

    drm/xe: Add min/max cap for engine scheduler properties
    
    Add sysfs entries for the min, max, and defaults for each of
    engine scheduler controls for every hardware engine class.
    
    Non-elevated user IOCTLs to set these controls must be within
    the min-max ranges of the sysfs entries, elevated user can set
    these controls to any value. However, introduced compile time
    CONFIG min-max values which restricts elevated user to be in
    compile time min-max range if at all sysfs min/max are violated.
    
    Sysfs entries examples are,
    DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
    job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
    job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
    
    DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
    .defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
    job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
    
    V6 :
       - Rebase changes to reflect per engine class props interface - MattB
       - Use #if ENABLED - MattB
       - Remove MAX_SCHED_TIMEOUT check as range validation is enough
    V5 :
       - Rebase to resolve conflicts - CI
    V4 :
       - Rebase
       - Update commit to reflect tile addition
       - Use XE_HW macro directly as they are already filtered
         for CONFIG checks - Niranjana
       - Add CONFIG for enable/disable min/max limitation
         on elevated user. Default is enable - Matt/Joonas
    V3 :
       - Resolve CI hooks warning for kernel-doc
    V2 :
       - Restric min/max setting to #define default min/max for
         elevated user - Himal
       - Remove unrelated changes from patch - Niranjana
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch f7e68e5db4417dde38c45cc8aedd7cb2b18fa678 drm-intel
e11843a3a drm/xe: Add sysfs entries for engines under its GT
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 150 lines checked
937e239a2 drm/xe: Add sysfs for default engine scheduler properties
-:25: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#25: 
   - Scheduling props should apply per class engine not per hardware engine - Matt

total: 0 errors, 1 warnings, 0 checks, 247 lines checked
12c6c0eed drm/xe: Add job timeout engine property to sysfs
73e3ee9f2 drm/xe: Add timeslice duration engine property to sysfs
-:53: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#53: FILE: drivers/gpu/drm/xe/xe_engine_class_sysfs.c:105:
+static ssize_t timeslice_duration_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)

total: 0 errors, 0 warnings, 1 checks, 45 lines checked
3b4d04a1b drm/xe: Add sysfs for preempt reset timeout
feb439aeb drm/xe: Add min/max cap for engine scheduler properties
-:17: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#17: 
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us

-:58: WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
#58: FILE: drivers/gpu/drm/xe/Kconfig:90:
+	source "drivers/gpu/drm/xe/Kconfig.profile"

-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

-:401: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#401: FILE: drivers/gpu/drm/xe/xe_engine_class_sysfs.c:269:
+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
+		struct kobj_attribute *attr,

total: 0 errors, 3 warnings, 1 checks, 632 lines checked


