Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8490EC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526AE10E834;
	Fri, 16 Aug 2024 19:07:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D48F10E833;
 Fri, 16 Aug 2024 19:07:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PXP_HWDRM_support_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 19:07:20 -0000
Message-ID: <172383524044.659130.15929266246797891249@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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

Series: Add PXP HWDRM support (rev2)
URL   : https://patchwork.freedesktop.org/series/136052/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ac4eba87c34f724cace81d81d94b806d9b3175e
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Aug 16 12:00:21 2024 -0700

    drm/xe/pxp: Enable PXP for MTL and LNL
    
    Now that are the pieces are there, we can turn the feature on.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch d6dac3db19935f5939cbb033eea30c90bdf3888c drm-intel
f524ad9b903d drm/xe/pxp: Initialize PXP structure and KCR reg
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
d3ea2bf3ab04 drm/xe/pxp: Allocate PXP execution resources
-:80: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#80: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:152:
+	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));

-:136: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#136: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 566 lines checked
e842580936d5 drm/xe/pxp: Add VCS inline termination support
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 207 lines checked
788fb23fdf2f drm/xe/pxp: Add GSC session invalidation support
84b2360b4fd7 drm/xe/pxp: Handle the PXP termination interrupt
6d8ed35f74b3 drm/xe/pxp: Add GSC session initialization support
1b3ccfc32f59 drm/xe/pxp: Add spport for PXP-using queues
99ddd25e86e2 drm/xe/pxp: add a query for PXP status
e4cdd52a24ab drm/xe/pxp: Add API to mark a BO as using PXP
82608cec8960 drm/xe/pxp: add PXP PM support
21fc45006a80 drm/xe/pxp: Add PXP debugfs support
-:50: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#50: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 155 lines checked
4ac4eba87c34 drm/xe/pxp: Enable PXP for MTL and LNL


