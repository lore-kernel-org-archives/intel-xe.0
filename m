Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E477EC02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 15:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A913F10E9AE;
	Fri, 24 Jan 2025 15:19:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D7510E99B;
 Fri, 24 Jan 2025 15:19:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 15:19:14 -0000
Message-ID: <173773195456.4056260.8771512057366151853@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev2)
URL   : https://patchwork.freedesktop.org/series/141152/
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
commit d76ff1cdee2fbf05b88ccf4c695fe513c2e3d446
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Jan 24 20:30:20 2025 +0530

    drm/i915/display: Use VRR timings for MTL+ in modeset sequence
    
    While enabling pipe currently we use the non vrr timings first and then
    enable the VRR timings later.
    From MTL+ we will always have VRR timing generarator in use, so start
    the transcoder in vrr mode.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 897537fb818365733977947214c799d61675895f drm-intel
191d3c90c437 drm/i915/vrr: Add crtc_state dump for vrr.vsync params
-:24: WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#24: FILE: drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:300:
+	drm_printf(&p, "vrr: vmin vblank: %d, vmax vblank: %d, vmin vtotal: %d, vmax vtotal: %d vsync start: %d vsync end %d \n",

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
e3defeec2843 drm/i915/vrr: Compute vrr.vsync_{start, end} during full modeset
e855abf106aa drm/i915/dp: fix the Adaptive sync Operation mode for SDP
44dcf059fa8d drm/i915/dp: Compute as_sdp.vtotal based on vrr timings
9ad7c622ce8e drm/i915/dp: Compute as_sdp based on if vrr possible
b02a75a92e10 drm/i915/display: Move as sdp params change to fastset
1bf3eacb2d49 drm/i915/vrr: Remove unwanted comment
d7133f13f7d5 drm/i915:vrr: Refactor VRR timing setup into a separate function
ae90f1d3b0af drm/i915:vrr: Separate out functions to compute vmin and vmax
5393ba549966 drm/i915/vrr: Make helpers for cmrr and vrr timings
e191f2e54532 drm/i915/vrr: Avoid prepare vrr timings for cmrr
f2af52f3208a drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
06dc7eb4ec20 drm/i915/vrr: Introduce new field for VRR mode
e658be4fb8cf drm/i915/vrr: Fill VRR timing generator mode for CMRR and VRR
c3e80f8a28ea drm/i915/display: Remove vrr.enable and instead check vrr.mode != NONE
de231355adf6 drm/i915/display: Absorb cmrr attributes into vrr struct
06d0010f3c14 drm/i915/display: Add vrr mode to crtc_state dump
3a773995eed3 drm/i915/dp: Avoid vrr compute config for HDMI sink
d06703fa1cfc drm/i915/vrr: Introduce VRR mode Fixed RR
6e85468ae0b0 drm/i915/vrr: Avoid sending PUSH when VRR TG is used with Fixed refresh rate
35c00feebae6 drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
3b5852c0dc51 drm/i915/vrr: Disable CMRR
a194549a284d drm/i915/vrr: Use crtc_vtotal for vmin
-:7: WARNING:TYPO_SPELLING: 'cant' may be misspelled - perhaps 'can't'?
#7: 
guardband/pipeline full cant be programmed on the fly. So we need to
                        ^^^^

total: 0 errors, 1 warnings, 0 checks, 34 lines checked
0da0f066903a drm/i915/vrr: Adjust Vtotal for MSA for fixed timings
1deb60fa7be3 drm/i915/vrr: Prepare for fixed refresh rate timings
9a4e0cfa8b6b drm/i915/hdmi: Use VRR Timing generator for HDMI
c7a8120eaa07 drm/i915/display: Disable PSR before disabling VRR
d0b81bc8d21c drm/i915/psr: Allow PSR for fixed refrsh rate with VRR TG
c11771fa8345 drm/i915/display: Extend WA 14015406119 for PSR2
c49b45c1c3e1 drm/i915/vrr: Handle joiner with vrr
e724c95c4eec drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
e68de58c2344 drm/i915/vrr: Prepare for Fixed refresh rate mode from MTL+
-:19: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19: FILE: drivers/gpu/drm/i915/display/intel_display.c:1304:
+	struct intel_display * display = to_intel_display(state);

total: 1 errors, 0 warnings, 0 checks, 74 lines checked
389795aec6d3 drm/i915/vrr: Refactor condition for computing vmax and LRR
03bab50d75dc drm/i915/vrr: Always use VRR timing generator for MTL+
d76ff1cdee2f drm/i915/display: Use VRR timings for MTL+ in modeset sequence


