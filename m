Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC31C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 09:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D221110E4FB;
	Mon, 14 Apr 2025 09:22:09 +0000 (UTC)
Received: from f7756006eef8 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8E10E505;
 Mon, 14 Apr 2025 09:22:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/display=3A_Add_macro_for_checking_3_DSC_engines_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 09:22:08 -0000
Message-ID: <174462252863.611.6082923896755869390@f7756006eef8>
X-Patchwork-Hint: ignore
References: <20250414024256.2782702-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250414024256.2782702-1-ankit.k.nautiyal@intel.com>
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

Series: series starting with [1/2] drm/i915/display: Add macro for checking 3 DSC engines (rev2)
URL   : https://patchwork.freedesktop.org/series/147642/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e047bd811bb3660ce145f93798221809b7579089
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Apr 14 08:12:56 2025 +0530

    drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices
    
    DSC 12 slices configuration is used for some specific cases with
    Ultrajoiner. This can be supported only when each of the 4 joined pipes
    have 3 DSC engines each.
    
    Add the missing check for 3 DSC engines support before using 3 DSC
    slices per pipe.
    
    Fixes: be7f5fcdf4a0 ("drm/i915/dp: Enable 3 DSC engines for 12 slices")
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: <stable@vger.kernel.org> # v6.14+
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 8d0b26a073a34e4eeef766fb53b62e7ec19f9456 drm-intel
f972be4033fa drm/i915/display: Add macro for checking 3 DSC engines
-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:166:
+#define HAS_DSC_3ENGINES(__display)	(DISPLAY_VERx100(__display) == 1401 && HAS_DSC(__display))

total: 0 errors, 0 warnings, 1 checks, 7 lines checked
e047bd811bb3 drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices


