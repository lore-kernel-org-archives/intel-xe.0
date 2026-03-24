Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF19F54ADA
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 16:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46A810E777;
	Tue, 24 Mar 2026 16:47:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FA610E775;
 Tue, 24 Mar 2026 16:47:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_general_DRM_prope?=
 =?utf-8?q?rty_=22color_format=22_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Mar 2026 16:47:50 -0000
Message-ID: <177437087049.392270.5239996264039588958@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
In-Reply-To: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
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

Series: Add new general DRM property "color format" (rev8)
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
commit d3c08301379dffae6775b6babf47b4242ef85c59
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date:   Tue Mar 24 17:01:26 2026 +0100

    drm/bridge: Document bridge chain format selection
    
    The bridge chain format selection behaviour was, until now,
    undocumented. With the addition of the "color format" DRM property, it's
    not sufficiently complex enough that documentation is warranted,
    especially for driver authors trying to do the right thing.
    
    Add a high-level overview of how the process is supposed to work, and
    mention what the display driver is supposed to do if it wants to make
    use of this functionality.
    
    Reviewed-by: Maxime Ripard <mripard@kernel.org>
    Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ /mt/dim checkpatch 0be244ee3139de3578e9acc56e1b917a4bd162cd drm-intel
d87c66c9e33f drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
9c0de94ff0f8 drm/display: hdmi-state-helper: Use default case for unsupported formats
f6de78423ab8 drm: Add new general DRM property "color format"
a0f427a210c0 drm/bridge: Act on the DRM color format property
-:94: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#94: FILE: drivers/gpu/drm/drm_bridge.c:1288:
+			    drm_hdmi_connector_get_output_format_name(

-:123: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#123: FILE: drivers/gpu/drm/drm_bridge.c:1317:
+			ret = -ENOTSUPP;

-:129: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#129: FILE: drivers/gpu/drm/drm_bridge.c:1322:
+		if (ret != -ENOTSUPP) {

total: 0 errors, 2 warnings, 1 checks, 113 lines checked
b4965c563c66 drm/atomic-helper: Add HDMI bridge output bus formats helper
-:68: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/drm_atomic_helper.c:4119:
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,

-:138: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#138: FILE: include/drm/drm_atomic_helper.h:300:
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,

total: 0 errors, 0 warnings, 2 checks, 101 lines checked
0361c56c3aba drm/display: hdmi-state-helper: Act on color format DRM property
-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/display/drm_hdmi_state_helper.c:695:
+			drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
+				conn_state->color_format);

total: 0 errors, 0 warnings, 1 checks, 39 lines checked
1a3323035bfb drm/display: hdmi-state-helper: Try subsampling in mode_valid
4946032cee4f drm/i915: Implement the "color format" DRM property
afc229c6b3ca drm/amdgpu: Implement "color format" DRM property
70256595dbca drm/rockchip: Add YUV422 output mode constants for VOP2
54918eb9c848 drm/rockchip: vop2: Add RK3576 to the RG swap special case
e9ca0167586f drm/rockchip: vop2: Recognise 10-bit YUV422 as YUV format
9a1cfef9ea45 drm/rockchip: vop2: Set correct output format for RK3576 YUV422
51630e1613dc drm/bridge: dw-hdmi-qp: Use common HDMI output bus fmts helper
9b561240ee94 drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property
3673fb474d8c drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
e68fb72d2073 drm/connector: Register color format property on HDMI connectors
09402d52ed20 drm/tests: hdmi: Add tests for the color_format property
-:112: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#112: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2253:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |

-:219: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#219: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2360:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |

total: 0 errors, 0 warnings, 2 checks, 278 lines checked
389857cfb2b8 drm/tests: hdmi: Add tests for HDMI helper's mode_valid
-:57: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#57: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2777:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |

-:92: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#92: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2812:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),

-:118: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#118: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2838:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),

total: 0 errors, 0 warnings, 3 checks, 126 lines checked
81525e38a950 drm/tests: bridge: Add KUnit tests for bridge chain format selection
-:197: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#197: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:231:
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

-:239: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hdmi_write_infoframe_func' - possible side-effects?
#239: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:273:
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,	\
+						 hdmi_write_infoframe_func,			\
+						 hdmi_clear_infoframe_func)			\
+static const struct drm_bridge_funcs (ident) = {						\
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

-:239: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hdmi_clear_infoframe_func' - possible side-effects?
#239: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:273:
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,	\
+						 hdmi_write_infoframe_func,			\
+						 hdmi_clear_infoframe_func)			\
+static const struct drm_bridge_funcs (ident) = {						\
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

-:417: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#417: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:529:
+		edid = drm_edid_alloc(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz,
+				ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz));

-:843: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#843: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:1276:
+	KUNIT_EXPECT_EQ(test, ret, -ENOTSUPP);

total: 0 errors, 1 warnings, 4 checks, 834 lines checked
67c3d5377595 drm/tests: bridge: Add test for HDMI output bus formats helper
-:214: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#214: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:957:
+	out_bus_fmts = bridge->funcs->atomic_get_output_bus_fmts(

total: 0 errors, 0 warnings, 1 checks, 212 lines checked
d3c08301379d drm/bridge: Document bridge chain format selection


