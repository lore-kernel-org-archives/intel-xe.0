Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D2CCFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 20:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2AA10E886;
	Thu, 27 Nov 2025 20:28:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F2710E899;
 Thu, 27 Nov 2025 20:28:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Clean_up_l?=
 =?utf-8?q?ink_BW/DSC_slice_config_computation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 20:28:03 -0000
Message-ID: <176427528355.36740.5733436195651872892@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127175023.1522538-1-imre.deak@intel.com>
In-Reply-To: <20251127175023.1522538-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Clean up link BW/DSC slice config computation
URL   : https://patchwork.freedesktop.org/series/158181/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 56ce135820f8ff0e6602953b1e7aea25fff207f4
Author: Imre Deak <imre.deak@intel.com>
Date:   Thu Nov 27 19:50:23 2025 +0200

    drm/i915/dp: Use intel_dp_dsc_get_slice_config()
    
    Simplify things by computing the detailed slice configuration using
    intel_dp_dsc_get_slice_config(), instead of open-coding the same.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch d858d76d3596e85f00b062a894e38e7fda3d9916 drm-intel
64341df08911 drm/dp: Parse all DSC slice count caps for eDP 1.5
fa01f242ceaa drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
b7e8b9e9acfd drm/i915/dp: Fix DSC sink's slice count capability check
966768b34612 drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp()
2491ba0e6d49 drm/i915/dp: Use a mode's crtc_clock vs. clock during state computation
8912be8af7b6 drm/i915/dp: Factor out intel_dp_link_bw_overhead()
cd7af982ca7e drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
e831be48def7 drm/i915/dp: Use the effective data rate for DP BW calculation
4ca8b5cd7b94 drm/i915/dp: Use the effective data rate for DP compressed BW calculation
9341a38bff31 drm/i915/dp: Account with MST, SSC BW overhead for uncompressed DP-MST stream BW
331012ff9a15 drm/i915/dp: Account with DSC BW overhead for compressed DP-SST stream BW
fb8971dc28c5 drm/i915/dp: Account with pipe joiner max compressed BPP limit for DP-MST and eDP
28bc5460f9f8 drm/i915/dp: Drop unused timeslots param from dsc_compute_link_config()
f82324c69c61 drm/i915/dp: Factor out align_max_sink_dsc_input_bpp()
654de9436624 drm/i915/dp: Factor out align_max_vesa_compressed_bpp_x16()
3ba88c5e4245 drm/i915/dp: Fail state computation for invalid min/max link BPP values
-:22: WARNING:LONG_LINE: line length of 191 exceeds 100 columns
#22: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2657:
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " max link_bpp " FXP_Q4_FMT "\n",

total: 0 errors, 1 warnings, 0 checks, 21 lines checked
ea064b53d1eb drm/i915/dp: Fail state computation for invalid max throughput BPP value
78194274166b drm/i915/dp: Fail state computation for invalid max sink compressed BPP value
a367a04b3feb drm/i915/dp: Fail state computation for invalid DSC source input BPP values
56f3df1f1134 drm/i915/dp: Align min/max DSC input BPPs to sink caps
a022353eb347 drm/i915/dp: Align min/max compressed BPPs when calculating BPP limits
419f79280147 drm/i915/dp: Drop intel_dp parameter from intel_dp_compute_config_link_bpp_limits()
5d35de4db8fc drm/i915/dp: Pass intel_output_format to intel_dp_dsc_sink_{min_max}_compressed_bpp()
2539108fee66 drm/i915/dp: Pass mode clock to dsc_throughput_quirk_max_bpp_x16()
fd71400a6b90 drm/i915/dp: Factor out compute_min_compressed_bpp_x16()
9e0d1e34830a drm/i915/dp: Factor out compute_max_compressed_bpp_x16()
4ef8e9d619e3 drm/i915/dp: Add intel_dp_mode_valid_with_dsc()
10ef3b0de2cc drm/i915/dp: Unify detect and compute time DSC mode BW validation
e60e175dc16e drm/i915/dp: Use helpers to align min/max compressed BPPs
f03f904d3985 drm/i915/dp: Simplify computing DSC BPPs for eDP
13a04ffc50dc drm/i915/dp: Simplify computing DSC BPPs for DP-SST
2eca4cbcfc39 drm/i915/dp: Simplify computing forced DSC BPP for DP-SST
ebb208273e3c drm/i915/dp: Unify computing compressed BPP for DP-SST and eDP
e4d8ca7aa954 drm/i915/dp: Simplify eDP vs. DP compressed BPP computation
8f0bfce75f6a drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST
54ecae22fd00 drm/i915/dsc: Track the detaild DSC slice configuration
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
2 pipes-per-line x 2 streams-per-pipe x 2 slices-per-stream = 8 slices-per-line

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
2efbfc05c876 drm/i915/dsc: Track the DSC stream count in the DSC slice config state
059f55447eba drm/i915/dsi: Move initialization of DSI DSC streams-per-pipe to fill_dsc()
c5658987797d drm/i915/dsi: Track the detailed DSC slice configuration
3531a16b7fd0 drm/i915/dp: Track the detailed DSC slice configuration
6b6c71fd9269 drm/i915/dsc: Switch to using intel_dsc_line_slice_count()
0b336bf6c481 drm/i915/dp: Factor out intel_dp_dsc_min_slice_count()
5582a6edf283 drm/i915/dp: Use int for DSC slice count variables
93531abf81ad drm/i915/dp: Rename test_slice_count to slices_per_line
8ad633f8fe2f drm/i915/dp: Simplify the DSC slice config loop's slices-per-pipe iteration
4c99f145d612 drm/i915/dsc: Add intel_dsc_get_slice_config()
-:108: CHECK:LINE_SPACING: Please don't use multiple blank lines
#108: FILE: drivers/gpu/drm/i915/display/intel_vdsc.c:90:
+
+

total: 0 errors, 0 warnings, 1 checks, 104 lines checked
f7537ea5783f drm/i915/dsi: Use intel_dsc_get_slice_config()
7eaed6595c41 drm/i915/dp: Unify DP and eDP slice count computation
1d87df9af494 drm/i915/dp: Add intel_dp_dsc_get_slice_config()
56ce135820f8 drm/i915/dp: Use intel_dp_dsc_get_slice_config()


