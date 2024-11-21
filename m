Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11DED743F9
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 00:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B1810E3C7;
	Thu, 21 Nov 2024 00:16:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A0C10E3C7;
 Thu, 21 Nov 2024 00:16:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PXP_HWDRM_support_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 00:16:26 -0000
Message-ID: <173214818630.906172.2186937733386905511@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

Series: Add PXP HWDRM support (rev3)
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
commit 85bba26b99a6bed0fb7e6dccbf8b3ebe17693ddf
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Nov 20 15:43:52 2024 -0800

    drm/xe/pxp: Enable PXP for MTL and LNL
    
    Now that are the pieces are there, we can turn the feature on.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch e46649e7764a9f6868ccbcba7b8b23b413303380 drm-intel
320e4e94ee14 drm/xe/pxp: Initialize PXP structure and KCR reg
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
585a8f50e156 drm/xe/pxp: Allocate PXP execution resources
-:82: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#82: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:154:
+	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));

-:139: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#139: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 553 lines checked
79db4a8ef2d2 drm/xe/pxp: Add VCS inline termination support
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 219 lines checked
c12a1998521e drm/xe/pxp: Add GSC session invalidation support
5037645c2899 drm/xe/pxp: Handle the PXP termination interrupt
b36e9fe3c139 drm/xe/pxp: Add GSC session initialization support
a93a47d938a9 drm/xe/pxp: Add support for PXP-using queues
5404181812dc drm/xe/pxp: add a query for PXP status
5bbdc0e8e3fe drm/xe/pxp: Add API to mark a BO as using PXP
-:408: WARNING:REPEATED_WORD: Possible repeated word: 'much'
#408: FILE: drivers/gpu/drm/xe/xe_pxp_types.h:117:
+	 * normal behavior is for this to increase much much slower than that.

total: 0 errors, 1 warnings, 0 checks, 456 lines checked
32fe4d84a3c8 drm/xe/pxp: add PXP PM support
3dece59c67f4 drm/xe/pxp: Add PXP debugfs support
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
85bba26b99a6 drm/xe/pxp: Enable PXP for MTL and LNL


