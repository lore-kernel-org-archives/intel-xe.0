Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4071EC44536
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 15:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CD410E231;
	Wed, 21 Jan 2026 15:23:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF49510E231;
 Wed, 21 Jan 2026 15:23:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_general_DRM_prope?=
 =?utf-8?q?rty_=22color_format=22_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 15:23:33 -0000
Message-ID: <176900901398.178097.8429547490137502530@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
In-Reply-To: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
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

Series: Add new general DRM property "color format" (rev4)
URL   : https://patchwork.freedesktop.org/series/157911/
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
commit fd38b017116f29e3d1919129db32cc10fd2ada9d
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date:   Wed Jan 21 15:45:29 2026 +0100

    drm/bridge: Document bridge chain format selection
    
    The bridge chain format selection behaviour was, until now,
    undocumented. With the addition of the "color format" DRM property, it's
    not sufficiently complex enough that documentation is warranted,
    especially for driver authors trying to do the right thing.
    
    Add a high-level overview of how the process is supposed to work, and
    mention what the display driver is supposed to do if it wants to make
    use of this functionality.
    
    Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ /mt/dim checkpatch eba230075d9652bf53d531ae8e53347a6ccc7863 drm-intel
5ceb02cc6be6 drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
30ac902882ce drm: Add new general DRM property "color format"
f529f0c02c48 drm: Add enum conversions between DRM_COLOR_FORMAT and HDMI_COLORSPACE
5f8545344dca drm/bridge: Act on the DRM color format property
-:113: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#113: FILE: drivers/gpu/drm/drm_bridge.c:1273:
+			ret = -ENOTSUPP;

-:119: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#119: FILE: drivers/gpu/drm/drm_bridge.c:1278:
+		if (ret != -ENOTSUPP) {

total: 0 errors, 2 warnings, 0 checks, 103 lines checked
4acfb59859e1 drm/display: hdmi-state-helper: Act on color format DRM property
2ff6b59e7a40 drm/display: hdmi-state-helper: Try subsampling in mode_valid
03190f3c2df0 drm/i915: Implement the "color format" DRM property
e8a973f041c3 drm/amdgpu: Implement "color format" DRM property
-:63: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#63: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6715:
+	} else if ((info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		   && want_422 && is_dp_or_hdmi) {

total: 0 errors, 0 warnings, 1 checks, 157 lines checked
63987544c8ea drm/rockchip: Add YUV422 output mode constants for VOP2
986afb45090a drm/rockchip: vop2: Fix YUV444 output
b7e71741d572 drm/rockchip: vop2: Add RK3576 to the RG swap special case
2205fe819f25 drm/rockchip: vop2: Recognise 10/12-bit YUV422 as YUV formats
a2b28f17878f drm/rockchip: vop2: Set correct output format for RK3576 YUV422
6507b8ad639d drm/bridge: dw-hdmi-qp: Implement atomic_get_output_bus_fmts
73fc82585f7b drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property
3b5a7f09ac01 drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
24d07a720fba drm/connector: Register color format property on HDMI connectors
c7708035ac6b drm/tests: hdmi: Add tests for the color_format property
-:110: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#110: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2253:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |

-:192: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#192: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2335:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |

total: 0 errors, 0 warnings, 2 checks, 233 lines checked
b8366313379e drm/tests: hdmi: Add tests for HDMI helper's mode_valid
-:56: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2732:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |

-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2767:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),

-:117: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#117: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2793:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),

total: 0 errors, 0 warnings, 3 checks, 126 lines checked
f6e0affaa39e drm/tests: edid: Add __maybe_unused attribute to EDID definitions
f330acfaff2f drm/tests: bridge: Add KUnit tests for bridge chain format selection
-:223: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#223: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:252:
+#define DEFINE_FMT_FUNCS_FROM_TUPLES(name) \
+static u32 *drm_test_bridge_ ## name ## _out_fmts(struct drm_bridge *bridge,			\
+						  struct drm_bridge_state *bridge_state,	\
+						  struct drm_crtc_state *crtc_state,		\
+						  struct drm_connector_state *conn_state,	\
+						  unsigned int *num_output_fmts)		\
+{												\
+	u32 *out_fmts = kcalloc(ARRAY_SIZE((name)), sizeof(u32), GFP_KERNEL);			\
+												\
+	if (out_fmts)										\
+		*num_output_fmts = get_tuples_out_fmts((name), ARRAY_SIZE((name)), out_fmts);	\
+	else											\
+		*num_output_fmts = 0;								\
+												\
+	return out_fmts;									\
+}												\
+												\
+static u32 *drm_test_bridge_ ## name ## _in_fmts(struct drm_bridge *bridge,			\
+						 struct drm_bridge_state *bridge_state,		\
+						 struct drm_crtc_state *crtc_state,		\
+						 struct drm_connector_state *conn_state,	\
+						 u32 output_fmt,				\
+						 unsigned int *num_input_fmts)			\
+{												\
+	u32 *in_fmts = kcalloc(ARRAY_SIZE((name)), sizeof(u32), GFP_KERNEL);			\
+	unsigned int num_fmts = 0;								\
+	size_t i;										\
+												\
+	if (!in_fmts) {										\
+		*num_input_fmts = 0;								\
+		return NULL;									\
+	}											\
+												\
+	for (i = 0; i < ARRAY_SIZE((name)); i++)						\
+		if ((name)[i].out_fmt == output_fmt)						\
+			in_fmts[num_fmts++] = (name)[i].in_fmt;					\
+												\
+	*num_input_fmts = num_fmts;								\
+												\
+	return in_fmts;										\
+}

