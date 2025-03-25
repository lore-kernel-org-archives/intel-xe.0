Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0071AC36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 00:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A5410E4F5;
	Tue, 25 Mar 2025 00:29:34 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386D110E4F4;
 Tue, 25 Mar 2025 00:29:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_Add_GT_freq?=
 =?utf-8?q?uency_events_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 00:29:33 -0000
Message-ID: <174286257323.75924.4656378705897663726@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: Add GT frequency events (rev6)
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
commit 85ffe99829e1946ba85c454509a2c2dead375da6
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Mon Mar 24 16:24:02 2025 -0700

    drm/xe/pmu: Add GT frequency events
    
    Define PMU events for GT frequency (actual and requested). The
    instantaneous values for these frequencies will be displayed.
    
    Following PMU events are being added:
      xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
      xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
    
    Standard perf commands can be used to monitor GT frequency:
      $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
    
      1.001229762       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
      2.006175406       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
    
    v2: Use locks while storing/reading samples, keep track of multiple
    clients (Lucas) and other general cleanup.
    v3: Review comments (Lucas) and use event counts instead of mask for
    active events.
    v4: Add freq events to event_param_valid method (Riana)
    v5: Use instantaneous values instead of aggregating (Lucas)
    
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch d59baa9838223beffa7bde82f8cd29e743f4b410 drm-intel
85ffe99829e1 drm/xe/pmu: Add GT frequency events
-:94: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#94: FILE: drivers/gpu/drm/xe/xe_pmu.c:289:
+	uint32_t id = config_to_event_id(event->attr.config);

-:122: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#122: FILE: drivers/gpu/drm/xe/xe_pmu.c:449:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                        ^

-:122: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#122: FILE: drivers/gpu/drm/xe/xe_pmu.c:449:
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
                               ^

-:124: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#124: FILE: drivers/gpu/drm/xe/xe_pmu.c:451:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                        ^

-:124: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#124: FILE: drivers/gpu/drm/xe/xe_pmu.c:451:
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
                                  ^

total: 0 errors, 0 warnings, 5 checks, 106 lines checked


