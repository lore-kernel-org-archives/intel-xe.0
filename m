Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E79C5B559
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 10:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4076E10E34A;
	Fri,  6 Jun 2025 10:29:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB32B10E34A;
 Fri,  6 Jun 2025 10:29:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_split_out_dis?=
 =?utf-8?q?play_register_macros_to_a_separate_file_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 10:29:16 -0000
Message-ID: <174920575669.55357.13028630993101838888@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606102256.2080073-1-jani.nikula@intel.com>
In-Reply-To: <20250606102256.2080073-1-jani.nikula@intel.com>
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

Series: drm/i915: split out display register macros to a separate file (rev2)
URL   : https://patchwork.freedesktop.org/series/149831/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 452b0d80ff14c2f85b7b65a3f8cb9ee149398485
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jun 6 13:22:56 2025 +0300

    drm/i915: split out display register macros to a separate file
    
    This is a scripted split of the display related register macros from
    i915_reg.h to display/intel_display_regs.h. As a starting point, move
    all the macros that are only used in display code (or GVT). If there are
    users in core i915 code or soc/, or no users anywhere, keep the macros
    in i915_reg.h. This is done in groups of macros separated by blank
    lines, moving the comments along with the groups.
    
    Some manually picked macro groups are kept/moved regardless of the
    heuristics above.
    
    This is obviously a very crude approach. It's not perfect. But there are
    4.2k lines in i915_reg.h, and its refactoring has ground to a halt. This
    is the big hammer that splits the file to two, and enables further
    cleanup.
    
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 180cee22a876c2dfec1099123ba7ded61fbb24ee drm-intel
452b0d80ff14 drm/i915: split out display register macros to a separate file
-:350: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#350: 
new file mode 100644

-:534: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#534: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:180:
+#define   PHY_STATUS_SPLINE_LDO(phy, ch, spline)        (1 << (8 - (6 * (phy) + 3 * (ch) + (spline))))

-:853: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#853: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:499:
+ * The same register may be used for SDVO or HDMI */

-:934: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#934: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:580:
+ * of the infoframe structure specified by CEA-861. */

-:1091: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#1091: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:737:
+#define   TRANSCONF_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANSCONF_FRAME_START_DELAY_MASK, (x)) /* pre-hsw: 0-3 */

-:1098: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#1098: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:744:
+#define   TRANSCONF_GAMMA_MODE_12BIT		REG_FIELD_PREP(TRANSCONF_GAMMA_MODE_MASK_ILK, 2) /* ilk-ivb */

-:1099: WARNING:LONG_LINE_COMMENT: line length of 106 exceeds 100 columns
#1099: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:745:
+#define   TRANSCONF_GAMMA_MODE_SPLIT		REG_FIELD_PREP(TRANSCONF_GAMMA_MODE_MASK_ILK, 3) /* ivb */

-:1100: WARNING:LONG_LINE_COMMENT: line length of 130 exceeds 100 columns
#1100: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:746:
+#define   TRANSCONF_GAMMA_MODE(x)		REG_FIELD_PREP(TRANSCONF_GAMMA_MODE_MASK_ILK, (x)) /* pass in GAMMA_MODE_MODE_* */

-:1103: WARNING:LONG_LINE_COMMENT: line length of 115 exceeds 100 columns
#1103: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:749:
+#define   TRANSCONF_INTERLACE_W_SYNC_SHIFT_PANEL	REG_FIELD_PREP(TRANSCONF_INTERLACE_MASK, 4) /* gen4 only */

-:1104: WARNING:LONG_LINE_COMMENT: line length of 107 exceeds 100 columns
#1104: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:750:
+#define   TRANSCONF_INTERLACE_W_SYNC_SHIFT	REG_FIELD_PREP(TRANSCONF_INTERLACE_MASK, 5) /* gen4 only */

-:1106: WARNING:LONG_LINE_COMMENT: line length of 107 exceeds 100 columns
#1106: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:752:
+#define   TRANSCONF_INTERLACE_FIELD_0_ONLY	REG_FIELD_PREP(TRANSCONF_INTERLACE_MASK, 7) /* gen3 only */

-:1116: WARNING:LONG_LINE_COMMENT: line length of 114 exceeds 100 columns
#1116: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:762:
+#define   TRANSCONF_INTERLACE_IF_ID_DBL_ILK	REG_FIELD_PREP(TRANSCONF_INTERLACE_MASK_ILK, 4) /* ilk/snb only */

