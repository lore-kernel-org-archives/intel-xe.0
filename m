Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A27FCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 21:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0BE10EA42;
	Thu, 30 Oct 2025 21:43:25 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9D810EA42;
 Thu, 30 Oct 2025 21:43:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_display_parent_interf?=
 =?utf-8?q?ace_for_runtime_pm_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 21:43:25 -0000
Message-ID: <176186060512.2568.38401475419926249@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030202836.1815680-1-jouni.hogander@intel.com>
In-Reply-To: <20251030202836.1815680-1-jouni.hogander@intel.com>
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

Series: Use display parent interface for runtime pm (rev3)
URL   : https://patchwork.freedesktop.org/series/156308/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c553ba7b69fb17ba36976d630fced590d4d457f7
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Oct 30 22:28:36 2025 +0200

    drm/xe/display: Use display parent interface for xe runtime pm
    
    Start using display parent interface for xe runtime pm.
    
    v2: keep xe_display_rpm.c
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch b50629a75c6ecb269adbba8de7b8ab4c9a650641 drm-intel
eccc4d668638 drm/{i915, xe}/display: pass parent interface to display probe
-:72: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:1651:
+						 const struct intel_display_parent_interface *parent)

-:103: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#103: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:318:
+						 const struct intel_display_parent_interface *parent);

-:217: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#217: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 158 lines checked
a6dd8c40affd drm/{i915, xe}/display: Add display runtime pm parent interface
de5f53150dd8 drm/i915/display: Runtime pm wrappers for display parent interface
7f05cbc87474 drm/xe/display: Runtime pm wrappers for display parent interface
-:125: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#125: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
27a12310aed9 drm/i915/display: Use display parent interface for i915 runtime pm
c553ba7b69fb drm/xe/display: Use display parent interface for xe runtime pm


