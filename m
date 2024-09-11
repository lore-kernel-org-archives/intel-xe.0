Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48E3EE49BC
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF6E10EA4D;
	Wed, 11 Sep 2024 15:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOI2c1S6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0964210EA3A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726070153; x=1757606153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kbCvuCdu1qwhzdalj8drRd6v+b4FlmFXQd1405NgiKY=;
 b=YOI2c1S6Vkhly6e50ZYcKYliYNoh6dsT9MzxUuTf0/uN09mhxyjyhjAN
 //HW9nxEX8qXw+3Dd+33b55ePLCU5Z/Fe1Ld+/fYuLEQRCtvAPkOB2o3j
 9o1UxSfCz1Cv4d0KW5J780Ehc98qkPiNQ7M2r1yHQa8nu1+vlw0PqAUjq
 yTVwfu1XShecKOrHwPOalDMdWtYnliQaw80f5wLA5NdOFHfTE3YOEEplb
 bpDU0N6wYBKn2MHI5E+3oh1zXsg21BDpxI5s5X6erPjQGrfsqlQR7ANkS
 qymp08Aep+z8UMG/kvboYIOfUFcgP6cNej7lXoXvSArv6BE4Rgvd0qLmX w==;
X-CSE-ConnectionGUID: w1qkmkJqT/qes3nvMUOTdA==
X-CSE-MsgGUID: d3b56yVVQImpxw5xaXem/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24703344"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24703344"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:53 -0700
X-CSE-ConnectionGUID: UF6dSX6BReeeY36+8IATOQ==
X-CSE-MsgGUID: lBabBOlUQIaUnkkuLSnCrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67257844"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/4] drm/xe/client: use mem_type from the current resource
Date: Wed, 11 Sep 2024 16:55:29 +0100
Message-ID: <20240911155527.178910-7-matthew.auld@intel.com>
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

Rather extract the mem_type from the current resource. Checking the
first potential placement doesn't really tell us where the bo is
currently allocated, especially if there are multiple potential
placements.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 95a05c5bc897..c4add8b38bbd 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -168,15 +168,10 @@ static void bo_meminfo(struct xe_bo *bo,
 		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
 {
 	u64 sz = bo->size;
-	u32 mem_type;
+	u32 mem_type = bo->ttm.resource->mem_type;
 
 	xe_bo_assert_held(bo);
 
-	if (bo->placement.placement)
-		mem_type = bo->placement.placement->mem_type;
-	else
-		mem_type = XE_PL_TT;
-
 	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
 		stats[mem_type].shared += sz;
 	else
-- 
2.46.0