-:1117: WARNING:LONG_LINE_COMMENT: line length of 114 exceeds 100 columns
#1117: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:763:
+#define   TRANSCONF_INTERLACE_PF_ID_DBL_ILK	REG_FIELD_PREP(TRANSCONF_INTERLACE_MASK_ILK, 5) /* ilk/snb only */

-:1126: WARNING:LONG_LINE_COMMENT: line length of 113 exceeds 100 columns
#1126: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:772:
+#define   TRANSCONF_OUTPUT_COLORSPACE_RGB	REG_FIELD_PREP(TRANSCONF_OUTPUT_COLORSPACE_MASK, 0) /* ilk-ivb */

-:1127: WARNING:LONG_LINE_COMMENT: line length of 113 exceeds 100 columns
#1127: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:773:
+#define   TRANSCONF_OUTPUT_COLORSPACE_YUV601	REG_FIELD_PREP(TRANSCONF_OUTPUT_COLORSPACE_MASK, 1) /* ilk-ivb */

-:1128: WARNING:LONG_LINE_COMMENT: line length of 113 exceeds 100 columns
#1128: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:774:
+#define   TRANSCONF_OUTPUT_COLORSPACE_YUV709	REG_FIELD_PREP(TRANSCONF_OUTPUT_COLORSPACE_MASK, 2) /* ilk-ivb */

-:1237: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#1237: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:883:
+#define   PIPE_MISC2_FLIP_INFO_PLANE_SEL(plane_id)	REG_FIELD_PREP(PIPE_MISC2_FLIP_INFO_PLANE_SEL_MASK, (plane_id))

-:1403: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1403: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1049:
+#define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
+			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
+			_ID(id, _PS_1B_CTRL, _PS_2B_CTRL))

-:1430: WARNING:LONG_LINE_COMMENT: line length of 107 exceeds 100 columns
#1430: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1076:
+#define   PS_PIPE_SCALER_LOC_AFTER_OUTPUT_CSC	REG_FIELD_PREP(PS_SCALER_LOCATION_MASK, 0) /* non-linear */

-:1431: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#1431: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1077:
+#define   PS_PIPE_SCALER_LOC_AFTER_CSC		REG_FIELD_PREP(PS_SCALER_LOCATION_MASK, 1) /* linear */

-:1458: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1458: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1104:
+#define SKL_PS_PWR_GATE(pipe, id) _MMIO_PIPE(pipe,    \
+			_ID(id, _PS_PWR_GATE_1A, _PS_PWR_GATE_2A), \
+			_ID(id, _PS_PWR_GATE_1B, _PS_PWR_GATE_2B))

-:1478: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1478: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1124:
+#define SKL_PS_WIN_POS(pipe, id) _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_WIN_POS_1A, _PS_WIN_POS_2A), \
+			_ID(id, _PS_WIN_POS_1B, _PS_WIN_POS_2B))

-:1491: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1491: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1137:
+#define SKL_PS_WIN_SZ(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_WIN_SZ_1A, _PS_WIN_SZ_2A),   \
+			_ID(id, _PS_WIN_SZ_1B, _PS_WIN_SZ_2B))

-:1504: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1504: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1150:
+#define SKL_PS_VSCALE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_VSCALE_1A, _PS_VSCALE_2A),   \
+			_ID(id, _PS_VSCALE_1B, _PS_VSCALE_2B))

-:1513: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1513: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1159:
+#define SKL_PS_HSCALE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_HSCALE_1A, _PS_HSCALE_2A),   \
+			_ID(id, _PS_HSCALE_1B, _PS_HSCALE_2B))

-:1522: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1522: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1168:
+#define SKL_PS_VPHASE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_VPHASE_1A, _PS_VPHASE_2A),   \
+			_ID(id, _PS_VPHASE_1B, _PS_VPHASE_2B))

-:1537: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1537: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1183:
+#define SKL_PS_HPHASE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_HPHASE_1A, _PS_HPHASE_2A),   \
+			_ID(id, _PS_HPHASE_1B, _PS_HPHASE_2B))

-:1546: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1546: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1192:
+#define SKL_PS_ECC_STAT(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
+			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))

-:1554: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1554: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1200:
+#define GLK_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
+			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B) + (set) * 8)

-:1554: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'set' - possible side-effects?
#1554: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1200:
+#define GLK_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
+			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B) + (set) * 8)

-:1563: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#1563: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1209:
+#define GLK_PS_COEF_DATA_SET(pipe, id, set)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B) + (set) * 8)

-:1563: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'set' - possible side-effects?
#1563: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1209:
+#define GLK_PS_COEF_DATA_SET(pipe, id, set)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B) + (set) * 8)

