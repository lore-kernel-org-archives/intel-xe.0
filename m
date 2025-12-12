Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D9D59D94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 20:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F0A10E35A;
	Fri, 12 Dec 2025 20:45:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD5010E35A;
 Fri, 12 Dec 2025 20:45:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Clean_up_l?=
 =?utf-8?q?ink_BW/DSC_slice_config_computation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 20:45:16 -0000
Message-ID: <176557231668.82534.7352580911326795700@a3b018990fe9>
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

Series: drm/i915/dp: Clean up link BW/DSC slice config computation (rev3)
URL   : https://patchwork.freedesktop.org/series/158181/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e1f64154009e17f73733d9377304bd71733e3e69
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Dec 12 20:17:02 2025 +0200

    drm/i915/dp: Use intel_dp_dsc_get_slice_config()
    
    Simplify things by computing the detailed slice configuration using
    intel_dp_dsc_get_slice_config(), instead of open-coding the same.
    
    While at it add a TODO comment to intel_dp_dsc_compute_config() to
    explore if it's worth increasing the number of VDSC stream engines used,
    in order to reduce the minimum CDCLK required.
    
    v2: Add a TODO comment to intel_dp_dsc_compute_config() to explore if
        it's worth increasing the number of slices in order to use a lower
        CDCLK. (Jouni)
    
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 90eba5e4087d6932c174f97637833862c9f9ec25 drm-intel
a14ad448c8d1 drm/dp: Parse all DSC slice count caps for eDP 1.5
532bea0547f1 drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
4cc56c17cdbf drm/i915/dp: Fix DSC sink's slice count capability check
838c2cc94e36 drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp()
0f948f8cda4a drm/i915/dp: Use a mode's crtc_clock vs. clock during state computation
7b9ad25e7fe9 drm/i915/dp: Factor out intel_dp_link_bw_overhead()
a1405cd6a5ff drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
4b33c67ecd5f drm/i915/dp: Use the effective data rate for DP BW calculation
f16cae75d5b7 drm/i915/dp: Use the effective data rate for DP compressed BW calculation
143842280262 drm/i915/dp: Account with MST, SSC BW overhead for uncompressed DP-MST stream BW
deb3c7766c42 drm/i915/dp: Account with DSC BW overhead for compressed DP-SST stream BW
e69507626454 drm/i915/dp: Account with pipe joiner max compressed BPP limit for DP-MST and eDP
2bf8f5c179e7 drm/i915/dp: Drop unused timeslots param from dsc_compute_link_config()
85b742b552b2 drm/i915/dp: Factor out align_max_sink_dsc_input_bpp()
e72d453f0d35 drm/i915/dp: Factor out align_max_vesa_compressed_bpp_x16()
1775f3debfb9 drm/i915/dp: Fail state computation for invalid min/max link BPP values
-:23: WARNING:LONG_LINE: line length of 191 exceeds 100 columns
#23: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2657:
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " max link_bpp " FXP_Q4_FMT "\n",

total: 0 errors, 1 warnings, 0 checks, 21 lines checked
ffb7d0eea2e9 drm/i915/dp: Fail state computation for invalid max throughput BPP value
b5a80d5f468a drm/i915/dp: Fail state computation for invalid max sink compressed BPP value
f0d9464e73fa drm/i915/dp: Fail state computation for invalid DSC source input BPP values
5d0f0bbeb4b4 drm/i915/dp: Align min/max DSC input BPPs to sink caps
82af4d41d821 drm/i915/dp: Align min/max compressed BPPs when calculating BPP limits
10dadcb0bdea drm/i915/dp: Drop intel_dp parameter from intel_dp_compute_config_link_bpp_limits()
c5d022262a77 drm/i915/dp: Pass intel_output_format to intel_dp_dsc_sink_{min_max}_compressed_bpp()
56b53511ffdc drm/i915/dp: Pass mode clock to dsc_throughput_quirk_max_bpp_x16()
ba338e43fe4b drm/i915/dp: Factor out compute_min_compressed_bpp_x16()
24b1f081f57a drm/i915/dp: Factor out compute_max_compressed_bpp_x16()
aa9678663671 drm/i915/dp: Add intel_dp_mode_valid_with_dsc()
c89780fa564b drm/i915/dp: Unify detect and compute time DSC mode BW validation
2c0e4cdfe6e4 drm/i915/dp: Use helpers to align min/max compressed BPPs
-:18: WARNING:BAD_SIGN_OFF: Duplicate signature
#18: 
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
ab8f30d02306 drm/i915/dp: Simplify computing DSC BPPs for eDP
c05ff39a7003 drm/i915/dp: Simplify computing DSC BPPs for DP-SST
eb1f118aed86 drm/i915/dp: Simplify computing forced DSC BPP for DP-SST
81fca1518efd drm/i915/dp: Unify computing compressed BPP for DP-SST and eDP
0bd51c8b55b7 drm/i915/dp: Simplify eDP vs. DP compressed BPP computation
cd08f7caad73 drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST
96ff7d265528 drm/i915/dsc: Track the detaild DSC slice configuration
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
2 pipes-per-line x 2 streams-per-pipe x 2 slices-per-stream = 8 slices-per-line

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
533812fcb553 drm/i915/dsc: Track the DSC stream count in the DSC slice config state
3bec5fc1360b drm/i915/dsi: Move initialization of DSI DSC streams-per-pipe to fill_dsc()
7f2c8ac24f43 drm/i915/dsi: Track the detailed DSC slice configuration
a1f9349b3002 drm/i915/dp: Track the detailed DSC slice configuration
698da02e26c4 drm/i915/dsc: Switch to using intel_dsc_line_slice_count()
f2fd257a5378 drm/i915/dp: Factor out intel_dp_dsc_min_slice_count()
c6589ec007c1 drm/i915/dp: Use int for DSC slice count variables
698d2e7ffc76 drm/i915/dp: Rename test_slice_count to slices_per_line
7cfd0e3575e1 drm/i915/dp: Simplify the DSC slice config loop's slices-per-pipe iteration
12606827bc1e drm/i915/dsc: Add intel_dsc_get_slice_config()
-:112: CHECK:LINE_SPACING: Please don't use multiple blank lines
#112: FILE: drivers/gpu/drm/i915/display/intel_vdsc.c:90:
+
+

total: 0 errors, 0 warnings, 1 checks, 104 lines checked
7a668df79a48 drm/i915/dsi: Use intel_dsc_get_slice_config()
e7fc5d5f2457 drm/i915/dp: Unify DP and eDP slice count computation
b128ae3e6a7c drm/i915/dp: Add intel_dp_dsc_get_slice_config()
e1f64154009e drm/i915/dp: Use intel_dp_dsc_get_slice_config()


