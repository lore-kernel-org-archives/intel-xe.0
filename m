Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FDBC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 20:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2CC10E6C9;
	Wed, 28 May 2025 20:06:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411410E6C9;
 Wed, 28 May 2025 20:06:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Panel_Replay_+_Adaptive_s?=
 =?utf-8?q?ync_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 20:06:48 -0000
Message-ID: <174846280820.29574.6632886312625646395@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
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

Series: Panel Replay + Adaptive sync (rev6)
URL   : https://patchwork.freedesktop.org/series/149487/
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
commit 394fd9cdd0af97f5122752db711f0251aa2469c5
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon May 26 15:05:12 2025 +0300

    drm/i915/psr: Do not disable Panel Replay in case VRR is enabled
    
    Allow Panel Replay with VRR. All VRR modes are supposed to work with
    Panel Replay.
    
    Bspec: 68920, 68925
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 76d59d6988dc9194cbd7d3c551c11f47f56f4020 drm-intel
db23a015e389 drm/panelreplay: Panel Replay capability DPCD register definitions
eeac4dcbacf2 drm/dp: Add Panel Replay capability bits from DP2.1 specification
-:33: WARNING:LONG_LINE: line length of 136 exceeds 100 columns
#33: FILE: include/drm/display/drm_dp.h:559:
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT)

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
59003bef27c2 drm/i915/psr: Read all Panel Replay capability registers from DPCD
c10a66cb1c58 drm/i915/alpm: Add PR_ALPM_CTL register definitions
-:29: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#29: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:275:
+#define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1_OR_T2	REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 0)

-:30: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:276:
+#define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 1)

-:31: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#31: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:277:
+#define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T2		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 2)

total: 0 errors, 3 warnings, 0 checks, 16 lines checked
571ab7247ccd drm/i915/alpm: Write PR_ALPM_CTL register
-:32: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:357:
+			if (!(intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &

-:33: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:358:
+						DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR))

total: 0 errors, 2 warnings, 0 checks, 20 lines checked
860fe591380d drm/i915/psr: Add interface to check if AUXLess ALPM is needed by PSR
479abdc71a7c drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
9fef8bb82167 drm/i915/alpm: Move port alpm configuration
-:74: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#74: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:407:
+			PORT_ALPM_CTL_SILENCE_PERIOD(

-:77: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#77: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:410:
+			PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(

-:79: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#79: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:412:
+			PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(

-:81: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#81: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:414:
+			PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(

total: 0 errors, 0 warnings, 4 checks, 93 lines checked
dbded5c0cc09 drm/i915/display: Add PHY_CMN1_CONTROL register definitions
b759e4f7ec79 drm/i915/display: Add function to configure LFPS sending
216a76fcb77c drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
-:25: WARNING:LONG_LINE: line length of 139 exceeds 100 columns
#25: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:338:
+#define  PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION_MASK, val)

-:28: WARNING:LONG_LINE: line length of 138 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:340:
+#define  PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION_MASK, val)

total: 0 errors, 2 warnings, 0 checks, 10 lines checked
394fd9cdd0af drm/i915/psr: Do not disable Panel Replay in case VRR is enabled


