Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5545CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 20:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7FB10ED1F;
	Tue, 16 Jun 2026 20:20:31 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC8210EB84;
 Tue, 16 Jun 2026 20:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Flink=3A_Ref?=
 =?utf-8?q?actor_DP_link_capability_logic_part1?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jun 2026 20:20:30 -0000
Message-ID: <178164123075.86684.14257336439621781084@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616200849.3534628-1-imre.deak@intel.com>
In-Reply-To: <20260616200849.3534628-1-imre.deak@intel.com>
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

Series: drm/i915/dp_link: Refactor DP link capability logic part1
URL   : https://patchwork.freedesktop.org/series/168632/
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
commit 8fffa40b893c7f1a58eb4f857affd0ff1a069cb0
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Jun 16 23:08:48 2026 +0300

    drm/i915/dp_link_caps: Pass link_caps to common rate helpers
    
    Pass the link_caps pointer to the common rate helpers in
    intel_dp_link_caps.c, as it holds the state with the relevant
    information.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 5447491819dcc3d10fd362c7bfbf877d343f6526 drm-intel
d331ab695995 drm/i915/dp: Rename intel_dp_link_config to intel_dp_link_config_entry
91d2069c21cc drm/i915/dp: Add struct intel_dp_link_config
f516300a3fe5 drm/i915/dp_link_caps: Introduce DP link capability module
-:84: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#84: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
28e7d30a8f17 drm/i915/dp_link_caps: Move common rate helpers to link caps
6303984b95cb drm/i915/dp_link_caps: Move forced link param helpers to link caps
686fb0b9d5ef drm/i915/dp: Simplify querying of forced link parameters
a74375a910b4 drm/i915/dp_link_caps: Move forced and max link debugfs entries to link caps
-:301: CHECK:LINE_SPACING: Please don't use multiple blank lines
#301: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:325:
+
+

total: 0 errors, 0 warnings, 1 checks, 596 lines checked
149d0fc2a454 drm/i915/dp_link_training: Use helpers to get forced link params
f41d29c502ce drm/i915/dp_link_caps: Move forced link params to link_caps
be7e3e774a21 drm/i915/dp_link_caps: Move link config helpers to link caps
6eaf9267a798 drm/i915/dp_link_caps: Move link config tracking to link_caps
-:63: CHECK:SPACING: No space is necessary after a cast
#63: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:28:
+#define INTEL_DP_LINK_RATE_IDX_BITS		(BITS_PER_TYPE(u8) - INTEL_DP_LANE_COUNT_EXP_BITS)

total: 0 errors, 0 warnings, 1 checks, 113 lines checked
ff0ba2857366 drm/i915/dp_link_caps: Rename helper updating the link configurations
133085c811cd drm/i915/dp: Factor out helper to get link rate capabilities
c90a42561ff5 drm/i915/dp_link_caps: Pass supported link rates to link caps update
c49558f9332c drm/i915/dp_link_caps: Add helper to print all supported link rates
9a3ed085d13a drm/i915/dp_link_caps: Add helper to get the number of supported link rates
5e130ac021fd drm/i915/dp_link_caps: Add helper to get common rate index
-:88: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#88: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:60:
+								   intel_dp->compliance.test_link_rate);

total: 0 errors, 1 warnings, 0 checks, 58 lines checked
9c60673083e8 drm/i915/dp_link_caps: Move tracking of common rates to link_caps struct
a31d3c9410f8 drm/i915/dp_link_caps: Track max common lane count in link_caps
d38209149d94 drm/i915/dp_link_caps: Use max common lane count from link_caps
-:55: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3609:
+	intel_dp->link.max_lane_count = intel_dp_link_caps_max_common_lane_count(intel_dp->link.caps);

total: 0 errors, 1 warnings, 0 checks, 77 lines checked
cb0c222352de drm/i915/dp_link_caps: Add helpers to get max link limits
50f07cf796e9 drm/i915/dp_link_caps: Add helpers to set max link limits
43b143a47c1f drm/i915/dp_link_caps: Add helper to reset max link limits
7779a6b79a3d drm/i915/dp_link_caps: Add helper to reset link_caps state
0fec924131f3 drm/i915/dp_link_caps: Move max link limits to link_caps
13cecd67b2b7 drm/i915/dp_link_caps: Pass link_caps to static functions
-:107: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#107: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:417:
+static int parse_link_rate(struct intel_dp_link_caps *link_caps, const char __user *ubuf, size_t len)

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
e0b15827cc68 drm/i915/dp_link_caps: Pass link_caps to config update/lookup helpers
8fffa40b893c drm/i915/dp_link_caps: Pass link_caps to common rate helpers


