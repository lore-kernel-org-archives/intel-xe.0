Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25235CCF9E3
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 12:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27710E263;
	Sat, 25 Oct 2025 12:16:32 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C2010E263;
 Sat, 25 Oct 2025 12:16:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Dynamic_drm=5Fpagemaps_an?=
 =?utf-8?q?d_Initial_multi-device_SVM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Oct 2025 12:16:31 -0000
Message-ID: <176139459146.54840.8610914446326618175@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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

Series: Dynamic drm_pagemaps and Initial multi-device SVM
URL   : https://patchwork.freedesktop.org/series/156525/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 180f2e88ef4c5a51c4dcbb00180ce181d1c07e04
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sat Oct 25 14:04:12 2025 +0200

    drm/xe: Retry migration once
    
    Data present in foreign device memory may cause migration to fail.
    For now, retry once after first migrating to system.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch d827507f9c3c65785556819d50eb5131b2bf6a3a drm-intel
49af12d0b510 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
b2741a09b011 drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd
4eb5a99b63b1 drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
6cebb0f9512e drm/pagemap: Add a drm_pagemap cache and shrinker
-:160: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#160: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 673 lines checked
14bdc6456330 drm/xe: Use the drm_pagemap cache and shrinker
daa55c97b59c drm/pagemap: Remove the drm_pagemap_create() interface
73843dad307f drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
-:212: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#212: FILE: include/drm/drm_pagemap_util.h:51:
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	.lock = __MUTEX_INITIALIZER(_name.lock), \
+	.peers = LIST_HEAD_INIT(_name.peers) }

total: 0 errors, 0 warnings, 1 checks, 196 lines checked
6732f8d5bda1 drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
7510714e83bf drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes
3497aab4cbb6 drm/xe: Use the vma attibute drm_pagemap to select where to migrate
7787c9591544 drm/xe: Simplify madvise_preferred_mem_loc()
3990b7fb1a3e drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm
54096aeb0974 drm/xe: Support pcie p2p dma as a fast interconnect
c6dc9eeaa4de drm/xe/vm: Add a prefetch debug printout
180f2e88ef4c drm/xe: Retry migration once


