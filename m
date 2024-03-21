Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8EC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 02:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D31B10E5BF;
	Thu, 21 Mar 2024 02:27:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23489561;
 Thu, 21 Mar 2024 02:27:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Change_userptr_so_it_can_?=
 =?utf-8?q?be_unified_with_hmmptr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 02:27:18 -0000
Message-ID: <171098803863.938557.887368334944773103@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321022939.2279979-1-oak.zeng@intel.com>
In-Reply-To: <20240321022939.2279979-1-oak.zeng@intel.com>
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

Series: Change userptr so it can be unified with hmmptr
URL   : https://patchwork.freedesktop.org/series/131398/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c542b552c210f7679d844e9e5a559d792cb8850f
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed Mar 20 22:29:39 2024 -0400

    drm/xe: destroy userptr vma on UNMAP event
    
    When there is MMU_NOTIFY_UNMAP event happens, the userptr
    is munmapped from CPU. There is no need to keep the xe_vma
    for this userptr from GPU side. So we destroy it.
    
    But we can't destroy vma directly from the mmu notifier
    callback function, because we need to remove mmu
    notifier during vma destroy. If we remove mmu notifier
    directly from mmu notifier callback, it is a deadlock.
    xe_vma_destroy is modified to destroy vma in a worker
    thread.
    
    Another reason of this change is, for the future
    hmmptr codes, we destroy vma when hmmptr is unmapped
    from CPU. We want to unify the hmmptr and userptr
    code.
    
    I believe this is also the correct behavior for userptr.
    This patch is experimental for CI and open to discuss
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch b8290992108644cb99d7d9db2921bb25369ead3c drm-intel
62864dd4cf3b drm/xe: Introduce helper to populate userptr
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:68: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#68: 
new file mode 100644

-:152: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#152: FILE: drivers/gpu/drm/xe/xe_hmm.c:80:
+static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
+			     struct sg_table *st, bool write)

-:170: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#170: FILE: drivers/gpu/drm/xe/xe_hmm.c:98:
+	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
+			npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);

-:175: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#175: FILE: drivers/gpu/drm/xe/xe_hmm.c:103:
+	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
+			DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);

-:303: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_hmm.h', please use '/*' instead
#303: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

-:303: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#303: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 3 checks, 256 lines checked
1297b94e84b9 drm/xe: Introduce a helper to free sg table
-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/xe/xe_hmm.c:131:
+	dma_unmap_sgtable(dev, userptr->sg,
+			write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);

total: 0 errors, 0 warnings, 1 checks, 52 lines checked
499747afa3cc drm/xe: Use hmm_range_fault to populate user pages
c542b552c210 drm/xe: destroy userptr vma on UNMAP event


