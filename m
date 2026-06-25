Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E1CCDE001
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 13:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022DB10F2B7;
	Thu, 25 Jun 2026 13:21:27 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4419810F2B7;
 Thu, 25 Jun 2026 13:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_require_v?=
 =?utf-8?q?alid_min/max_vfreq_for_VRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 13:21:25 -0000
Message-ID: <178239368527.117404.13436710626602981290@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625131040.1051272-1-jani.nikula@intel.com>
In-Reply-To: <20260625131040.1051272-1-jani.nikula@intel.com>
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

Series: drm/i915/vrr: require valid min/max vfreq for VRR
URL   : https://patchwork.freedesktop.org/series/169197/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5187962cc833a49427215e760da52e429755dab3
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 25 16:10:40 2026 +0300

    drm/i915/vrr: require valid min/max vfreq for VRR
    
    Ensure the EDID provided min/max vfreq are valid. Most scenarios are
    already covered (by coincidence) through the checks in
    intel_vrr_is_capable() and intel_vrr_is_in_range(), but be more explicit
    about it. At worst, a zero min_vfreq could lead to a division by zero in
    intel_vrr_compute_vmax().
    
    Discovered using AI-assisted static analysis confirmed by Intel Product
    Security.
    
    Reported-by: Martin Hodo <martin.hodo@intel.com>
    Fixes: 117cd09ba528 ("drm/i915/display/dp: Compute VRR state in atomic_check")
    Cc: <stable@vger.kernel.org> # v5.12+
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch adbc617250e16fb2db4a4c777b89440927cb8973 drm-intel
5187962cc833 drm/i915/vrr: require valid min/max vfreq for VRR
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 117cd09ba528 ("drm/i915/display/dp: Compute VRR state in atomic_check")

total: 0 errors, 1 warnings, 0 checks, 10 lines checked


