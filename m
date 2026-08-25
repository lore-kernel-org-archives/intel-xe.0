Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81572C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4036210E924;
	Tue, 25 Aug 2026 07:59:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E32E10E924;
 Tue, 25 Aug 2026 07:59:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_DP2=2E1_alpm_=28re?=
 =?utf-8?q?v5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 07:59:53 -0000
Message-ID: <178764479305.82315.13415333849683178575@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825054536.3455704-1-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
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

Series: Enable DP2.1 alpm (rev5)
URL   : https://patchwork.freedesktop.org/series/156416/
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
commit 130dc5547864e3c936033feea09c35b4aabd0199
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Tue Aug 25 11:15:36 2026 +0530

    drm/i915/alpm: Program zero-based LFPS half cycle duration
    
    The LFPS Half Cycle Duration field, as well as the First and Last LFPS
    Half Cycle Duration fields, in PORT_ALPM_LFPS_CTL are zero-based: per
    Bspec the value programmed must be N_Symbol - 1. get_lfps_half_cycle_clocks()
    returned N_Symbol and programmed it directly into all three fields, making
    each half cycle one symbol clock too long.
    
    Return N_Symbol - 1 so the programmed value matches the zero-based field
    encoding.
    
    Bspec: 71632
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Assisted-by: Claude:claude-opus-4-8
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad drm-intel
c04b8267f0cb drm/i915/alpm: Add DPCD definition for DP2.1 ALPM capability
f427829ab1c8 drm/i915/alpm: Move alpm sink capabality readout in separate function
e392a9445d08 drm/i915/alpm: alpm_init() for DP2.1
390f6cacdec7 drm/i915/alpm: Enable debugfs for DP2.1
c4093d992fc9 drm/i915/alpm: Refactor Auxless wake time calculation
3fbdd9a7669e drm/i915/alpm: Auxless wake time calculation for Xe3p
-:122: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#122: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:469:
+			alpm_ctl |= ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);

-:124: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#124: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:471:
+			alpm_ctl |= ALPM_CTL_AUX_LESS_WAKE_TIME_XE3LPD(crtc_state->alpm_state.aux_less_wake_lines);

-:138: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#138: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:304:
+#define  ALPM_CTL_AUX_LESS_WAKE_TIME_XE3LPD(val)	REG_FIELD_PREP(ALPM_CTL_AUX_LESS_WAKE_TIME_MASK_XE3LPD, val)

total: 0 errors, 3 warnings, 0 checks, 106 lines checked
d5c6768df5ab drm/i915/alpm: table based establishment period
505b3b961aa5 drm/i915/alpm: Half LFPS cycle calculation
f19c517b0d09 drm/i915/alpm: Modify LFPS cycle count for DP ALPM
-:82: WARNING:LONG_LINE: line length of 176 exceeds 100 columns
#82: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:339:
+#define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_XE3LPD(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK_XE3LPD, (val) - PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN)

total: 0 errors, 1 warnings, 0 checks, 64 lines checked
531553729eeb drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM
a079bb115bc9 drm/i915/alpm: Enable MAC Transmitting LFPS for LT PHY
c33ffa3dd09b drm/i915/alpm: Replace is_edp() with alpm_is_possible()
1cbd31f1fd9e drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf
-:215: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#215: FILE: drivers/gpu/drm/i915/display/intel_psr.c:4557:
+							    crtc_state->alpm_state.fast_wake_lines) :

total: 0 errors, 1 warnings, 0 checks, 174 lines checked
5d109dc7ba1a drm/i915/alpm: Compute and program switch to active latency
-:24: CHECK:LINE_SPACING: Please don't use multiple blank lines
#24: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:273:
 
+

-:57: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:357:
+	crtc_state->alpm_state.switch_to_active = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,

-:58: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:358:
+									   get_switch_to_active(crtc_state));

total: 0 errors, 2 warnings, 1 checks, 58 lines checked
130dc5547864 drm/i915/alpm: Program zero-based LFPS half cycle duration
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Bspec the value programmed must be N_Symbol - 1. get_lfps_half_cycle_clocks()

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


