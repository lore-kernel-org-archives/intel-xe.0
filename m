Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4050DC0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 21:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05ED10E196;
	Fri, 31 Jan 2025 21:44:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BD110E196;
 Fri, 31 Jan 2025 21:44:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PXP_HWDRM_support_=28?=
 =?utf-8?q?rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 21:44:27 -0000
Message-ID: <173835986708.3314805.9461735235833673298@b555e5b46a47>
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

Series: Add PXP HWDRM support (rev8)
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
commit aea738ec93a63f503fde57cada93d2085c5dc9f9
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Jan 29 09:41:37 2025 -0800

    drm/xe/pxp: Enable PXP for MTL and LNL
    
    Now that are the pieces are there, we can turn the feature on.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 01f54d1da1ffffff78047186f62b5916dfd43939 drm-intel
06fe1b50e45f drm/xe/pxp: Initialize PXP structure and KCR reg
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
5e2c05e1ec12 drm/xe/pxp: Allocate PXP execution resources
-:85: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#85: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:157:
+	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));

-:142: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#142: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 552 lines checked
d0252c0f5cb0 drm/xe/pxp: Add VCS inline termination support
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 220 lines checked
5d0cb03b6e69 drm/xe/pxp: Add GSC session invalidation support
f64d3087081f drm/xe/pxp: Handle the PXP termination interrupt
f3991734c7bf drm/xe/pxp: Add GSC session initialization support
348878f8ff85 drm/xe/pxp: Add PXP queue tracking and session start
c46ee280b868 drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues
81cf27d48505 drm/xe/pxp/uapi: Add a query for PXP status
e2350e3df5d3 drm/xe/pxp/uapi: Add API to mark a BO as using PXP
-:433: WARNING:REPEATED_WORD: Possible repeated word: 'much'
#433: FILE: drivers/gpu/drm/xe/xe_pxp_types.h:121:
+	 * normal behavior is for this to increase much much slower than that.

total: 0 errors, 1 warnings, 0 checks, 474 lines checked
4ea51fdd40dd drm/xe/pxp: add PXP PM support
f0e05fdcfb9c drm/xe/pxp: Add PXP debugfs support
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
aea738ec93a6 drm/xe/pxp: Enable PXP for MTL and LNL


