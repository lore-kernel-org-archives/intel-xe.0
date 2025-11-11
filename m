Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A82CCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 17:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4290210E618;
	Tue, 11 Nov 2025 17:07:04 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0865510E62B;
 Tue, 11 Nov 2025 17:07:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Dynamic_drm=5Fpagemaps_an?=
 =?utf-8?q?d_Initial_multi-device_SVM_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Nov 2025 17:07:03 -0000
Message-ID: <176288082302.41671.6984288559587687759@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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

Series: Dynamic drm_pagemaps and Initial multi-device SVM (rev2)
URL   : https://patchwork.freedesktop.org/series/156525/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bf57ab8e3fecc7fa12723f0101756c8519bfc637
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Nov 11 17:44:07 2025 +0100

    drm/xe/svm: Document how xe keeps drm_pagemap references
    
    As an aid to understanding the lifetime of the drm_pagemaps used
    by the xe driver, document how the xe driver keeps the
    drm_pagemap references.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 52764bea2cf028d285b0f4d86ee1ebfd4e196486 drm-intel
a9338dcfda08 drm/xe/svm: Fix a debug printout
c24e70746ea6 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
bc7289a139cb drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd
f9739c1f102f drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
a91ca074671c drm/pagemap: Add a drm_pagemap cache and shrinker
-:176: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#176: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 725 lines checked
02eb0698c6c1 drm/xe: Use the drm_pagemap cache and shrinker
b4dce9064090 drm/pagemap: Remove the drm_pagemap_create() interface
72264b929d95 drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
-:213: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#213: FILE: include/drm/drm_pagemap_util.h:53:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	  .lock = __MUTEX_INITIALIZER((_name).lock),	\
+	  .peers = LIST_HEAD_INIT((_name).peers) }

total: 0 errors, 0 warnings, 1 checks, 192 lines checked
8dbac40754f8 drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
3ad68cf21e6c drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes
8417912511fc drm/xe: Use the vma attibute drm_pagemap to select where to migrate
2647af07575f drm/xe: Simplify madvise_preferred_mem_loc()
535c0bc5fb15 drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm
acc8cf334fb3 drm/xe: Support pcie p2p dma as a fast interconnect
596efd5f8f1d drm/xe/vm: Add a couple of VM debug printouts
085652b9ac6d drm/pagemap, drm/xe: Support migration over interconnect
bf57ab8e3fec drm/xe/svm: Document how xe keeps drm_pagemap references


