Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5397C282EC
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 00:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D07B10E60B;
	Wed, 12 Mar 2025 00:24:05 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4DE10E60B;
 Wed, 12 Mar 2025 00:24:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_Add_GT_freq?=
 =?utf-8?q?uency_events_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 00:24:03 -0000
Message-ID: <174173904337.22246.426350424154023484@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: Add GT frequency events (rev5)
URL   : https://patchwork.freedesktop.org/series/144164/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a2730a941cd299378f8429409d07712632c35ef1
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Mar 11 17:14:08 2025 -0700

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
    v3: Review comments (Lucas) and use event counts instead of mask for
    active events.
    
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch eb17816e52395a403aa0b447aa0befa9d2f86dd5 drm-intel
a2730a941cd2 drm/xe/pmu: Add GT frequency events
-:116: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#116: FILE: drivers/gpu/drm/xe/xe_pmu.c:265:
+		    uint32_t val, uint32_t period)

-:183: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#183: FILE: drivers/gpu/drm/xe/xe_pmu.c:356:
+	uint32_t act_freq, cur_freq;

-:236: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#236: FILE: drivers/gpu/drm/xe/xe_pmu.c:409:
+	uint32_t id = config_to_event_id(event->attr.config);

-:270: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#270: FILE: drivers/gpu/drm/xe/xe_pmu.c:447:
+	uint32_t id = config_to_event_id(event->attr.config);

-:312: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#312: FILE: drivers/gpu/drm/xe/xe_pmu.c:564:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                        ^

-:312: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#312: FILE: drivers/gpu/drm/xe/xe_pmu.c:564:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                               ^

-:314: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#314: FILE: drivers/gpu/drm/xe/xe_pmu.c:566:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                        ^

-:314: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#314: FILE: drivers/gpu/drm/xe/xe_pmu.c:566:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                                  ^

total: 0 errors, 0 warnings, 8 checks, 349 lines checked


