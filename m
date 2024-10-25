Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F870D1038E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 02:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6DB10E0CF;
	Fri, 25 Oct 2024 02:03:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A9910E0CF;
 Fri, 25 Oct 2024 02:03:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rt_I915=5FSTATE=5FWARN=28=29_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 02:03:38 -0000
Message-ID: <172982181862.1330037.8916330295485792932@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024162510.2410128-1-jani.nikula@intel.com>
In-Reply-To: <20241024162510.2410128-1-jani.nikula@intel.com>
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

Series: drm/i915/display: convert I915_STATE_WARN() to struct intel_display
URL   : https://patchwork.freedesktop.org/series/140450/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c259fc3bfc0056d95d6b555457d7a5155fe5281
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Oct 24 19:25:10 2024 +0300

    drm/i915/display: convert I915_STATE_WARN() to struct intel_display
    
    Convert I915_STATE_WARN() to struct intel_display *, and rename to
    INTEL_DISPLAY_STATE_WARN(). Do some minor opportunistic struct
    drm_i915_private to struct intel_display conversions while at it.
    
    v2: crtc_state may be NULL in intel_connector_verify_state()
    
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 75eab7b9ee32a121d95a42ac704b679097f1fac4 drm-intel
3c259fc3bfc0 drm/i915/display: convert I915_STATE_WARN() to struct intel_display
-:156: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#156: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3401:
+			INTEL_DISPLAY_STATE_WARN(display, mpll_hw_state->mpllb[i] != mpll_sw_state->mpllb[i],

-:167: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#167: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3408:
+			INTEL_DISPLAY_STATE_WARN(display, mpll_hw_state->mplla[i] != mpll_sw_state->mplla[i],

-:264: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#264: FILE: drivers/gpu/drm/i915/display/intel_display.h:594:
+#define INTEL_DISPLAY_STATE_WARN(__display, condition, format...) ({	\
 	int __ret_warn_on = !!(condition);				\
 	if (unlikely(__ret_warn_on))					\
+		if (!drm_WARN((__display)->drm, (__display)->params.verbose_state_checks, format)) \
+			drm_err((__display)->drm, format);		\
 	unlikely(__ret_warn_on);					\
 })

-:349: WARNING:LONG_LINE: line length of 154 exceeds 100 columns
#349: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:1212:
+				 (intel_de_read(display, UTIL_PIN_CTL) & (UTIL_PIN_ENABLE | UTIL_PIN_MODE_MASK)) == (UTIL_PIN_ENABLE | UTIL_PIN_MODE_PWM),

-:549: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#549: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:4709:
+					 pll->info->name, pipe_name(crtc->pipe), pll->state.pipe_mask);

-:576: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#576: FILE: drivers/gpu/drm/i915/display/intel_fdi.c:41:
+					  TRANS_DDI_FUNC_CTL(display, cpu_transcoder)) & TRANS_DDI_FUNC_ENABLE;

-:914: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#914: FILE: drivers/gpu/drm/i915/display/intel_pch_display.c:89:
+				 intel_crt_port_enabled(dev_priv, PCH_ADPA, &port_pipe) && port_pipe == pipe,

-:923: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#923: FILE: drivers/gpu/drm/i915/display/intel_pch_display.c:94:
+				 intel_lvds_port_enabled(dev_priv, PCH_LVDS, &port_pipe) && port_pipe == pipe,

-:1033: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#1033: FILE: drivers/gpu/drm/i915/display/intel_snps_phy.c:2024:
+				 "[CRTC:%d:%s] mismatch in MPLLB: %s (expected 0x%08x, found 0x%08x)", \

total: 0 errors, 8 warnings, 1 checks, 947 lines checked


