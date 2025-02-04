Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE818C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 22:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8904510E119;
	Tue,  4 Feb 2025 22:41:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D624A10E119;
 Tue,  4 Feb 2025 22:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_Add_GT_freq?=
 =?utf-8?q?uency_events_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 22:41:37 -0000
Message-ID: <173870889787.1106250.12206444902474049561@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: Add GT frequency events (rev2)
URL   : https://patchwork.freedesktop.org/series/144164/
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
commit 4fc896c0f9fd708413428fc44aba487e02146c81
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Feb 4 10:09:05 2025 -0800

    drm/xe/pmu: Add GT frequency events
    
    Define PMU events for GT frequency (actual and requested). This is
    a port from the i915 driver implementation, where an internal timer
    is used to aggregate GT frequencies over certain fixed interval.
    Following PMU events are being added-
    
      xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
      xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
    
    Standard perf commands can be used to monitor GT frequency-
      $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
    
         1.001175175                700 M    xe/gt-requested-frequency,gt=0/
         2.005891881                703 M    xe/gt-requested-frequency,gt=0/
         3.007318169                700 M    xe/gt-requested-frequency,gt=0/
    
    Actual frequencies will be reported as 0 when GT is suspended.
    
    v2: Use locks while storing samples, keep track of multiple clients (Lucas)
    
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch ac87843456aa558a665df43aa62c03eaf7701bcb drm-intel
9707d54e4a47 drm/xe/pmu: Add event tracking
4fc896c0f9fd drm/xe/pmu: Add GT frequency events
-:110: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'event' may be better as '(event)' to avoid precedence issues
#110: FILE: drivers/gpu/drm/xe/xe_pmu.c:196:
+#define CONFIG_EVENT_ENABLED(config, event) \
+	(FIELD_GET(XE_PMU_EVENT_ID_MASK, config) & event)

-:113: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'config' - possible side-effects?
#113: FILE: drivers/gpu/drm/xe/xe_pmu.c:199:
+#define CONFIG_EVENT_ENABLED_GT(config, event, gt) \
+	(CONFIG_EVENT_ENABLED(config, event) && \
+	(FIELD_GET(XE_PMU_EVENT_GT_MASK, config) == gt))

-:113: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'gt' may be better as '(gt)' to avoid precedence issues
#113: FILE: drivers/gpu/drm/xe/xe_pmu.c:199:
+#define CONFIG_EVENT_ENABLED_GT(config, event, gt) \
+	(CONFIG_EVENT_ENABLED(config, event) && \
+	(FIELD_GET(XE_PMU_EVENT_GT_MASK, config) == gt))

-:223: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#223: FILE: drivers/gpu/drm/xe/xe_pmu.c:433:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                        ^

-:223: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#223: FILE: drivers/gpu/drm/xe/xe_pmu.c:433:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                               ^

-:225: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#225: FILE: drivers/gpu/drm/xe/xe_pmu.c:435:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                        ^

-:225: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#225: FILE: drivers/gpu/drm/xe/xe_pmu.c:435:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                                  ^

total: 0 errors, 0 warnings, 7 checks, 247 lines checked


