Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CC6CD5BAB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 10:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F316E10E715;
	Thu, 13 Nov 2025 10:06:21 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CEB10E715;
 Thu, 13 Nov 2025 10:06:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_start_dissolv?=
 =?utf-8?q?ing_soc/?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Nov 2025 10:06:20 -0000
Message-ID: <176302838073.48735.5148793437959084152@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1763027774.git.jani.nikula@intel.com>
In-Reply-To: <cover.1763027774.git.jani.nikula@intel.com>
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

Series: drm/i915: start dissolving soc/
URL   : https://patchwork.freedesktop.org/series/157488/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ddd84eee03b944375f97572c104f377e48e488cb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Nov 13 11:58:05 2025 +0200

    drm/xe: remove remaining platform checks from compat i915_drv.h
    
    With xe no longer building anything from soc/, we can remove the compat
    platform checks from i915_drv.h, reducing the file to just the to_i915()
    pointer conversion helper.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch fb991a463f083eaadee5e0de96929117bc9016d4 drm-intel
b62495777e49 drm/i915/edram: extract i915_edram.[ch] for edram detection
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 99 lines checked
78e1573e3fc8 drm/i915: split out i915_freq.[ch]
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 172 lines checked
d967cc46e000 drm/i915: move intel_dram.[ch] from soc/ to display/
-:119: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#119: 
rename from drivers/gpu/drm/i915/soc/intel_dram.c

total: 0 errors, 1 warnings, 0 checks, 143 lines checked
ac40c554d493 drm/xe: remove MISSING_CASE() from compat i915_utils.h
434d64b9cc71 drm/i915/dram: convert to struct intel_display
eb0174c6e251 drm/i915: move dram_info to struct intel_display
35faae568bcf drm/i915: move intel_rom.[ch] from soc/ to display/
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
rename from drivers/gpu/drm/i915/soc/intel_rom.c

total: 0 errors, 1 warnings, 0 checks, 59 lines checked
ddd84eee03b9 drm/xe: remove remaining platform checks from compat i915_drv.h


