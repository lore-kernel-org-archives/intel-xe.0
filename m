Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AF5C369A8
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 10:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DB810EB55;
	Fri, 11 Apr 2025 10:00:50 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4D010EB55;
 Fri, 11 Apr 2025 10:00:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_Mo?=
 =?utf-8?q?ve_PCH_stuff_under_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 10:00:48 -0000
Message-ID: <174436564863.3740.3022768954808684011@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <cover.1744364975.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744364975.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: Move PCH stuff under display
URL   : https://patchwork.freedesktop.org/series/147580/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 945fc51a19d07eec4bc1bb8022c7b5632285adf9
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Apr 11 12:54:14 2025 +0300

    drm/i915/pch: clean up includes
    
    We no longer need i915_drv.h in intel_pch.c, and we no longer need
    intel_pch.h universally.
    
    With intel_pch.h being included from intel_display_core.h, it's still
    included pretty much everywhere, but there's no need to include it
    explicitly from i915_drv.h or xe_device_types.h.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 24cf8a809b44d0ab872b5fc4a364a30f0ab7960f drm-intel
ea1ad6e1065d drm/{i915,xe}: Move intel_pch under display
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
rename from drivers/gpu/drm/i915/soc/intel_pch.c

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
1125031ff899 drm/i915/display: Convert intel_pch towards intel_display
-:473: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#473: FILE: drivers/gpu/drm/i915/display/intel_pch.h:49:
+#define HAS_PCH_LPT(display)			(INTEL_PCH_TYPE(display) == PCH_LPT_H || \
+						 INTEL_PCH_TYPE(display) == PCH_LPT_LP)

total: 0 errors, 0 warnings, 1 checks, 474 lines checked
260974a9bfa3 drm/i915/pch: move PCH detection to intel_display_driver_early_probe()
945fc51a19d0 drm/i915/pch: clean up includes


