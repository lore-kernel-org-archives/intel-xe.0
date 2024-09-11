Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC9BEE0213
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9957210EA39;
	Wed, 11 Sep 2024 15:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEeLECGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C9210EA3A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726070151; x=1757606151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DxZWgv8LmI84zVG27feULf1IIzcwEZhS5w1FwvUkZf0=;
 b=QEeLECGitx+ilMV7FkkLmJTlLRe2aO+CR9PB1I/yIGEnHVelTiA15akY
 YvT8389UoisiTH/UJ6mOK5y/JU3P2n4DpOIG5GRBr1KPSiUDCyZliGHfm
 jjt0gxgYws74XMtikMfWX46hgC0vKgG2Pd1dQNdfaKbdun5vBSecj8wWI
 iKkMVkR6hP8w1neDpuMunvUcqXDgh65wn1HOLGyyHTCwNLOeHqVhxpLKa
 UbSwH8kfMd38NCLCGKFavc4yol7qgCNnB/H41SJjRbZpX9MCQNq2+NKZF
 SdNrxr/vVdxj4RSEAcNKNyvAk0VFuWGEfBzhtHrp2cJfRRrR4E5eAdP4m g==;
X-CSE-ConnectionGUID: 2nATrBCDSuiLQYp3FHqTiA==
X-CSE-MsgGUID: VL9Je8ltTN2lS/0twycusQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24703338"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24703338"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:51 -0700
X-CSE-ConnectionGUID: UZm/QsFrRe2KgYqueoEL/w==
X-CSE-MsgGUID: aPAogfTrQ1ymCHqmRK3Jog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67257836"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/4] drm/xe/client: add missing bo locking in show_meminfo()
Date: Wed, 11 Sep 2024 16:55:28 +0100
Message-ID: <20240911155527.178910-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911155527.178910-5-matthew.auld@intel.com>
References: <20240911155527.178910-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

bo_meminfo() wants to inspect bo state like tt and the ttm resource,
however this state can change at any point leading to stuff like NPD and
UAF, if the bo lock is not held. Grab the bo lock when calling
bo_meminfo(), ensuring we drop any spinlocks first. In the case of
object_idr we now also need to hold a ref.

v2 (MattB)
  - Also add xe_bo_assert_held()

Fixes: 0845233388f8 ("drm/xe: Implement fdinfo memory stats printing")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 39 +++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index badfa045ead8..95a05c5bc897 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_device_types.h"
@@ -151,10 +152,13 @@ void xe_drm_client_add_bo(struct xe_drm_client *client,
  */
 void xe_drm_client_remove_bo(struct xe_bo *bo)
 {
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct xe_drm_client *client = bo->client;
 
+	xe_assert(xe, !kref_read(&bo->ttm.base.refcount));
+
 	spin_lock(&client->bos_lock);
-	list_del(&bo->client_link);
+	list_del_init(&bo->client_link);
 	spin_unlock(&client->bos_lock);
 
 	xe_drm_client_put(client);
@@ -166,6 +170,8 @@ static void bo_meminfo(struct xe_bo *bo,
 	u64 sz = bo->size;
 	u32 mem_type;
 
+	xe_bo_assert_held(bo);
+
 	if (bo->placement.placement)
 		mem_type = bo->placement.placement->mem_type;
 	else
@@ -207,7 +213,20 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	idr_for_each_entry(&file->object_idr, obj, id) {
 		struct xe_bo *bo = gem_to_xe_bo(obj);
 
-		bo_meminfo(bo, stats);
+		if (dma_resv_trylock(bo->ttm.base.resv)) {
+			bo_meminfo(bo, stats);
+			xe_bo_unlock(bo);
+		} else {
+			xe_bo_get(bo);
+			spin_unlock(&file->table_lock);
+
+			xe_bo_lock(bo, false);
+			bo_meminfo(bo, stats);
+			xe_bo_unlock(bo);
+
+			xe_bo_put(bo);
+			spin_lock(&file->table_lock);
+		}
 	}
 	spin_unlock(&file->table_lock);
 
@@ -217,7 +236,21 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 		if (!kref_get_unless_zero(&bo->ttm.base.refcount))
 			continue;
 
-		bo_meminfo(bo, stats);
+		if (dma_resv_trylock(bo->ttm.base.resv)) {
+			bo_meminfo(bo, stats);
+			xe_bo_unlock(bo);
+		} else {
+			spin_unlock(&client->bos_lock);
+
+			xe_bo_lock(bo, false);
+			bo_meminfo(bo, stats);
+			xe_bo_unlock(bo);
+
+			spin_lock(&client->bos_lock);
+			/* The bo ref will prevent this bo from being removed from the list */
+			xe_assert(xef->xe, !list_empty(&bo->client_link));
+		}
+
 		xe_bo_put_deferred(bo, &deferred);
 	}
 	spin_unlock(&client->bos_lock);
-- 
2.46.0

