Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0C8CD343F
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 22:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D10892F2;
	Tue, 12 May 2026 22:21:12 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C598945A;
 Tue, 12 May 2026 22:21:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/intel=5Fpanel=3A?=
 =?utf-8?q?_Fix_seamless_VRR_mode_switching_for_DRRS_panels_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 22:21:11 -0000
Message-ID: <177862447101.64651.3878513675224653845@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512133249.2475882-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260512133249.2475882-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/intel_panel: Fix seamless VRR mode switching for DRRS panels (rev2)
URL   : https://patchwork.freedesktop.org/series/165603/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d1a2add1a2513d04af7833256f923b3d4668b3fa
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue May 12 19:02:49 2026 +0530

    drm/i915/intel_panel: Refine VRR fixed mode selection for DRRS panels
    
    There are two kinds of VRR panels with fixed modes to consider:
    
    Type 1: Modes with different clocks (e.g. 60Hz @ 347MHz, 120Hz @ 695MHz)
    For such panels, it is not possible to seamlessly switch from a lower RR
    mode to a higher RR mode, since at lower clock we cannot increase the
    clock without a full modeset. But seamless switch from 120Hz to 60Hz can
    be achieved by running at the same (higher) clock and just extending the
    vtotal.
    
    Type 2: Modes with same clock but different vtotal
    Here the clock is the same, so we can go from higher RR to lower RR or
    vice versa just by changing the vtotal. Seamless switching is possible
    in both directions.
    
    The previous change makes intel_panel_fixed_mode() always return the
    highest refresh rate mode for all VRR panels. This works well for Type 2
    panels since there is no clock advantage from picking a lower mode.
    
    However for Type 1 (seamless DRRS) panels, if the user sets the
    allow_modeset flag they really want a lower RR mode with a lower clock
    to save power. So avoid selecting the highest RR mode when allow_modeset
    is set for such panels.
    
    Also, for seamless DRRS panels on platforms with double-buffered M/N
    support, the clock can be changed on the fly, so we don't need the
    highest RR + vtotal adjustment approach.
    
    To understand the user requirement for full modeset/seamless switch, add
    a nullable struct drm_atomic_commit state parameter to
    intel_panel_fixed_mode() to check the allow_modeset flag.
    
    Note: The mode_valid callers pass NULL since they have no atomic state.
    In that case use the existing approach to select the closest-match to
    avoid pruning valid modes.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 drm-intel
fa5e6f0d6b63 drm/i915/display: Deprecate TRANS_VSYNC where VRR TG is always on
c48638b6c04a drm/i915/panel: Preserve Vtotal-Vsync distance while adjusting vtotal
-:7: WARNING:TYPO_SPELLING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#7: 
As we increase the vtotal to accomodate lower resfresh rate for fixed
                             ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
9625e8cc6972 drm/i915/intel_panel: Add a helper to get the highest refresh rate mode
a57652dbc4f1 drm/i915/intel_panel: Pass crtc_state to intel_panel_compute_config
440ecab04443 drm/i915/intel_panel: Use highest refresh rate mode for VRR panels
d1a2add1a251 drm/i915/intel_panel: Refine VRR fixed mode selection for DRRS panels


