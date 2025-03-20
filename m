Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF2EC35FFF
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 05:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1420910E03F;
	Thu, 20 Mar 2025 05:37:23 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA0610E03F;
 Thu, 20 Mar 2025 05:37:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 05:37:21 -0000
Message-ID: <174244904182.56566.6165715742654264692@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250318073540.2773890-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250318073540.2773890-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev10)
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3e47bed36e933bbf889ad01ea9047b1517f9f797
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Mar 18 13:05:40 2025 +0530

    drm/i915/vrr: Set trans_vrr_ctl in intel_vrr_set_transcoder_timings()
    
    We now always set vrr.flipline, vmin, and vmax for all platforms that
    support VRR. Therefore, we should set all TRANS_VRR_CTL bits except
    VRR_ENABLE. Without this, the readback for these bits will fail because we
    only read vrr.flipline, vmin, and vmax if TRANS_VRR_CTL has the
    FLIPLINE_EN bit set.
    
    For platforms that always have the VRR Timing Generator enabled,
    the FLIPLINE_EN bit is always set in TRANS_VRR_CTL during
    intel_transcoder_vrr_enable(). However, for the remaining platforms
    (that do not always have the VRR Timing Generator enabled) if a full
    modeset doesn't occur and VRR is not enabled, the bit is not set.
    
    This results in a mismatch between the software state and hardware state
    because the software state expects VRR timings like flipline, vmin, and
    vmax to be set, but the readout for these doesn't happen since the
    FLIPLINE_EN bit is not set in TRANS_VRR_CTL.
    
    To avoid this mismatch, write trans_vrr_ctl in
    intel_vrr_set_transcoder_timings() even when VRR is not enabled
    for platforms that do not have the VRR Timing Generator always enabled.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
80196e9e7596 drm/i915/display: Add fixed_rr to crtc_state dump
f46c254cf9df drm/i915/vrr: Avoid reading vrr.enable based on fixed_rr check
dd95b50f9c03 drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
6400f9ce60a1 drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
7e2e354e1fd0 drm/i915/display: Disable PSR before disabling VRR
4e55bcd3d80f drm/i915/display: Move intel_psr_post_plane_update() at the later
43efbca1eca3 drm/i915/vrr: Refactor condition for computing vmax and LRR
8302eb5de9f4 drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
751145c7c740 drm/i915/vrr: Set vrr.enable for VRR TG with fixed_rr
f010a6190984 drm/i915/display: Use fixed_rr timings in modeset sequence
2a070030fa2e drm/i915/vrr: Use fixed timings for platforms that support VRR
5d4d5d5a72ba drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
4ee8009bf0a0 drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset block
83bf9c40fccc drm/i915/vrr: Allow fixed_rr with pipe joiner
eae882eb9bc1 drm/i915/vrr: Always use VRR timing generator for PTL+
3e47bed36e93 drm/i915/vrr: Set trans_vrr_ctl in intel_vrr_set_transcoder_timings()


