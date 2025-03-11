Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C97C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 09:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DB510E557;
	Tue, 11 Mar 2025 09:58:04 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3118B10E151;
 Tue, 11 Mar 2025 09:58:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VRR_Refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 09:58:03 -0000
Message-ID: <174168708319.17594.2217126523922223255@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311093751.1329043-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250311093751.1329043-1-ankit.k.nautiyal@intel.com>
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

Series: VRR Refactor
URL   : https://patchwork.freedesktop.org/series/146127/
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
commit c039ecfc05a5f348ad04c41a07bd115b0babfd6b
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Mar 11 15:07:51 2025 +0530

    drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
    
    MSA Ignore Timing PAR enable is set in the DP sink when we enable variable
    refresh rate.
    
    Currently for link training we depend on flipline to decide whether we
    want to ignore the msa timings. With fixed refresh rate we will still
    fill the flipline in all cases whether panel supports VRR or not.
    
    Change the condition for link training to ignore the msa timings if
    vrr.in_range.
    
    v2: Add more documentation and a #TODO for readout of vrr.in_range.
    (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 777e1850811f9864aa8b55940634d3da19712bf7 drm-intel
6f6fb621bd9e drm/i915/vrr: Remove unwanted comment
30b201efba6c drm/i915:vrr: Separate out functions to compute vmin and vmax
d720f108c6fe drm/i915/vrr: Make helpers for cmrr and vrr timings
f46b254073e5 drm/i915/vrr: Disable CMRR
2f6d459acee1 drm/i915/vrr: Track vrr.enable only for variable timing
f878cad593cf drm/i915/vrr: Use crtc_vtotal for vmin
c3bb65c6c6c0 drm/i915/vrr: Prepare for fixed refresh rate timings
c039ecfc05a5 drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode


