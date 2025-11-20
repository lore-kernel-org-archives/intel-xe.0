Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EF5CFA442
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 19:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E638110E082;
	Thu, 20 Nov 2025 19:19:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EB810E082;
 Thu, 20 Nov 2025 19:19:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_dissolve_soc/?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 19:19:49 -0000
Message-ID: <176366638972.15313.9162431708596454235@a3b018990fe9>
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

Series: drm/i915: dissolve soc/ (rev2)
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
commit 0d943d9ca07e3e52e1f32b216d0115982d387c83
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Nov 19 20:52:52 2025 +0200

    drm/xe/vga: use the same intel_gmch_vga_set_decode() as i915
    
    Drop the #ifdef I915, and use the same intel_gmch_vga_set_decode() for
    both i915 and xe.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 drm-intel
c1877a71173b drm/i915/edram: extract i915_edram.[ch] for edram detection
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 99 lines checked
b70838457b07 drm/i915: split out i915_freq.[ch]
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 172 lines checked
57eef214ba18 drm/i915: move intel_dram.[ch] from soc/ to display/
-:119: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#119: 
rename from drivers/gpu/drm/i915/soc/intel_dram.c

total: 0 errors, 1 warnings, 0 checks, 143 lines checked
24d0e6688075 drm/xe: remove MISSING_CASE() from compat i915_utils.h
f41a8ec2326d drm/i915/dram: convert to struct intel_display
2f61ba005236 drm/i915: move dram_info to struct intel_display
e805c4f80dba drm/i915: move intel_rom.[ch] from soc/ to display/
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
rename from drivers/gpu/drm/i915/soc/intel_rom.c

total: 0 errors, 1 warnings, 0 checks, 59 lines checked
4f993700b177 drm/xe: remove remaining platform checks from compat i915_drv.h
831c39f82388 drm/i915/gmch: split out i915_gmch.[ch] from soc
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 363 lines checked
744f78f9028f drm/i915/gmch: switch to use pci_bus_{read, write}_config_word()
a3dba9b7fe9a drm/i915/gmch: convert intel_gmch.c to struct intel_display
ac2970096674 drm/i915: merge soc/intel_gmch.[ch] to display/intel_vga.c
-:108: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#108: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
0d943d9ca07e drm/xe/vga: use the same intel_gmch_vga_set_decode() as i915


