Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA24CFD317
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 15:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC6110E2E7;
	Mon, 24 Nov 2025 15:20:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26A810E2E6;
 Mon, 24 Nov 2025 15:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_general_DRM_prope?=
 =?utf-8?q?rty_=22color_format=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Nov 2025 15:20:28 -0000
Message-ID: <176399762878.21320.3749798866984135672@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
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

Series: Add new general DRM property "color format"
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
commit 603eb4c4964bbdaf34e51473ea57793682924efc
Author: Derek Foreman <derek.foreman@collabora.com>
Date:   Mon Nov 17 20:11:54 2025 +0100

    drm/rockchip: Implement "color format" DRM property
    
    Register the color format property in the dw_hdmi_qp-rockchip driver,
    and act on requested format changes as part of the connector state in
    the vop2 video output driver.
    
    Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
    Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
    Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ /mt/dim checkpatch 7285a751f80f2dd2d6e2402502d139a62ba2452d drm-intel
27582bf35700 drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6653:
+	if (drm_mode_is_420_only(info, mode_in) || (drm_mode_is_420_also(info, mode_in) &&
+	    aconnector && aconnector->force_yuv420_output))

total: 0 errors, 0 warnings, 1 checks, 14 lines checked
07808b45ca80 drm: Add new general DRM property "color format"
-:161: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#161: FILE: drivers/gpu/drm/drm_connector.c:2708:
+		drm_err(dev, "No supported color formats provded on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);

-:167: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#167: FILE: drivers/gpu/drm/drm_connector.c:2714:
+		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);

-:186: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#186: FILE: drivers/gpu/drm/drm_connector.c:2733:
+		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "color format",
+					enum_list, len);

-:270: CHECK:LINE_SPACING: Please don't use multiple blank lines
#270: FILE: drivers/gpu/drm/drm_connector.c:3027:
+
+

total: 0 errors, 0 warnings, 4 checks, 321 lines checked
451a7115ebd5 drm: Add enum conversion from/to HDMI_COLORSPACE to DRM_COLOR_FORMAT
f47081fb0519 drm/bridge: Act on the DRM color format property
-:85: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#85: FILE: drivers/gpu/drm/drm_bridge.c:1194:
+			ret = -ENOTSUPP;

total: 0 errors, 1 warnings, 0 checks, 69 lines checked
9a78a43c322e drm/bridge: dw-hdmi-qp: Set bridge supported_formats
a19a8b2612dc drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
7683d0540587 drm/display: hdmi-state-helper: Act on color format DRM property
52af1853b184 drm/i915: Implement the "color format" DRM property
-:245: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#245: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:688:
+		drm_dbg_kms(display->drm,
+			"YCbCr 4:2:0 mode requested but it's unsupported by connector. Trying RGB.\n");

-:298: CHECK:BRACES: braces {} should be used on all arms of this statement
#298: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2278:
+	if (conn_state->color_format == DRM_COLOR_FORMAT_YCBCR444)
[...]
+	else {
[...]

-:300: CHECK:BRACES: Unbalanced braces around else statement
#300: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2280:
+	else {

total: 0 errors, 0 warnings, 3 checks, 284 lines checked
0036df87cfa5 drm/amdgpu: Implement "color format" DRM property
-:54: CHECK:BRACES: braces {} should be used on all arms of this statement
#54: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6660:
+	if (drm_mode_is_420(info, mode_in) && want_420)
[...]
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR422)
[...]
-			&& aconnector->force_yuv422_output)
[...]
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
[...]
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
[...]

-:71: CHECK:BRACES: Unbalanced braces around else statement
#71: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6671:
+	else {

-:79: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#79: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6679:
+		if (connector_state->color_format &&
+			connector_state->color_format != DRM_COLOR_FORMAT_AUTO)

total: 0 errors, 0 warnings, 3 checks, 164 lines checked
603eb4c4964b drm/rockchip: Implement "color format" DRM property


