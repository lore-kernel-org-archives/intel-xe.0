Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FBFD41C14
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 10:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2DF10E7D0;
	Thu, 11 Dec 2025 10:23:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D70E10E7D0;
 Thu, 11 Dec 2025 10:23:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Dynamic_drm=5Fpagemaps_an?=
 =?utf-8?q?d_Initial_multi-device_SVM_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 10:23:18 -0000
Message-ID: <176544859837.76770.14251390345069285856@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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

Series: Dynamic drm_pagemaps and Initial multi-device SVM (rev4)
URL   : https://patchwork.freedesktop.org/series/156525/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3b571a0377270956ebb7a3b52a3df435d6bb416b
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Dec 10 12:07:42 2025 +0100

    drm/pagemap: Support source migration over interconnect
    
    Support source interconnect migration by using the copy_to_ram() op
    of the source device private pages.
    
    Source interconnect migration is required to flush the L2 cache of
    the source device, which among other things is a requirement for
    correct global atomic operation. It also enables the source GPU to
    potentially decompress any compressed content which is not
    understood by peers, and finally for the PCIe case, it's expected
    that writes over PCIe will be faster than reads.
    
    The implementation can probably be improved by coalescing subregions
    with the same source.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch fa2134b77403f66c13791a12274ab54fe17e1798 drm-intel
966f597ab87e drm/xe/svm: Fix a debug printout
f92954fb5111 drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use
d9c9992b1152 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
2ba975fdd9d3 drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd
d41032b79b08 drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
35e33781d0a6 drm/pagemap: Add a drm_pagemap cache and shrinker
-:177: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#177: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 725 lines checked
58d0250199bd drm/xe: Use the drm_pagemap cache and shrinker
eca1cf83ac2a drm/pagemap: Remove the drm_pagemap_create() interface
4e1ff879fe2c drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
-:213: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#213: FILE: include/drm/drm_pagemap_util.h:53:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	  .lock = __MUTEX_INITIALIZER((_name).lock),	\
+	  .peers = LIST_HEAD_INIT((_name).peers) }

total: 0 errors, 0 warnings, 1 checks, 192 lines checked
0a84c0dec977 drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
d3245367e6b7 drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes
f103541de787 drm/xe: Use the vma attibute drm_pagemap to select where to migrate
6985f8b24fe3 drm/xe: Simplify madvise_preferred_mem_loc()
f4c6f9facb1b drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm
065f4080f873 drm/xe: Support pcie p2p dma as a fast interconnect
b094fe70e4d2 drm/xe/vm: Add a couple of VM debug printouts
2475e8c2528d drm/xe/svm: Document how xe keeps drm_pagemap references
69f970d028ff drm/pagemap, drm/xe: Clean up the use of the device-private page owner
d5362035d699 drm/gpusvm: Introduce a function to scan the current migration state
2b6ae0711d93 drm/xe: Use drm_gpusvm_scan_mm()
3e7d17b60dda drm/pagemap, drm/xe: Support destination migration over interconnect
3b571a037727 drm/pagemap: Support source migration over interconnect


