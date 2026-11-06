Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CD9606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ASu5ObZL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD17A10FF2A;
	Fri,  6 Nov 2026 15:54:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3884310FF2A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793980440; x=1825516440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9S4acSsyrfzQOqONjfGpSXUUTf3trcrvSMV+zVEu0qE=;
 b=ASu5ObZLwgDaYa9Ow8gfu0t8Rx7aG8vWphEdtDYxs3sTdlH7hf0PggMD
 2wBseqa3QeMMa3Opa62c7hrS00KNncVyxc7z+6BWPAE66TRNoF0kZOwmt
 lXi+62LIJuYbDyY6Oh0zPSWH8zA82K1YIps3482tIP1mNh6X2r8OYjpF9
 +BAFwprWDuz161MWOXZefyB5kDkaq2HhNFhQvQI25WUg/NyuYDwpamjh8
 ndJeGStyIqSzb0QC3SJ9I2Oo56yVncUt/V4wpbOj7znhoKDEGAbxd33lM
 qDxgISbDsk1EKucvbvw90wCu/FpxnuA3NLCzMlzvaqtNXAtghuP1MqHxc A==;
X-CSE-ConnectionGUID: YtPGdNK/Rseunf4rudwiCw==
X-CSE-MsgGUID: JDmfrA5WTB+hMvj7OIqSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2895845"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2895845"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:54:00 -0800
X-CSE-ConnectionGUID: KgN7g7egRY2SFsti3c6woA==
X-CSE-MsgGUID: LE0yby6ESWWZncxlsTMOlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7650143"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:53:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
Subject: [PATCH v2 1/2] drm/xe: only evict CCS buffers from TT on iGPU
Date: Fri,  6 Nov 2026 15:53:43 +0000
Message-ID: <20261106-s4-opti-v2-1-a3cdae711a3b@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106-s4-opti-v2-0-a3cdae711a3b@intel.com>
References: <20261106-s4-opti-v2-0-a3cdae711a3b@intel.com>
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

v2 (Sashiko):
  - Ensure purge() path refaults user mmaps

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Carlos Santa <carlos.santa@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 66 ++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..72a13aba558d 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -5,6 +5,8 @@
 
 #include "xe_bo_evict.h"
 
+#include <drm/ttm/ttm_bo.h>
+
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
@@ -104,8 +106,48 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe)
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
+		if (xe_bo_madv_is_dontneed(bo)) {
+			ttm_bo_unmap_virtual(ttm_bo);
+			ret = xe_ttm_bo_purge(ttm_bo, &ctx);
+		} else {
+			ret = xe_bo_evict(bo, NULL);
+		}
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
@@ -123,22 +165,26 @@ int xe_bo_evict_all_user(struct xe_device *xe)
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
