Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F164C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 17:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EA810E48F;
	Mon, 24 Feb 2025 17:59:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0F10E48F;
 Mon, 24 Feb 2025 17:59:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 17:59:37 -0000
Message-ID: <174041997728.1677817.4212652936172824908@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224061717.1095226-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250224061717.1095226-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev5)
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
commit 896350b5246915f86524ec2bf36c698fad356c40
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Feb 24 11:47:17 2025 +0530

    drm/i915/display: Add fixed_rr to crtc_state dump
    
    Add fixed refresh rate mode in crtc_state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch a5a9504217e25c850ff9e82d38c1093dbdbf20f9 drm-intel
fc5adc4f0959 drm/i915/vrr: Remove unwanted comment
11a8a9f4ba6b drm/i915:vrr: Separate out functions to compute vmin and vmax
345273151114 drm/i915/vrr: Make helpers for cmrr and vrr timings
d3bdbfa3fba6 drm/i915/vrr: Disable CMRR
8ada3ea9f472 drm/i915/vrr: Track vrr.enable only for variable timing
e2b782a8455a drm/i915/vrr: Use crtc_vtotal for vmin
17f822f5514f drm/i915/vrr: Prepare for fixed refresh rate timings
c06b2eb6cd95 drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
23d7cdd7f6bb drm/i915/hdmi: Use VRR Timing generator for HDMI
46028ff96340 drm/i915/dp_mst: Use VRR Timing generator for DP MST
b348841910ee drm/i915/display: Disable PSR before disabling VRR
49aead702864 drm/i915/display: Extend WA 14015406119 for PSR2
9e4e53537e42 drm/i915/vrr: Handle joiner with vrr
c22c120cddc6 drm/i915/vrr: Refactor condition for computing vmax and LRR
32cb793b5ad6 drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
23108b15db2c drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
7434c258862d drm/i915/display: Use fixed_rr timings in modeset sequence
e8e42fdcfbd6 drm/i915/vrr: Use fixed timings for platforms that support VRR
3373b1f7d284 drm/i915/vrr: Always use VRR timing generator for MTL+
896350b52469 drm/i915/display: Add fixed_rr to crtc_state dump


