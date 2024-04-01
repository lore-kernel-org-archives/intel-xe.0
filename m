Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3EDCD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 14:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E510F017;
	Mon,  1 Apr 2024 14:32:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8896E882B5;
 Mon,  1 Apr 2024 14:32:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_hmm=5Frange=5Ffault_t?=
 =?utf-8?q?o_populate_user_page_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Apr 2024 14:32:38 -0000
Message-ID: <171198195855.1117021.18077913442142911896@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322035520.2382600-1-oak.zeng@intel.com>
In-Reply-To: <20240322035520.2382600-1-oak.zeng@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/131463/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 74c1e29f2828e8e0280395ad2a18007004b4518a
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Thu Mar 21 23:55:20 2024 -0400

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
+ /mt/dim checkpatch a585b19932157f2c96293bf00288968ada86d435 drm-intel
eacfb6259412 drm/xe: Introduce helper to populate userptr
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
70e85440fc92 drm/xe: Introduce a helper to free sg table
-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/xe/xe_hmm.c:131:
+	dma_unmap_sgtable(dev, userptr->sg,
+			write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);

total: 0 errors, 0 warnings, 1 checks, 52 lines checked
74c1e29f2828 drm/xe: Use hmm_range_fault to populate user pages


