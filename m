Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6A1C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221AC10E33B;
	Tue, 15 Sep 2026 20:16:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F169F10E378;
 Tue, 15 Sep 2026 20:16:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_us?=
 =?utf-8?q?e_a_shared_gtt=5Fview=5Ftypes=2Eh_header?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Sep 2026 20:16:57 -0000
Message-ID: <178950341798.167993.8387284638663205192@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1789502902.git.jani.nikula@intel.com>
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: use a shared gtt_view_types.h header
URL   : https://patchwork.freedesktop.org/series/174204/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1a37064aa27dea3bb74afd6013b85bb742569fb6
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 15 23:09:21 2026 +0300

    drm/intel: rename I915_GTT_VIEW_* enumerations to INTEL_GTT_VIEW_*
    
    Make the I915_GTT_VIEW_* enumerators less i915 specific, and rename them
    INTEL_GTT_VIEW_*.
    
    $ sed -i 's/I915_GTT_VIEW_/INTEL_GTT_VIEW_/g' -- $(git grep -l I915_GTT_VIEW_)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 drm-intel
c543cb2856df drm/intel: move i915_gtt_view_types.h to include/drm/intel
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
6e2b20b359e0 drm/intel: rename i915_gtt_view_is_*() helpers to intel_gtt_view_is_*()
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
$ sed -i 's/i915_gtt_view_is_/intel_gtt_view_is_/g' -- $(git grep -l i915_gtt_view_is_)

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
6f89f0f7b632 drm/intel: rename i915_gtt_view* struct/enum to intel_gtt_view*
06bc3130c56e drm/intel: add intel_gtt_view_is_partial() for completeness
c334ead6648d drm/xe/display: use intel_gtt_view_is_*() helpers more
f254e2db3d5f drm/i915/gem: use intel_gtt_view_is_*() helpers more
635085073251 drm/i915/vma: use intel_gtt_view_is_*() helpers more
-:71: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#71: FILE: drivers/gpu/drm/i915/i915_vma.c:1321:
+		GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));

total: 0 errors, 1 warnings, 0 checks, 58 lines checked
c40cc71bdc20 drm/i915/selftests: use intel_gtt_view_is_*() helpers more
-:58: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:635:
+					expected_pages = remapped_size(&view, &plane_info[0], &plane_info[1]);

-:79: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#79: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:675:
+						if (intel_gtt_view_is_rotated(&view))

-:131: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#131: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:1060:
+			GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));

-:149: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#149: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:1084:
+						       intel_gtt_view_is_rotated(&vma->gtt_view) ? "Rotated" : "Remapped",

total: 0 errors, 4 warnings, 0 checks, 125 lines checked
ccb2dd99d01f drm/i915/debugfs: use the intel_gtt_view_is_*() helpers more
1a37064aa27d drm/intel: rename I915_GTT_VIEW_* enumerations to INTEL_GTT_VIEW_*
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
$ sed -i 's/I915_GTT_VIEW_/INTEL_GTT_VIEW_/g' -- $(git grep -l I915_GTT_VIEW_)

total: 0 errors, 1 warnings, 0 checks, 168 lines checked


