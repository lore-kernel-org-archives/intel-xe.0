Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE182C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 11:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11EA10EDB2;
	Wed,  7 Feb 2024 11:09:52 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BD610EDB2;
 Wed,  7 Feb 2024 11:09:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_DMC_w?=
 =?utf-8?q?akelock_implementation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Feb 2024 11:09:51 -0000
Message-ID: <170730419134.1072169.6793048502944425307@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240207103007.665367-1-luciano.coelho@intel.com>
In-Reply-To: <20240207103007.665367-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: DMC wakelock implementation (rev2)
URL   : https://patchwork.freedesktop.org/series/128628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 70308230dc377ed3a71871dfaa32ab252fe86495
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Wed Feb 7 12:30:07 2024 +0200

    drm/i915/display: call DMC wakelock enable when DMC is loaded
    
    Although the documentation says that this should be done in the first
    modeset, it makes more sense to enable and disable it when DMC is
    enabled and disabled, including during suspend and resume operations.
    
    Add the calls to enable and disable DMC wakelock accordingly.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch e33f766ecfa1aee40eec83b3a146eb84a5e23222 drm-intel
08764c426 drm/i915/display: add support for DMC wakelocks
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:118: CHECK:LINE_SPACING: Please don't use multiple blank lines
#118: FILE: drivers/gpu/drm/i915/display/intel_display_core.h:540:
+
+

-:176: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#176: 
new file mode 100644

-:181: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_dmc_wl.c', please use '//' instead
#181: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:1:
+/* SPDX-License-Identifier: MIT */

-:181: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#181: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:1:
+/* SPDX-License-Identifier: MIT */

-:281: WARNING:RETURN_VOID: void function return statements are not generally useful
#281: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:101:
+	return;
+}

-:310: WARNING:RETURN_VOID: void function return statements are not generally useful
#310: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:130:
+	return;
+}

-:339: CHECK:LINE_SPACING: Please don't use multiple blank lines
#339: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:159:
+
+

-:389: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#389: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.h:18:
+	spinlock_t lock;

total: 0 errors, 5 warnings, 3 checks, 350 lines checked
d94f42c45 drm/i915/display: use wakelock in the remaining read operations
d1c391716 drm/i915/display: use wakelock in register waiting functions
-:6: WARNING:TYPO_SPELLING: 'functonality' may be misspelled - perhaps 'functionality'?
#6: 
Add the wakelock functonality to the functions that help wait for
                 ^^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
e4dc12948 drm/i915/display: use wakelock in the last write function
24da8dba7 drm/i915/display: add module parameter to enable DMC wakelock
-:24: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#24: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:120:
+intel_display_param_named_unsafe(enable_dmc_wl, bool, 0400,
+	"Enable DMC wakelock "

total: 0 errors, 0 warnings, 1 checks, 58 lines checked
70308230d drm/i915/display: call DMC wakelock enable when DMC is loaded


