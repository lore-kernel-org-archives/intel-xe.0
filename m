Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F18E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 11:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC5C10E5CB;
	Thu,  5 Dec 2024 11:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7fozab5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7158710E5C4
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733399042; x=1764935042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AE27GIKgR4YhLEYoDRJtp+/wA4/TSiQv6CxIogL1FQI=;
 b=X7fozab5morMkbVUNdxeiKaeDNCJUqcYbTxx/RMIDac/PdzCkJdX1E/2
 SMLcLJgQJB+/mPpNVO9gQwh3CMvQlndyaWmPR4q71d2jBQBzVju+hLVxf
 t39+NvcixMqu28YmWst2cV9vOHJ5PHWexFmUoX0sTrUViKJW+AIV4GXA/
 M9P9Yuu7u0DfVVR+T/blQAuBWg0KvxibNvHbLUEKzG+LR+CvttMvG9heK
 k1h4U0sQkSiYIN6GuT+eD2I8ae4YOjhgZWFAMTCgtCUSEZJZ2PSQ62idD
 STXG9MgjzSO3dZBS6MCtwFybdx/pwJdIQGPjZvLiSHSU5p66VuOnrosD6 Q==;
X-CSE-ConnectionGUID: 0Gi7V+M9SUWw5K301ZU34Q==
X-CSE-MsgGUID: sn1cT1OCQGm7E9maM4653w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44376700"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="44376700"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:44:01 -0800
X-CSE-ConnectionGUID: rv1XKFvQRG6CP7emSh0dvA==
X-CSE-MsgGUID: BuiED4j4TGuCVYuKCXkQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="131499506"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:44:00 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Wait for migration job before unmapping pages
Date: Thu,  5 Dec 2024 13:02:53 +0100
Message-ID: <20241205120253.2015537-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241205120253.2015537-1-nirmoy.das@intel.com>
References: <20241205120253.2015537-1-nirmoy.das@intel.com>
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

There could be still migration job going on while doing
xe_tt_unmap_sg() which could trigger GPU page faults. Fix this by
waiting for the migration job to finish.

v2: Use intr=false(Matt A)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b2aa368a23f8..c906a5529db0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 out:
 	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
-	    ttm_bo->ttm)
+	    ttm_bo->ttm) {
+		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP,
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

