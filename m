Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD668C7EE30
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 14:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE9010E5CF;
	Tue, 24 Jun 2025 14:24:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5410E5CF;
 Tue, 24 Jun 2025 14:24:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/display/dp=3A_Use_sta?=
 =?utf-8?q?tic_values_for_min=5Fhblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 14:24:23 -0000
Message-ID: <175077506356.104499.1300695000693723790@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624-min_hblank-v1-1-5c100e4a8b05@intel.com>
In-Reply-To: <20250624-min_hblank-v1-1-5c100e4a8b05@intel.com>
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

Series: drm/display/dp: Use static values for min_hblank
URL   : https://patchwork.freedesktop.org/series/150680/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a1235c35ecc5402017969a0dfe4f6385eef67c5a
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Jun 24 14:48:26 2025 +0530

    drm/display/dp: Use static values for min_hblank
    
    Use recommended static values as per wa_14021694213 for min_hblank to
    avoid underruns.
    
    Bspec: 74379
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch fb5dada21e3cfa26179ca58e1d7c26cdad217201 drm-intel
a1235c35ecc5 drm/display/dp: Use static values for min_hblank
-:83: CHECK:BRACES: braces {} should be used on all arms of this statement
#83: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3123:
+	if (intel_dp_is_uhbr(crtc_state)) {
[...]
+	} else
[...]

-:90: CHECK:BRACES: Unbalanced braces around else statement
#90: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3130:
+	} else

total: 0 errors, 0 warnings, 2 checks, 78 lines checked


