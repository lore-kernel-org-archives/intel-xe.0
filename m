Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6F9CA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 15:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28F310F49E;
	Wed, 30 Sep 2026 15:28:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3E010E26A;
 Wed, 30 Sep 2026 15:28:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_us?=
 =?utf-8?q?e_a_shared_gtt=5Fview=5Ftypes=2Eh_header_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Sep 2026 15:28:41 -0000
Message-ID: <179078212118.225143.3752474720282541720@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790780340.git.jani.nikula@intel.com>
In-Reply-To: <cover.1790780340.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: use a shared gtt_view_types.h header (rev3)
URL   : https://patchwork.freedesktop.org/series/174204/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 08b1b002482a816750001fb3a8529ec04289667f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 30 18:00:06 2026 +0300

    drm/intel: rename I915_GTT_VIEW_* enumerations to INTEL_GTT_VIEW_*
    
    Make the I915_GTT_VIEW_* enumerators less i915 specific, and rename them
    INTEL_GTT_VIEW_*.
    
    $ sed -i 's/I915_GTT_VIEW_/INTEL_GTT_VIEW_/g' -- $(git grep -l I915_GTT_VIEW_)
    
    Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b7036096f753a7fe43361478bcf22c04f23387a8 drm-intel
24e5b0378805 drm/intel: move i915_gtt_view_types.h to include/drm/intel
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
1d53ef5fb75e drm/intel: rename i915_gtt_view_is_*() helpers to intel_gtt_view_is_*()
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
$ sed -i 's/i915_gtt_view_is_/intel_gtt_view_is_/g' -- $(git grep -l i915_gtt_view_is_)

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
ebd63c8367e7 drm/intel: rename i915_gtt_view* struct/enum to intel_gtt_view*
bff6d1bae640 drm/intel: add intel_gtt_view_is_partial() for completeness
28b8b1356159 drm/xe/display: use intel_gtt_view_is_*() helpers more
db7ad4f35e5d drm/i915/gem: use intel_gtt_view_is_*() helpers more
0b7aef6fb132 drm/i915/vma: use intel_gtt_view_is_*() helpers more
-:76: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#76: FILE: drivers/gpu/drm/i915/i915_vma.c:1321:
+		GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));

total: 0 errors, 1 warnings, 0 checks, 58 lines checked
2c9ecb6d652a drm/i915/selftests: use intel_gtt_view_is_*() helpers more
-:67: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:635:
+					expected_pages = remapped_size(&view, &plane_info[0], &plane_info[1]);

-:88: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#88: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:675:
+						if (intel_gtt_view_is_rotated(&view))

-:140: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#140: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:1060:
+			GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));

-:158: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#158: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:1084:
+						       intel_gtt_view_is_rotated(&view) ? "Rotated" : "Remapped",

total: 0 errors, 4 warnings, 0 checks, 125 lines checked
9dd41a56057c drm/i915/debugfs: use the intel_gtt_view_is_*() helpers more
08b1b002482a drm/intel: rename I915_GTT_VIEW_* enumerations to INTEL_GTT_VIEW_*
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
$ sed -i 's/I915_GTT_VIEW_/INTEL_GTT_VIEW_/g' -- $(git grep -l I915_GTT_VIEW_)

total: 0 errors, 1 warnings, 0 checks, 168 lines checked


