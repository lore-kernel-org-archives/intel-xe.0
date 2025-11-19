Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04061CF58FF
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 21:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE810E69E;
	Wed, 19 Nov 2025 21:45:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9719810E69E;
 Wed, 19 Nov 2025 21:45:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_dissolve_soc/?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 21:45:30 -0000
Message-ID: <176358873061.11451.8181842446064119333@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1763578288.git.jani.nikula@intel.com>
In-Reply-To: <cover.1763578288.git.jani.nikula@intel.com>
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

Series: drm/i915: dissolve soc/
URL   : https://patchwork.freedesktop.org/series/157792/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec5a418312d714c5e066b9d1e57794591f1e1c39
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Nov 19 20:52:52 2025 +0200

    drm/xe/vga: use the same intel_gmch_vga_set_decode() as i915
    
    Drop the #ifdef I915, and use the same intel_gmch_vga_set_decode() for
    both i915 and xe.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a95032b2166b5ae428c065917b843a1caf1e82b8 drm-intel
0589ff61875a drm/i915/edram: extract i915_edram.[ch] for edram detection
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 99 lines checked
6d6508fd0d71 drm/i915: split out i915_freq.[ch]
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 172 lines checked
7111c206575e drm/i915: move intel_dram.[ch] from soc/ to display/
-:119: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#119: 
rename from drivers/gpu/drm/i915/soc/intel_dram.c

total: 0 errors, 1 warnings, 0 checks, 143 lines checked
5444e7477983 drm/xe: remove MISSING_CASE() from compat i915_utils.h
b010d0f88826 drm/i915/dram: convert to struct intel_display
3386f99e55a2 drm/i915: move dram_info to struct intel_display
b8e54c61cb4a drm/i915: move intel_rom.[ch] from soc/ to display/
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
rename from drivers/gpu/drm/i915/soc/intel_rom.c

total: 0 errors, 1 warnings, 0 checks, 59 lines checked
baace5a2f53d drm/xe: remove remaining platform checks from compat i915_drv.h
c2ce1b8b5903 drm/i915/gmch: split out i915_gmch.[ch] from soc
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 363 lines checked
4f9260c15234 drm/i915/gmch: switch to use pci_bus_{read, write}_config_word()
994ae8eb2b6f drm/i915/gmch: convert intel_gmch.c to struct intel_display
0ad0aea2c886 drm/i915: merge soc/intel_gmch.[ch] to display/intel_vga.c
-:108: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#108: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
ec5a418312d7 drm/xe/vga: use the same intel_gmch_vga_set_decode() as i915


