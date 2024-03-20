Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ECAC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 18:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58A910FEDA;
	Wed, 20 Mar 2024 18:46:16 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934F110FED7;
 Wed, 20 Mar 2024 18:46:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/8=5D_drm/xe/svm=3A_Remap_and_provide_memmap_backing_for_GPU?=
 =?utf-8?q?_vram?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 18:46:16 -0000
Message-ID: <171096037660.921315.9677009188003946537@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320184542.2239076-1-oak.zeng@intel.com>
In-Reply-To: <20240320184542.2239076-1-oak.zeng@intel.com>
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

Series: series starting with [CI,1/8] drm/xe/svm: Remap and provide memmap backing for GPU vram
URL   : https://patchwork.freedesktop.org/series/131381/
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
commit 0db4747cc9cfa247d6cd7699b53b4ed9e1523756
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed Mar 20 14:45:42 2024 -0400

    drm/xe: Use hmm_range_fault to populate user pages
    
    This is an effort to unify hmmptr (aka system allocator)
    and userptr code. hmm_range_fault is used to populate
    a virtual address range for both hmmptr and userptr,
    instead of hmmptr using hmm_range_fault and userptr
    using get_user_pages_fast.
    
    This also aligns with AMD gpu driver's behavior. In
    long term, we plan to put some common helpers in this
    area to drm layer so it can be re-used by different
    vendors.
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch f4d4df0d10d2f906666d29c434ed2d7bbaebe2ce drm-intel
17bff6b257e3 drm/xe/svm: Remap and provide memmap backing for GPU vram
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:105: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#105: 
new file mode 100644

-:110: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_svm.h', please use '/*' instead
#110: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

-:110: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#110: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

-:142: CHECK:LINE_SPACING: Please don't use multiple blank lines
#142: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:12:
+
+

-:193: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#193: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:63:
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);

-:199: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#199: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:69:
+	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);

-:216: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#216: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:86:
+		devm_release_mem_region(dev, mr->pagemap.range.start,
+			mr->pagemap.range.end - mr->pagemap.range.start + 1);

total: 0 errors, 3 warnings, 4 checks, 165 lines checked
b16668e1caef drm/xe/svm: Introduce DRM_XE_SVM kernel config
2e3a785bf106 drm/xe: Introduce helper to get tile from memory region
1befc7cf7333 drm/xe: Introduce a helper to get dpa from pfn
5c5aba80245e drm/xe/svm: Get xe memory region from page
4eb63b5d20b3 drm/xe: Introduce helper to populate userptr
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:55: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#55: 
new file mode 100644

-:140: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#140: FILE: drivers/gpu/drm/xe/xe_hmm.c:81:
+static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
+			     struct sg_table *st, bool write)

-:158: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#158: FILE: drivers/gpu/drm/xe/xe_hmm.c:99:
+	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
+			npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);

-:163: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#163: FILE: drivers/gpu/drm/xe/xe_hmm.c:104:
+	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
+			DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);

-:291: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_hmm.h', please use '/*' instead
#291: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

-:291: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#291: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 3 checks, 242 lines checked
ac183b58770f drm/xe: Introduce a helper to free sg table
-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/xe/xe_hmm.c:132:
+	dma_unmap_sgtable(dev, userptr->sg,
+			write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);

total: 0 errors, 0 warnings, 1 checks, 52 lines checked
0db4747cc9cf drm/xe: Use hmm_range_fault to populate user pages


