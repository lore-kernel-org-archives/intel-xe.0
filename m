Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18156C021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 16:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C1410E9AB;
	Thu, 20 Feb 2025 16:24:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D6F10E9AB;
 Thu, 20 Feb 2025 16:24:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_perf/x86/rapl=3A_Fix_PP1_?=
 =?utf-8?q?event_for_Intel_Meteor/Lunar_Lake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 16:24:14 -0000
Message-ID: <174006865439.221004.12530674225854072535@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220153857.2593704-6-lucas.demarchi@intel.com>
In-Reply-To: <20250220153857.2593704-6-lucas.demarchi@intel.com>
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

Series: perf/x86/rapl: Fix PP1 event for Intel Meteor/Lunar Lake
URL   : https://patchwork.freedesktop.org/series/145183/
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
commit 98b61a535c00820e1699e18a8f0dd9ec25a39931
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Feb 20 07:36:30 2025 -0800

    perf/x86/rapl: Fix PP1 event for Intel Meteor/Lunar Lake
    
    On some boots the read of MSR_PP1_ENERGY_STATUS msr returns 0, causing
    perf_msr_probe() to make the power/events/energy-gpu event non-visible.
    When that happens, the msr always read 0 until the graphics module (i915
    for Meteor Lake, xe for Lunar Lake) is loaded. Then it starts returning
    something different and re-loading the rapl module "fixes" it.
    
    This is tested on the following platforms with the fail rates before
    this patch:
    
            Alder Lake S    0/20
            Arrow Lake H    0/20
            Lunar Lake M    8/20
            Meteor Lake U   6/20
            Raptor Lake P   4/20
            Raptor Lake S   0/20
    
    For those platforms failing, use a separate msr list with .no_check
    set so it doesn't check the runtime value to create the event - it will
    just return 0 until the i915/xe module initializes the GPU.
    
    The issue https://github.com/ulissesf/qmassa/issues/4 is workarounded by
    reading the MSR directly since it works after xe is loaded, but the
    issue with not having the perf event is still there.
    
    Closes: https://github.com/ulissesf/qmassa/issues/4
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4241
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com
+ /mt/dim checkpatch 8554d5b7b4fded481a85ab11d75eeb97443450e2 drm-intel
98b61a535c00 perf/x86/rapl: Fix PP1 event for Intel Meteor/Lunar Lake
-:32: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Lucas De Marchi <lucas.demarchi@intel.com'
#32: 
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com

-:43: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#43: FILE: arch/x86/events/rapl.c:592:
+	[PERF_RAPL_PP0]  = { MSR_PP0_ENERGY_STATUS,      &rapl_events_cores_group, test_msr, false, RAPL_MSR_MASK },

-:44: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#44: FILE: arch/x86/events/rapl.c:593:
+	[PERF_RAPL_PKG]  = { MSR_PKG_ENERGY_STATUS,      &rapl_events_pkg_group,   test_msr, false, RAPL_MSR_MASK },

-:45: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#45: FILE: arch/x86/events/rapl.c:594:
+	[PERF_RAPL_RAM]  = { MSR_DRAM_ENERGY_STATUS,     &rapl_events_ram_group,   test_msr, false, RAPL_MSR_MASK },

-:46: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#46: FILE: arch/x86/events/rapl.c:595:
+	[PERF_RAPL_PP1]  = { MSR_PP1_ENERGY_STATUS,      &rapl_events_gpu_group,   test_msr, true,  RAPL_MSR_MASK },

-:47: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#47: FILE: arch/x86/events/rapl.c:596:
+	[PERF_RAPL_PSYS] = { MSR_PLATFORM_ENERGY_STATUS, &rapl_events_psys_group,  test_msr, false, RAPL_MSR_MASK },

-:87: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Lucas De Marchi <lucas.demarchi@intel.com>'

total: 2 errors, 5 warnings, 0 checks, 47 lines checked


