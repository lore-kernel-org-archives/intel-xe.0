Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F69C2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 04:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9613910F35A;
	Fri,  7 Aug 2026 04:42:35 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8C210F337;
 Fri,  7 Aug 2026 04:42:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_HDMI_FRL_for_MTL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Aug 2026 04:42:35 -0000
Message-ID: <178607775529.27931.7569938345287674188@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260807041430.229038-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260807041430.229038-1-ankit.k.nautiyal@intel.com>
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

Series: Enable HDMI FRL for MTL+
URL   : https://patchwork.freedesktop.org/series/171757/
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
commit 65d45dcfda2403654560796707d3812b4359cb7a
Author: Vandita Kulkarni <vandita.kulkarni@intel.com>
Date:   Fri Aug 7 09:44:29 2026 +0530

    drm/i915/hdmi: Enable FRL based mode clock valid
    
    Compute frl_mode based on the sink HDMI FRL capability and the maximum
    FRL rate, and pass it through intel_hdmi_mode_clock_valid() so that
    modes can be validated for FRL transmission.
    
    Higher resolution modes like 8K@60, 4K@120 need FRL support. Platforms
    before MTL do not support FRL, so allow modes requiring more than 600MHz
    dotclock to be enumerated only on MTL+ where FRL is supported.
    
    Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 01d30c194951b8794c33f0d7f559bc4a1c9b7630 drm-intel
6eb91eb33ef9 drm/i915/hdmi: Parse frl max link rate from vbt
4718c80b62c5 drm/i915/hdmi: Add new data members for FRL configuration
ce48314bc793 drm/i915/hdmi: Add FRL link rate cap
e613887f4338 drm/drm_scdc_helper: Add SCDC helper funcs for FRL
fb42c38abde2 drm/i915/display: Add registers for HDMI FRL configuration
-:28: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:563:
+#define  TRANS_HDMI_R_B_SCHED_ENABLE(val)		REG_FIELD_PREP(TRANS_HDMI_R_B_SCHED_ENABLE_MASK, val)

-:30: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:565:
+#define  TRANS_HDMI_ACTIVE_CHAR_BUF_THRESH(val)		REG_FIELD_PREP(TRANS_HDMI_ACTIVE_CHAR_BUF_THRESH_MASK, val)

-:32: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:567:
+#define  TRANS_HDMI_MIN_BLANK_CHAR(val)			REG_FIELD_PREP(TRANS_HDMI_MIN_BLANK_CHAR_MASK, val)

-:35: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:570:
+#define  TRANS_HDMI_FRL_PKT_PAYLOAD_MAX(val)		REG_FIELD_PREP(TRANS_HDMI_FRL_PKT_PAYLOAD_MAX_MASK, val)

total: 0 errors, 4 warnings, 0 checks, 32 lines checked
cb120e7d644a drm/i915/display: Add new members in crtc_state for FRL configuration
abd98e4a9b0e drm/i915/intel_cx0_phy_regs: Add HDMI FRL SHIFT EN bit in PORT_BUF_CTL_1
eb80977b6ae5 drm/i915/ddi: Update Transcoder/DDI registers with the frl bits
eee14e8ec47c drm/i915/hdmi: Enable Scrambling only for TMDS mode
508cfd8c6461 drm/i915/ddi: Simplify intel_ddi_enable()
18e4e320a351 drm/i915/ddi: Factor out common transcoder/vblank enable sequence
cf68cb1622ab drm/i915/ddi: Update HDMI modeset sequence for MTL+
78277cd4435f drm/i915/hdmi: Add function to prepare registers for FRL mode
52e8f4fc24e1 drm/i915/hdmi: Add functions for FRL training state machine
d5b037621cea drm/i915/intel_hdmi: Add helper to disable FRL
81ad314398c1 drm/i915/hdmi: Reduce FRL rate cap on rate change during training
8d142e7ea1a8 drm/i915/hdmi: Introduce intel_hdmi_frl_level() for per-lane TxFFE
0a3e0d7144b7 drm/i915/hdmi: Drive per-lane TxFFE during FRL link training
3946abf27ab6 drm/i915/ltphy: Add PLL tables for HDMI FRL
f1a3a105587a drm/i915/ltphy: Add safegaurd when calculation HDMI FRL state
d5d27e1739b0 drm/i915/ltphy: Calculate port clock for HDMI FRL
6148578334eb drm/i915/ltphy: Verify HDMI FRL tables
e844c33f3d8d drm/i915/ddi_buf: Add Vswing table for HDMI FRL
058f1d5dff7a drm/i915/hdmi: Add provision for FRL mode while computing output format
8ea4882b6ecf drm/i915/hdmi: Rename port clock limit to specify tmds clock
113f1e7328fc drm/i915/cx0: Add helper to check if the FRL rate is valid
070f97f17245 drm/i915/lt_phy: Add helper to check if the FRL rate is valid
db9d727351bc drm/i915/hdmi: Rename port clock valid to specify tmds clock
c29b22dfdd35 drm/i915/hdmi: Add FRL port and mode clock valid
4ca14b2c74ec drm/i915/hdmi_frl_dfm_regs: Define DFM registers
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
7f848a5e7616 drm/i915/hdmi_frl_dfm: Define frl_dfm structure
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
055b1b956e93 drm/i915/hdmi_frl_dfm: Add non dsc frl capacity computation helpers
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 435 lines checked
9493a07b4ca1 drm/i915/hdmi_frl_dfm: Add support for DFM calculation with DSC
932ff2438e8e drm/i915/hdmi: Add helper to write FRL CFG register
813624cb0df7 drm/i915/hdmi_frl_dfm: Add helpers to read/write FRL DFM registers
addc42f25797 drm/i915/hdmi_frl_dfm: Add function to compute FRL DFM config
d7e826c3d7c6 drm/i915/hdmi: Add FRL clock computation based on DFM
19af527779b5 drm/i915/hdmi: Add support for sending uevent to user for FRL training failure
d6c4c7e13d40 drm/i915/ddi: Wire FRL into the HDMI DDI enable/disable path
416e8cb96e45 drm/i915/hdmi: Add read out for FRL state
b2696a76871c drm/i915/hdmi_frl_dfm: Handle FRL Link M/N
f9638a1a808b drm/i915/display: Add FRL members to the state checker
114c17d599b2 drm/i915/hdmi: Compute output format for HDMI FRL mode
65d45dcfda24 drm/i915/hdmi: Enable FRL based mode clock valid


