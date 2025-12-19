Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22800D7495D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 07:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15B210ED35;
	Fri, 19 Dec 2025 07:19:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961B510E5A1;
 Fri, 19 Dec 2025 07:19:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Color_pipeline_tea?=
 =?utf-8?q?rdown_and_follow-up_fixes/improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 07:19:24 -0000
Message-ID: <176612876461.104675.4782521708032014051@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

Series: drm: Color pipeline teardown and follow-up fixes/improvements
URL   : https://patchwork.freedesktop.org/series/159263/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5f54f403acc61a45ad2b4d68dfd74b336dce1968
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 60151363ce5c12d168c3912680217b36fabd66dc
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Fri Dec 19 12:26:14 2025 +0530

    drm/i915/color: Add failure handling in plane color pipeline init
    
    The plane color pipeline initialization built up multiple colorop blocks
    inline, but did not reliably clean up partially constructed pipelines
    when an intermediate step failed. This could lead to leaked colorop
    objects and fragile error handling as the pipeline grows.
    
    Refactor the pipeline construction to use a common helper for adding
    colorop blocks. This centralizes allocation, initialization, and
    teardown logic, allowing the caller to reliably unwind all previously
    created colorops on failure.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 515e6667d13b3a1ea3192f275982df95854ac89b drm-intel
d629d33dd2b0 drm/i915/color: Place 3D LUT after CSC in plane color pipeline
19409e158009 drm/amd/display: Fix color pipeline enum name leak
7dec3c0dcb01 drm/vkms: Fix color pipeline enum name leak
0c121aee40f6 drm/i915/display: Fix color pipeline enum name leak
bb8420ade837 drm: Allow driver-managed destruction of colorop objects
-:55: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#55: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:125:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
 						amdgpu_dm_supported_shaper_tfs,

-:64: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#64: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:142:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
+							MAX_COLOR_LUT_ENTRIES,

-:74: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#74: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:160:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, LUT3D_SIZE,
 					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,

-:158: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#158: FILE: drivers/gpu/drm/drm_colorop.c:304:
+					uint32_t lut_size,

-:349: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#349: FILE: include/drm/drm_colorop.h:413:
+					uint32_t lut_size,

total: 0 errors, 0 warnings, 5 checks, 300 lines checked
00796c7e46a2 drm/colorop: Add destroy helper for colorop objects
c0c4c2adc221 drm/amd/display: Hook up colorop destroy helper for plane pipelines
-:63: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#63: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:131:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
 						amdgpu_dm_supported_shaper_tfs,

-:72: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#72: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:148:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
+							&dm_colorop_funcs,

-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:167:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane,
+					&dm_colorop_funcs, LUT3D_SIZE,

total: 0 errors, 0 warnings, 3 checks, 79 lines checked
175270567018 drm/vkms: Hook up colorop destroy helper for plane pipelines
0ec1dc33dbf7 drm/i915/display: Hook up intel_colorop_destroy
4ed7ae3eb47f drm: Clean up colorop objects during mode_config cleanup
734093c5bf82 drm/vkms: Remove drm_colorop_pipeline_destroy() from vkms_destroy()
c4b50a56994d drm/colorop: Use destroy callback for color pipeline teardown
60151363ce5c drm/i915/color: Add failure handling in plane color pipeline init


