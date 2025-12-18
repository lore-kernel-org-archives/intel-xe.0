Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F51D6E2C7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 16:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8335110EA90;
	Thu, 18 Dec 2025 16:58:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83CE10EA8D;
 Thu, 18 Dec 2025 16:58:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Dynamic_drm=5Fpagemaps_an?=
 =?utf-8?q?d_Initial_multi-device_SVM_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 16:58:02 -0000
Message-ID: <176607708281.102714.3104065675984714221@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

Series: Dynamic drm_pagemaps and Initial multi-device SVM (rev6)
URL   : https://patchwork.freedesktop.org/series/156525/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5f54f403acc61a45ad2b4d68dfd74b336dce1968
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e0e3305faf604877db0dbd0a1b77b928abb42591
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Dec 18 17:21:01 2025 +0100

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
+ /mt/dim checkpatch e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 drm-intel
143488bb59f9 drm/xe/svm: Fix a debug printout
2d94bbaaa124 drm/pagemap: Remove some dead code
353c468cce59 drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use
76b987b5c1e1 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
4ba36233c00a drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd
c17d3dce325a drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
0973c5f3b764 drm/pagemap: Add a drm_pagemap cache and shrinker
-:177: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#177: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 725 lines checked
6d05c8543ec0 drm/xe: Use the drm_pagemap cache and shrinker
9c338dec95dd drm/pagemap: Remove the drm_pagemap_create() interface
cdbe21fa9137 drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
-:213: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#213: FILE: include/drm/drm_pagemap_util.h:53:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	  .lock = __MUTEX_INITIALIZER((_name).lock),	\
+	  .peers = LIST_HEAD_INIT((_name).peers) }

total: 0 errors, 0 warnings, 1 checks, 192 lines checked
29d9045d4fd4 drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
f85135445c11 drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes
f5600970eb31 drm/xe: Use the vma attibute drm_pagemap to select where to migrate
51e4cb01b05d drm/xe: Simplify madvise_preferred_mem_loc()
14ae40e46c32 drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm
2505ac5d36fd drm/xe: Support pcie p2p dma as a fast interconnect
686795d1a6a1 drm/xe/vm: Add a couple of VM debug printouts
f90c23211eab drm/xe/svm: Document how xe keeps drm_pagemap references
42d864703c7e drm/pagemap, drm/xe: Clean up the use of the device-private page owner
7682db5ac84c drm/gpusvm: Introduce a function to scan the current migration state
b60e93fc215a drm/xe: Use drm_gpusvm_scan_mm()
4a5ca0bf52ad drm/pagemap, drm/xe: Support destination migration over interconnect
f179ac624f03 drm/pagemap: Support source migration over interconnect
e0e3305faf60 drm/xe/svm: Serialize migration to device if racing


