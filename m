Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22C0C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 11:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7149710E262;
	Tue,  5 Aug 2025 11:41:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45B010E262;
 Tue,  5 Aug 2025 11:41:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/tc=3A_Fix_enable?=
 =?utf-8?q?d/disconnected_DP-alt_sink_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Aug 2025 11:41:36 -0000
Message-ID: <175439409693.213461.8728702907871884648@1538d3639d33>
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

Series: drm/i915/tc: Fix enabled/disconnected DP-alt sink handling (rev3)
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
commit 6f4abb0858c45eabf94ef3df55850b8b7da913c3
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Aug 5 10:37:00 2025 +0300

    drm/i915/tc: Debug print the pin assignment and max lane count
    
    Debug print the TypeC pin assignment and max lane count value during HW
    readout and after resetting the TypeC mode.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 22cf8ca94d0cf9e5ed0dd5a4e8fed96f6cdab2bb drm-intel
ed2cf3332697 drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink
-:36: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#36: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:84: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 38 lines checked
00dee60f64e6 drm/i915/icl+/tc: Cache the max lane count value
-:23: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#23: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:180: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 139 lines checked
9f73599ccd98 drm/i915/lnl+/tc: Fix max lane count HW readout
-:24: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#24: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:61: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 27 lines checked
53674e3033f1 drm/i915/lnl+/tc: Use the cached max lane count value
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:41: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 17 lines checked
ab25f61e3cbe drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:35: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 14 lines checked
24227cc026af drm/i915/tc: Use the cached max lane count value
440f6eb5589e drm/i915/tc: Move getting the power domain before reading DFLEX registers
134e7a584280 drm/i915/tc: Move asserting the power state after reading TCSS_DDI_STATUS
5fc7bbf52e63 drm/i915/tc: Add an enum for the TypeC pin assignment
191d5baceb3d drm/i915/tc: Pass pin assignment value around using the pin assignment enum
4f57ee26bdc4 drm/i915/tc: Handle pin assignment NONE on all platforms
943c921f068c drm/i915/tc: Validate the pin assignment on all platforms
233d3c13826b drm/i915/tc: Unify the way to get the pin assignment on all platforms
c1acddd7018d drm/i915/tc: Unify the way to get the max lane count value on MTL+
7d172c1f496f drm/i915/tc: Handle non-TC encoders when getting the pin assignment
aa920a712e80 drm/i915/tc: Pass intel_tc_port to internal lane mask/count helpers
6fcdbc21c327 dmc/i915/tc: Report pin assignment NONE in TBT-alt mode
e74f42cae5b2 drm/i915/tc: Cache the pin assignment value
6f4abb0858c4 drm/i915/tc: Debug print the pin assignment and max lane count


