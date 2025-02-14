Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5572DC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 12:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2612E89C05;
	Fri, 14 Feb 2025 12:38:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F8789C05;
 Fri, 14 Feb 2025 12:38:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 12:38:34 -0000
Message-ID: <173953671454.2034348.616154801720100307@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214121130.1808451-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250214121130.1808451-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev4)
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fbea3786abb55af5f5e169d78a81960accc0cc44
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Feb 14 17:41:29 2025 +0530

    drm/i915/display: Add fixed_rr to crtc_state dump
    
    Add fixed refresh rate mode in crtc_state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 57457d93f156d8b4bdff8d138127d81b8f97d8c9 drm-intel
4e9ed229b34c drm/i915/vrr: Remove unwanted comment
410063362bc1 drm/i915:vrr: Separate out functions to compute vmin and vmax
9dbc2b75cc05 drm/i915/vrr: Make helpers for cmrr and vrr timings
eed4d8ce08ce drm/i915/vrr: Disable CMRR
f88ff0b8a095 drm/i915/vrr: Track vrr.enable only for variable timing
a608494f2f98 drm/i915/vrr: Use crtc_vtotal for vmin
8a1e6c24ddd3 drm/i915/vrr: Prepare for fixed refresh rate timings
7568d2b8f36f drm/i915/dp: Avoid vrr compute config for HDMI sink
e4669d64d634 drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
ac172a4d5730 drm/i915/hdmi: Use VRR Timing generator for HDMI
b258d44ad3e8 drm/i915/display: Disable PSR before disabling VRR
e7fe47af27c8 drm/i915/display: Extend WA 14015406119 for PSR2
e8c43d6a97fe drm/i915/vrr: Handle joiner with vrr
39c43791c47c drm/i915/vrr: Refactor condition for computing vmax and LRR
156d592022d9 drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
a0e75964418c drm/i915/display: Use fixed_rr timings in modeset sequence
00981340fdad drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
162985bddabe drm/i915/vrr: Always use VRR timing generator for MTL+
fbea3786abb5 drm/i915/display: Add fixed_rr to crtc_state dump