-:265: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hdmi_write_infoframe_func' - possible side-effects?
#265: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:294:
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,	\
+						 hdmi_write_infoframe_func,			\
+						 hdmi_clear_infoframe_func)			\
+static const struct drm_bridge_funcs (ident) = {						\
+	.destroy			= drm_test_bridge_chain_priv_destroy,			\
+	.atomic_enable			= drm_test_bridge_atomic_enable,			\
+	.atomic_disable			= drm_test_bridge_atomic_disable,			\
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,		\
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,		\
+	.atomic_reset			= drm_atomic_helper_bridge_reset,			\
+	.atomic_get_input_bus_fmts	= (input_fmts_func),					\
+	.atomic_get_output_bus_fmts	= (output_fmts_func),					\
+	.hdmi_write_avi_infoframe	= (hdmi_write_infoframe_func),				\
+	.hdmi_clear_avi_infoframe	= (hdmi_clear_infoframe_func),				\
+	.hdmi_write_hdmi_infoframe	= (hdmi_write_infoframe_func),				\
+	.hdmi_clear_hdmi_infoframe	= (hdmi_clear_infoframe_func),				\
+}

-:265: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hdmi_clear_infoframe_func' - possible side-effects?
#265: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:294:
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,	\
+						 hdmi_write_infoframe_func,			\
+						 hdmi_clear_infoframe_func)			\
+static const struct drm_bridge_funcs (ident) = {						\
+	.destroy			= drm_test_bridge_chain_priv_destroy,			\
+	.atomic_enable			= drm_test_bridge_atomic_enable,			\
+	.atomic_disable			= drm_test_bridge_atomic_disable,			\
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,		\
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,		\
+	.atomic_reset			= drm_atomic_helper_bridge_reset,			\
+	.atomic_get_input_bus_fmts	= (input_fmts_func),					\
+	.atomic_get_output_bus_fmts	= (output_fmts_func),					\
+	.hdmi_write_avi_infoframe	= (hdmi_write_infoframe_func),				\
+	.hdmi_clear_avi_infoframe	= (hdmi_clear_infoframe_func),				\
+	.hdmi_write_hdmi_infoframe	= (hdmi_write_infoframe_func),				\
+	.hdmi_clear_hdmi_infoframe	= (hdmi_clear_infoframe_func),				\
+}

-:448: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#448: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:555:
+		edid = drm_edid_alloc(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz,
+				ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz));

-:873: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#873: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:1301:
+	KUNIT_EXPECT_EQ(test, ret, -ENOTSUPP);

total: 0 errors, 1 warnings, 4 checks, 865 lines checked
fd38b017116f drm/bridge: Document bridge chain format selection


