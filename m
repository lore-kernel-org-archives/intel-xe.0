Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2639E6ADE4
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 20:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5795F10E05C;
	Mon, 22 Dec 2025 20:14:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBB810E05C;
 Mon, 22 Dec 2025 20:14:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Dynamic_drm=5Fpagemaps_an?=
 =?utf-8?q?d_Initial_multi-device_SVM_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 20:14:51 -0000
Message-ID: <176643449131.112879.4735100473308252856@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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

Series: Dynamic drm_pagemaps and Initial multi-device SVM (rev8)
URL   : https://patchwork.freedesktop.org/series/156525/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6364fa9f39bd90a43c3c9a4f9840e21f80622906
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Dec 19 12:33:20 2025 +0100

    drm/xe/svm: Serialize migration to device if racing
    
    Introduce an rw-semaphore to serialize migration to device if
    it's likely that migration races with another device migration
    of the same CPU address space range.
    This is a temporary fix to attempt to mitigate a livelock that
    might happen if many devices try to migrate a range at the same
    time, and it affects only devices using the xe driver.
    A longer term fix is probably improvements in the core mm
    migration layer.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f101d56dc32350daa45c130ff7a6d46512f614a9 drm-intel
2cdebd397a70 drm/xe/svm: Fix a debug printout
c78b26d1ffd7 drm/pagemap: Remove some dead code
d495dcac2857 drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use
dc914a21ea37 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
a55b83943e37 drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd
a1e7dc82c10a drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
08c5c7197849 drm/pagemap: Add a drm_pagemap cache and shrinker
-:177: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#177: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 725 lines checked
4510e8ea28f0 drm/xe: Use the drm_pagemap cache and shrinker
baeb759ef4c9 drm/pagemap: Remove the drm_pagemap_create() interface
442ab0e14404 drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
-:213: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#213: FILE: include/drm/drm_pagemap_util.h:53:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	  .lock = __MUTEX_INITIALIZER((_name).lock),	\
+	  .peers = LIST_HEAD_INIT((_name).peers) }

total: 0 errors, 0 warnings, 1 checks, 192 lines checked
81428e9c0008 drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
6daa772d333f drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes
584b260c9913 drm/xe: Use the vma attibute drm_pagemap to select where to migrate
ae78dc448f90 drm/xe: Simplify madvise_preferred_mem_loc()
0d4c9d47c8e8 drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm
d23b1005a27b drm/xe: Support pcie p2p dma as a fast interconnect
3f65458c4a63 drm/xe/vm: Add a couple of VM debug printouts
714e3fa43d9a drm/xe/svm: Document how xe keeps drm_pagemap references
cef35fbf3827 drm/pagemap, drm/xe: Clean up the use of the device-private page owner
054907b37dcf drm/gpusvm: Introduce a function to scan the current migration state
619b5ad76f8c drm/xe: Use drm_gpusvm_scan_mm()
e64d87cb2951 drm/pagemap, drm/xe: Support destination migration over interconnect
076f25f3b09c drm/pagemap: Support source migration over interconnect
6364fa9f39bd drm/xe/svm: Serialize migration to device if racing


