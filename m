Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2047CDB471
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 23:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFC510E233;
	Tue, 23 Jun 2026 23:09:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587D610E233;
 Tue, 23 Jun 2026 23:09:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Comments_applied_to_dp=5F?=
 =?utf-8?q?link=5Fcaps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 23:09:25 -0000
Message-ID: <178225616535.108193.3161239571950407581@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623224619.1949975-1-michal.grzelak@intel.com>
In-Reply-To: <20260623224619.1949975-1-michal.grzelak@intel.com>
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

Series: Comments applied to dp_link_caps
URL   : https://patchwork.freedesktop.org/series/169057/
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
commit c69f711190fc2b2ad3a9c158be979d56e25b3148
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Wed Jun 24 00:46:19 2026 +0200

    drm/i915/dp: return -EINVAL on failure
    
    Both intel_dp_rate_index() and intel_dp_link_config_index() in case of
    failure return -1 which equates to -EPERM. Return -EINVAL instead since
    each caller checks for negative error code.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch e7cd62086ec5a70cefb8b8b00964096692bfab36 drm-intel
8f41050ddbdc drm/i915/dp: Rename intel_dp_link_config to intel_dp_link_config_entry
c22029be6f31 drm/i915/dp: Add struct intel_dp_link_config
8649ce25b4e9 drm/i915/dp_link_caps: Introduce DP link capability module
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
09d64da68f6e drm/i915/dp_link_caps: Move common rate helpers to link caps
c7e070dd7203 drm/i915/dp_link_caps: Move forced link param helpers to link caps
6b9b9be5491a drm/i915/dp: Simplify querying of forced link parameters
f0b3a0143cba drm/i915/dp_link_caps: Move forced and max link debugfs entries to link caps
-:305: CHECK:LINE_SPACING: Please don't use multiple blank lines
#305: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:325:
+
+

total: 0 errors, 0 warnings, 1 checks, 596 lines checked
0fe23ce0ae93 drm/i915/dp_link_training: Use helpers to get forced link params
daa9e18e3d93 drm/i915/dp_link_caps: Move forced link params to link_caps
ec207dd98208 drm/i915/dp_link_caps: Move link config helpers to link caps
c61876e46480 drm/i915/dp_link_caps: Move link config tracking to link_caps
-:67: CHECK:SPACING: No space is necessary after a cast
#67: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:28:
+#define INTEL_DP_LINK_RATE_IDX_BITS		(BITS_PER_TYPE(u8) - INTEL_DP_LANE_COUNT_EXP_BITS)

total: 0 errors, 0 warnings, 1 checks, 113 lines checked
d5a1daed8fda drm/i915/dp_link_caps: Rename helper updating the link configurations
389d82ba05b4 drm/i915/dp: Factor out helper to get link rate capabilities
6b0b7c4e3985 drm/i915/dp_link_caps: Pass supported link rates to link caps update
02cbc400bf5f drm/i915/dp_link_caps: Add helper to print all supported link rates
d2f77b333ba7 drm/i915/dp_link_caps: Add helper to get the number of supported link rates
5f45aec5f1fc drm/i915/dp_link_caps: Add helper to get common rate index
-:92: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#92: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:60:
+								   intel_dp->compliance.test_link_rate);

total: 0 errors, 1 warnings, 0 checks, 58 lines checked
12481027904d drm/i915/dp_link_caps: Move tracking of common rates to link_caps struct
066ab996e460 drm/i915/dp_link_caps: Track max common lane count in link_caps
38446edaf292 drm/i915/dp_link_caps: Use max common lane count from link_caps
-:59: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3609:
+	intel_dp->link.max_lane_count = intel_dp_link_caps_max_common_lane_count(intel_dp->link.caps);

total: 0 errors, 1 warnings, 0 checks, 77 lines checked
3af2d2e9fac2 drm/i915/dp_link_caps: Add helpers to get max link limits
ec7d34ea8f62 drm/i915/dp_link_caps: Add helpers to set max link limits
c35a9d9e5160 drm/i915/dp_link_caps: Add helper to reset max link limits
446eb45302b4 drm/i915/dp_link_caps: Add helper to reset link_caps state
548bfbb3b7e9 drm/i915/dp_link_caps: Move max link limits to link_caps
c5a20f8370a4 drm/i915/dp_link_caps: Pass link_caps to static functions
-:111: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#111: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:417:
+static int parse_link_rate(struct intel_dp_link_caps *link_caps, const char __user *ubuf, size_t len)

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
875a3281891b drm/i915/dp_link_caps: Pass link_caps to config update/lookup helpers
03f4878dd51b drm/i915/dp_link_caps: Pass link_caps to common rate helpers
f7d4977092e3 drm/i915/dp_link_caps: s/lc/lce/
c69f711190fc drm/i915/dp: return -EINVAL on failure