-:1626: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'plane_id' - possible side-effects?
#1626: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1272:
+#define  GEN9_PIPE_PLANE_FLIP_DONE(plane_id) \
+	REG_BIT(((plane_id) >= PLANE_5 ? 16 - PLANE_5 : 3 - PLANE_1) + (plane_id)) /* skl+ */

-:1632: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#1632: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1278:
+#define GEN8_DE_PIPE_IRQ_REGS(pipe)	I915_IRQ_REGS(GEN8_DE_PIPE_IMR(pipe), \
+						      GEN8_DE_PIPE_IER(pipe), \
+						      GEN8_DE_PIPE_IIR(pipe))

-:1823: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#1823: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1469:
+#define CHICKEN_TRANS(display, trans)	(DISPLAY_VER(display) >= 14 ? _MTL_CHICKEN_TRANS(trans) : _CHICKEN_TRANS(trans))

-:1823: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'trans' - possible side-effects?
#1823: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1469:
+#define CHICKEN_TRANS(display, trans)	(DISPLAY_VER(display) >= 14 ? _MTL_CHICKEN_TRANS(trans) : _CHICKEN_TRANS(trans))

-:2164: WARNING:MACRO_ARG_UNUSED: Argument 'pipe' is not used in function-like macro
#2164: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1810:
+#define	 TRANS_DPLLA_SEL(pipe)		0

-:2206: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#2206: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1852:
+#define PCH_TRANS_VSYNCSHIFT(pipe)	_MMIO_PIPE(pipe, _PCH_TRANS_VSYNCSHIFT_A, _PCH_TRANS_VSYNCSHIFT_B)

-:2284: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#2284: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1930:
+#define HSW_TVIDEO_DIP_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_CTL_A)

-:2288: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#2288: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1934:
+#define HSW_TVIDEO_DIP_AVI_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_AVI_DATA_A + (i) * 4)

-:2292: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#2292: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1938:
+#define HSW_TVIDEO_DIP_VS_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VS_DATA_A + (i) * 4)

-:2296: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#2296: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1942:
+#define HSW_TVIDEO_DIP_SPD_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_SPD_DATA_A + (i) * 4)

-:2300: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#2300: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1946:
+#define HSW_TVIDEO_DIP_GMP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_GMP_DATA_A + (i) * 4)

-:2304: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#2304: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1950:
+#define HSW_TVIDEO_DIP_VSC_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VSC_DATA_A + (i) * 4)

-:2314: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#2314: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1960:
+#define GLK_TVIDEO_DIP_DRM_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)

-:2329: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#2329: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1975:
+#define HSW_TVIDEO_DIP_GCP(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_GCP_A)

-:2333: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#2333: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1979:
+#define ICL_VIDEO_DIP_PPS_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)

-:2337: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#2337: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1983:
+#define ICL_VIDEO_DIP_PPS_ECC(dev_priv, trans, i)		_MMIO_TRANS2(dev_priv, trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)

-:2351: WARNING:LONG_LINE_COMMENT: line length of 104 exceeds 100 columns
#2351: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1997:
+#define  TRANS_FRAME_START_DELAY(x)	REG_FIELD_PREP(TRANS_FRAME_START_DELAY_MASK, (x)) /* ibx: 0-3 */

-:2389: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#2389: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2035:
+#define TRANS_DP2_CTL(trans)			_MMIO_TRANS(trans, _TRANS_DP2_CTL_A, _TRANS_DP2_CTL_B)

-:2398: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#2398: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2044:
+#define TRANS_DP2_VFREQHIGH(trans)		_MMIO_TRANS(trans, _TRANS_DP2_VFREQHIGH_A, _TRANS_DP2_VFREQHIGH_B)

-:2400: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#2400: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2046:
+#define  TRANS_DP2_VFREQ_PIXEL_CLOCK(clk_hz)	REG_FIELD_PREP(TRANS_DP2_VFREQ_PIXEL_CLOCK_MASK, (clk_hz))

-:2406: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#2406: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2052:
+#define TRANS_DP2_VFREQLOW(trans)		_MMIO_TRANS(trans, _TRANS_DP2_VFREQLOW_A, _TRANS_DP2_VFREQLOW_B)

-:2410: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#2410: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2056:
+#define DP_MIN_HBLANK_CTL(trans)		_MMIO_TRANS(trans, _DP_MIN_HBLANK_CTL_A, _DP_MIN_HBLANK_CTL_B)

