Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD5DC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 16:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ABE10E21C;
	Fri, 25 Jul 2025 16:30:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A467910E21C;
 Fri, 25 Jul 2025 16:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prepare_GPU_SVM_for_migra?=
 =?utf-8?q?tion_of_THP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 16:30:39 -0000
Message-ID: <175346103966.190605.6691527462303145010@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725154011.2807655-1-francois.dugast@intel.com>
In-Reply-To: <20250725154011.2807655-1-francois.dugast@intel.com>
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

Series: Prepare GPU SVM for migration of THP (rev2)
URL   : https://patchwork.freedesktop.org/series/151754/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0218c562e70959363c6ca87c83aa3a46ab1b4366
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Jul 25 17:39:30 2025 +0200

    drm/xe/svm: Migrate folios when possible
    
    The DMA mapping can now correspond to a folio (order > 0), so move the
    iterator by the number of pages in the folio in order to migrate all
    pages at once. This will improve efficiency compared to migrating pages
    one by one.
    
    For this to work, the BOs must be contiguous in memory.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch a323d08c4fe03caea5c882ebe6446fd1ea441f98 drm-intel
ab82abeaad03 drm/pagemap: Rename drm_pagemap_device_addr to drm_pagemap_addr
a0d2e61ff643 drm/pagemap: Use struct drm_pagemap_addr in mapping and copy functions
-:66: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#66: FILE: drivers/gpu/drm/drm_pagemap.c:239:
+		pagemap_addr[i] = drm_pagemap_addr_encode(

-:380: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#380: FILE: drivers/gpu/drm/xe/xe_migrate.c:1921:
+static struct drm_pagemap_addr *xe_migrate_dma_map(struct xe_device *xe,
+							  void *buf, int len,

-:413: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#413: FILE: drivers/gpu/drm/xe/xe_migrate.c:1946:
+		pagemap_addr[i] = drm_pagemap_addr_encode(

total: 0 errors, 0 warnings, 3 checks, 551 lines checked
5b8f5330a5f1 drm/pagemap: DMA map folios when possible
-:88: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'order' may be better as '(order)' to avoid precedence issues
#88: FILE: include/drm/drm_pagemap.h:9:
+#define NR_PAGES(order) (1U << order)

total: 0 errors, 0 warnings, 1 checks, 79 lines checked
a01ce0a6b9f3 drm/pagemap: Allocate folios when possible
28a3ac7c1d6d drm/xe/migrate: Populate struct drm_pagemap_addr array
0218c562e709 drm/xe/svm: Migrate folios when possible


