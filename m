Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DCDC3600C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 14:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2ED10E416;
	Mon, 24 Mar 2025 14:19:49 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA6410E416;
 Mon, 24 Mar 2025 14:19:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 14:19:48 -0000
Message-ID: <174282598812.73023.11240211228070794932@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324133248.4071909-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250324133248.4071909-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev11)
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
commit 460e8945eb31adc86558d8bda855ff779d8c0d62
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Mar 24 19:02:48 2025 +0530

    drm/i915/display: Avoid use of VTOTAL.Vtotal bits
    
    For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
    bits are not required. Since the support for these bits is going to
    be deprecated in upcoming platforms, avoid writing these bits for the
    platforms that do not use legacy Timing Generator.
    
    Since for these platforms TRAN_VMIN is always filled with crtc_vtotal,
    use TRAN_VRR_VMIN to get the vtotal for adjusted_mode.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch c21be2ca9276fb42e3a8ef9abd96235b745f403c drm-intel
df9cb4c3aa7f drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
d2bfa87cd92b drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
df923fd46f96 drm/i915/display: Disable PSR before disabling VRR
4dbb1895f693 drm/i915/display: Move intel_psr_post_plane_update() at the later
8f8e584ad54f drm/i915/vrr: Refactor condition for computing vmax and LRR
2a850b2b4098 drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
e455912625f9 drm/i915/vrr: Set vrr.enable for VRR TG with fixed_rr
bdcaa724f4d8 drm/i915/display: Use fixed_rr timings in modeset sequence
7d6a98074fc8 drm/i915/vrr: Use fixed timings for platforms that support VRR
0a1261056f55 drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
445c4ca936d9 drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset block
adcf0aed995a drm/i915/vrr: Allow fixed_rr with pipe joiner
b3e07b234ad9 drm/i915/vrr: Always use VRR timing generator for PTL+
712fa1b2f9df drm/i915/vrr: Set trans_vrr_ctl in intel_vrr_set_transcoder_timings()
564e5e56b484 drm/i915/display: Separate out functions to get/set VTOTAL register
460e8945eb31 drm/i915/display: Avoid use of VTOTAL.Vtotal bits


