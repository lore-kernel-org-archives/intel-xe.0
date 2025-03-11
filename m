Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C41C28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 14:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616ED10E5B2;
	Tue, 11 Mar 2025 14:32:07 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E56210E5B2;
 Tue, 11 Mar 2025 14:32:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_add_d?=
 =?utf-8?q?isplay_specific_runtime_PM_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 14:32:05 -0000
Message-ID: <174170352544.18854.12486615106096072703@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1741694400.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741694400.git.jani.nikula@intel.com>
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

Series: drm/i915/display: add display specific runtime PM interface
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
commit caf309e8d2c45d2c1838362351d5236e5e1b2f73
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Mar 11 14:05:40 2025 +0200

    drm/xe/compat: remove intel_runtime_pm.h
    
    Now that all display code has been converted to display specific runtime
    PM interfaces, there's no need for the compat header anymore.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f8df428b3850ed87a1e2f3b12b6025328d8a6373 drm-intel
3253847575ae drm/i915/display: add display specific runtime PM wrappers
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:121: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#121: FILE: drivers/gpu/drm/i915/display/intel_display_rpm.h:15:
+#define __with_intel_display_rpm(__display, __wakeref) \
+	for (struct ref_tracker *(__wakeref) = intel_display_rpm_get(__display); (__wakeref); \
+	     intel_display_rpm_put((__display), (__wakeref)), (__wakeref) = NULL)

-:121: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__wakeref' - possible side-effects?
#121: FILE: drivers/gpu/drm/i915/display/intel_display_rpm.h:15:
+#define __with_intel_display_rpm(__display, __wakeref) \
+	for (struct ref_tracker *(__wakeref) = intel_display_rpm_get(__display); (__wakeref); \
+	     intel_display_rpm_put((__display), (__wakeref)), (__wakeref) = NULL)

total: 0 errors, 1 warnings, 2 checks, 190 lines checked
deb96e32464d drm/i915/display: conversions to with_intel_display_rpm()
52d22e61f08e drm/i915/display: use display runtime PM interfaces for for atomic state
8b67c92de124 drm/i915/display: convert to display runtime PM interfaces
42b2e9d07510 drm/i915/power: convert to display runtime PM interfaces
caf309e8d2c4 drm/xe/compat: remove intel_runtime_pm.h
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


