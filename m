Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D73606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 05:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9210E9EC;
	Mon, 26 Oct 2026 05:50:42 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C2210E9EC;
 Mon, 26 Oct 2026 05:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_DP2=2E1_alpm_=28re?=
 =?utf-8?q?v7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 05:50:41 -0000
Message-ID: <179299384134.67200.5251447033022716166@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026054001.799894-1-animesh.manna@intel.com>
In-Reply-To: <20261026054001.799894-1-animesh.manna@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Enable DP2.1 alpm (rev7)
URL   : https://patchwork.freedesktop.org/series/156416/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 10f7d9a530325a5a63d453152a6ee3d5addbde00
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Oct 26 11:09:31 2026 +0530

    drm/i915/dp: Enable AS SDP for DP Panel Replay with AUX-less ALPM
    
    AS SDP for Panel Replay with AUX-less ALPM and the related
    DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE setting are limited to eDP by
    intel_psr_needs_alpm_aux_less(). DP Panel Replay can now use AUX-less
    ALPM as well, so base these on the ALPM state instead.
    
    has_alpm is decided only in the late compute config, after AS SDP has
    been computed. Use alpm_state.aux_less_possible to decide whether AS
    SDP is needed, and has_alpm for the link training DPCD setting, which
    happens with the final state.
    
    intel_psr_needs_alpm_aux_less() is now used only within intel_psr.c,
    so make it static.
    
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch d56ff005f0d16ec136ee31fe3238eb447fefdc1a drm-intel
4e4eecc806a9 drm/i915/alpm: Program zero-based LFPS half cycle duration
-:61: WARNING:LONG_LINE: line length of 139 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:345:
+#define  PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION_MASK, (val) - 1)

-:64: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:347:
+#define  PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION_MASK, (val) - 1)

-:67: WARNING:LONG_LINE: line length of 144 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:349:
+#define  PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION_MASK, (val) - 1)

total: 0 errors, 3 warnings, 0 checks, 29 lines checked
1db19c552d4e drm/dp: Add DPCD definitions for DP2.1 ALPM capability
f6e3a7f187f7 drm/i915/alpm: Move alpm sink capability readout into a separate function
a61af672a28f drm/i915/alpm: alpm_init() for DP2.1
b014acf66bce drm/i915/alpm: Enable debugfs for DP2.1
8fd2113f218a drm/i915/alpm: Refactor Auxless wake time calculation
42c278a10bf8 drm/i915/alpm: Auxless wake time calculation for Xe3p
868d5535839f drm/i915/alpm: Modify AUX_LESS_WAKE_TIME bitfield for xe3lpd
-:89: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#89: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:306:
+#define  ALPM_CTL_AUX_LESS_WAKE_TIME_XE3LPD(val)	REG_FIELD_PREP(ALPM_CTL_AUX_LESS_WAKE_TIME_MASK_XE3LPD, val)

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
a78d90dbeebc drm/i915/alpm: table based establishment period
afc72b40435f drm/i915/alpm: Half LFPS cycle calculation
-:62: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#62: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:111:
+static void get_lfps_period_min_max_time(const struct intel_crtc_state *crtc_state,
+					int *min, int *max)

total: 0 errors, 0 warnings, 1 checks, 57 lines checked
884969592d27 drm/i915/alpm: Modify LFPS cycle count for DP ALPM
-:64: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:755:
+		lfps_ctl_val = PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(get_lfps_cycle_count(crtc_state)) |

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
d1b9bf044a26 drm/i915/alpm: Modify LFPS_CYCLE_COUNT bitfield for xe3lpd
-:57: WARNING:LONG_LINE: line length of 176 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:341:
+#define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_XE3LPD(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK_XE3LPD, (val) - PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN)

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
75df0961013a drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM
2357196d069a drm/i915/alpm: Enable MAC Transmitting LFPS for LT PHY
875ec550f045 drm/i915/alpm: Compute and program switch to active latency
97d7edda3519 drm/i915/alpm: Replace is_edp() with alpm_is_possible()
7b5e61a88eb7 drm/i915/alpm: Disallow ALPM for UHBR link rate
45186e28ab7d drm/i915/alpm: Compute ALPM config before PSR config
ab64f3c29245 drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf
10f7d9a53032 drm/i915/dp: Enable AS SDP for DP Panel Replay with AUX-less ALPM


