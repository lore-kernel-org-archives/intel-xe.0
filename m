Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD8CE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 12:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF4410EFEA;
	Fri, 13 Dec 2024 12:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dId4JMWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D245110EFEA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734091519; x=1765627519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wxca4nWqVRYw78odCUx7X9ScpYXZQbZgyncSVPxftBs=;
 b=dId4JMWbA7rz7FhoVc4nYUJF7RhV5kXVF+qrWKWRHD0AuhAxlgg2rKwx
 zeHdIqD6+zZuYPX6cN2cx4/GXeVWYCMdFWM1tmIyQHLJ6ipL0bnCgVZKa
 Fk0nvkfl8EDfxddODtCU5Dp1jH//yYbsTxm8pzpq1kZ1y7XJA4RjzaM6T
 i1lIbMRCcszyYzplzDUJ0jwMuys53v4Wb/nBpt+b4F7eOedyXU0I0oaZM
 J1G8R3B+Bu9kcooP4siky5Rm6mkDuHPN9HgzgCNzcYadjOp4rZ2rIgg5k
 aayzv6cN/Pv06EYk04f0WH0tjxCCqypeAVY/J2bFAgccWMlP7HQzAi+UN g==;
X-CSE-ConnectionGUID: h/4p6uwETzKfyHtVxGWpjA==
X-CSE-MsgGUID: 3wTy5zWFQj6T5Jyygn86+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45951338"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45951338"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:05:19 -0800
X-CSE-ConnectionGUID: TR8mUurtQImKW0H3n0QyfQ==
X-CSE-MsgGUID: IfIw0MLIR7e2ZqcevIx96w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="127330967"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:05:18 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 2/2] drm/xe: Wait for migration job before unmapping pages
Date: Fri, 13 Dec 2024 13:24:15 +0100
Message-ID: <20241213122415.3880017-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241213122415.3880017-1-nirmoy.das@intel.com>
References: <20241213122415.3880017-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Fix a potential GPU page fault during tt -> system moves by waiting for
migration jobs to complete before unmapping SG. This ensures that IOMMU
mappings are not prematurely torn down while a migration job is still in
progress.

v2: Use intr=false(Matt A)
v3: Update commit message(Matt A)
v4: s/DMA_RESV_USAGE_BOOKKEEP/DMA_RESV_USAGE_KERNEL(Thomas)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 06931df876ab..e6c896ad5602 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 out:
 	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
-	    ttm_bo->ttm)
+	    ttm_bo->ttm) {
+		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
+						     DMA_RESV_USAGE_KERNEL,
+						     false,
+						     MAX_SCHEDULE_TIMEOUT);
+		if (timeout < 0)
+			ret = timeout;
+
 		xe_tt_unmap_sg(ttm_bo->ttm);
+	}
 
 	return ret;
 }
-- 
2.46.0

