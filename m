Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE68C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 09:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C735610E0DC;
	Tue,  4 Mar 2025 09:17:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBA510E0DC;
 Tue,  4 Mar 2025 09:17:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_VRR_timing_generator_?=
 =?utf-8?q?for_fixed_refresh_rate_modes_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 09:17:23 -0000
Message-ID: <174107984343.479656.3041639241982204440@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev6)
URL   : https://patchwork.freedesktop.org/series/141152/
State : warning

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
commit 2459c1a7826b8a8387c9be6d6e727f693d16c0c2
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Mar 4 13:49:48 2025 +0530

    drm/i915/display: Avoid use of VTOTAL.Vtotal bits
    
    For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
    bits are not required. Since the support for these bits is going to
    be deprecated in upcoming platforms, avoid writing these bits for the
    platforms that do not use legacy Timing Generator.
    
    Since for these platforms TRAN_VMIN is always filled with crtc_vtotal,
    use TRAN_VRR_VMIN to get the vtotal for adjusted_mode.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 1cf56e26a93292ca26fbf891368b75a67e8700dc drm-intel
25f260ed722b drm/i915/vrr: Remove unwanted comment
6300abe553b0 drm/i915:vrr: Separate out functions to compute vmin and vmax
e930ae9a3eef drm/i915/vrr: Make helpers for cmrr and vrr timings
d037f13351be drm/i915/vrr: Disable CMRR
bb191def9703 drm/i915/vrr: Track vrr.enable only for variable timing
3364295af3f1 drm/i915/vrr: Use crtc_vtotal for vmin
b8e8cc6cb36a drm/i915/vrr: Prepare for fixed refresh rate timings
4e584aa0cd09 drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
08a70128ad20 drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
179cbcc32e25 drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
fbe1ff0c22a3 drm/i915/display: Disable PSR before disabling VRR
3319163276fd drm/i915/display: Move intel_psr_post_plane_update() at the later
a3d065af5ede drm/i915/vrr: Refactor condition for computing vmax and LRR
c72f41fbaeed drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
e3aa69a7b726 drm/i915/display: Use fixed_rr timings in modeset sequence
6b0249bb7a81 drm/i915/vrr: Use fixed timings for platforms that support VRR
2a64e14c292a drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset block
a85c3d5de765 drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
6f5164c63ff6 drm/i915/vrr: Allow fixed_rr with pipe joiner
08ab233548cc drm/i915/vrr: Always use VRR timing generator for MTL+
29dfa6e6d45d drm/i915/display: Add fixed_rr to crtc_state dump
2459c1a7826b drm/i915/display: Avoid use of VTOTAL.Vtotal bits
-:73: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 24)
#73: FILE: drivers/gpu/drm/i915/display/intel_display.c:2739:
 	if (IS_HASWELL(dev_priv) && cpu_transcoder == TRANSCODER_EDP &&
[...]
+			intel_crtc_set_vtotal(display, (enum transcoder)pipe,

total: 0 errors, 1 warnings, 0 checks, 135 lines checked


