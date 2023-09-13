Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E274EDEC66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 14:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B78B10E24C;
	Wed, 13 Sep 2023 14:32:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 671D110E4CB;
 Wed, 13 Sep 2023 14:32:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 68DD0AA01E;
 Wed, 13 Sep 2023 14:32:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 13 Sep 2023 14:32:53 -0000
Message-ID: <169461557342.31250.15041585112414249179@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230913095412.3427407-1-jouni.hogander@intel.com>
In-Reply-To: <20230913095412.3427407-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_FB?=
 =?utf-8?q?C_refactoring_=28rev5=29?=
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

Series: FBC refactoring (rev5)
URL   : https://patchwork.freedesktop.org/series/122905/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7fd5ea543f2334865de8021c3f0e1b6606fc8871
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Sep 13 12:54:12 2023 +0300

    drm/xe: Add Xe implementation for fence checks used by fbc code
    
    Xe doesn't support legacy fences. Implement legacy fence and fence
    id checks accordingly.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 89b671db4d8e2c46f27044d39c69095f597290e5 drm-intel
1d4268034 Revert "drm/i915/display: Implement FBC support"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '62074302224cee194f642a811a2b70687fe2e6cc', maybe rebased or not pulled?
#9: 
This reverts commit 62074302224cee194f642a811a2b70687fe2e6cc.

-:35: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:66:
+static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, void *ptr, u32 size, u32 align, u32 start, u32 end)

total: 0 errors, 2 warnings, 0 checks, 90 lines checked
58ef3d7d3 fixup! drm/i915/display: Remaining changes to make xe compile
5fef94649 drm/xe: Xe stolen memory handling for fbc support
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:38: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#38: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h:1:
+#ifndef _I915_GEM_OBJECT_H_

-:85: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#85: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h:48:
+	BUG_ON(1);

total: 0 errors, 3 warnings, 0 checks, 86 lines checked
b19fcc6e8 drm/xe: Add i915_gem.h compatibility header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
7fd5ea543 drm/xe: Add Xe implementation for fence checks used by fbc code
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 23 lines checked


