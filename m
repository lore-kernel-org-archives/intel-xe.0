Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A255C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 19:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6F10E045;
	Mon, 31 Jul 2023 19:13:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEED410E045;
 Mon, 31 Jul 2023 19:13:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AB371A882E;
 Mon, 31 Jul 2023 19:13:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 31 Jul 2023 19:13:42 -0000
Message-ID: <169083082269.10566.14488299243338862081@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_engine_scheduler_control_interface_=28rev11=29?=
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

Series: drm/xe: Add engine scheduler control interface (rev11)
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
commit 673b172c8cbd99bfeb2e8ced9d5d73b1fdda49db
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Aug 1 00:47:42 2023 +0530

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
    
    V11:
       - Make engine_get_prop_minmax and enforce_sched_limit static - Matt
       - use enum in place of string in engine_get_prop_minmax - Matt
       - no need to use enforce_sched_limit or no need to filter min/max
         per user type in sysfs - Matt
    V10:
       - Add kernel doc for non-static func
       - Make helper to get min/max for range validation - Matt
       - Filter min/max per user type
    V9 :
       - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
    V8 :
       - fix enforce_sched_limit and avoid code duplication - Niranjana
       - Make sure min < max - Niranjana
    V7 :
       - Rebase to replace hw engine with eclass interface
       - return EINVAL in place of EPERM
       - Use some APIs to avoid code duplication
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
+ /mt/dim checkpatch d74e8f8407bc922b04ba50e8f4e888bedb31330a drm-intel
1a3a7efad drm/xe: Add sysfs entries for engines under its GT
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 161 lines checked
ba404e306 drm/xe: Add sysfs for default engine scheduler properties
-:37: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#37: 
   - Scheduling props should apply per class engine not per hardware engine - Matt

total: 0 errors, 1 warnings, 0 checks, 280 lines checked
80bd9ed46 drm/xe: Add job timeout engine property to sysfs
886874d34 drm/xe: Add timeslice duration engine property to sysfs
844c6d063 drm/xe: Add sysfs for preempt reset timeout
673b172c8 drm/xe: Add min/max cap for engine scheduler properties
-:17: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#17: 
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us

-:76: WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
#76: FILE: drivers/gpu/drm/xe/Kconfig:90:
+	source "drivers/gpu/drm/xe/Kconfig.profile"

-:79: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#79: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 651 lines checked


