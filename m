Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14431C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 14:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D8A10E514;
	Mon,  3 Feb 2025 14:35:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C4E10E514;
 Mon,  3 Feb 2025 14:35:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Feb 2025 14:35:46 -0000
Message-ID: <173859334678.320737.13227741452220303677@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203123840.3855874-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250203123840.3855874-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev3)
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

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
commit 7e70e15b4e2fe197dad9894672aee4cfd9ce4fc3
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Feb 3 18:08:40 2025 +0530

    drm/i915/vblank: Avoid warning for platforms that always use VRR TG
    
    For fixed refresh rate timings, the VRR TG is not disabled and timings
    are changed on the fly.
    Modify the check for warning for changing timings with VRR TG disabled.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 3c17a49b1e97e8e71f503ce25e0fa68b8c7b48b1 drm-intel
48d6c0aa6a90 drm/i915/vrr: Remove unwanted comment
66ffd0cf6266 drm/i915:vrr: Separate out functions to compute vmin and vmax
dc405c667012 drm/i915/vrr: Make helpers for cmrr and vrr timings
5391c30b2c30 drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
cd91f919b1a4 drm/i915/vrr: Introduce new field for VRR mode
c012ab2d85ef drm/i915/vrr: Fill VRR timing generator mode for CMRR and VRR
708d242e586e drm/i915/display: Remove vrr.enable and instead check vrr.mode != NONE
fa3449ac1145 drm/i915/display: Absorb cmrr attributes into vrr struct
08ab8f24904d drm/i915/display: Add vrr mode to crtc_state dump
c48c808dc14d drm/i915/vrr: Disable CMRR
ae05a9c4ef9f drm/i915/display: Update intel_crtc_vrr_{enable/disable}
2963650e49d3 drm/i915/vrr: Use crtc_vtotal for vmin
070d9dcda398 drm/i915/vrr: Prepare for fixed refresh rate timings
8613b28d6146 drm/i915/dp: Avoid vrr compute config for HDMI sink
13c51359595e drm/i915/vrr: Introduce VRR mode Fixed RR
32c4568255fe drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
52982b72c2dd drm/i915/hdmi: Use VRR Timing generator for HDMI
6a3f59b4f489 drm/i915/display: Disable PSR before disabling VRR
951dd81a0cca drm/i915/psr: Allow PSR for fixed refrsh rate with VRR TG
358235d40c7f drm/i915/display: Extend WA 14015406119 for PSR2
d76a9c73c5eb drm/i915/vrr: Handle joiner with vrr
b2fd57a49668 drm/i915/vrr: Refactor condition for computing vmax and LRR
3086b477425d drm/i915/display: Pass vrr.mode to intel_crtc_update_active_timings()
1fd06da6bc02 drm/i915/vblank: Add crtc active timings for fixed_rr mode
cd460b462d0a drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
1df527d963f8 drm/i915/display: Use fixed_rr timings in modeset sequence
8a2c2dec9b7c drm/i915/vrr: Always use VRR timing generator for MTL+
7e70e15b4e2f drm/i915/vblank: Avoid warning for platforms that always use VRR TG


