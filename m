Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305ABEB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 13:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF0710E7BD;
	Tue, 10 Sep 2024 13:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN8rgVCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349610E7BE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973922; x=1757509922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iF8axzE/QId4a9qor3MI0r+CUtkHeMhF23cw9uLx2k0=;
 b=DN8rgVCNLIA/ZQ/JDDQS8vRcoi/xTbi/+kl+Q8yYshrkN5bS34ksVv+o
 HKt2PofBywX4ackNFn2iF0jBQ02rpzHasobXL+uossa33o005ro9tOXSS
 qB2O+i2tEOCAXcfXb1fpp4mdhrsM9rzKnzDskpdM5tT22AM0jOgm4rR8W
 xbtnyr3mMQUIFUCoYLJpXf03yZzRdzvSCXgTQr/q33C7H/yQvKQVS/JlS
 oGGy6Njj3Cx6edbMCp+uWItjV/3lAAp+4iJnomn+K3IETHWNzOqmXCQzl
 YcfSwxDVwqnyTxLNDeN0K0rmpq6VPl7d7dbE16T1ZVioMDmk2GvrgOER/ w==;
X-CSE-ConnectionGUID: A3v9tF8yS9GaoEBcRLJkfw==
X-CSE-MsgGUID: kZOiltLtRIyOM9URsZqUTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24861237"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24861237"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:12:02 -0700
X-CSE-ConnectionGUID: rakxbUf7QXed6xkgU4tIFQ==
X-CSE-MsgGUID: dnG7sOfIRo6sJxwVKi7JWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67037944"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.215])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:11:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/4] drm/xe/client: add missing bo locking in show_meminfo()
Date: Tue, 10 Sep 2024 14:11:47 +0100
Message-ID: <20240910131145.136984-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910131145.136984-5-matthew.auld@intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
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

Fixes: 0845233388f8 ("drm/xe: Implement fdinfo memory stats printing")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_drm_client.c | 37 +++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index badfa045ead8..3cca741c500c 100644
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
@@ -207,7 +211,20 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
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
 
@@ -217,7 +234,21 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
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

