Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D73C28B23
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 14:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3FD10E9B3;
	Thu,  6 Mar 2025 14:30:02 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42EA10E9BE;
 Thu,  6 Mar 2025 14:30:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 14:30:01 -0000
Message-ID: <174127140166.68260.2160819580388707924@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306131100.3989503-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250306131100.3989503-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev7)
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
commit 16a9ac55fb85947648279fa01a84f5414f276b6f
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Mar 6 18:41:00 2025 +0530

    drm/i915/display: Add fixed_rr to crtc_state dump
    
    Add fixed refresh rate mode in crtc_state dump.
    VRR Timing Generator is running in fixed refresh rate mode when
    vrr.enable is unset and vrr.vmin = vrr.vmax = vrr.flipline.
    
    v2: Add check for vrr.enable.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch a99aaba62a8e84d8473b700d23267a40c18b46f1 drm-intel
82fc8265bc74 drm/i915/vrr: Remove unwanted comment
cf7e930e5cac drm/i915:vrr: Separate out functions to compute vmin and vmax
2b5d1d21a956 drm/i915/vrr: Make helpers for cmrr and vrr timings
3447da70b9e9 drm/i915/vrr: Disable CMRR
d24dbdabff17 drm/i915/vrr: Track vrr.enable only for variable timing
f4705f515b8a drm/i915/vrr: Use crtc_vtotal for vmin
58472ee0d840 drm/i915/vrr: Prepare for fixed refresh rate timings
645ae64213cb drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
05b4af0f4de9 drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
afa0573e7abd drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
67b1163d7f44 drm/i915/display: Disable PSR before disabling VRR
4cf743906020 drm/i915/display: Move intel_psr_post_plane_update() at the later
154b994918e6 drm/i915/vrr: Refactor condition for computing vmax and LRR
404c5d017522 drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
681f91cc2999 drm/i915/display: Use fixed_rr timings in modeset sequence
6cd1a82a5934 drm/i915/vrr: Use fixed timings for platforms that support VRR
fe9d6097249b drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset block
d15cf055dfd0 drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
55670401665a drm/i915/vrr: Allow fixed_rr with pipe joiner
1f62e5fb4434 drm/i915/vrr: Always use VRR timing generator for MTL+
16a9ac55fb85 drm/i915/display: Add fixed_rr to crtc_state dump


