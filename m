Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CE1CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 13:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1710F576;
	Fri, 22 May 2026 13:13:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBDE10F576;
 Fri, 22 May 2026 13:13:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_general_DRM_prope?=
 =?utf-8?q?rty_=22color_format=22_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 May 2026 13:13:30 -0000
Message-ID: <177945561011.100701.17951211717289440435@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
In-Reply-To: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
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

Series: Add new general DRM property "color format" (rev12)
URL   : https://patchwork.freedesktop.org/series/157911/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b0a8ecd46d9ab299fd1a35edc298cc3f6d51eb99
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date:   Fri May 22 14:32:19 2026 +0200

    drm/connector: Update docs of "colorspace" for color format prop
    
    The colorspace property's documentation states that BT2020_RGB and
    BT2020_YCC are equivalent, and the output format depends on the driver.
    
    Now that there is a "color format" property that userspace can use to
    explicitly set a format, update the colorspace docs to mention this.
    
    The behaviour here is not changed for userspace that doesn't know about
    the color format property yet, as the color format property defaults to
    "AUTO", where the choice of output format is left up to drivers.
    
    Reviewed-by: Daniel Stone <daniel@fooishbar.org>
    Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ /mt/dim checkpatch 127c8434a6a018110189cdb654719a9844702ff7 drm-intel
71f669d05f25 drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
d86b1d27b6df drm/display: hdmi-state-helper: Use default case for unsupported formats
27dfcbfe50af drm: Add new general DRM property "color format"
27de1857ec15 drm/connector: Let connectors have a say in their color format
-:62: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#62: FILE: include/drm/drm_connector.h:1798:
+	enum drm_connector_color_format (*color_format)(

total: 0 errors, 0 warnings, 1 checks, 46 lines checked
b779ff9d32a2 drm/display: bridge_connector: Use HDMI color format for HDMI conns
5abe797bbd22 drm/bridge: Act on the DRM color format property
-:105: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#105: FILE: drivers/gpu/drm/drm_bridge.c:1292:
+			ret = -ENOTSUPP;

-:111: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#111: FILE: drivers/gpu/drm/drm_bridge.c:1297:
+		if (ret != -ENOTSUPP) {

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
b3feb285e02e drm/atomic-helper: Add HDMI bridge output bus formats helper
-:70: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#70: FILE: drivers/gpu/drm/drm_atomic_helper.c:4131:
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,

-:140: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#140: FILE: include/drm/drm_atomic_helper.h:300:
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,

total: 0 errors, 0 warnings, 2 checks, 101 lines checked
ce5522007463 drm/display: hdmi-state-helper: Act on color format DRM property
-:51: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#51: FILE: drivers/gpu/drm/display/drm_hdmi_state_helper.c:695:
+			drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
+				conn_state->color_format);

total: 0 errors, 0 warnings, 1 checks, 39 lines checked
5a403ea91f34 drm/display: hdmi-state-helper: Try subsampling in mode_valid
5d15acad9163 drm/amdgpu: Implement "color format" DRM property
3f1737f8d112 drm/i915/hdmi: Add YCBCR444 handling for sink formats
bfda35d96865 drm/i915/dp: Add YCBCR444 handling for sink formats
945f9b2a0028 drm/i915/hdmi: Implement "color format" DRM property
082d9c10b81b drm/i915/dp: Implement "color format" DRM property
b19ac7c915b3 drm/rockchip: Add YUV422 output mode constants for VOP2
2df097666139 drm/rockchip: vop2: Add RK3576 to the RG swap special case
76d08401eb0a drm/rockchip: vop2: Recognise 10-bit YUV422 as YUV format
5c4566273fbf drm/rockchip: vop2: Set correct output format for RK3576 YUV422
1ae5e60b5a92 drm/bridge: dw-hdmi-qp: Use common HDMI output bus fmts helper
0734b7814242 drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property
758d152fa648 drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
6347b51a05d8 drm/connector: Register color format property on HDMI connectors
2040666a1833 drm/tests: hdmi: Add tests for the color_format property
-:113: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#113: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2253:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |

-:220: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#220: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2360:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |

total: 0 errors, 0 warnings, 2 checks, 278 lines checked
7918ea892f62 drm/tests: hdmi: Add tests for HDMI helper's mode_valid
-:58: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#58: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2777:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |

-:93: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#93: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2812:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),

-:119: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#119: FILE: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2838:
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),

total: 0 errors, 0 warnings, 3 checks, 126 lines checked
fdf49babefa1 drm/tests: bridge: Add KUnit tests for bridge chain format selection
-:198: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#198: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:231:
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

-:240: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hdmi_write_infoframe_func' - possible side-effects?
#240: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:273:
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

-:240: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hdmi_clear_infoframe_func' - possible side-effects?
#240: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:273:
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

-:418: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#418: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:527:
+		edid = drm_edid_alloc(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz,
+				ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz));

-:844: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#844: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:1274:
+	KUNIT_EXPECT_EQ(test, ret, -ENOTSUPP);

total: 0 errors, 1 warnings, 4 checks, 834 lines checked
00b13e87b7c8 drm/tests: bridge: Add test for HDMI output bus formats helper
-:215: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#215: FILE: drivers/gpu/drm/tests/drm_bridge_test.c:955:
+	out_bus_fmts = bridge->funcs->atomic_get_output_bus_fmts(

total: 0 errors, 0 warnings, 1 checks, 212 lines checked
e743405d05fa drm/bridge: Document bridge chain format selection
b0a8ecd46d9a drm/connector: Update docs of "colorspace" for color format prop


