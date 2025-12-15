Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03684D5B86D
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 22:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D66C10E532;
	Mon, 15 Dec 2025 22:16:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAE910E532;
 Mon, 15 Dec 2025 22:16:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Clean_up_l?=
 =?utf-8?q?ink_BW/DSC_slice_config_computation_=28fixes=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 22:16:15 -0000
Message-ID: <176583697526.91286.8263777585000568487@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215192357.172201-1-imre.deak@intel.com>
In-Reply-To: <20251215192357.172201-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Clean up link BW/DSC slice config computation (fixes)
URL   : https://patchwork.freedesktop.org/series/159045/
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
commit 7bd46f6120688f33b3cea312fa4d4f02a25bd6b0
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Dec 15 21:23:56 2025 +0200

    drm/i915/dp: Fail state computation for invalid DSC source input BPP values
    
    There is no reason to accept an invalid minimum/maximum DSC source input
    BPP value (i.e a minimum DSC input BPP value above the maximum pipe BPP
    or a maximum DSC input BPP value below the minimum pipe BPP value), fail
    the state computation in these cases.
    
    Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 5dd9dbd1824c3a520036488257ff25a6495ac1fe drm-intel
ae06ff288eda drm/dp: Parse all DSC slice count caps for eDP 1.5
079819e8f3fc drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
14842ecea3e9 drm/i915/dp: Fix DSC sink's slice count capability check
206ba8fc789c drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp()
a306fff287b8 drm/i915/dp: Use a mode's crtc_clock vs. clock during state computation
80399e03029a drm/i915/dp: Factor out intel_dp_link_bw_overhead()
2fa6de384ced drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
21581875209c drm/i915/dp: Use the effective data rate for DP BW calculation
5f0476364f4c drm/i915/dp: Use the effective data rate for DP compressed BW calculation
f2e5945cdaba drm/i915/dp: Account with MST, SSC BW overhead for uncompressed DP-MST stream BW
58f947a5cd00 drm/i915/dp: Account with DSC BW overhead for compressed DP-SST stream BW
e4231db63865 drm/i915/dp: Account with pipe joiner max compressed BPP limit for DP-MST and eDP
35ec87995d58 drm/i915/dp: Fail state computation for invalid min/max link BPP values
-:24: WARNING:LONG_LINE: line length of 191 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2648:
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " max link_bpp " FXP_Q4_FMT "\n",

total: 0 errors, 1 warnings, 0 checks, 21 lines checked
55ec3ede5e03 drm/i915/dp: Fail state computation for invalid max throughput BPP value
b20b22dd0de8 drm/i915/dp: Fail state computation for invalid max sink compressed BPP value
7bd46f612068 drm/i915/dp: Fail state computation for invalid DSC source input BPP values


