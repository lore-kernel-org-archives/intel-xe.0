Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3A4C02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 10:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B9710E0B7;
	Wed, 22 Jan 2025 10:44:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FE410E0B7;
 Wed, 22 Jan 2025 10:44:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_PMU_interfa?=
 =?utf-8?q?ce_for_Xe_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 10:44:56 -0000
Message-ID: <173754269627.3027311.7640333372145611748@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122062341.1100173-1-lucas.demarchi@intel.com>
In-Reply-To: <20250122062341.1100173-1-lucas.demarchi@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev14)
URL   : https://patchwork.freedesktop.org/series/139121/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5d5eb696916476427a03a6224af7d4687d63c366
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Jan 21 22:23:41 2025 -0800

    drm/xe/pmu: Add GT C6 events
    
    Provide a PMU interface for GT C6 residency counters. The implementation
    is ported over from the i915 PMU code. Residency is provided in units of
    ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
    
    Sample usage and output:
    
            $ perf list | grep gt-c6
              xe_0000_00_02.0/gt-c6-residency/                   [Kernel PMU event]
    
            $ tail /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency*
            ==> /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency <==
            event=0x01
    
            ==> /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency.unit <==
            ms
    
            $ perf stat -e xe_0000_00_02.0/gt-c6-residency,gt=0/ -I1000
            #           time             counts unit events
                 1.001196056              1,001 ms   xe_0000_00_02.0/gt-c6-residency,gt=0/
                 2.005216219              1,003 ms   xe_0000_00_02.0/gt-c6-residency,gt=0/
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 71b6a6ef0f37fe2d812dc2bd6d4b0d2d52096d07 drm-intel
5708cebfe0a0 perf/core: Add PMU_EVENT_ATTR_ID_STRING
-:24: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#24: FILE: include/linux/perf_event.h:1926:
+#define PMU_EVENT_ATTR_ID_STRING(_name, _var, _id, _str)		    \
 static struct perf_pmu_events_attr _var = {				    \
 	.attr		= __ATTR(_name, 0444, perf_event_sysfs_show, NULL), \
+	.id		= _id,						    \
 	.event_str	= _str,						    \
 };

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
5825130414cd drm/xe/pmu: Enable PMU interface
-:75: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#75: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 401 lines checked
ce87defa84e2 drm/xe/pmu: Assert max gt
1c0c5a2cedaf drm/xe/pmu: Extract xe_pmu_event_update()
aa39d8ebaf15 drm/xe/pmu: Add attribute skeleton
-:65: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#65: FILE: drivers/gpu/drm/xe/xe_pmu.c:248:
+#define XE_EVENT_ATTR(name_, v_, id_, unit_)					\
+	PMU_EVENT_ATTR(name_, pmu_event_ ## v_, id_, event_attr_show)		\
+	PMU_EVENT_ATTR_ID_STRING(name_.unit, pmu_event_unit_ ## v_, id_, unit_)

-:65: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name_' - possible side-effects?
#65: FILE: drivers/gpu/drm/xe/xe_pmu.c:248:
+#define XE_EVENT_ATTR(name_, v_, id_, unit_)					\
+	PMU_EVENT_ATTR(name_, pmu_event_ ## v_, id_, event_attr_show)		\
+	PMU_EVENT_ATTR_ID_STRING(name_.unit, pmu_event_unit_ ## v_, id_, unit_)

-:65: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id_' - possible side-effects?
#65: FILE: drivers/gpu/drm/xe/xe_pmu.c:248:
+#define XE_EVENT_ATTR(name_, v_, id_, unit_)					\
+	PMU_EVENT_ATTR(name_, pmu_event_ ## v_, id_, event_attr_show)		\
+	PMU_EVENT_ATTR_ID_STRING(name_.unit, pmu_event_unit_ ## v_, id_, unit_)

-:69: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#69: FILE: drivers/gpu/drm/xe/xe_pmu.c:252:
+XE_EVENT_ATTR(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms")
                 ^

-:69: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#69: FILE: drivers/gpu/drm/xe/xe_pmu.c:252:
+XE_EVENT_ATTR(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms")
                    ^

total: 1 errors, 0 warnings, 4 checks, 89 lines checked
033ff5bd99da drm/xe/pmu: Get/put runtime pm on event init
5d5eb6969164 drm/xe/pmu: Add GT C6 events
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
	$ tail /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency*

total: 0 errors, 1 warnings, 0 checks, 35 lines checked


