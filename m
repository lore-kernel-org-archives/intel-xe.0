Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F4AC0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 05:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51A10E253;
	Fri, 24 Jan 2025 05:15:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAC610E253;
 Fri, 24 Jan 2025 05:15:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/6=5D_drm/xe/pmu=3A_Enable_PMU_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 05:15:05 -0000
Message-ID: <173769570504.3878903.4626885544551263181@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
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

Series: series starting with [CI,1/6] drm/xe/pmu: Enable PMU interface
URL   : https://patchwork.freedesktop.org/series/143907/
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
commit 01da1ae883c276af6f454141eb59a15bebf9913a
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jan 23 21:04:11 2025 -0800

    drm/xe/pmu: Add GT C6 events
    
    Provide a PMU interface for GT C6 residency counters. The interface is
    similar to the one available for i915, but gt is passed in the config
    when creating the event.
    
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
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5 drm-intel
f005b88911c4 drm/xe/pmu: Enable PMU interface
-:75: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#75: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 381 lines checked
33398eba3182 drm/xe/pmu: Assert max gt
ab3f69a9cec0 drm/xe/pmu: Extract xe_pmu_event_update()
c3a6069002d1 drm/xe/pmu: Get/put runtime pm on event init
5439024a4c10 drm/xe/pmu: Add attribute skeleton
-:71: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#71: FILE: drivers/gpu/drm/xe/xe_pmu.c:255:
+#define XE_EVENT_ATTR_SIMPLE(name_, v_, id_, unit_)			\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_UNIT(name_, v_, unit_)				\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr,	\
+			    &pmu_event_unit_ ##v_.attr.attr)

-:71: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name_' - possible side-effects?
#71: FILE: drivers/gpu/drm/xe/xe_pmu.c:255:
+#define XE_EVENT_ATTR_SIMPLE(name_, v_, id_, unit_)			\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_UNIT(name_, v_, unit_)				\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr,	\
+			    &pmu_event_unit_ ##v_.attr.attr)

-:71: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'v_' - possible side-effects?
#71: FILE: drivers/gpu/drm/xe/xe_pmu.c:255:
+#define XE_EVENT_ATTR_SIMPLE(name_, v_, id_, unit_)			\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_UNIT(name_, v_, unit_)				\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr,	\
+			    &pmu_event_unit_ ##v_.attr.attr)

-:71: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id_' - possible side-effects?
#71: FILE: drivers/gpu/drm/xe/xe_pmu.c:255:
+#define XE_EVENT_ATTR_SIMPLE(name_, v_, id_, unit_)			\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_UNIT(name_, v_, unit_)				\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr,	\
+			    &pmu_event_unit_ ##v_.attr.attr)

-:77: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#77: FILE: drivers/gpu/drm/xe/xe_pmu.c:261:
+#define XE_EVENT_ATTR_NOUNIT(name_, v_, id_)				\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'v_' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_pmu.c:261:
+#define XE_EVENT_ATTR_NOUNIT(name_, v_, id_)				\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id_' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_pmu.c:261:
+#define XE_EVENT_ATTR_NOUNIT(name_, v_, id_)				\
+	XE_EVENT_ATTR(name_, v_, id_)					\
+	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)

total: 2 errors, 0 warnings, 5 checks, 110 lines checked
01da1ae883c2 drm/xe/pmu: Add GT C6 events
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
	$ tail /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency*

-:87: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#87: FILE: drivers/gpu/drm/xe/xe_pmu.c:272:
+XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
                        ^

-:87: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#87: FILE: drivers/gpu/drm/xe/xe_pmu.c:272:
+XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
                           ^

total: 0 errors, 1 warnings, 2 checks, 68 lines checked


