Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A14FD0C856
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 11:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEE610E2E6;
	Tue, 13 Jan 2026 11:18:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A225510E2E6;
 Tue, 13 Jan 2026 11:18:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Color_pipeline_tea?=
 =?utf-8?q?rdown_and_follow-up_fixes/improvements_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jan 2026 11:18:05 -0000
Message-ID: <176830308566.149757.493133123495657274@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
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

Series: drm: Color pipeline teardown and follow-up fixes/improvements (rev3)
URL   : https://patchwork.freedesktop.org/series/159263/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c73cf14db2c0ba24b1f3c82e3ef9a4c7ab142669
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Tue Jan 13 15:53:03 2026 +0530

    drm/i915/color: Add failure handling in plane color pipeline init
    
    The plane color pipeline initialization built up multiple colorop blocks
    inline, but did not reliably clean up partially constructed pipelines
    when an intermediate step failed. This could lead to leaked colorop
    objects and fragile error handling as the pipeline grows.
    
    Refactor the pipeline construction to use a common helper for adding
    colorop blocks. This centralizes allocation, initialization, and
    teardown logic, allowing the caller to reliably unwind all previously
    created colorops on failure.
    
    v2:
     - Refactor code to avoid repetition (Suraj)
    
    v3:
     - s/nvl/xe3plpd (Suraj)
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082 drm-intel
f166843fe069 drm/i915/color: Place 3D LUT after CSC in plane color pipeline
082162cf6dac drm/amd/display: Fix color pipeline enum name leak
a1b78ac88836 drm/vkms: Fix color pipeline enum name leak
adae6513f14a drm/i915/display: Fix color pipeline enum name leak
57a50762145f drm/colorop: Add destroy helper for colorop objects
d30796634823 drm: Allow driver-managed destruction of colorop objects
-:58: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#58: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:125:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
 						amdgpu_dm_supported_shaper_tfs,

-:67: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#67: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:142:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
+							MAX_COLOR_LUT_ENTRIES,

-:77: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#77: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:160:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, LUT3D_SIZE,
 					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,

-:161: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#161: FILE: drivers/gpu/drm/drm_colorop.c:319:
+					uint32_t lut_size,

-:352: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#352: FILE: include/drm/drm_colorop.h:413:
+					uint32_t lut_size,

total: 0 errors, 0 warnings, 5 checks, 300 lines checked
f5fe63ab7aa5 drm/amd/display: Hook up colorop destroy helper for plane pipelines
-:65: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#65: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:131:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
 						amdgpu_dm_supported_shaper_tfs,

-:74: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#74: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:148:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
+							&dm_colorop_funcs,

-:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#84: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:167:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane,
+					&dm_colorop_funcs, LUT3D_SIZE,

total: 0 errors, 0 warnings, 3 checks, 79 lines checked
9dd9367e1fd7 drm/vkms: Hook up colorop destroy helper for plane pipelines
188831a5f26a drm/i915/display: Hook up intel_colorop_destroy
cacb529a82d3 drm: Clean up colorop objects during mode_config cleanup
f8d27de88de5 drm/vkms: Remove drm_colorop_pipeline_destroy() from vkms_destroy()
354a590c9861 drm/colorop: Use destroy callback for color pipeline teardown
c73cf14db2c0 drm/i915/color: Add failure handling in plane color pipeline init


