Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A27E67810
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 18:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366E210E24E;
	Mon, 22 Dec 2025 18:44:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34B710E24E;
 Mon, 22 Dec 2025 18:44:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Dynamic_drm=5Fpagemaps_an?=
 =?utf-8?q?d_Initial_multi-device_SVM_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 18:44:07 -0000
Message-ID: <176642904779.111296.17060260924987683980@a3b018990fe9>
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

Series: Dynamic drm_pagemaps and Initial multi-device SVM (rev7)
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
commit abec65093d8fa7fa506a8ea8477e2ff6d790b41c
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
352552776ef3 drm/xe/svm: Fix a debug printout
00c1b29abd29 drm/pagemap: Remove some dead code
97c84c301127 drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use
f78a6b72577e drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
36c42d702f05 drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd
2e7e18b49ad4 drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
a9a721429203 drm/pagemap: Add a drm_pagemap cache and shrinker
-:177: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#177: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 725 lines checked
8c7fa46eaad0 drm/xe: Use the drm_pagemap cache and shrinker
95a892491e28 drm/pagemap: Remove the drm_pagemap_create() interface
676155ee4fcb drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
-:213: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#213: FILE: include/drm/drm_pagemap_util.h:53:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	  .lock = __MUTEX_INITIALIZER((_name).lock),	\
+	  .peers = LIST_HEAD_INIT((_name).peers) }

total: 0 errors, 0 warnings, 1 checks, 192 lines checked
9c3481ca40cb drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
c1a158d1b5f8 drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes
5db62104b410 drm/xe: Use the vma attibute drm_pagemap to select where to migrate
d44a483ccbdf drm/xe: Simplify madvise_preferred_mem_loc()
d6b967f189cb drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm
4fc7e3290a77 drm/xe: Support pcie p2p dma as a fast interconnect
eaa6449fa0f9 drm/xe/vm: Add a couple of VM debug printouts
d19c1b92372b drm/xe/svm: Document how xe keeps drm_pagemap references
975b4bf7f4e5 drm/pagemap, drm/xe: Clean up the use of the device-private page owner
4bda664e3a9c drm/gpusvm: Introduce a function to scan the current migration state
241c3cd735b6 drm/xe: Use drm_gpusvm_scan_mm()
4a2424e7bb4d drm/pagemap, drm/xe: Support destination migration over interconnect
ce3c89d1c4c4 drm/pagemap: Support source migration over interconnect
abec65093d8f drm/xe/svm: Serialize migration to device if racing


