Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FABBECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04B510E82B;
	Tue, 10 Sep 2024 14:45:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7841110E82B;
 Tue, 10 Sep 2024 14:45:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_register_styl?=
 =?utf-8?q?e_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 14:45:01 -0000
Message-ID: <172597950148.980744.6580194644426824566@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725974820.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725974820.git.jani.nikula@intel.com>
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

Series: drm/i915: register style fixes
URL   : https://patchwork.freedesktop.org/series/138475/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 868dcfd819428bf6c51430ceb4d1cc5af070ea9f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 10 16:28:55 2024 +0300

    drm/i915/reg: remove superfluous whitespace
    
    Clean up some whitespace.
    
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 45770b0eec2155dcc4df41438934976f6a8da0d6 drm-intel
336157def331 drm/i915/reg: fix transcoder timing register style
c06a83d192eb drm/i915/reg: fix g4x pipe data/link m/n register style
491d458593a5 drm/i915/reg: fix pipe conf, stat etc. register style
411e6827af1e drm/i915/reg: fix pipe data/link m/n register style
e8039b97c07a drm/i915/reg: fix SKL scaler register style
-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/i915_reg.h:2238:
+#define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
+			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
+			_ID(id, _PS_1B_CTRL, _PS_2B_CTRL))

-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#38: FILE: drivers/gpu/drm/i915/i915_reg.h:2293:
+#define SKL_PS_PWR_GATE(pipe, id) _MMIO_PIPE(pipe,    \
+			_ID(id, _PS_PWR_GATE_1A, _PS_PWR_GATE_2A), \
+			_ID(id, _PS_PWR_GATE_1B, _PS_PWR_GATE_2B))

-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#48: FILE: drivers/gpu/drm/i915/i915_reg.h:2313:
+#define SKL_PS_WIN_POS(pipe, id) _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_WIN_POS_1A, _PS_WIN_POS_2A), \
+			_ID(id, _PS_WIN_POS_1B, _PS_WIN_POS_2B))

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#58: FILE: drivers/gpu/drm/i915/i915_reg.h:2326:
+#define SKL_PS_WIN_SZ(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_WIN_SZ_1A, _PS_WIN_SZ_2A),   \
+			_ID(id, _PS_WIN_SZ_1B, _PS_WIN_SZ_2B))

-:68: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#68: FILE: drivers/gpu/drm/i915/i915_reg.h:2339:
+#define SKL_PS_VSCALE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_VSCALE_1A, _PS_VSCALE_2A),   \
+			_ID(id, _PS_VSCALE_1B, _PS_VSCALE_2B))

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#77: FILE: drivers/gpu/drm/i915/i915_reg.h:2348:
+#define SKL_PS_HSCALE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_HSCALE_1A, _PS_HSCALE_2A),   \
+			_ID(id, _PS_HSCALE_1B, _PS_HSCALE_2B))

-:86: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#86: FILE: drivers/gpu/drm/i915/i915_reg.h:2357:
+#define SKL_PS_VPHASE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_VPHASE_1A, _PS_VPHASE_2A),   \
+			_ID(id, _PS_VPHASE_1B, _PS_VPHASE_2B))

-:96: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#96: FILE: drivers/gpu/drm/i915/i915_reg.h:2372:
+#define SKL_PS_HPHASE(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_HPHASE_1A, _PS_HPHASE_2A),   \
+			_ID(id, _PS_HPHASE_1B, _PS_HPHASE_2B))

-:105: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#105: FILE: drivers/gpu/drm/i915/i915_reg.h:2381:
+#define SKL_PS_ECC_STAT(pipe, id)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
+			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))

-:113: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
#113: FILE: drivers/gpu/drm/i915/i915_reg.h:2389:
+#define GLK_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
+			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B) + (set) * 8)

-:113: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'set' - possible side-effects?
#113: FILE: drivers/gpu/drm/i915/i915_reg.h:2389:
+#define GLK_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
+			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B) + (set) * 8)

total: 0 errors, 0 warnings, 11 checks, 134 lines checked
c5ae7eb3ba20 drm/i915/reg: fix PCH transcoder timing indentation
b6a696e6591d drm/i915/reg: fix PCH transcoder timing and data/link m/n style
-:62: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/i915_reg.h:3200:
+#define PCH_TRANS_VSYNCSHIFT(pipe)	_MMIO_PIPE(pipe, _PCH_TRANS_VSYNCSHIFT_A, _PCH_TRANS_VSYNCSHIFT_B)

total: 0 errors, 1 warnings, 0 checks, 116 lines checked
0f1882e7d88d drm/i915/reg: fix DIP CTL register style
-:68: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#68: FILE: drivers/gpu/drm/i915/i915_reg.h:3278:
+#define HSW_TVIDEO_DIP_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_CTL_A)

-:72: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/i915_reg.h:3282:
+#define HSW_TVIDEO_DIP_AVI_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_AVI_DATA_A + (i) * 4)

-:76: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#76: FILE: drivers/gpu/drm/i915/i915_reg.h:3286:
+#define HSW_TVIDEO_DIP_VS_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VS_DATA_A + (i) * 4)

-:80: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#80: FILE: drivers/gpu/drm/i915/i915_reg.h:3290:
+#define HSW_TVIDEO_DIP_SPD_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_SPD_DATA_A + (i) * 4)

-:84: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#84: FILE: drivers/gpu/drm/i915/i915_reg.h:3294:
+#define HSW_TVIDEO_DIP_GMP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_GMP_DATA_A + (i) * 4)

-:88: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#88: FILE: drivers/gpu/drm/i915/i915_reg.h:3298:
+#define HSW_TVIDEO_DIP_VSC_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VSC_DATA_A + (i) * 4)

-:98: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/i915_reg.h:3308:
+#define GLK_TVIDEO_DIP_DRM_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)

-:113: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#113: FILE: drivers/gpu/drm/i915/i915_reg.h:3323:
+#define HSW_TVIDEO_DIP_GCP(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_GCP_A)

-:121: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#121: FILE: drivers/gpu/drm/i915/i915_reg.h:3333:
+#define ICL_VIDEO_DIP_PPS_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)

total: 0 errors, 9 warnings, 0 checks, 128 lines checked
665a07413a36 drm/i915/reg: fix small register style issues here and there
f20de5f90e4e drm/i915/reg: remove unused DSI register macros
868dcfd81942 drm/i915/reg: remove superfluous whitespace


