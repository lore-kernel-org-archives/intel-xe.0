Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC9E77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 21:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C8F10E0F7;
	Mon,  6 Jan 2025 21:35:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A964210E0F7;
 Mon,  6 Jan 2025 21:35:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PXP_HWDRM_support_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 21:35:22 -0000
Message-ID: <173619932269.452263.7470067636886623807@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
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

Series: Add PXP HWDRM support (rev4)
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
commit dbf290b3ac20d9b36257793de94f9647f5febc7f
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Jan 6 13:12:10 2025 -0800

    drm/xe/pxp: Enable PXP for MTL and LNL
    
    Now that are the pieces are there, we can turn the feature on.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd drm-intel
ea943780506d drm/xe/pxp: Initialize PXP structure and KCR reg
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
493e543e220d drm/xe/pxp: Allocate PXP execution resources
-:85: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#85: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:157:
+	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));

-:142: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#142: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 552 lines checked
458801882ed0 drm/xe/pxp: Add VCS inline termination support
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 220 lines checked
d9e2a167ffd8 drm/xe/pxp: Add GSC session invalidation support
3e7314df20af drm/xe/pxp: Handle the PXP termination interrupt
36db21284793 drm/xe/pxp: Add GSC session initialization support
87a58f5c7cfa drm/xe/pxp: Add PXP queue tracking and session start
-:221: ERROR:SPACING: space required before the open parenthesis '('
#221: FILE: drivers/gpu/drm/xe/xe_pxp.c:192:
+	switch(pxp->status) {

total: 1 errors, 0 warnings, 0 checks, 522 lines checked
254ade7b399a drm/xe/pxp: Add userspace and LRC support for PXP-using queues
53b984225d9b drm/xe/pxp: Add a query for PXP status
829b42eea4f5 drm/xe/pxp: Add API to mark a BO as using PXP
-:427: WARNING:REPEATED_WORD: Possible repeated word: 'much'
#427: FILE: drivers/gpu/drm/xe/xe_pxp_types.h:121:
+	 * normal behavior is for this to increase much much slower than that.

total: 0 errors, 1 warnings, 0 checks, 471 lines checked
1a335383239a drm/xe/pxp: add PXP PM support
-:12: WARNING:TYPO_SPELLING: 'fuction' may be misspelled - perhaps 'function'?
#12: 
makes things much easier and allows us to use the same fuction for all
                                                       ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 302 lines checked
a3b67e1e819d drm/xe/pxp: Add PXP debugfs support
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
dbf290b3ac20 drm/xe/pxp: Enable PXP for MTL and LNL


