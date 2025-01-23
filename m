Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3E4C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 04:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8FD10E0D0;
	Thu, 23 Jan 2025 04:29:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8AC10E0D0;
 Thu, 23 Jan 2025 04:29:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_PMU_interfa?=
 =?utf-8?q?ce_for_Xe_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 04:29:42 -0000
Message-ID: <173760658243.3368941.14772706985898766368@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123041923.1892837-1-lucas.demarchi@intel.com>
In-Reply-To: <20250123041923.1892837-1-lucas.demarchi@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev15)
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
commit 00700d09d75562251cd9a37cc6602209f56a9a39
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Jan 22 20:19:23 2025 -0800

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
+ /mt/dim checkpatch db7cf8d52a41001ea2780cf834fed3dc490343d2 drm-intel
d4a79374a3ca drm/xe/pmu: Enable PMU interface
-:75: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#75: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 381 lines checked
ee337a2ffa5b drm/xe/pmu: Assert max gt
203dc6e52c8a drm/xe/pmu: Extract xe_pmu_event_update()
d7dec9b7f29b drm/xe/pmu: Add attribute skeleton
-:52: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name_' - possible side-effects?
#52: FILE: drivers/gpu/drm/xe/xe_pmu.c:225:
+#define XE_EVENT_ATTR(name_, v_, id_, unit_)				\
+	PMU_EVENT_ATTR(name_, pmu_event_ ## v_, id_, event_attr_show)	\
+	PMU_EVENT_ATTR_STRING(name_.unit, pmu_event_unit_ ## v_, unit_)	\
+	static struct attribute *pmu_attr_ ##v_[] = {			\
+		&pmu_event_ ##v_.attr.attr,				\
+		&pmu_event_unit_ ##v_.attr.attr,			\
+		NULL							\
+	};								\
+	static umode_t is_visible_##v_(struct kobject *kobj,		\
+				       struct attribute *attr, int idx) \
+	{								\
+		struct perf_pmu_events_attr *pmu_attr;			\
+		struct xe_pmu *pmu;					\
+									\
+		pmu_attr = container_of(attr, typeof(*pmu_attr), attr.attr); \
+		pmu = container_of(dev_get_drvdata(kobj_to_dev(kobj)),	\
+				   typeof(*pmu), base);			\
+									\
+		return event_supported(pmu, 0, id_) ? attr->mode : 0;	\
+	}								\
+	static const struct attribute_group pmu_group_ ##v_ = {		\
+		.name = "events",					\
+		.attrs = pmu_attr_ ## v_,				\
+		.is_visible = is_visible_ ## v_,			\
+	}

-:52: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id_' - possible side-effects?
#52: FILE: drivers/gpu/drm/xe/xe_pmu.c:225:
+#define XE_EVENT_ATTR(name_, v_, id_, unit_)				\
+	PMU_EVENT_ATTR(name_, pmu_event_ ## v_, id_, event_attr_show)	\
+	PMU_EVENT_ATTR_STRING(name_.unit, pmu_event_unit_ ## v_, unit_)	\
+	static struct attribute *pmu_attr_ ##v_[] = {			\
+		&pmu_event_ ##v_.attr.attr,				\
+		&pmu_event_unit_ ##v_.attr.attr,			\
+		NULL							\
+	};								\
+	static umode_t is_visible_##v_(struct kobject *kobj,		\
+				       struct attribute *attr, int idx) \
+	{								\
+		struct perf_pmu_events_attr *pmu_attr;			\
+		struct xe_pmu *pmu;					\
+									\
+		pmu_attr = container_of(attr, typeof(*pmu_attr), attr.attr); \
+		pmu = container_of(dev_get_drvdata(kobj_to_dev(kobj)),	\
+				   typeof(*pmu), base);			\
+									\
+		return event_supported(pmu, 0, id_) ? attr->mode : 0;	\
+	}								\
+	static const struct attribute_group pmu_group_ ##v_ = {		\
+		.name = "events",					\
+		.attrs = pmu_attr_ ## v_,				\
+		.is_visible = is_visible_ ## v_,			\
+	}

-:78: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#78: FILE: drivers/gpu/drm/xe/xe_pmu.c:251:
+XE_EVENT_ATTR(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
                 ^

-:78: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#78: FILE: drivers/gpu/drm/xe/xe_pmu.c:251:
+XE_EVENT_ATTR(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
                    ^

total: 0 errors, 0 warnings, 4 checks, 107 lines checked
6fe58c0bd499 drm/xe/pmu: Get/put runtime pm on event init
00700d09d755 drm/xe/pmu: Add GT C6 events
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
	$ tail /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency*

total: 0 errors, 1 warnings, 0 checks, 35 lines checked


