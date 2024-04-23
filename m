Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E081AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 20:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDFD113666;
	Tue, 23 Apr 2024 20:07:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25D113666;
 Tue, 23 Apr 2024 20:07:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_baby_steps_to?=
 =?utf-8?q?wards_removing_implicit_dev=5Fpriv?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 20:07:38 -0000
Message-ID: <171390285869.1607644.4372072181369061067@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713890614.git.jani.nikula@intel.com>
In-Reply-To: <cover.1713890614.git.jani.nikula@intel.com>
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

Series: drm/i915: baby steps towards removing implicit dev_priv
URL   : https://patchwork.freedesktop.org/series/132784/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ccfd5fa76593036fedf97c4300db381dbf9a67a4
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 23 19:45:00 2024 +0300

    drm/i915: pass dev_priv to _MMIO_PIPE2, _MMIO_TRANS2, _MMIO_CURSOR2
    
    Pass the dev_priv parameter to the low-level helpers, and move the
    implicit dev_priv usage one level higher.
    
    sed -i "s/\(_MMIO_PIPE2(\|_MMIO_TRANS2(\|_MMIO_CURSOR2(\)/\1dev_priv, /" \
            $(git ls-files drivers/gpu/drm/i915)
    
    Name the parameter "display", as the generics allow it to be display
    already.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e1dc9638bb47a28181fee1a9a180445ca2a8b9cf drm-intel
cc4047bcb785 drm/i915: convert _MMIO_PIPE3()/_MMIO_PORT3() to accept base
-:26: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:32:
+#define _MMIO_BASE_PIPE3(base, pipe, a, b, c)	_MMIO((base) + _PICK_EVEN_2RANGES(pipe, 1, a, a, b, c))

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#26: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:32:
+#define _MMIO_BASE_PIPE3(base, pipe, a, b, c)	_MMIO((base) + _PICK_EVEN_2RANGES(pipe, 1, a, a, b, c))

-:27: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#27: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:33:
+#define _MMIO_BASE_PORT3(base, pipe, a, b, c)	_MMIO((base) + _PICK_EVEN_2RANGES(pipe, 1, a, a, b, c))

-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:33:
+#define _MMIO_BASE_PORT3(base, pipe, a, b, c)	_MMIO((base) + _PICK_EVEN_2RANGES(pipe, 1, a, a, b, c))

total: 0 errors, 2 warnings, 2 checks, 120 lines checked
ccfd5fa76593 drm/i915: pass dev_priv to _MMIO_PIPE2, _MMIO_TRANS2, _MMIO_CURSOR2
-:59: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:39:
+#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \

-:59: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#59: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:39:
+#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
+						      DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
+						      DISPLAY_MMIO_BASE(display) + (reg))

-:60: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#60: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:40:
+						      DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \

-:62: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:42:
+#define _MMIO_TRANS2(display, tran, reg)	_MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \

-:62: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#62: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:42:
+#define _MMIO_TRANS2(display, tran, reg)	_MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
+						      DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
+						      DISPLAY_MMIO_BASE(display) + (reg))

-:63: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#63: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:43:
+						      DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \

-:65: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:45:
+#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \

-:65: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#65: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:45:
+#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
+						      DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
+						      DISPLAY_MMIO_BASE(display) + (reg))

-:66: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:46:
+						      DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \

-:117: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#117: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:99:
+#define EDP_PSR_AUX_DATA(tran, i)		_MMIO_TRANS2(dev_priv, tran, _SRD_AUX_DATA_A + (i) * 4) /* 5 registers */

-:174: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#174: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:224:
+#define _PSR2_SU_STATUS(tran, index)	_MMIO_TRANS2(dev_priv, tran, _PSR2_SU_STATUS_A + (index) * 4)

-:183: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#183: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:232:
+#define PSR2_MAN_TRK_CTL(tran)					_MMIO_TRANS2(dev_priv, tran, _PSR2_MAN_TRK_CTL_A)

-:228: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#228: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:348:
+#define PORT_ALPM_LFPS_CTL(tran)				_MMIO_TRANS2(dev_priv, tran, _PORT_ALPM_LFPS_CTL_A)

-:472: WARNING:LONG_LINE_COMMENT: line length of 116 exceeds 100 columns
#472: FILE: drivers/gpu/drm/i915/i915_reg.h:2915:
+#define DSPGAMC(plane, i)	_MMIO_PIPE2(dev_priv, plane, _DSPAGAMC + (5 - (i)) * 4) /* plane C only, 6 x u0.8 */

-:532: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#532: FILE: drivers/gpu/drm/i915/i915_reg.h:4841:
+#define HSW_TVIDEO_DIP_AVI_DATA(trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_AVI_DATA_A + (i) * 4)

-:533: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#533: FILE: drivers/gpu/drm/i915/i915_reg.h:4842:
+#define HSW_TVIDEO_DIP_VS_DATA(trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VS_DATA_A + (i) * 4)

-:534: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#534: FILE: drivers/gpu/drm/i915/i915_reg.h:4843:
+#define HSW_TVIDEO_DIP_SPD_DATA(trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_SPD_DATA_A + (i) * 4)

-:535: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#535: FILE: drivers/gpu/drm/i915/i915_reg.h:4844:
+#define HSW_TVIDEO_DIP_GMP_DATA(trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_GMP_DATA_A + (i) * 4)

-:536: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#536: FILE: drivers/gpu/drm/i915/i915_reg.h:4845:
+#define HSW_TVIDEO_DIP_VSC_DATA(trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VSC_DATA_A + (i) * 4)

-:537: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#537: FILE: drivers/gpu/drm/i915/i915_reg.h:4846:
+#define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(dev_priv, trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)

-:538: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#538: FILE: drivers/gpu/drm/i915/i915_reg.h:4847:
+#define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(dev_priv, trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)

-:539: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#539: FILE: drivers/gpu/drm/i915/i915_reg.h:4848:
+#define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(dev_priv, trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)

-:603: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#603: FILE: drivers/gpu/drm/i915/i915_reg.h:5625:
+#define TRANS_SET_CONTEXT_LATENCY(tran)		_MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)

-:621: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#621: FILE: drivers/gpu/drm/i915/i915_reg.h:6152:
+#define MTL_CLKGATE_DIS_TRANS(trans)			_MMIO_TRANS2(dev_priv, trans, _MTL_CLKGATE_DIS_TRANS_A)

total: 0 errors, 21 warnings, 3 checks, 551 lines checked


