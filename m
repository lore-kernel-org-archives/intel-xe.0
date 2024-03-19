Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116C4C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 04:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2710E926;
	Tue, 19 Mar 2024 04:09:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C2B10E882;
 Tue, 19 Mar 2024 04:09:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_hmm=5Frange=5Ffault_t?=
 =?utf-8?q?o_populate_user_page_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 04:09:37 -0000
Message-ID: <171082137787.900715.95290482377193184@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319025511.1598354-1-oak.zeng@intel.com>
In-Reply-To: <20240319025511.1598354-1-oak.zeng@intel.com>
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

Series: Use hmm_range_fault to populate user page (rev2)
URL   : https://patchwork.freedesktop.org/series/131117/
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
commit e62651e1ba2b2f43b08a1ca66c3be6017b9d27eb
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Mon Mar 18 22:55:11 2024 -0400

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
+ /mt/dim checkpatch e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 drm-intel
1524f5c3349e drm/xe/svm: Remap and provide memmap backing for GPU vram
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:96: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#96: FILE: drivers/gpu/drm/xe/xe_mmio.c:358:
+    struct xe_tile *tile;$

-:97: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#97: FILE: drivers/gpu/drm/xe/xe_mmio.c:359:
+    u8 id;$

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
+			mr->pagemap.range.end - mr->pagemap.range.start +1);

-:216: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#216: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:86:
+			mr->pagemap.range.end - mr->pagemap.range.start +1);
 			                                                ^

total: 0 errors, 5 warnings, 5 checks, 165 lines checked
e33865eb68f6 drm/xe/svm: Add DRM_XE_SVM kernel config entry
1fdd2cba011d drm/xe: Helper to get tile from memory region
39f0fd7ecfca drm/xe: Introduce a helper to get dpa from pfn
52a1d1f641ec drm/xe/svm: Get xe memory region from page
08aa488367d1 drm/xe: Helper to populate a userptr or hmmptr
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

-:134: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#134: FILE: drivers/gpu/drm/xe/xe_hmm.c:78:
+static int build_sg(struct xe_device *xe, struct hmm_range *range,
+			     struct sg_table *st, bool write)

-:158: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#158: FILE: drivers/gpu/drm/xe/xe_hmm.c:102:
+			addr = dma_map_page(dev, page, 0, PAGE_SIZE,
+					write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE);

-:246: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#246: FILE: drivers/gpu/drm/xe/xe_hmm.c:190:
+	 * Set the the dev_private_owner can prevent hmm_range_fault to fault

-:294: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_hmm.h', please use '/*' instead
#294: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

-:294: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#294: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 4 warnings, 2 checks, 248 lines checked
957bae77ae43 drm/xe: Introduce a helper to free sg table
-:68: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/xe/xe_hmm.c:120:
+		if (sg && is_device_private_page(page) &&
+				(addr == (sg_dma_address(sg) + sg->length))) {

-:102: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#102: FILE: drivers/gpu/drm/xe/xe_hmm.c:163:
+			dma_unmap_page(dev, addr, PAGE_SIZE,
+				write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE);

-:137: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#137: FILE: drivers/gpu/drm/xe/xe_hmm.h:17:
+#define ADDR_VRAM_BIT (1<<0)
                         ^

total: 0 errors, 0 warnings, 3 checks, 119 lines checked
e62651e1ba2b drm/xe: Use hmm_range_fault to populate user pages


