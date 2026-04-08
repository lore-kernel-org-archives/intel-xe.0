Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C9CFD5F99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 09:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8055610E5C7;
	Wed,  8 Apr 2026 09:08:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA4610E5CB;
 Wed,  8 Apr 2026 09:08:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_Adaptive-Sync_SDP_for?=
 =?utf-8?q?_PR_with_Link_ON_+_Auxless-ALPM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 09:08:22 -0000
Message-ID: <177563930234.441679.8878133106176529721@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408084239.1295325-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260408084239.1295325-1-ankit.k.nautiyal@intel.com>
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

Series: Fix Adaptive-Sync SDP for PR with Link ON + Auxless-ALPM
URL   : https://patchwork.freedesktop.org/series/164513/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 75171eeeeeabc611b68b40a0d7ee5f173aa8abca
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Apr 8 14:12:38 2026 +0530

    drm/i915/dp: Always enable AS SDP if supported by source + sink
    
    Currently AS SDP is only configured when VRR is enabled. However, other
    use cases like CMRR, Panel Replay, etc. also send information to the sink
    via AS SDPs.
    
    With optimized guardband, we also need to account for wakeup time and other
    relevant details that depend on the AS SDP position whenever AS SDP is
    enabled. If a feature enabling AS SDP gets turned on later (after modeset),
    the guardband might not be sufficient and may need to increase, triggering
    a full modeset.
    
    To avoid this, always send AS SDP whenever:
     - the source and sink both support it, AND,
     - there is a possibility to use it for VRR and Panel Replay for
       synchronization.
    
    v2: Check if AS SDP can be used for synchronization for VRR or PR. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 460b46774c045acd4c2e99e53f251e2a08ef373b drm-intel
08d536496bca drm/dp: Rename and relocate AS SDP payload field masks
7c226488686c drm/dp: Clean up DPRX feature enumeration macros
6c211b567203 drm/dp: Add bits for AS SDP FAVT Payload Fields Parsing support
d1c3fc41f90f drm/dp: Add DPCD for configuring AS SDP for PR + VRR
-:23: WARNING:BAD_SIGN_OFF: Duplicate signature
#23: 
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
eb8fa17fe958 drm/dp: Store coasting vtotal in struct drm_dp_as_sdp
682282dcabdc drm/dp: Add a helper to get the SDP type as a string
d21242c99d01 drm/dp: Add target_rr_divider field in AS SDP logging
9c6013b6b69a drm/i915/dp: Fix readback for target_rr in Adaptive Sync SDP
99f489bceb28 drm/i915/vrr: Avoid vrr for PCON with HDMI2.1 sink
9fe5cf538e36 drm/i915/dp: Account for AS_SDP guardband only when enabled
07fea9d691ca drm/i915/dp: Add a helper to decide if AS SDP can be used
72f4dc7d4d89 drm/i915/dp: Skip AS SDP for DP branch devices
8cb1c766bb1d drm/i915/dp: Use revision field of AS SDP data structure
61ea8a177c9c drm/i915/dp: Set sdp_type in AS SDP unpack
cfe965373774 drm/i915/dp: Include all relevant AS SDP fields in comparison
c936bf7f6a02 drm/i915/psr: Add helper to get Async Video timing support in PR active
f0c23441526c drm/i915/dp: Add member to intel_dp to store AS SDP v2 support
eb4fd8ab5973 drm/i915/dp: Allow AS SDP only if v2 is supported
ccc809083a1e drm/i915/psr: Write the PR config DPCDs in burst mode
e16e950ab778 drm/i915/display: Add helper for AS SDP transmission time selection
f106604aca47 drm/i915/psr: Program Panel Replay CONFIG3 using AS SDP transmission time
866733c616b4 drm/i915/dp: Set relevant Downspread Ctrl DPCD bits for PR + Auxless ALPM
874098f6a2f9 drm/i915/dp: Program AS SDP DB[1:0] for PR with Link off
85542890c4f3 drm/i915/dp: Split AS SDP computation between compute_config and compute_config_late
e3b01414f6fc drm/i915/dp: Compute and include coasting vtotal for AS SDP
75171eeeeeab drm/i915/dp: Always enable AS SDP if supported by source + sink


