Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D958606A32E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYsAw2lc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98DD112CBF;
	Fri,  6 Nov 2026 10:17:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60371112CDB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793960215; x=1825496215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwTWdhK6lZk5cQyJWI7Qt9DxrUbs/zzFL5bjlPQ+zYk=;
 b=cYsAw2lcF9Y2vU7Cc4uEcBUdoNypudIYmpcGanWC+8hiyUE4hYmBHzP1
 3TTqKkCDArKeok5sYP5/I+bOpx6yIHCgNKUv1DvajToxfpb2AFXuc/nSx
 c3QP5ttrAyPEEdA90Q8CiIzw2av08alTCKaI8tbyp6GC7ozlLHJTDNUvu
 RuISPU43VaPdHQqucV1VIzX9kCG01xXCLZDUlGFNY291ea7xNfPsVJYgV
 Hx6Lkqlokg68kN+gTMhQt/Pz+rk6qt10d/uZ6LQYyd1eP/qwfYc+5e9Yv
 rTJozv6lZQnPySMvUid+SzTzcIOOJkHyZrbPH69b/oad0+8DHEPhMWK7n g==;
X-CSE-ConnectionGUID: kb+AalR8QfCgNiQL1PEncQ==
X-CSE-MsgGUID: 3m0sOH+fR0e9qt3/CPFL0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2785437"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2785437"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 02:16:55 -0800
X-CSE-ConnectionGUID: 5w5yemglTKyBY6Db2xobuQ==
X-CSE-MsgGUID: oib/MFJqQBiVtQVHj4rDAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7131707"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 02:16:54 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
Subject: [PATCH 1/2] drm/xe: only evict CCS buffers from TT on iGPU
Date: Fri,  6 Nov 2026 10:16:42 +0000
Message-ID: <20261106-s4-opti-v1-1-5edaea2c6d31@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
References: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On iGPU platforms with Flat CCS, xe_bo_evict_all_user() currently calls
ttm_resource_manager_evict_all() on XE_PL_TT, evicting every buffer in
TT even if it does not use Flat CCS compression.

Walk the XE_PL_TT LRU using ttm_bo_lru_for_each_reserved_guarded() and
only evict buffers with initialised CCS state (or purge them if marked
DONTNEED), leaving non-CCS buffers in place.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Carlos Santa <carlos.santa@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 64 +++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..1f95769c4a56 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -5,6 +5,8 @@
 
 #include "xe_bo_evict.h"
 
+#include <drm/ttm/ttm_bo.h>
+
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
@@ -104,8 +106,46 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe)
 				    xe_bo_notifier_unprepare_pinned);
 }
 
+static int xe_bo_evict_all_ccs(struct ttm_resource_manager *man)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false,
+	};
+	struct ttm_lru_walk_arg arg = {
+		.ctx = &ctx,
+		.sleeping_lock = true,
+	};
+	struct ttm_bo_lru_cursor cursor;
+	struct ttm_buffer_object *ttm_bo;
+	int ret = 0;
+
+	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &arg, ttm_bo) {
+		struct xe_bo *bo;
+
+		if (!xe_bo_is_xe_bo(ttm_bo) || ttm_bo->deleted)
+			continue;
+
+		bo = ttm_to_xe_bo(ttm_bo);
+		if (xe_bo_is_pinned(bo) || !xe_bo_needs_ccs_pages(bo) ||
+		    !bo->ccs_cleared)
+			continue;
+
+		if (xe_bo_madv_is_dontneed(bo))
+			ret = xe_ttm_bo_purge(ttm_bo, &ctx);
+		else
+			ret = xe_bo_evict(bo, NULL);
+		if (ret)
+			break;
+	}
+	if (IS_ERR(ttm_bo))
+		return PTR_ERR(ttm_bo);
+
+	return ret;
+}
+
 /**
- * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM
+ * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM (and CCS in TT)
  * @xe: xe device
  *
  * Evict non-pinned user BOs (via GPU).
@@ -123,22 +163,26 @@ int xe_bo_evict_all_user(struct xe_device *xe)
 		struct ttm_resource_manager *man =
 			ttm_manager_type(bdev, mem_type);
 
+		if (!man)
+			continue;
+
 		/*
 		 * On igpu platforms with flat CCS we need to ensure we save and restore any CCS
 		 * state since this state lives inside graphics stolen memory which doesn't survive
 		 * hibernation.
-		 *
-		 * This can be further improved by only evicting objects that we know have actually
-		 * used a compression enabled PAT index.
 		 */
-		if (mem_type == XE_PL_TT && (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe)))
+		if (mem_type == XE_PL_TT) {
+			if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe)) {
+				ret = xe_bo_evict_all_ccs(man);
+				if (ret)
+					return ret;
+			}
 			continue;
-
-		if (man) {
-			ret = ttm_resource_manager_evict_all(bdev, man);
-			if (ret)
-				return ret;
 		}
+
+		ret = ttm_resource_manager_evict_all(bdev, man);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.56.0
