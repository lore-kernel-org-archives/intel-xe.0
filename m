Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA43AD2E9C3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 09:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B628710E1C8;
	Mon, 11 Nov 2024 09:18:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00BD10E1C8;
 Mon, 11 Nov 2024 09:18:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 09:18:02 -0000
Message-ID: <173131668278.2543115.3577564924438197609@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes
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
commit 859c0d1ecf794c40b536700c147c4e4ef6fb01ce
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Nov 11 14:42:21 2024 +0530

    drm/i915/display: Use VRR timings for XE2LPD+ in modeset sequence
    
    While enabling pipe currently we use the non vrr timings first and then
    enable the VRR timings later.
    From XE2LPD+ we will always have VRR timing generarator in use, so start
    the transcoder in vrr mode.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 75325ad29c3ab47b398fc7a8a8a1586868d89335 drm-intel
dafe4c35bdd5 drm/i915/vrr: Refactor VRR Timing Computation
e5bf144faccc drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
8cf076e97d0f drm/i915/vrr: Introduce new field for VRR mode
d21c74aed002 drm/i915/vrr: Fill VRR mode for CMRR and dynamic VRR
156e71be97b1 drm/i915/vrr: Rename vrr.enable to vrr.tg_enable
fca7e84a6403 drm/i915/display: Absorb cmrr attributes into vrr
0d69905bcea6 drm/i915/display: Add vrr mode to crtc_state dump
51cd8908f39f drm/i915/vrr: Remove condition flipline > vmin for LNL
f7392ec61026 drm/i915/vrr: Compute vrr vsync if platforms support it
7a4b8959607a drm/i915/dp: Avoid vrr compute config for HDMI sink
3c4bd68e7e6b drm/i915/dp: fix the Adaptive sync Operation mode for SDP
b5f4d1e1694a drm/i915/hdmi: Use VRR Timing generator for HDMI
6ddca0dd9891 drm/i915/vrr: Handle joiner with vrr
9ffc420ed7d0 drm/i915/display: Handle transcoder timings for joiner
1c9bff22a9be drm/i915/vrr: Introduce VRR mode Fixed RR
d1698a7d6d91 drm/i915/vrr: Fill fixed refresh mode in vrr_get_compute_config
f7742de400d0 drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
0db9cc385371 drm/i915/dp: Set FAVT mode in DP SDP with fixed refresh rate
753ca017eeef drm/i915/vrr: Avoid sending PUSH when VRR TG is used with Fixed refresh rate
b8e5ea2f041d drm/i915/display: Disable PSR before disabling VRR
e41e2ce0d2b7 drm/i915/psr: Allow PSR for fixed refrsh rate with VRR TG
dbc7e774143e drm/i915/vrr: Always use VRR timing generator for XE2LPD+
859c0d1ecf79 drm/i915/display: Use VRR timings for XE2LPD+ in modeset sequence


