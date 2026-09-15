Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C04EC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 18:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC3810F41F;
	Tue, 15 Sep 2026 18:50:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE6F10F3FA;
 Tue, 15 Sep 2026 18:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_DP2=2E1_alpm_=28re?=
 =?utf-8?q?v6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Sep 2026 18:50:29 -0000
Message-ID: <178949822910.166934.2143706588673872909@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915180449.277933-1-animesh.manna@intel.com>
In-Reply-To: <20260915180449.277933-1-animesh.manna@intel.com>
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

Series: Enable DP2.1 alpm (rev6)
URL   : https://patchwork.freedesktop.org/series/156416/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e44aefa187485f329a8fd97334120e02cd0700ec
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Tue Sep 15 23:34:49 2026 +0530

    drm/i915/alpm: Disallow ALPM for UHBR link rate
    
    DP2.1 ALPM is not supported on UHBR (128b/132b) link rates on the NVL
    platform. Reject the ALPM parameter computation for external DP running
    at a UHBR rate on display version 35, so that ALPM (and the Panel Replay
    and LOBF features that rely on it) is not enabled in that case. eDP is
    excluded so eDP ALPM keeps working at any link rate.
    
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 drm-intel
2461ca19859d drm/i915/alpm: Add DPCD definition for DP2.1 ALPM capability
c5f13e46e7e5 drm/i915/alpm: Move alpm sink capability readout into a separate function
4d07ad36aec5 drm/i915/alpm: alpm_init() for DP2.1
-:36: ERROR:CODE_INDENT: code indent should use tabs where possible
#36: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:52:
+^I        connector->base.connector_type == DRM_MODE_CONNECTOR_eDP;$

total: 1 errors, 0 warnings, 0 checks, 55 lines checked
82eaee8b1b82 drm/i915/alpm: Enable debugfs for DP2.1
8ab97aeaf921 drm/i915/alpm: Refactor Auxless wake time calculation
217676043eb0 drm/i915/alpm: Auxless wake time calculation for Xe3p
c4508b8f6726 drm/i915/alpm: Modify AUX_LESS_WAKE_TIME bitfield for xe3lpd
-:35: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:616:
+			alpm_ctl |= ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);

-:37: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#37: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:618:
+			alpm_ctl |= ALPM_CTL_AUX_LESS_WAKE_TIME_XE3LPD(crtc_state->alpm_state.aux_less_wake_lines);

-:51: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#51: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:306:
+#define  ALPM_CTL_AUX_LESS_WAKE_TIME_XE3LPD(val)	REG_FIELD_PREP(ALPM_CTL_AUX_LESS_WAKE_TIME_MASK_XE3LPD, val)

total: 0 errors, 3 warnings, 0 checks, 23 lines checked
6ce6326e92d2 drm/i915/alpm: table based establishment period
75717c7b72db drm/i915/alpm: Half LFPS cycle calculation
-:61: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#61: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:104:
+static void get_lfps_period_min_max_time(const struct intel_crtc_state *crtc_state,
+					int *min, int *max)

total: 0 errors, 0 warnings, 1 checks, 57 lines checked
4725d687823f drm/i915/alpm: Modify LFPS cycle count for DP ALPM
-:54: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:792:
+		lfps_ctl_val = PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(get_lfps_cycle_count(crtc_state)) |

total: 0 errors, 1 warnings, 0 checks, 37 lines checked
139c6e7be765 drm/i915/alpm: Modify LFPS_CYCLE_COUNT bitfield for xe3lpd
-:57: WARNING:LONG_LINE: line length of 176 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:341:
+#define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_XE3LPD(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK_XE3LPD, (val) - PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN)

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
497b0f084edc drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM
da05aac74844 drm/i915/alpm: Enable MAC Transmitting LFPS for LT PHY
98d744665248 drm/i915/alpm: Replace is_edp() with alpm_is_possible()
2bfd7ca45952 drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf
-:276: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#276: FILE: drivers/gpu/drm/i915/display/intel_psr.c:4591:
+							    crtc_state->alpm_state.fast_wake_lines) :

total: 0 errors, 1 warnings, 0 checks, 208 lines checked
18f1bbb9f066 drm/i915/alpm: Compute and program switch to active latency
-:59: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:388:
+	crtc_state->alpm_state.switch_to_active = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,

-:60: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#60: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:389:
+									   get_switch_to_active(crtc_state));

total: 0 errors, 2 warnings, 0 checks, 54 lines checked
bc59e89159dc drm/i915/alpm: Program zero-based LFPS half cycle duration
-:41: WARNING:LONG_LINE: line length of 139 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:349:
+#define  PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION_MASK, (val) - 1)

-:44: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:351:
+#define  PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION_MASK, (val) - 1)

-:47: WARNING:LONG_LINE: line length of 144 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:353:
+#define  PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION_MASK, (val) - 1)

total: 0 errors, 3 warnings, 0 checks, 20 lines checked
e44aefa18748 drm/i915/alpm: Disallow ALPM for UHBR link rate


