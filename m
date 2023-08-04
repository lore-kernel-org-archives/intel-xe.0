Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8957C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 13:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B8410E70F;
	Fri,  4 Aug 2023 13:01:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 313F110E0B1;
 Fri,  4 Aug 2023 13:00:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 50D75AADF0;
 Fri,  4 Aug 2023 13:00:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Fri, 04 Aug 2023 13:00:45 -0000
Message-ID: <169115404532.2852.8494069877229366544@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230804130452.1402344-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230804130452.1402344-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_engine_scheduler_control_interface_=28rev13=29?=
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

Series: drm/xe: Add engine scheduler control interface (rev13)
URL   : https://patchwork.freedesktop.org/series/119392/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2fa1706fb5d3170d0422fd982598910f6a56358a
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Aug 4 18:34:52 2023 +0530

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
    
    V12:
       - Rebase
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
    
    Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch f16c04291100aa92caddd4d09e17b56bf7f4833c drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


