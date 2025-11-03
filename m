Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B82CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 18:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826F710E45B;
	Mon,  3 Nov 2025 18:36:13 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270D10E21E;
 Mon,  3 Nov 2025 18:36:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_i?=
 =?utf-8?q?nitial_support_for_Xe3p=5FLPD_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 18:36:13 -0000
Message-ID: <176219497313.11629.11525404725529460681@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251103-xe3p_lpd-basic-enabling-v3-0-00e87b510ae7@intel.com>
In-Reply-To: <20251103-xe3p_lpd-basic-enabling-v3-0-00e87b510ae7@intel.com>
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

Series: drm/i915/display: Add initial support for Xe3p_LPD (rev3)
URL   : https://patchwork.freedesktop.org/series/155951/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ebcc4eb376de3b6b372c407c7e1f89ad76b471c5
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Nov 3 14:18:20 2025 -0300

    drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power
    
    Bspec states that the new AUX power enable/disable sequences are
    associated with the LT PHY.  As such, use HAS_LT_PHY() instead of IP
    checks in those paths in the driver code.
    
    While at it, also move the comment that we can't use the power status
    flag to the "else" branch, since that comment is not applicable for the
    LT PHY.
    
    Bspec: 68967
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 0c721eb082329d9ba1ef257e3cdfa8109ae9de32 drm-intel
e2087f347c57 drm/i915/xe3p_lpd: Add Xe3p_LPD display IP features
17d7850e059f drm/i915/xe3p_lpd: Drop north display reset option programming
4618b247d937 drm/i915/display: Use braces for if-ladder in intel_bw_init_hw()
c85c42ac9413 drm/i915/xe3p_lpd: Update bandwidth parameters
81efe6b3ed42 drm/i915/xe3p_lpd: Expand bifield masks dbuf blocks fields
fe797ea5a8bf drm/i915/xe3p_lpd: Horizontal flip support for linear surfaces
e09848197031 drm/i915/xe3p_lpd: Remove gamma,csc bottom color checks
9e91a2da1ee9 drm/i915/xe3p_lpd: Add CDCLK table
19f7a3fd244d drm/i915/xe3p_lpd: Load DMC firmware
57dfc3e18f2e drm/i915/xe3p_lpd: Drop support for interlace mode
caa6c58a0718 drm/i915/xe3p_lpd: Extend Wa_16025573575
1b72f4536b0e drm/i915/xe3p_lpd: Don't allow odd ypan or ysize with semiplanar format
608afa0545a9 drm/i915/xe3p_lpd: Reload DMC MMIO for pipes C and D
7aa8107ae409 drm/i915/wm: don't use method1 in Xe3p_LPD onwards
4d6f6e099722 drm/i915/dram: Add field ecc_impacting_de_bw
02e15c664545 drm/i915/xe3p_lpd: Underrun debuggability and error codes/hints
7b98f9e80043 drm/i915/xe3p_lpd: Log FBC-related debug info for PIPE underrun
b532b2763aae drm/i915/xe3p_lpd: Adapt to updates on MBUS_CTL/DBUF_CTL registers
-:95: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#95: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:41:
+#define   MBUS_JOIN_PIPE_SELECT(pipe)			REG_FIELD_PREP(MBUS_JOIN_PIPE_SELECT_MASK, pipe)

-:98: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:44:
+#define   XE3P_MBUS_TRANSLATION_THROTTLE_MIN(val)	REG_FIELD_PREP(XE3P_MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

-:100: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#100: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:46:
+#define   MBUS_TRANSLATION_THROTTLE_MIN(val)		REG_FIELD_PREP(MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

-:134: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#134: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:68:
+#define  DBUF_TRACKER_STATE_SERVICE(x)			REG_FIELD_PREP(DBUF_TRACKER_STATE_SERVICE_MASK, x)

-:136: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#136: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:70:
+#define  XE3P_DBUF_MIN_TRACKER_STATE_SERVICE(x)		REG_FIELD_PREP(XE3P_DBUF_MIN_TRACKER_STATE_SERVICE_MASK, x)

total: 0 errors, 5 warnings, 0 checks, 92 lines checked
8702f0f89a16 drm/i915/wm: Do not make latency values monotonic on Xe3 onward
d972157fd2ff drm/i915/xe3p_lpd: Always apply WaWmMemoryReadLatency
eaa22a959b36 drm/i915/xe3p_lpd: Enable system caching for FBC
-:109: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#109: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:133:
+#define   FBC_SYS_CACHE_START_BASE(base)        REG_FIELD_PREP(FBC_SYS_CACHE_START_BASE_MASK, (base))

-:111: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#111: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:135:
+#define   FBC_SYS_CACHEABLE_RANGE(range)        REG_FIELD_PREP(FBC_SYS_CACHEABLE_RANGE_MASK, (range))

total: 0 errors, 2 warnings, 0 checks, 90 lines checked
d80d337d1fbc drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
5cec3f2db1e9 drm/i915/power: Use intel_encoder_is_tc()
83c3cad3a9dd drm/i915/display: Handle dedicated external ports in intel_encoder_is_tc()
fa1e46ee3578 drm/i915/xe3p_lpd: Extend Type-C flow for static DDI allocation
-:49: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tc_port' - possible side-effects?
#49: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2932:
+#define   IOM_DDI_CONSUMER_STATIC_TC(tc_port)	IOM_DDI_CONSUMER(tc_port, 0x8 + (tc_port))

total: 0 errors, 0 warnings, 1 checks, 219 lines checked
e4f3853257cd drm/i915/nvls: Add NVL-S display support
fe0b28bfd784 drm/i915/display: Use platform check in HAS_LT_PHY()
55322e769f35 drm/i915/display: Move HAS_LT_PHY() to intel_display_device.h
ebcc4eb376de drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power


