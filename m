Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3940C28B2E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 13:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B910E45D;
	Mon, 10 Mar 2025 13:22:50 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB13C10E45D;
 Mon, 10 Mar 2025 13:22:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 13:22:48 -0000
Message-ID: <174161296889.14086.9056904317670366311@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310121615.1077079-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250310121615.1077079-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev8)
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5043f51ddcb67c19ddbc43cc1bd22acda4594537
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Mar 10 17:46:15 2025 +0530

    drm/i915/display: Add fixed_rr to crtc_state dump
    
    Add fixed refresh rate mode in crtc_state dump.
    VRR Timing Generator is running in fixed refresh rate mode when
    vrr.vmin = vrr.vmax = vrr.flipline.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a drm-intel
d6fad2c7ecb7 drm/i915/vrr: Remove unwanted comment
7362587cfb0b drm/i915:vrr: Separate out functions to compute vmin and vmax
a0464d976690 drm/i915/vrr: Make helpers for cmrr and vrr timings
05ed65a923de drm/i915/vrr: Disable CMRR
e1e6373bb64b drm/i915/vrr: Track vrr.enable only for variable timing
df18f53e0887 drm/i915/vrr: Use crtc_vtotal for vmin
1ad85ff282f4 drm/i915/vrr: Prepare for fixed refresh rate timings
12bfc3b7f481 drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
58aeaa27a866 drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
a791eae30217 drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
0d53b2755a49 drm/i915/display: Disable PSR before disabling VRR
0aeabf682b5f drm/i915/display: Move intel_psr_post_plane_update() at the later
60d23a103990 drm/i915/vrr: Refactor condition for computing vmax and LRR
1ee06a8a931a drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
1bb5201fd753 drm/i915/display: Use fixed_rr timings in modeset sequence
a17a9ab01c8e drm/i915/vrr: Use fixed timings for platforms that support VRR
6addf0497a7e drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
611f3866bf73 drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset block
85b150c171f1 drm/i915/vrr: Allow fixed_rr with pipe joiner
fb0b14bba501 drm/i915/vrr: Always use VRR timing generator for MTL+
5043f51ddcb6 drm/i915/display: Add fixed_rr to crtc_state dump


