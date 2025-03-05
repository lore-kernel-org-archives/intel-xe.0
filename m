Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D4BC19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 20:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADB010E322;
	Wed,  5 Mar 2025 20:31:30 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B465910E322;
 Wed,  5 Mar 2025 20:31:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/compat=3A_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 20:31:28 -0000
Message-ID: <174120668873.43388.14378592341032873128@64e06c682a23>
X-Patchwork-Hint: ignore
References: <cover.1741192597.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741192597.git.jani.nikula@intel.com>
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

Series: drm/xe/compat: cleanup
URL   : https://patchwork.freedesktop.org/series/145853/
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
commit 905133819c388b159cd085b18a127f6486f3bebb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 5 18:38:23 2025 +0200

    drm/i915/plane: convert intel_atomic_plane.[ch] to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert intel_atomic_plane.[ch] to struct intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f813902c30436f86fac23d2369ec0f3cfe7ff761 drm-intel
51cf9b342d60 drm/xe/compat: refactor compat i915_drv.h
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 60 lines checked
905133819c38 drm/i915/plane: convert intel_atomic_plane.[ch] to struct intel_display
-:120: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#120: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:618:
+	if ((display->platform.ironlake || display->platform.sandybridge || display->platform.ivybridge) &&

total: 0 errors, 1 warnings, 0 checks, 274 lines checked


