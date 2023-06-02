Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD07EC77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AD410E65A;
	Fri,  2 Jun 2023 10:46:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C779F10E656;
 Fri,  2 Jun 2023 10:46:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C46CDAADD8;
 Fri,  2 Jun 2023 10:46:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 02 Jun 2023 10:46:04 -0000
Message-ID: <168570276480.15700.6877479188400085177@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cl?=
 =?utf-8?q?ean-up_Xe_FBC_additions_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Clean-up Xe FBC additions (rev3)
URL   : https://patchwork.freedesktop.org/series/118560/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7b6d35daafe7264bb9b35090ce87f2f9282e6ece
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Jun 2 13:42:37 2023 +0300

    drm/xe: Add Xe implementation for fence checks used by fbc code
    
    Xe doesn't support legacy fences. Implement legacy fence and fence
    id checks accordingly.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 9f49c413b187c00f223eaf1e8dbe2c1a97c9954b drm-intel
6c452fb42 Revert "drm/i915/display: Make FBC check stolen at use time."
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '21e4ad64271f79f821e808a3a84bc145f4c5b2cb', maybe rebased or not pulled?
#9: 
This reverts commit 21e4ad64271f79f821e808a3a84bc145f4c5b2cb.

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
880fbafd3 Revert "drm/i915/fbc: set compressed_fb to NULL on error"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a85e885ec8004b465d477a37ef6dd3ea4e714bef', maybe rebased or not pulled?
#9: 
This reverts commit a85e885ec8004b465d477a37ef6dd3ea4e714bef.

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
de9891f4d Revert "drm/i915/display: Implement FBC support"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6cd92ad14e89f2327aacf1c346874fb7db13925b', maybe rebased or not pulled?
#9: 
This reverts commit 6cd92ad14e89f2327aacf1c346874fb7db13925b.

-:35: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:64:
+static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, void *ptr, u32 size, u32 align, u32 start, u32 end)

total: 0 errors, 2 warnings, 0 checks, 155 lines checked
33946c68a fixup! drm/i915/display: Remaining changes to make xe compile
5bcc3e81e drm/i915: Move stolen memory handling into i915_gem_stolen
-:46: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#46: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:334:
+	GEM_BUG_ON(range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),

-:49: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#49: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:337:
+	GEM_BUG_ON(range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),

-:168: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#168: FILE: drivers/gpu/drm/i915/gem/i915_gem_stolen.c:992:
+u64 i915_gem_stolen_node_address(const struct drm_i915_private *i915,
+			const struct drm_mm_node *node)

-:173: CHECK:LINE_SPACING: Please don't use multiple blank lines
#173: FILE: drivers/gpu/drm/i915/gem/i915_gem_stolen.c:997:
+
+

-:210: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#210: FILE: drivers/gpu/drm/i915/gem/i915_gem_stolen.h:46:
+u64 i915_gem_stolen_node_address(const struct drm_i915_private *i915,
+			    const struct drm_mm_node *node);

total: 0 errors, 2 warnings, 3 checks, 170 lines checked
24adef775 drm/xe: Xe stolen memory handling for fbc support
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:36: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#36: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h:1:
+#ifndef _I915_GEM_OBJECT_H_

-:83: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#83: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h:48:
+	BUG_ON(1);

total: 0 errors, 3 warnings, 0 checks, 86 lines checked
375d5e746 drm/xe: Add i915_gem.h compatibility header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
009003385 drm/i915/fbc: Make FBC check stolen at use time
492960265 drm/i915/fbc: Moved fence related code away from intel_fbc
-:69: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'gt' may be better as '(gt)' to avoid precedence issues
#69: FILE: drivers/gpu/drm/i915/gt/intel_gt_types.h:309:
+#define intel_gt_support_legacy_fencing(gt) (gt->ggtt->num_fences <= 0)

total: 0 errors, 0 warnings, 1 checks, 54 lines checked
7b6d35daa drm/xe: Add Xe implementation for fence checks used by fbc code
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


