Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601FD116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 15:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F910E41E;
	Mon,  1 Dec 2025 15:54:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6923A10E412;
 Mon,  1 Dec 2025 15:54:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_general_DRM_prope?=
 =?utf-8?q?rty_=22color_format=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 15:54:07 -0000
Message-ID: <176460444742.44391.7561839573895065415@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
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

Series: Add new general DRM property "color format" (rev2)
URL   : https://patchwork.freedesktop.org/series/157911/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 112150954be848015eac91bebd09c0f15c6d6476
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date:   Fri Nov 28 22:05:53 2025 +0100

    drm/tests: hdmi: Add tests for the color_format property
    
    Add some KUnit tests to check the color_format property is working as
    expected with the HDMI state helper.
    
    The added tests check that AUTO results in RGB, and the YCBCR modes
    result in the corresponding YUV modes. An additional test ensures that
    only DRM_COLOR_FORMAT_AUTO falls back to YUV420 with a YUV420-only mode,
    and RGB errors out instead, while explicitly asking for YUV420 still
    works.
    
    This requires exporting hdmi_compute_config, so that it is accessible
    from the tests.
    
    Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ /mt/dim checkpatch 4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6 drm-intel
9bc441454413 drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
-:38: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#38: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6672:
+	if (drm_mode_is_420_only(info, mode_in) || (drm_mode_is_420_also(info, mode_in) &&
+	    aconnector && aconnector->force_yuv420_output))

total: 0 errors, 0 warnings, 1 checks, 14 lines checked
9ca651a68680 drm: Add new general DRM property "color format"
-:207: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#207: FILE: drivers/gpu/drm/drm_connector.c:2745:
+		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "color format",
+					enum_list, len);

-:242: CHECK:LINE_SPACING: Please don't use multiple blank lines
#242: FILE: drivers/gpu/drm/drm_connector.c:2990:
+
+

total: 0 errors, 0 warnings, 2 checks, 272 lines checked
44d228d39630 drm: Add enum conversion from DRM_COLOR_FORMAT to HDMI_COLORSPACE
dc43e3242caf drm/bridge: Act on the DRM color format property
-:73: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#73: FILE: drivers/gpu/drm/drm_bridge.c:1182:
+			ret = -ENOTSUPP;

total: 0 errors, 1 warnings, 0 checks, 57 lines checked
70dc8308cf51 drm/display: hdmi-state-helper: Act on color format DRM property
d57270f1b8df drm/display: hdmi-state-helper: Try subsampling in mode_valid
c64aa68d2d58 drm/i915: Implement the "color format" DRM property
-:235: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#235: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:689:
+		drm_dbg_kms(display->drm,
+			"YCbCr 4:2:0 mode requested but unsupported by connector.\n");

-:295: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#295: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2286:
+		crtc_state->sink_format = intel_hdmi_sink_format(crtc_state, connector,
+			req_fmt == DRM_COLOR_FORMAT_YCBCR420);

total: 0 errors, 0 warnings, 2 checks, 285 lines checked
5a6141e7f0d6 drm/amdgpu: Implement "color format" DRM property
-:54: CHECK:BRACES: braces {} should be used on all arms of this statement
#54: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6679:
+	if (drm_mode_is_420_only(info, mode_in) && (want_420 || !connector_state->color_format))
[...]
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR422)
[...]
-			&& aconnector->force_yuv422_output)
[...]
+		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
[...]
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
[...]
+		 (info->color_formats & DRM_COLOR_FORMAT_YCBCR444) && is_dp_or_hdmi)
[...]

-:72: CHECK:BRACES: Unbalanced braces around else statement
#72: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6691:
+	else {

total: 0 errors, 0 warnings, 2 checks, 155 lines checked
09d032183fff drm/rockchip: Add YUV422 output mode constants for VOP2
b204f0ef6595 drm/rockchip: vop2: Fix YUV444 output
4aa14849c6db drm/rockchip: vop2: Add RK3576 to the RG swap special case
c40fd8f29a95 drm/rockchip: vop2: Recognise 10/12-bit YUV422 as YUV formats
a5659a6f69c8 drm/rockchip: vop2: Set correct output format for RK3576 YUV422
dfedc225b0eb drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property
530bcd81a674 drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
f344f233e03a drm/connector: Register color format property on HDMI connectors
112150954be8 drm/tests: hdmi: Add tests for the color_format property
-:90: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#90: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2036:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |

-:121: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#121: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2067:
+KUNIT_ARRAY_PARAM_DESC(check_hdmi_color_format,
+		  hdmi_color_format_params, desc);

-:123: CHECK:LINE_SPACING: Please don't use multiple blank lines
#123: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2069:
+
+

-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2079:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |

total: 0 errors, 0 warnings, 4 checks, 150 lines checked


