Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB37CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 21:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5744810E85F;
	Wed, 22 Oct 2025 21:46:36 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6E710E869;
 Wed, 22 Oct 2025 21:46:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_i915=5Futils?=
 =?utf-8?q?=2Eh_refactoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 21:46:36 -0000
Message-ID: <176116959610.44373.15207983949514035831@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1761146196.git.jani.nikula@intel.com>
In-Reply-To: <cover.1761146196.git.jani.nikula@intel.com>
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

Series: drm/i915: i915_utils.h refactoring
URL   : https://patchwork.freedesktop.org/series/156358/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba6a9f5679e868e62b5a1e62540e791b13b21f62
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 22 18:17:14 2025 +0300

    drm/xe/compat: reduce i915_utils.[ch]
    
    Reduce the compat i915_utils.h to only cover the requirements of
    MISSING_CASE() in soc/ and the few i915_inject_probe_failure()
    instances, instead of including the entire i915_utils.h from i915. This
    prevents new users for the utilities from cropping up.
    
    With this, we can remove the xe/display/ext/i915_utils.c altogether.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 71929a54e8bb5da291d41a931d80c6c9160073dd drm-intel
48c58cb4887e drm/i915: split out separate files for jiffies timeout and wait helpers
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 192 lines checked
2e9190f44c5a drm/i915/display: create intel_display_utils.h
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
9121aeb1537e drm/i915/display: add intel_display_run_as_guest()
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
9f4a7df45ded drm/i915/display: add intel_display_vtd_active()
9be1f0805ade drm/i915/display: switch to intel_display_utils.h
-:340: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#340: FILE: drivers/gpu/drm/i915/display/intel_display_utils.h:18:
+#define fetch_and_zero(ptr) ({						\
+	typeof(*ptr) __T = *(ptr);					\
+	*(ptr) = (typeof(*ptr))0;					\
+	__T;								\
+})

-:340: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ptr' may be better as '(ptr)' to avoid precedence issues
#340: FILE: drivers/gpu/drm/i915/display/intel_display_utils.h:18:
+#define fetch_and_zero(ptr) ({						\
+	typeof(*ptr) __T = *(ptr);					\
+	*(ptr) = (typeof(*ptr))0;					\
+	__T;								\
+})

total: 0 errors, 0 warnings, 2 checks, 651 lines checked
ba6a9f5679e8 drm/xe/compat: reduce i915_utils.[ch]
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 19 lines checked


