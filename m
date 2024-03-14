Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27C8C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4B110F89C;
	Thu, 14 Mar 2024 03:28:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140D510F8A3;
 Thu, 14 Mar 2024 03:28:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_hmm=5Frange=5Ffault_t?=
 =?utf-8?q?o_populate_user_page?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 03:28:54 -0000
Message-ID: <171038693408.750287.12490356717484329362@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314033553.1379444-1-oak.zeng@intel.com>
In-Reply-To: <20240314033553.1379444-1-oak.zeng@intel.com>
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

Series: Use hmm_range_fault to populate user page
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
commit 949ff440ef2fd98f08340e015405731c9c20401c
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed Mar 13 23:35:53 2024 -0400

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
+ /mt/dim checkpatch 790a1d4e546a1d7f1cc5316c77f21379a4083250 drm-intel
835de08a6cb6 drm/xe/svm: Remap and provide memmap backing for GPU vram
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:58: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#58: FILE: drivers/gpu/drm/xe/xe_device_types.h:103:
+    struct dev_pagemap pagemap;$

-:64: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#64: FILE: drivers/gpu/drm/xe/xe_device_types.h:109:
+    resource_size_t hpa_base;$

-:93: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#93: FILE: drivers/gpu/drm/xe/xe_mmio.c:359:
+    struct xe_tile *tile;$

-:94: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#94: FILE: drivers/gpu/drm/xe/xe_mmio.c:360:
+    u8 id;$

-:107: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#107: 
new file mode 100644

-:112: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_svm.h', please use '/*' instead
#112: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

-:112: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#112: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

-:144: CHECK:LINE_SPACING: Please don't use multiple blank lines
#144: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:13:
+
+

-:194: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#194: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:63:
+		drm_err(&tile->xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);

-:200: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#200: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:69:
+	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);

-:212: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#212: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:81:
+#if 0

-:218: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#218: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:87:
+		devm_release_mem_region(dev, mr->pagemap.range.start,
+			mr->pagemap.range.end - mr->pagemap.range.start +1);

-:218: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#218: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:87:
+			mr->pagemap.range.end - mr->pagemap.range.start +1);
 			                                                ^

total: 0 errors, 8 warnings, 5 checks, 159 lines checked
2d11ab5ab4ca drm/xe: Helper to get memory region from tile
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
244ff8649c11 drm/xe: Helper to get dpa from pfn
-:24: WARNING:LINE_SPACING: Missing a blank line after declarations
#24: FILE: drivers/gpu/drm/xe/xe_device_types.h:583:
+	u64 offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
c0b901d8869e drm/xe: Helper to populate a userptr or hmmptr
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/xe/xe_hmm.c:73:
+static int build_sg(struct xe_device *xe, struct hmm_range *range,
+			     struct sg_table *st, bool write)

-:147: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#147: FILE: drivers/gpu/drm/xe/xe_hmm.c:97:
+			addr = dma_map_page(dev, page, 0, PAGE_SIZE,
+					write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE);

-:194: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#194: FILE: drivers/gpu/drm/xe/xe_hmm.c:144:
+int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range *hmm_range,
+						bool write)

-:228: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#228: FILE: drivers/gpu/drm/xe/xe_hmm.c:178:
+	 * Set the the dev_private_owner can prevent hmm_range_fault to fault

-:270: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_hmm.h', please use '/*' instead
#270: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

-:270: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#270: FILE: drivers/gpu/drm/xe/xe_hmm.h:1:
+// SPDX-License-Identifier: MIT

-:281: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#281: FILE: drivers/gpu/drm/xe/xe_hmm.h:12:
+int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range *hmm_range,
+						bool write);

total: 0 errors, 4 warnings, 4 checks, 234 lines checked
949ff440ef2f drm/xe: Use hmm_range_fault to populate user pages


