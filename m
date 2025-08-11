Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A448FCA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 08:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5193A10E131;
	Mon, 11 Aug 2025 08:51:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C0C10E131;
 Mon, 11 Aug 2025 08:51:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/tc=3A_Fix_enable?=
 =?utf-8?q?d/disconnected_DP-alt_sink_handling_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Aug 2025 08:51:17 -0000
Message-ID: <175490227702.225766.16358522079987348842@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250811080152.906216-1-imre.deak@intel.com>
In-Reply-To: <20250811080152.906216-1-imre.deak@intel.com>
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

Series: drm/i915/tc: Fix enabled/disconnected DP-alt sink handling (rev4)
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
commit a3ca345763a012455156941b51a1cd4b61287866
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Aug 11 11:01:52 2025 +0300

    drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
    
    The BIOS can leave the AUX power well enabled on an output, even if this
    isn't required (on platforms where the AUX power is only needed for an
    AUX access). This was observed at least on PTL. To avoid the WARN which
    would be triggered by this during the HW readout, convert the WARN to a
    debug message.
    
    Cc: stable@vger.kernel.org # v6.8+
    Reported-by: Charlton Lin <charlton.lin@intel.com>
    Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 27315c7bb830e06a1e63fe1fd656fda48365805c drm-intel
1ca77afd0408 drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink
-:40: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#40: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:90: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 38 lines checked
621699a642f9 drm/i915/icl+/tc: Cache the max lane count value
-:23: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#23: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:181: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 139 lines checked
d14730fd6b13 drm/i915/lnl+/tc: Fix max lane count HW readout
-:24: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#24: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:62: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 27 lines checked
eed4f8c2660c drm/i915/lnl+/tc: Use the cached max lane count value
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:42: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 17 lines checked
a3ca345763a0 drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Charlton Lin <charlton.lin@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

-:36: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 14 lines checked


