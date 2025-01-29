Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13347C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 19:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45E010E86E;
	Wed, 29 Jan 2025 19:10:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017CF10E86E;
 Wed, 29 Jan 2025 19:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PXP_HWDRM_support_=28?=
 =?utf-8?q?rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 19:10:38 -0000
Message-ID: <173817783800.2530294.6841891616747209066@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
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

Series: Add PXP HWDRM support (rev7)
URL   : https://patchwork.freedesktop.org/series/136052/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b85061c65799a9c6257347f510d5d0d3608d7194
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Jan 29 09:41:37 2025 -0800

    drm/xe/pxp: Enable PXP for MTL and LNL
    
    Now that are the pieces are there, we can turn the feature on.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch b4ad7016f85d211372535e1bb8def3b5b429c8cf drm-intel
427eadc0e24f drm/xe/pxp: Initialize PXP structure and KCR reg
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
1682d90656f1 drm/xe/pxp: Allocate PXP execution resources
-:85: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#85: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:157:
+	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));

-:142: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#142: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 552 lines checked
e3211dfabe2b drm/xe/pxp: Add VCS inline termination support
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 220 lines checked
fa256a50863a drm/xe/pxp: Add GSC session invalidation support
5042f867eb61 drm/xe/pxp: Handle the PXP termination interrupt
5fd45553303c drm/xe/pxp: Add GSC session initialization support
bac5f71e2b60 drm/xe/pxp: Add PXP queue tracking and session start
db463a97d306 drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues
6ca19b9819b5 drm/xe/pxp/uapi: Add a query for PXP status
a92e7ef0ed2d drm/xe/pxp/uapi: Add API to mark a BO as using PXP
-:433: WARNING:REPEATED_WORD: Possible repeated word: 'much'
#433: FILE: drivers/gpu/drm/xe/xe_pxp_types.h:121:
+	 * normal behavior is for this to increase much much slower than that.

total: 0 errors, 1 warnings, 0 checks, 474 lines checked
91517471e392 drm/xe/pxp: add PXP PM support
1067a4b31160 drm/xe/pxp: Add PXP debugfs support
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
b85061c65799 drm/xe/pxp: Enable PXP for MTL and LNL


