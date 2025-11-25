Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A98D0EE18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 20:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2603710E453;
	Tue, 25 Nov 2025 20:07:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13CB10E453;
 Tue, 25 Nov 2025 20:07:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_switc?=
 =?utf-8?q?h_from_intel=5Fwakeref=5Ft_to_struct_ref=5Ftracker_*_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Nov 2025 20:07:45 -0000
Message-ID: <176410126591.27008.18442636304717293487@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1764076995.git.jani.nikula@intel.com>
In-Reply-To: <cover.1764076995.git.jani.nikula@intel.com>
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

Series: drm/i915/display: switch from intel_wakeref_t to struct ref_tracker * (rev2)
URL   : https://patchwork.freedesktop.org/series/157907/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af7518077349632a17ab35612a175f80ffbb2799
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Nov 25 15:24:43 2025 +0200

    drm/{i915,xe}/display: drop intel_wakeref.h usage
    
    Drop the display dependency on intel_wakeref.h header. The contract in
    the parent interface is that -ENOENT means there's no tracking. It
    doesn't actually require us to use a shared macro for it. Duplicate the
    macro in the few places that need this instead of inlining, primarily
    for documentation reasons.
    
    This allows us to remove the xe compat intel_wakeref.h header.
    
    v2: Define INTEL_WAKEREF_DEF in intel_display_power.h
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8052b0ba2e97387477c22ba816fabca9a4728aae drm-intel
bb4089bb7d89 drm/i915/pps: drop wakeref parameter from with_intel_pps_lock()
-:266: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dp' - possible side-effects?
#266: FILE: drivers/gpu/drm/i915/display/intel_pps.h:23:
+#define __with_intel_pps_lock(dp, wf) \
+	for (intel_wakeref_t (wf) = intel_pps_lock(dp); (wf); (wf) = intel_pps_unlock((dp), (wf)))

-:266: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'wf' - possible side-effects?
#266: FILE: drivers/gpu/drm/i915/display/intel_pps.h:23:
+#define __with_intel_pps_lock(dp, wf) \
+	for (intel_wakeref_t (wf) = intel_pps_lock(dp); (wf); (wf) = intel_pps_unlock((dp), (wf)))

total: 0 errors, 0 warnings, 2 checks, 228 lines checked
84caf63709af drm/i915/pps: convert intel_wakeref_t to struct ref_tracker *
-:78: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#78: FILE: drivers/gpu/drm/i915/display/intel_pps.h:23:
+	for (struct ref_tracker *(wf) = intel_pps_lock(dp); (wf); (wf) = intel_pps_unlock((dp), (wf)))

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
df99bfcd6101 drm/i915/power: drop wakeref parameter from with_intel_display_power*()
-:112: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#112: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:300:
+#define __with_intel_display_power(display, domain, wf) \
+	for (intel_wakeref_t (wf) = intel_display_power_get((display), (domain)); (wf); \
 	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:112: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'domain' - possible side-effects?
#112: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:300:
+#define __with_intel_display_power(display, domain, wf) \
+	for (intel_wakeref_t (wf) = intel_display_power_get((display), (domain)); (wf); \
 	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:112: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'wf' - possible side-effects?
#112: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:300:
+#define __with_intel_display_power(display, domain, wf) \
+	for (intel_wakeref_t (wf) = intel_display_power_get((display), (domain)); (wf); \
 	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:121: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#121: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:307:
+#define __with_intel_display_power_if_enabled(display, domain, wf) \
+	for (intel_wakeref_t (wf) = intel_display_power_get_if_enabled((display), (domain)); (wf); \
 	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:121: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'domain' - possible side-effects?
#121: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:307:
+#define __with_intel_display_power_if_enabled(display, domain, wf) \
+	for (intel_wakeref_t (wf) = intel_display_power_get_if_enabled((display), (domain)); (wf); \
 	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:121: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'wf' - possible side-effects?
#121: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:307:
+#define __with_intel_display_power_if_enabled(display, domain, wf) \
+	for (intel_wakeref_t (wf) = intel_display_power_get_if_enabled((display), (domain)); (wf); \
 	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

total: 0 errors, 0 warnings, 6 checks, 182 lines checked
21f98cd74483 drm/i915/power: convert intel_wakeref_t to struct ref_tracker *
-:201: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#201: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:121:
+static void intel_cx0_phy_transaction_end(struct intel_encoder *encoder, struct ref_tracker *wakeref)

-:634: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#634: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:309:
+	for (struct ref_tracker *(wf) = intel_display_power_get_if_enabled((display), (domain)); (wf); \

total: 0 errors, 2 warnings, 0 checks, 929 lines checked
af7518077349 drm/{i915,xe}/display: drop intel_wakeref.h usage
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


