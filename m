Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9EEE7BDA9
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 12:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E69B10E00B;
	Mon, 16 Feb 2026 12:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cKbX84q2";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02BE10E00B;
 Mon, 16 Feb 2026 12:17:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 34A1443C03;
 Mon, 16 Feb 2026 12:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A837CC116C6;
 Mon, 16 Feb 2026 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771244236;
 bh=nCZ2XlmxuQe2RU8iCUB0ZrG16LRxkIYnd2cTVcFsfSM=;
 h=From:To:Cc:Subject:Date:From;
 b=cKbX84q2DJ9+9EmAYPO7e86nTAInqHcsdvTSNTWpGkwsletK6Zj0EoxBe6MDF68Gk
 ydlwUORCQW43KlZ/fRmW552lQumOnQEuRZARvFyakuC4cyLVNYna3nO+ZZVp9qmtYv
 945AMfLrVbJgqeFgpkL0pi+aeq0DWf6SVW4Cs9gIkti8HiHE63d2rpYM0KDLK7mkTd
 /jILE+CH0exkxmcQlCszhzCRGHhgBfYkqENi1rw/IXTXxJhO9nCNNv7ZLOtz1xDcY3
 ADlr7cxGi6pUTfep/aJm+mxJdW9ClXDP3wy0HWypztZqOhaIDfnmWMsy2CI/dufdjS
 u4AJXoyHzGBMg==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/pagemap: pass pagemap_addr by reference
Date: Mon, 16 Feb 2026 13:16:43 +0100
Message-Id: <20260216121709.2345721-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Passing a structure by reference into a function is sometimes problematic,
for a number of reasons. Of of these is a warning from the 32-bit arm
compiler:

drivers/gpu/drm/drm_gpusvm.c: In function '__drm_gpusvm_unmap_pages':
drivers/gpu/drm/drm_gpusvm.c:1152:33: note: parameter passing for argument of type 'struct drm_pagemap_addr' changed in GCC 9.1
 1152 |                                 dpagemap->ops->device_unmap(dpagemap,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1153 |                                                             dev, *addr);
      |                                                             ~~~~~~~~~~~

This particular problem is harmless since we are not mixing compiler versions
inside of the compiler. However, passing this by reference avoids the warning
along with providing slightly better calling conventions as it avoids an
extra copy on the stack.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/drm_gpusvm.c  | 2 +-
 drivers/gpu/drm/drm_pagemap.c | 2 +-
 drivers/gpu/drm/xe/xe_svm.c   | 8 ++++----
 include/drm/drm_pagemap.h     | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index c25f50cad6fe..81626b00b755 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1150,7 +1150,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 					       addr->dir);
 			else if (dpagemap && dpagemap->ops->device_unmap)
 				dpagemap->ops->device_unmap(dpagemap,
-							    dev, *addr);
+							    dev, addr);
 			i += 1 << addr->order;
 		}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index d0041c947a28..22579806c055 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -318,7 +318,7 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 			struct drm_pagemap_zdd *zdd = page->zone_device_data;
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 
-			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
+			dpagemap->ops->device_unmap(dpagemap, dev, &pagemap_addr[i]);
 		} else {
 			dma_unmap_page(dev, pagemap_addr[i].addr,
 				       PAGE_SIZE << pagemap_addr[i].order, dir);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..184cfaac8baf 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1676,13 +1676,13 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 
 static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
 					struct device *dev,
-					struct drm_pagemap_addr addr)
+					struct drm_pagemap_addr *addr)
 {
-	if (addr.proto != XE_INTERCONNECT_P2P)
+	if (addr->proto != XE_INTERCONNECT_P2P)
 		return;
 
-	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
-			   addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_resource(dev, addr->addr, PAGE_SIZE << addr->order,
+			   addr->dir, DMA_ATTR_SKIP_CPU_SYNC);
 }
 
 static void xe_pagemap_destroy_work(struct work_struct *work)
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2baf0861f78f..74a32d0dacd8 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -95,7 +95,7 @@ struct drm_pagemap_ops {
 	 */
 	void (*device_unmap)(struct drm_pagemap *dpagemap,
 			     struct device *dev,
-			     struct drm_pagemap_addr addr);
+			     struct drm_pagemap_addr *addr);
 
 	/**
 	 * @populate_mm: Populate part of the mm with @dpagemap memory,
-- 
2.39.5

