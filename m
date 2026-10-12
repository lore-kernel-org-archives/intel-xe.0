Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5878ACA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 04:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1541810ECA1;
	Mon, 12 Oct 2026 04:59:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46FC10EC9A;
 Mon, 12 Oct 2026 04:59:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_HDMI_FRL_for_MTL+_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Oct 2026 04:59:50 -0000
Message-ID: <179178119073.9355.4885655674908120349@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012035806.3361439-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20261012035806.3361439-1-ankit.k.nautiyal@intel.com>
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

Series: Enable HDMI FRL for MTL+ (rev2)
URL   : https://patchwork.freedesktop.org/series/171757/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1e8db5a1ca680ddeb7382f067c49e50ee65cff4a
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Oct 12 09:28:05 2026 +0530

    drm/i915/hdmi: Allow Pipe joiner for HDMI
    
    Pipe joiner is used only with FRL mode, so allow it only when the platform
    and the sink both support FRL.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 0f28405022887336d4fc1fe1a0e1429146c2d431 drm-intel
ff78645a20a2 drm/i915/hdmi: Parse FRL max link rate from VBT
358750e518db drm/i915/hdmi: Add new data members for FRL configuration
6676d55f6bf1 drm/i915/hdmi: Add FRL link rate cap
0ccb693a6bf1 drm/drm_scdc_helper: Add SCDC helper funcs for FRL
16948ec0bca7 drm/i915/display: Add registers for HDMI FRL configuration
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
91c0c459a690 drm/i915/display: Add new members in crtc_state for FRL configuration
fd5908592a62 drm/i915/intel_cx0_phy_regs: Add HDMI FRL SHIFT EN bit in PORT_BUF_CTL_1
4af81f55c76e drm/i915/ddi: Update Transcoder/DDI registers with the frl bits
25101d4e57fa drm/i915/hdmi: Enable Scrambling only for TMDS mode
d125dffe95e9 drm/i915/ddi: Simplify intel_ddi_enable()
1fc37d0f8e28 drm/i915/ddi: Factor out common transcoder/vblank enable sequence
a1de60d8f0b5 drm/i915/ddi: Update HDMI modeset sequence for MTL+
54ee959c6cc3 drm/i915/hdmi: Add function to prepare registers for FRL mode
d4e8732bbd3d drm/i915/hdmi: Add functions for FRL training state machine
55e38ec9d191 drm/i915/intel_hdmi: Add helper to disable FRL
1e54ce562714 drm/i915/hdmi: Reduce FRL rate cap on rate change during training
650fe55c10a7 drm/i915/hdmi: Introduce intel_hdmi_frl_level() for per-lane TxFFE
b740290f2e7a drm/i915/hdmi: Drive per-lane TxFFE during FRL link training
364dce97db8d drm/i915/ltphy: Add PLL tables for HDMI FRL
8fa6652d1dcb drm/i915/ltphy: Add safegaurd when calculation HDMI FRL state
573e973fd390 drm/i915/ltphy: Calculate port clock for HDMI FRL
a7d5f1c8695f drm/i915/ltphy: Verify HDMI FRL tables
016b3aa9dfab drm/i915/ddi_buf: Add Vswing table for HDMI FRL
729a80635c21 drm/i915/hdmi: Add provision for FRL mode while computing output format
eb1ecc9829a2 drm/i915/cx0: Add helper to check if the FRL rate is valid
54ac347bf3a0 drm/i915/lt_phy: Add helper to check if the FRL rate is valid
bfc486aba88d drm/i915/hdmi_frl_dfm_regs: Define DFM registers
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
24d08fbda098 drm/i915/hdmi_frl_dfm: Define frl_dfm structure
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
6e49debf38bc drm/i915/hdmi_frl_dfm: Add non dsc frl capacity computation helpers
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:399: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#399: FILE: drivers/gpu/drm/i915/display/intel_hdmi_frl_dfm.c:361:
+			DIV_ROUND_UP_ULL(mul_u32_u32(tborrowed_ns, frl_dfm->params.ftb_avg_k) * 1000,

total: 0 errors, 2 warnings, 0 checks, 446 lines checked
10afc87b52ad drm/i915/hdmi_frl_dfm: Add support for DFM calculation with DSC
59c22f2365b7 drm/i915/hdmi: Add helper to write FRL CFG register
b94fbfb9ed23 drm/i915/hdmi_frl_dfm: Add helpers to read/write FRL DFM registers
f52b17990f4a drm/i915/hdmi: Rename port clock limit to specify tmds clock
c538705c186b drm/i915/hdmi: Rename port clock valid to specify tmds clock
4d19a5fef4a6 drm/i915/hdmi: Rename mode clock valid to specify tmds clock
-:36: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2066:
+	return intel_hdmi_tmds_mode_clock_valid(&connector->base, clock, has_hdmi_sink, sink_format);

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
414c3d62a587 drm/i915/hdmi: Validate FRL modes in mode_valid using the FRL DFM
-:109: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#109: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2120:
+	status = intel_hdmi_tmds_mode_clock_valid(&connector->base, clock, has_hdmi_sink, sink_format);

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
1772f3279b6d drm/i915/hdmi: Add FRL port clock valid
-:16: WARNING:BAD_SIGN_OFF: Duplicate signature
#16: 
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>

-:17: WARNING:BAD_SIGN_OFF: Duplicate signature
#17: 
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

total: 0 errors, 2 warnings, 0 checks, 51 lines checked
82042d54836c drm/i915/hdmi: Add FRL clock computation based on DFM
7a81ad151b9e drm/i915/hdmi: Add support for sending uevent to user for FRL training failure
76901f6d2fc2 drm/i915/ddi: Wire FRL into the HDMI DDI enable/disable path
224b9e5d886a drm/i915/ltphy: Fix HDMI FRL per-lane TX mapping
ebc600fffd37 drm/i915/hdmi: Add read out for FRL state
884988221bd3 drm/i915/hdmi: Compute FRL Link M/N
ad5dc42a4020 drm/i915/hdmi_frl_dfm: Write and read back FRL Link M/N
b64c1a84b436 drm/i915/hdmi: Use the real pixel clock as crtc_clock for FRL
7973082039d2 drm/i915/display: Add FRL members to the state checker
6e75acf53411 drm/i915/hdmi: Compute output format for HDMI FRL mode
75f3a54085bf drm/i915/hdmi: Add a helper to check non DSC audio support for HDMI FRL
032791495e50 drm/i915/audio: Add the mode pruning logic for HDMI FRL
009b9e678be7 drm/i915/hdmi: Enable FRL based mode clock valid
a2906c5189e0 drm/i915/joiner: Prepare to move joiner helpers to a new file
-:125: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#125: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 125 lines checked
c246a9bac550 drm/i915/joiner: Move joiner candidate helpers to intel_joiner.c
-:187: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__num_joined_pipes' - possible side-effects?
#187: FILE: drivers/gpu/drm/i915/display/intel_joiner.h:21:
+#define for_each_joiner_candidate(__connector, __mode, __num_joined_pipes) \
+	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \
+		for_each_if(intel_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))

-:188: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#188: FILE: drivers/gpu/drm/i915/display/intel_joiner.h:22:
+	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \

-:189: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#189: FILE: drivers/gpu/drm/i915/display/intel_joiner.h:23:
+		for_each_if(intel_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))

total: 0 errors, 2 warnings, 1 checks, 150 lines checked
94b57270b8af drm/i915/joiner: Move joiner pipe mask helper to intel_joiner.c
e16a18ff1586 drm/i915/hdmi: Iterate through joiner candidates in compute_config path
-:85: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#85: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2527:
+		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
76f7666565ef drm/i915/hdmi: Iterate through joiner candidates in mode_valid path
1e8db5a1ca68 drm/i915/hdmi: Allow Pipe joiner for HDMI


