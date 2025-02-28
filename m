Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36656C282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 15:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D6D10ECDC;
	Fri, 28 Feb 2025 15:36:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C8310ECDB;
 Fri, 28 Feb 2025 15:36:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/compat=3A_refactor_compat_i915=5Fdrv=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 15:36:01 -0000
Message-ID: <174075696118.3254638.3527383613292355463@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228142539.3216960-1-jani.nikula@intel.com>
In-Reply-To: <20250228142539.3216960-1-jani.nikula@intel.com>
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

Series: series starting with [1/2] drm/xe/compat: refactor compat i915_drv.h
URL   : https://patchwork.freedesktop.org/series/145647/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a4ba61ae6d80aaf6d5f1665a31d01703a295a7b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Feb 28 16:25:39 2025 +0200

    drm/i915/plane: convert intel_atomic_plane.[ch] to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert intel_atomic_plane.[ch] to struct intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4e4a83bc30b77bb710641f0b43e6098bd04c5044 drm-intel
6edca468bf94 drm/xe/compat: refactor compat i915_drv.h
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
5a4ba61ae6d8 drm/i915/plane: convert intel_atomic_plane.[ch] to struct intel_display
-:28: CHECK:LINE_SPACING: Please don't use multiple blank lines
#28: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:59:
 
+

-:128: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#128: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:597:
+	if ((display->platform.ironlake || display->platform.sandybridge || display->platform.ivybridge) &&

total: 0 errors, 1 warnings, 1 checks, 281 lines checked


