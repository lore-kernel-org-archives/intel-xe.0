Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEFEC7882F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 12:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3B10E824;
	Fri, 20 Sep 2024 12:07:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4FB10E824;
 Fri, 20 Sep 2024 12:07:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_clean_up_D?=
 =?utf-8?q?P_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 12:07:10 -0000
Message-ID: <172683403069.1050582.9667812720042782639@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726833193.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726833193.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: clean up DP testing
URL   : https://patchwork.freedesktop.org/series/138918/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 72e65bdf67f46c1bce1b9a65b0ed0f96f41fa550
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Sep 20 14:56:51 2024 +0300

    drm/i915/dp: add intel_dp_test_reset() and intel_dp_test_short_pulse()
    
    Abstract more DP test stuff. Now the only place touching
    intel_dp->compliance is intel_dp_test.c.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 drm-intel
3661626c6635 drm/i915/dp: split out intel_dp_test.[ch] to a dedicated file
-:638: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#638: 
new file mode 100644

-:674: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#674: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:32:
+		limits->pipe.min_bpp = limits->pipe.max_bpp = bpp;

-:693: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#693: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:51:
+				limits->min_rate = limits->max_rate =

-:695: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#695: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:53:
+			limits->min_lane_count = limits->max_lane_count =

-:814: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!intel_connector->detect_edid"
#814: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:172:
+	if (intel_connector->detect_edid == NULL ||

-:825: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#825: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:183:
+		if (intel_dp->aux.i2c_nack_count > 0 ||
+			intel_dp->aux.i2c_defer_count > 0)

total: 0 errors, 1 warnings, 5 checks, 1112 lines checked
75440a78c3b2 drm/i915/dp: fix style issues in intel_dp_test.c
d9edd1f60141 drm/i915/dp: convert intel_dp_test.c struct intel_display
54ac015d736d drm/i915/dp: clean up intel_dp_test.[ch] interface
0d20d29e2e02 drm/i915/dp: move DP test debugfs files next to the functionality
-:339: CHECK:BRACES: braces {} should be used on all arms of this statement
#339: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:591:
+		if (encoder && connector->status == connector_status_connected) {
[...]
+		} else
[...]

-:345: CHECK:BRACES: Unbalanced braces around else statement
#345: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:597:
+		} else

-:388: CHECK:BRACES: braces {} should be used on all arms of this statement
#388: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:640:
+		if (encoder && connector->status == connector_status_connected) {
[...]
+		} else
[...]

-:413: CHECK:BRACES: Unbalanced braces around else statement
#413: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:665:
+		} else

-:441: CHECK:BRACES: braces {} should be used on all arms of this statement
#441: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:693:
+		if (encoder && connector->status == connector_status_connected) {
[...]
+		} else
[...]

-:444: CHECK:BRACES: Unbalanced braces around else statement
#444: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:696:
+		} else

total: 0 errors, 0 warnings, 6 checks, 460 lines checked
1cfc4347eb9b drm/i915/dp: fix style issues in DP test debugfs
bc308aba32a8 drm/i915/display: remove the loop in fifo underrun debugfs file creation
01bcda605bc9 drm/i915/dp: convert DP test debugfs to struct intel_display
72e65bdf67f4 drm/i915/dp: add intel_dp_test_reset() and intel_dp_test_short_pulse()


