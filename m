Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B29D12694
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 10:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99CC10E76D;
	Wed,  3 Dec 2025 10:38:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB46B10E76D;
 Wed,  3 Dec 2025 10:38:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Move_PSR/Panel_Replay_sin?=
 =?utf-8?q?k_data_into_intel=5Fconnector_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Dec 2025 10:38:19 -0000
Message-ID: <176475829995.53396.12622319278103700618@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251203103134.1054430-1-jouni.hogander@intel.com>
In-Reply-To: <20251203103134.1054430-1-jouni.hogander@intel.com>
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

Series: Move PSR/Panel Replay sink data into intel_connector (rev2)
URL   : https://patchwork.freedesktop.org/series/157898/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit edef0904dbf249b06e50c6bbb7d7c7516a4c395e
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Dec 3 12:31:34 2025 +0200

    drm/i915/psr: Move sink_sync_latency to intel_connector
    
    As everything else related to PSR and Panel Replay capabilities are moved
    into intel_connector move sink_sync_latency as well.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 6bb7557236825dae297c2399e24e40b4d9cd1a88 drm-intel
a012ca4a7354 drm/i915/psr: Add panel granularity information into intel_connector
08a63b7832dc drm/i915/psr: Use SU granularity information available in intel_connector
-:178: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#178: FILE: drivers/gpu/drm/i915/display/intel_psr.c:596:
+	w = le16_to_cpu(*(__le16 *)&intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_X_GRANULARITY)]) ? : 4;

total: 0 errors, 1 warnings, 0 checks, 282 lines checked
9818ec8908e7 drm/i915/psr: Compute Panel Replay/Adaptive Sync coexistence behavior
-:94: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1754:
+	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(intel_dp);

total: 0 errors, 1 warnings, 0 checks, 69 lines checked
5d3f5f406c65 drm/i915/psr: Move pr_dpcd and psr_dpcd to intel_connector
-:77: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#77: FILE: drivers/gpu/drm/i915/display/intel_psr.c:547:
+	val = connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)];

-:93: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#93: FILE: drivers/gpu/drm/i915/display/intel_psr.c:584:
+	if (!(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &

-:103: WARNING:LONG_LINE: line length of 136 exceeds 100 columns
#103: FILE: drivers/gpu/drm/i915/display/intel_psr.c:595:
+	w = le16_to_cpu(*(__le16 *)&connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_X_GRANULARITY)]) ? : 4;

-:104: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#104: FILE: drivers/gpu/drm/i915/display/intel_psr.c:596:
+	y = connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_Y_GRANULARITY)] ? : 1;

-:119: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#119: FILE: drivers/gpu/drm/i915/display/intel_psr.c:618:
+	if (!(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &

-:128: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#128: FILE: drivers/gpu/drm/i915/display/intel_psr.c:629:
+		if (!(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &

-:198: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#198: FILE: drivers/gpu/drm/i915/display/intel_psr.c:767:
+		connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &

-:233: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#233: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1675:
+								       crtc_state->has_panel_replay);

-:264: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#264: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1717:
+	return (connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &

-:272: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#272: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1723:
+	return !(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &

-:282: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#282: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1758:
+	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);

-:283: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#283: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1759:
+	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);

total: 0 errors, 12 warnings, 0 checks, 304 lines checked
1a2cb6b9aaa0 drm/i915/psr: Clear pr_dpcd as well on disconnect
ec694fccde2b drm/i915/psr: Move Panel Replay DSC sink support data to intel_connector
c335b421bbc5 drm/i915/psr: Move sink PSR and Panel Replay booleans to intel_connector
edef0904dbf2 drm/i915/psr: Move sink_sync_latency to intel_connector


