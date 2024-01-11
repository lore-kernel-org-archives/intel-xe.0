Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347D3C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 09:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0D410E05E;
	Thu, 11 Jan 2024 09:56:08 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416BE10E05E;
 Thu, 11 Jan 2024 09:56:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_DMC_w?=
 =?utf-8?q?akelock_implementation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Date: Thu, 11 Jan 2024 09:56:08 -0000
Message-ID: <170496696826.271298.12013552901038213725@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
In-Reply-To: <20240111091622.1110799-1-luciano.coelho@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/display: DMC wakelock implementation
URL   : https://patchwork.freedesktop.org/series/128628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ git -C mt rev-list -n1 origin/master
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eaa070e2a4f2837e693e2a733464be819a8c0bae
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Thu Jan 11 11:16:22 2024 +0200

    drm/i915/display: use wakelock in the last write function
    
    Finally, add the wakelock mechanism to the write functions.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 79184e72263e91528195db01783148435c7e4fad drm-intel
a737a7afb drm/i915/display: add support for DMC wakelocks
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:113: CHECK:LINE_SPACING: Please don't use multiple blank lines
#113: FILE: drivers/gpu/drm/i915/display/intel_display_core.h:530:
+
+

-:157: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#157: 
new file mode 100644

-:162: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_wakelock.c', please use '//' instead
#162: FILE: drivers/gpu/drm/i915/display/intel_wakelock.c:1:
+/* SPDX-License-Identifier: MIT */

-:162: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#162: FILE: drivers/gpu/drm/i915/display/intel_wakelock.c:1:
+/* SPDX-License-Identifier: MIT */

-:213: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#213: FILE: drivers/gpu/drm/i915/display/intel_wakelock.c:52:
+	udelay(100);

-:279: WARNING:RETURN_VOID: void function return statements are not generally useful
#279: FILE: drivers/gpu/drm/i915/display/intel_wakelock.c:118:
+	return;
+}

-:316: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#316: FILE: drivers/gpu/drm/i915/display/intel_wakelock.c:155:
+	udelay(100);

-:376: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#376: FILE: drivers/gpu/drm/i915/display/intel_wakelock.h:18:
+	spinlock_t lock;

total: 0 errors, 4 warnings, 4 checks, 327 lines checked
8915e9cf2 drm/i915/display: use wakelock in the remaining read operations
41dfc520e drm/i915/display: use wakelock in register waiting functions
-:6: WARNING:TYPO_SPELLING: 'functonality' may be misspelled - perhaps 'functionality'?
#6: 
Add the wakelock functonality to the functions that help wait for
                 ^^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 82 lines checked
eaa070e2a drm/i915/display: use wakelock in the last write function


