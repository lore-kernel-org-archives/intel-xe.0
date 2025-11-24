Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD64CFD355
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 19:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF9310E259;
	Mon, 24 Nov 2025 19:59:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DA110E259;
 Mon, 24 Nov 2025 19:59:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Move_PSR/Panel_Replay_sin?=
 =?utf-8?q?k_data_into_intel=5Fconnector?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Nov 2025 19:59:01 -0000
Message-ID: <176401434102.22750.3539717133045263059@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251121111655.164830-1-jouni.hogander@intel.com>
In-Reply-To: <20251121111655.164830-1-jouni.hogander@intel.com>
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

Series: Move PSR/Panel Replay sink data into intel_connector
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
commit 9098fcd405a6a6bc63bc4da05f4f5268199a18c2
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Nov 21 13:16:55 2025 +0200

    drm/i915/psr: Move sink_sync_latency to intel_connector
    
    As everything else related to PSR and Panel Replay capabilities are moved
    into intel_connector move sink_sync_latency as well.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch ed157ca0caebebe3af6d38ca0fb64a403c84ce77 drm-intel
09b49d4504d7 drm/i915/psr: Add panel granularity information into intel_connector
21cbbf29fe77 drm/i915/psr: Use SU granularity information available in intel_connector
d04d45981ba5 drm/i915/psr: Compute Panel Replay/Adaptive coexistence behavior
-:84: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#84: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1755:
+	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(intel_dp);

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
c7d69b7185b6 drm/i915/psr: Move pr_dpcd and psr_dpcd to intel_connector
-:266: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#266: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1760:
+	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);

-:267: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#267: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1761:
+	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);

total: 0 errors, 2 warnings, 0 checks, 293 lines checked
8a1e72a6c657 drm/i915/psr: Clear pr_dpcd as well on disconnect
392b7c407c44 drm/i915/psr: Move Panel Replay DSC sink support data to intel_connector
6b8199822474 drm/i915/psr: Move sink PSR and Panel Replay booleans to intel_connector
-:73: CHECK:LINE_SPACING: Please don't use multiple blank lines
#73: FILE: drivers/gpu/drm/i915/display/intel_dp.c:6060:
 
+

total: 0 errors, 0 warnings, 1 checks, 172 lines checked
9098fcd405a6 drm/i915/psr: Move sink_sync_latency to intel_connector


