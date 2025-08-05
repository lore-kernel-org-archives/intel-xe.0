Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276DC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 07:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BC810E253;
	Tue,  5 Aug 2025 07:46:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A3B10E253;
 Tue,  5 Aug 2025 07:46:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/tc=3A_Fix_enable?=
 =?utf-8?q?d/disconnected_DP-alt_sink_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Aug 2025 07:46:14 -0000
Message-ID: <175437997400.212725.509116130070813726@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250805073700.642107-1-imre.deak@intel.com>
In-Reply-To: <20250805073700.642107-1-imre.deak@intel.com>
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

Series: drm/i915/tc: Fix enabled/disconnected DP-alt sink handling
URL   : https://patchwork.freedesktop.org/series/152514/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f3f5afd67ee7974ca399d2d2bd7cd317039d7697
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Aug 5 10:37:00 2025 +0300

    drm/i915/tc: Debug print the pin assignment and max lane count
    
    Debug print the TypeC pin assignment and max lane count value during HW
    readout and after resetting the TypeC mode.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch c79dfb5e415ae8c63601b02f7b3a2082d1a2345b drm-intel
15c0253c3e62 drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink
-:36: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#36: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:84: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 38 lines checked
032f572013d5 drm/i915/icl+/tc: Cache the max lane count value
-:21: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#21: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:163: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 124 lines checked
ee01c9c7d751 drm/i915/lnl+/tc: Fix max lane count HW readout
-:21: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#21: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:58: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 27 lines checked
999f9ca5b2a6 drm/i915/lnl+/tc: Use the cached max lane count value
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:41: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 17 lines checked
e9256f6577b4 drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:35: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 14 lines checked
213152a71f5c drm/i915/tc: Use the cached max lane count value
e5bdd7b6d1be drm/i915/tc: Move getting the power domain before reading DFLEX registers
73a294b9c201 drm/i915/tc: Move asserting the power state after reading TCSS_DDI_STATUS
4ab6879919e7 drm/i915/tc: Add an enum for the TypeC pin assignment
3cf74e647354 drm/i915/tc: Pass pin assignment value around using the pin assignment enum
65d246e04056 drm/i915/tc: Handle pin assignment NONE on all platforms
e20220721ea1 drm/i915/tc: Validate the pin assignment on all platforms
f7a0c8a64d45 drm/i915/tc: Unify the way to get the pin assignment on all platforms
865c2bb16658 drm/i915/tc: Unify the way to get the max lane count value on MTL+
71794b24c2f1 drm/i915/tc: Handle non-TC encoders when getting the pin assignment
895b8c0a12c8 drm/i915/tc: Pass intel_tc_port to internal lane mask/count helpers
b5c6e591aeea dmc/i915/tc: Report pin assignment NONE in TBT-alt mode
ab6b04940979 drm/i915/tc: Cache the pin assignment value
f3f5afd67ee7 drm/i915/tc: Debug print the pin assignment and max lane count