-:2598: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#2598: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2244:
+#define  TRANS_DDI_PORT_SYNC_MASTER_SELECT(x)	REG_FIELD_PREP(TRANS_DDI_PORT_SYNC_MASTER_SELECT_MASK, (x))

-:2637: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#2637: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2283:
+#define  PORT_SYNC_MODE_MASTER_SELECT(x)	REG_FIELD_PREP(PORT_SYNC_MODE_MASTER_SELECT_MASK, (x))

-:2679: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#2679: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2325:
+#define   DP_TP_STATUS_STREAMS_ENABLED_MASK	REG_GENMASK(18, 16) /* 17:16 on hsw but bit 18 mbz */

-:2709: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#2709: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2355:
+#define  DDI_PORT_WIDTH(width)			REG_FIELD_PREP(DDI_PORT_WIDTH_MASK, \
+							       ((width) == 3 ? 4 : (width) - 1))

-:2717: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#2717: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2363:
+#define DDI_BUF_TRANS_LO(port, i)	_MMIO(_PORT(port, _DDI_BUF_TRANS_A, _DDI_BUF_TRANS_B) + (i) * 8)

-:2719: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#2719: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2365:
+#define DDI_BUF_TRANS_HI(port, i)	_MMIO(_PORT(port, _DDI_BUF_TRANS_A, _DDI_BUF_TRANS_B) + (i) * 8 + 4)

-:2724: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#2724: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2370:
+#define DDI_DP_COMP_CTL(pipe)			_MMIO_PIPE(pipe, _DDI_DP_COMP_CTL_A, _DDI_DP_COMP_CTL_B)

-:2737: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#2737: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2383:
+#define DDI_DP_COMP_PAT(pipe, i)		_MMIO(_PIPE(pipe, _DDI_DP_COMP_PAT_A, _DDI_DP_COMP_PAT_B) + (i) * 4)

-:2826: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#2826: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2472:
+#define TRANS_SET_CONTEXT_LATENCY(dev_priv, tran)		_MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)

-:2954: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tc_port' - possible side-effects?
#2954: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2600:
+#define  ICL_DPCLKA_CFGCR0_TC_CLK_OFF(tc_port)	(1 << ((tc_port) < TC_PORT_4 ? \
+						       (tc_port) + 12 : \
+						       (tc_port) - TC_PORT_4 + 21))

-:2958: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#2958: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2604:
+#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	(3 << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-:2959: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#2959: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2605:
+#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	((pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-:2981: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#2981: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2627:
+#define   DG1_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	(_DG1_DPCLKA_PLL_IDX(pll) << DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-:2982: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#2982: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2628:
+#define   DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	(0x3 << DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-:3104: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#3104: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2750:
+#define TGL_DPLL0_DIV0(pll)				_MMIO_PLL(pll, _TGL_DPLL0_DIV0, _TGL_DPLL1_DIV0)

-:3106: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#3106: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2752:
+#define   TGL_DPLL0_DIV0_AFC_STARTUP(val)		REG_FIELD_PREP(TGL_DPLL0_DIV0_AFC_STARTUP_MASK, (val))

-:3226: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'port' - possible side-effects?
#3226: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2872:
+#define DG2_PHY_MISC(port)	((port) == PHY_E ? _MMIO(_DG2_PHY_MISC_TC1) : \
+				 ICL_PHY_MISC(port))

-:3269: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#3269: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2915:
+#define MTL_CLKGATE_DIS_TRANS(dev_priv, trans)			_MMIO_TRANS2(dev_priv, trans, _MTL_CLKGATE_DIS_TRANS_A)

-:3274: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#3274: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2920:
+#define MTL_PIPE_CLKGATE_DIS2(pipe)		_MMIO_PIPE(pipe, _MTL_PIPE_CLKGATE_DIS2_A, _MTL_PIPE_CLKGATE_DIS2_B)

-:3278: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#3278: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2924:
+#define MTL_MEM_SS_INFO_QGV_POINT_LOW(point)	_MMIO(MTL_MEM_SS_INFO_QGV_POINT_OFFSET + (point) * 8)

-:3283: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#3283: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2929:
+#define MTL_MEM_SS_INFO_QGV_POINT_HIGH(point)	_MMIO(MTL_MEM_SS_INFO_QGV_POINT_OFFSET + (point) * 8 + 4)

-:3287: CHECK:LINE_SPACING: Please don't use multiple blank lines
#3287: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2933:
+
+

total: 0 errors, 56 warnings, 20 checks, 6674 lines checked


