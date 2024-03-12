Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CD2C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6551124CB;
	Tue, 12 Mar 2024 14:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEKxFXWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AB310FF70
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252311; x=1741788311;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=n04FG5bZCwPkl716Y0YpxmqHHqJ0msDevUdgEQAvBns=;
 b=VEKxFXWBTxlI+LCd4weW4Nx7/NInhMjASpifUFM/Sy1hW8rVQpUPgISP
 7V1Ou7hwvomHOKjQjGzFG9d3k3Oyus0CDHA5ehSHz5TRB1iG1mqOf++ei
 p1faSroDyLJ7WS8xgOEncW7UHIA1UDeFAx3DlKHV20UHtxv/oZiVPLpuz
 UJ+HRBwQ3T3FRVnwVlalilKc14yxxtOP5CWFo3wQfaDBmdm8aXdirK03Y
 yOScs5KyLif4nwvrpVI39Ug7lW5M9QMEcFBDy3iHz6Co0wNa8RorFvy+D
 pO0gMAKZYOJhkZtRaffhRY74haGZ0Wau9zWvFaV4jL3NPua2X4W4Ky5Ea A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22416001"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22416001"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12148466"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 7/7] drm/xe/bo: Allow migrating local bos to TT to make room in
 VRAM
Date: Tue, 12 Mar 2024 15:04:47 +0100
Message-ID: <20240312140447.50437-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
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

If VRAM is full and we want to evict local bos we can't typically
do that, since we require all local bos to be residient at
execution time.
But we're allowed to migrate to TT if that's a valid placement
for GPU access, so in that case, do that.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9b7fc51492ef..a88082fc68a8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1049,6 +1049,21 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+/*
+ * Does @bo have @mem_type as an allowed placement?
+ */
+static bool xe_bo_may_reside_in(const struct xe_bo *bo, unsigned int mem_type)
+{
+	const struct ttm_placement *placement = &bo->placement;
+	unsigned int i;
+
+	for (i = 0; i < placement->num_placement; ++i) {
+		if (placement->placement[i].mem_type == mem_type)
+			return true;
+	}
+	return false;
+}
+
 static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
 				    const struct ttm_place *place)
 {
@@ -1062,6 +1077,10 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
 			/* Not bound to the vm? */
 			if (list_empty(&ttm_bo->base.gpuva.list))
 				goto allow;
+			/* Is the bo gpu accessible even if placed in TT? */
+			if (ttm_bo->resource && ttm_bo->resource->mem_type !=
+			    XE_PL_TT && xe_bo_may_reside_in(xe_bo, XE_PL_TT))
+				goto allow;
 			return false;
 		}
 	}
-- 
2.44.0

