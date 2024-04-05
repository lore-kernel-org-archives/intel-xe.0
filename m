Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2509CD1296
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 21:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C28510EA36;
	Fri,  5 Apr 2024 21:41:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7127D10EA06;
 Fri,  5 Apr 2024 21:41:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915_and_drm/xe_displ?=
 =?utf-8?q?ay_integration_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 21:41:51 -0000
Message-ID: <171235331146.1239329.9847876630311212183@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712345787.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712345787.git.jani.nikula@intel.com>
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

Series: drm/i915 and drm/xe display integration cleanups
URL   : https://patchwork.freedesktop.org/series/132098/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9ea1645a96c441bee5b0c4ee1e45245d315cacd4
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Apr 5 22:37:43 2024 +0300

    drm/xe/display: clean up compat i915_vgpu.h
    
    There's a bunch of unnecessary stuff not needed by display code. Remove.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 11155f150a41d028c6ac7a141924fd4c8798721d drm-intel
8d920f6cbd6f drm/i915: use IS_JASPERLAKE()/IS_ELKHARTLAKE() instead of IS_PLATFORM()
bda92534fa6f drm/i915/dmc: define firmware URL locally
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
1dfc02eba129 drm/i915: move i915_fixed.h to display/intel_fixed.h
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
rename from drivers/gpu/drm/i915/i915_fixed.h

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
9c1cd74a03d7 drm/xe/display: clean up a lot of cruft from compat i915_drv.h
d322c189260f drm/xe/display: remove compat i915_gem.h
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
9ea1645a96c4 drm/xe/display: clean up compat i915_vgpu.h


