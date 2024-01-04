Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE09C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 05:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077C710E391;
	Thu,  4 Jan 2024 05:40:37 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B0110E38C;
 Thu,  4 Jan 2024 05:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_First_attempt_to_kill_mem?=
 =?utf-8?q?=5Faccess?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 04 Jan 2024 05:40:36 -0000
Message-ID: <170434683600.1841.11153562190681748499@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
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

Series: First attempt to kill mem_access
URL   : https://patchwork.freedesktop.org/series/128044/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd84f8497cabd367f0c544cd3cfece8a40b7ebbd
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Dec 27 21:12:32 2023 -0500

    drm/xe: Mega Kill of mem_access
    
    All of these remaining cases should already be protected
    by the outer bound calls of runtime_pm
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
1d470b54a drm/xe: Document Xe PM component
75358e29c drm/xe: Fix display runtime_pm handling
-:44: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#44: FILE: drivers/gpu/drm/xe/xe_pm.c:407:
+ * Returns: True if device is awake and the the reference was taken, false otherwise.

-:50: ERROR:CODE_INDENT: code indent should use tabs where possible
#50: FILE: drivers/gpu/drm/xe/xe_pm.c:413:
+                pm_runtime_get_noresume(xe->drm.dev);$

-:50: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#50: FILE: drivers/gpu/drm/xe/xe_pm.c:413:
+                pm_runtime_get_noresume(xe->drm.dev);$

-:54: ERROR:CODE_INDENT: code indent should use tabs where possible
#54: FILE: drivers/gpu/drm/xe/xe_pm.c:417:
+        return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;$

-:54: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#54: FILE: drivers/gpu/drm/xe/xe_pm.c:417:
+        return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;$

total: 2 errors, 3 warnings, 0 checks, 38 lines checked
769f946b3 drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
-:49: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#49: FILE: drivers/gpu/drm/xe/xe_pm.c:424:
+ * Returns: True if device is awake and the the reference was taken, false otherwise.

-:55: ERROR:CODE_INDENT: code indent should use tabs where possible
#55: FILE: drivers/gpu/drm/xe/xe_pm.c:430:
+                pm_runtime_get_noresume(xe->drm.dev);$

-:55: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#55: FILE: drivers/gpu/drm/xe/xe_pm.c:430:
+                pm_runtime_get_noresume(xe->drm.dev);$

-:59: ERROR:CODE_INDENT: code indent should use tabs where possible
#59: FILE: drivers/gpu/drm/xe/xe_pm.c:434:
+        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;$

-:59: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#59: FILE: drivers/gpu/drm/xe/xe_pm.c:434:
+        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;$

total: 2 errors, 3 warnings, 0 checks, 42 lines checked
4947ac546 drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
-:45: ERROR:CODE_INDENT: code indent should use tabs where possible
#45: FILE: drivers/gpu/drm/xe/xe_pm.c:375:
+                return;$

-:45: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#45: FILE: drivers/gpu/drm/xe/xe_pm.c:375:
+                return;$

total: 1 errors, 1 warnings, 0 checks, 45 lines checked
27921a1e2 drm/xe: Prepare display for D3Cold
a407c85be drm/xe: Convert mem_access assertion towards the runtime_pm state
58a9c6ab5 drm/xe: Runtime PM wake on every IOCTL
-:79: ERROR:CODE_INDENT: code indent should use tabs where possible
#79: FILE: drivers/gpu/drm/xe/xe_pm.c:423:
+        if (WARN_ON(xe_pm_read_callback_task(xe) == current))$

-:79: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#79: FILE: drivers/gpu/drm/xe/xe_pm.c:423:
+        if (WARN_ON(xe_pm_read_callback_task(xe) == current))$

-:80: ERROR:CODE_INDENT: code indent should use tabs where possible
#80: FILE: drivers/gpu/drm/xe/xe_pm.c:424:
+                return -ELOOP;$

-:80: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#80: FILE: drivers/gpu/drm/xe/xe_pm.c:424:
+                return -ELOOP;$

-:82: ERROR:CODE_INDENT: code indent should use tabs where possible
#82: FILE: drivers/gpu/drm/xe/xe_pm.c:426:
+        return pm_runtime_get_sync(xe->drm.dev);$

-:82: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#82: FILE: drivers/gpu/drm/xe/xe_pm.c:426:
+        return pm_runtime_get_sync(xe->drm.dev);$

total: 3 errors, 3 warnings, 0 checks, 73 lines checked
73a58e666 drm/xe: Runtime PM wake on every exec
4fabc06de drm/xe: Runtime PM wake on every sysfs call
-:278: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#278: FILE: drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:578:
+}
+static inline struct xe_device *to_xe_device(const struct drm_device *dev)

-:283: CHECK:LINE_SPACING: Please don't use multiple blank lines
#283: FILE: drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:583:
+
+

total: 0 errors, 0 warnings, 2 checks, 299 lines checked
6ac390e79 drm/xe: Sort some xe_pm_runtime related functions
-:22: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#22: FILE: drivers/gpu/drm/xe/xe_pm.c:394:
+ * Returns: True if device is awake and the the reference was taken, false otherwise.

-:28: ERROR:CODE_INDENT: code indent should use tabs where possible
#28: FILE: drivers/gpu/drm/xe/xe_pm.c:400:
+                pm_runtime_get_noresume(xe->drm.dev);$

-:28: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#28: FILE: drivers/gpu/drm/xe/xe_pm.c:400:
+                pm_runtime_get_noresume(xe->drm.dev);$

-:32: ERROR:CODE_INDENT: code indent should use tabs where possible
#32: FILE: drivers/gpu/drm/xe/xe_pm.c:404:
+        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;$

-:32: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#32: FILE: drivers/gpu/drm/xe/xe_pm.c:404:
+        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;$

total: 2 errors, 3 warnings, 0 checks, 77 lines checked
28388d6b9 drm/xe: Ensure device is awake before removing it
af3f933c1 drm/xe: Remove mem_access from guc_pc calls
d4f2bc787 drm/xe: Runtime PM wake on every debugfs call
4eb02fa60 drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
e9d147f41 drm/xe: Allow GuC CT fast path and worker regardless of runtime_pm
9272531e3 drm/xe: Remove mem_access calls from migration
7a45910d6 drm/xe: Removing extra mem_access protection from runtime pm
cec35989f drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
ddcf5db86 drm/xe: Remove unused runtime pm helper
fd84f8497 drm/xe: Mega Kill of mem_access


