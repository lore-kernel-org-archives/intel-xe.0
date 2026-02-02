Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00381E7DF11
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 17:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A0F10E535;
	Mon,  2 Feb 2026 17:37:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4001010E535;
 Mon,  2 Feb 2026 17:37:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Color_pipeline_tea?=
 =?utf-8?q?rdown_and_follow-up_fixes/improvements_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 17:37:53 -0000
Message-ID: <177005387324.217225.2955380866375662506@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202094202.2871478-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260202094202.2871478-1-chaitanya.kumar.borah@intel.com>
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

Series: drm: Color pipeline teardown and follow-up fixes/improvements (rev4)
URL   : https://patchwork.freedesktop.org/series/159263/
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
commit 6c3fabe8b9d3f8eb7ca5f2372d6929fd804bc598
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Feb 2 15:12:02 2026 +0530

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
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ce23cb229dd84e6459444e216fb5e7980be7849b drm-intel
ca94c7e9ac59 drm/colorop: Add destroy helper for colorop objects
ac8a891caa86 drm: Allow driver-managed destruction of colorop objects
-:59: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#59: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:125:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
 						amdgpu_dm_supported_shaper_tfs,

-:68: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:142:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
+							MAX_COLOR_LUT_ENTRIES,

-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:160:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, LUT3D_SIZE,
 					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,

-:162: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#162: FILE: drivers/gpu/drm/drm_colorop.c:319:
+					uint32_t lut_size,

-:353: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#353: FILE: include/drm/drm_colorop.h:413:
+					uint32_t lut_size,

total: 0 errors, 0 warnings, 5 checks, 300 lines checked
024a993a0dac drm/amd/display: Hook up colorop destroy helper for plane pipelines
-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:131:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
 						amdgpu_dm_supported_shaper_tfs,

-:75: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#75: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:148:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
+							&dm_colorop_funcs,

-:85: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#85: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:167:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane,
+					&dm_colorop_funcs, LUT3D_SIZE,

total: 0 errors, 0 warnings, 3 checks, 79 lines checked
2bcdbaaa1294 drm/vkms: Hook up colorop destroy helper for plane pipelines
b467c701d8c6 drm/i915/display: Hook up intel_colorop_destroy
804a5f8aef40 drm: Clean up colorop objects during mode_config cleanup
268cabcad8ce drm/vkms: Remove drm_colorop_pipeline_destroy() from vkms_destroy()
45eb622ce270 drm/colorop: Use destroy callback for color pipeline teardown
6c3fabe8b9d3 drm/i915/color: Add failure handling in plane color pipeline init


