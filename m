Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1319DC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 00:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F8510E34E;
	Thu, 13 Feb 2025 00:25:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E257510E34E;
 Thu, 13 Feb 2025 00:25:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_Add_GT_freq?=
 =?utf-8?q?uency_events_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 00:25:05 -0000
Message-ID: <173940630591.1473281.1588029505177512523@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: Add GT frequency events (rev3)
URL   : https://patchwork.freedesktop.org/series/144164/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e14dd9072e36f3e259d49ebd375c9452d8c1e47
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Feb 12 16:02:20 2025 -0800

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
    
    Actual frequencies will be reported as 0 when GT is in C6.
    
    v2: Use locks while storing/reading samples, keep track of multiple
    clients (Lucas) and other general cleanup.
    
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch fd03884f35d18372b0f7abb2fd33c55cee599bc3 drm-intel
4e14dd9072e3 drm/xe/pmu: Add GT frequency events
-:122: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#122: FILE: drivers/gpu/drm/xe/xe_pmu.c:148:
+		    uint32_t val, uint32_t period)

-:204: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#204: FILE: drivers/gpu/drm/xe/xe_pmu.c:244:
+	uint32_t act_freq, cur_freq;

-:208: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#208: FILE: drivers/gpu/drm/xe/xe_pmu.c:248:
+	if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
+

-:212: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#212: FILE: drivers/gpu/drm/xe/xe_pmu.c:252:
+		xe_store_pmu_sample(pmu, gt->info.id, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
+				 act_freq, period_ns / NSEC_PER_USEC);

-:219: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#219: FILE: drivers/gpu/drm/xe/xe_pmu.c:259:
+			xe_store_pmu_sample(pmu, gt->info.id, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
+					 cur_freq, period_ns / NSEC_PER_USEC);

-:254: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#254: FILE: drivers/gpu/drm/xe/xe_pmu.c:294:
+	uint32_t id = config_to_event_id(event->attr.config);

-:288: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#288: FILE: drivers/gpu/drm/xe/xe_pmu.c:332:
+	uint32_t id = config_to_event_id(event->attr.config);

-:289: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#289: FILE: drivers/gpu/drm/xe/xe_pmu.c:333:
+	uint32_t gt_id = config_to_gt_id(event->attr.config);

-:306: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#306: FILE: drivers/gpu/drm/xe/xe_pmu.c:349:
+	uint32_t id = config_to_event_id(event->attr.config);

-:326: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#326: FILE: drivers/gpu/drm/xe/xe_pmu.c:367:
+	uint32_t id = config_to_event_id(event->attr.config);

-:340: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#340: FILE: drivers/gpu/drm/xe/xe_pmu.c:448:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                        ^

-:340: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#340: FILE: drivers/gpu/drm/xe/xe_pmu.c:448:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                               ^

-:342: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#342: FILE: drivers/gpu/drm/xe/xe_pmu.c:450:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                        ^

-:342: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#342: FILE: drivers/gpu/drm/xe/xe_pmu.c:450:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                                  ^

total: 0 errors, 0 warnings, 14 checks, 380 lines checked


