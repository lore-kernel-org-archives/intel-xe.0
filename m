Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E637CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 08:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E07610E9FD;
	Thu, 15 Oct 2026 08:18:29 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9468C10E9FD;
 Thu, 15 Oct 2026 08:18:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_xe=5Fwedge_=28r?=
 =?utf-8?q?ev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 08:18:27 -0000
Message-ID: <179205230760.27530.4844137264245122862@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015081042.415942-1-raag.jadav@intel.com>
In-Reply-To: <20261015081042.415942-1-raag.jadav@intel.com>
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

Series: Introduce xe_wedge (rev7)
URL   : https://patchwork.freedesktop.org/series/173011/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 428a56858773a68e6be0a6552d43c00174c7908f
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Oct 15 13:40:21 2026 +0530

    drm/xe/ras: Move xe_ras_process_errors() to xe_ras
    
    With xe_wedge_fini() now moved to xe_wedge and registered as part of
    xe_device_probe_early(), it is safe to move xe_ras_process_errors() back
    to xe_ras where it belongs. This essentially reverts commit 20bc4883c7c0
    ("drm/xe/ras: Fix boot-time ras error processing"), which was added to
    prevent PM reference leak in case of early wedging in probe sequence.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch d0f854d04f85e2bd88bce0b7bd153e5a67957a5b drm-intel
f60c9250e8f0 drm/xe/gt: Use GT ordered workqueue for wedging
-:43: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#43: FILE: drivers/gpu/drm/xe/xe_device.h:142:
+#define for_each_initialized_gt(gt__, xe__, id__) \
+	for_each_gt((gt__), (xe__), (id__)) \
+		for_each_if(READ_ONCE((gt__)->initialized))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt__' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/xe_device.h:142:
+#define for_each_initialized_gt(gt__, xe__, id__) \
+	for_each_gt((gt__), (xe__), (id__)) \
+		for_each_if(READ_ONCE((gt__)->initialized))

total: 1 errors, 0 warnings, 1 checks, 90 lines checked
49b4472e3033 drm/xe: Drop xe_device_set_wedged_method()
87d9aefb10b1 drm/xe: Move xe_device_wedged_fini() registration to xe_device_probe_early()
a83f47b192cc drm/xe: Make xe_device_declare_wedged() IRQ safe
24bc107b487c drm/xe/pci_error: Flush GT wedge worker before bus reset
f1cf52d4e79b drm/xe: Introduce xe_wedge
-:1069: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1069: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1201 lines checked
428a56858773 drm/xe/ras: Move xe_ras_process_errors() to xe_ras


