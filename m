Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0DBC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 07:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C87210F944;
	Thu, 14 Mar 2024 07:44:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6572F10F923;
 Thu, 14 Mar 2024 07:44:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_DMC_w?=
 =?utf-8?q?akelock_implementation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 07:44:02 -0000
Message-ID: <171040224241.753906.520159948253637446@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314073752.1245879-1-luciano.coelho@intel.com>
In-Reply-To: <20240314073752.1245879-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: DMC wakelock implementation (rev3)
URL   : https://patchwork.freedesktop.org/series/128628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 593b857a8ec36ec99337d3dc241a0f6e66e5f1e2
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Thu Mar 14 09:37:52 2024 +0200

    drm/i915/display: tie DMC wakelock to DC5/6 state transitions
    
    We only need DMC wakelocks when we allow DC5 and DC6 states.  Add the
    calls to enable and disable DMC wakelock accordingly.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 96e47e3f3a5952e104d56352872becdc0048d26e drm-intel
6ca729037461 drm/i915/display: add support for DMC wakelocks
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:237: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#237: 
new file mode 100644

-:242: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_dmc_wl.c', please use '//' instead
#242: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:1:
+/* SPDX-License-Identifier: MIT */

-:242: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#242: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:1:
+/* SPDX-License-Identifier: MIT */

-:381: WARNING:RETURN_VOID: void function return statements are not generally useful
#381: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:140:
+	return;
+}

-:410: WARNING:RETURN_VOID: void function return statements are not generally useful
#410: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:169:
+	return;
+}

-:458: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#458: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.c:217:
+	if (WARN_RATELIMIT(!refcount_read(&wl->refcount),
+		    "Tried to put wakelock with refcount zero\n"))

-:493: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#493: FILE: drivers/gpu/drm/i915/display/intel_dmc_wl.h:18:
+	spinlock_t lock;

total: 0 errors, 5 warnings, 2 checks, 452 lines checked
017bf2c4ff22 drm/i915/display: don't allow DMC wakelock on older hardware
e8bffcb94860 drm/i915/display: add module parameter to enable DMC wakelock
-:21: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#21: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:120:
+intel_display_param_named_unsafe(enable_dmc_wl, bool, 0400,
+	"Enable DMC wakelock "

total: 0 errors, 0 warnings, 1 checks, 54 lines checked
593b857a8ec3 drm/i915/display: tie DMC wakelock to DC5/6 state transitions


