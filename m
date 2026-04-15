Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0728DF43854
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 17:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39B610E180;
	Wed, 15 Apr 2026 17:09:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A151E10E180;
 Wed, 15 Apr 2026 17:09:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=3A_drm/i915/display=3A_U?=
 =?utf-8?q?se_ceiling_division_for_NV12_UV_surface_offset_calculation_=28rev?=
 =?utf-8?q?3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 17:09:46 -0000
Message-ID: <177627298665.464821.11143282368217526869@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260411171521.162189-1-vidya.srinivas@intel.com>
In-Reply-To: <20260411171521.162189-1-vidya.srinivas@intel.com>
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

Series: : drm/i915/display: Use ceiling division for NV12 UV surface offset calculation (rev3)
URL   : https://patchwork.freedesktop.org/series/164739/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4419f68f1c30650828f7ddb2b1ad1f03a18cc089
Author: Vidya Srinivas <vidya.srinivas@intel.com>
Date:   Wed Apr 15 22:28:49 2026 +0530

    drm/i915/display: Use ceiling division for NV12 UV surface offset calculation
    
    For LNL+, odd source size and panning for YUV 422/420 surfaces is
    supported. However, it requires the UV (chroma) surface Start X/Y and
    width/height to be calculated as ceiling(half of Y plane value) rather
    than floor.
    
    The current code uses (>> 17) which combines the U16.16 fixed-point to
    integer conversion (>> 16) with a divide-by-2 for chroma subsampling
    (>> 1) into a single floor division. For odd Y plane values this
    produces an off-by-one error in the UV plane offset.
    
    On Android systems we see PLANE ATS fault when NV12 overlays are
    used with odd source dimensions:
    
    [  126.854200] xe 0000:00:02.0: [drm:intel_atomic_setup_scaler [xe]] [CRTC:148:pipe A] attached scaler id 0.0 to PLANE:33
    [  126.854617] xe 0000:00:02.0: [drm:skl_update_scaler [xe]] [CRTC:148:pipe A] scaler_user index 0.0: staged scaling request for 1279x719->1340x753
    [  126.854837] xe 0000:00:02.0: [drm:intel_plane_atomic_check [xe]] UV plane [PLANE:33:plane 1A] using Y plane [PLANE:123:plane 4A]
    [  126.854926] xe 0000:00:02.0: [drm] *ERROR* [CRTC:148:pipe A] PLANE ATS fault
    
    With Y plane width 1279:
      floor(1279/2) = 639 (current)
      ceil(1279/2)  = 640 (required)
    
    Introduce fp_16_16_div2() and fp_16_16_to_int_ceil() helpers to cleanly
    separate the two operations: first halve the U16.16 fixed-point value
    for chroma subsampling (staying in fixed-point domain), then convert
    to integer with ceiling rounding.
    
    v2: Use DIV_ROUND_UP(value, 1 << 17) to preserve sub-pixel precision
        while making the ceiling division readable (Jani, Uma)
    
    v3: Split into two helpers - fp_16_16_div2() for fixed-point division
        by 2 and fp_16_16_to_int_ceil() for ceiling conversion to integer,
        cleanly separating chroma subsampling from fixed-point to integer
        conversion (Jani)
    
    Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
+ /mt/dim checkpatch 4c59525db84aca677fd9f052e662912ad9d88448 drm-intel
4419f68f1c30 drm/i915/display: Use ceiling division for NV12 UV surface offset calculation
-:52: CHECK:LINE_SPACING: Please don't use multiple blank lines
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2129:
 
+

total: 0 errors, 0 warnings, 1 checks, 39 lines checked


