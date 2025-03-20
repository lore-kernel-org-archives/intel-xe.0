Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9680C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 15:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7C110E653;
	Thu, 20 Mar 2025 15:41:15 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0B10E653;
 Thu, 20 Mar 2025 15:41:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_add_d?=
 =?utf-8?q?isplay_specific_runtime_PM_interface_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 15:41:14 -0000
Message-ID: <174248527462.58846.15831729619673681197@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1742483007.git.jani.nikula@intel.com>
In-Reply-To: <cover.1742483007.git.jani.nikula@intel.com>
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

Series: drm/i915/display: add display specific runtime PM interface (rev2)
URL   : https://patchwork.freedesktop.org/series/146133/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f857a0b34e27cdb1d185919eb6b7ac60a4112fd
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Mar 20 17:04:00 2025 +0200

    drm/xe/compat: remove intel_runtime_pm.h
    
    Now that all display code has been converted to display specific runtime
    PM interfaces, there's no need for the compat header anymore.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4b4b30b32b4d8a7e6f48c0e9dd8fc29aecd39b11 drm-intel
d64d0390acbc drm/i915/display: add display specific runtime PM wrappers
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

-:122: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#122: FILE: drivers/gpu/drm/i915/display/intel_display_rpm.h:15:
+#define __with_intel_display_rpm(__display, __wakeref) \
+	for (struct ref_tracker *(__wakeref) = intel_display_rpm_get(__display); (__wakeref); \
+	     intel_display_rpm_put((__display), (__wakeref)), (__wakeref) = NULL)

-:122: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__wakeref' - possible side-effects?
#122: FILE: drivers/gpu/drm/i915/display/intel_display_rpm.h:15:
+#define __with_intel_display_rpm(__display, __wakeref) \
+	for (struct ref_tracker *(__wakeref) = intel_display_rpm_get(__display); (__wakeref); \
+	     intel_display_rpm_put((__display), (__wakeref)), (__wakeref) = NULL)

total: 0 errors, 1 warnings, 2 checks, 190 lines checked
f491e34844e3 drm/i915/display: conversions to with_intel_display_rpm()
4fbfdcc43aeb drm/i915/display: use display runtime PM interfaces for for atomic state
063c09f69e29 drm/i915/display: convert to display runtime PM interfaces
47c4f3193dad drm/i915/power: convert to display runtime PM interfaces
7f857a0b34e2 drm/xe/compat: remove intel_runtime_pm.h
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


