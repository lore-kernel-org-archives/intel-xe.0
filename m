Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C02CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A2B10E35B;
	Tue, 12 Sep 2023 06:50:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCF4210E35B;
 Tue, 12 Sep 2023 06:50:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B5265AADF2;
 Tue, 12 Sep 2023 06:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 12 Sep 2023 06:50:40 -0000
Message-ID: <169450144073.31792.13945390773911197143@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fr?=
 =?utf-8?q?ontbuffer_tracking_refactoring_=28rev8=29?=
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

Series: Frontbuffer tracking refactoring (rev8)
URL   : https://patchwork.freedesktop.org/series/122899/
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
commit 2783556369deee3a62efd65b76478c28711ce8cd
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue Sep 12 09:47:09 2023 +0300

    drm/xe: Add empty define for i915_ggtt_clear_scanout
    
    Add empty define for i915_ggtt_clear_scanout to avoid build failure.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch b4ddac861881e66a4af06531a7a72345c086bac1 drm-intel
d5e40d9ce drm/i915/display: Move releasing gem object away from fb tracking
ebca2515b drm/i915: Ignore set frontbuffer return value on release
-:24: CHECK:SPACING: No space is necessary after a cast
#24: FILE: drivers/gpu/drm/i915/display/intel_frontbuffer.c:241:
+	(void) i915_gem_object_set_frontbuffer(obj, NULL);

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
d05e3c282 fixup! drm/i915/display: Remaining changes to make xe compile
593ae8331 drm/xe: Add macro to get i915 device from xe_bo
b0da458be fixup! drm/i915/display: Remaining changes to make xe compile
-:24: CHECK:SPACING: No space is necessary after a cast
#24: FILE: drivers/gpu/drm/i915/display/intel_frontbuffer.c:237:
+	(void) i915_gem_object_set_frontbuffer(obj, NULL);

total: 0 errors, 0 warnings, 1 checks, 46 lines checked
1aaa98c5f drm/xe: Add frontbuffer setter/getter for xe_bo
7ec5dae45 fixup! drm/i915/display: Remaining changes to make xe compile
3719f146a drm/xe: Add i915_active.h compatibility header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

-:35: CHECK:SPACING: No space is necessary after a cast
#35: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_active.h:16:
+	(void) active;

-:36: CHECK:SPACING: No space is necessary after a cast
#36: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_active.h:17:
+	(void) retire;

total: 0 errors, 1 warnings, 2 checks, 22 lines checked
9c12875c8 drm/xe/display: Include i916_active header
5e4214ad1 drm/xe: Add struct i915_active for Xe
-:19: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#19: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h:1:
+/*

-:20: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#20: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h:2:
+ * SPDX-License-Identifier: MIT

total: 0 errors, 2 warnings, 0 checks, 13 lines checked
5bf3257fd fixup! drm/i915/display: Remaining changes to make xe compile
278355636 drm/xe: Add empty define for i915_ggtt_clear_scanout


