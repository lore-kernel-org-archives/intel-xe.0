Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2B3C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AC510E6B8;
	Wed, 30 Jul 2025 14:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIvlK+J2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527B710E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753886070; x=1785422070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+w+WgAj8eK3K+7Z1iGAPd9f4Nq7HJKewmI6erxCIxoM=;
 b=FIvlK+J2wrn6YWcVTw1h86hYIUwUonfwTAmV/S99XhkpghHWA+PICo4/
 FU1uFeixLw57PyOmqr/vnUBu/KRL0sMxTk27pp1M/29EoZ8VitY1e8vWn
 tglch1axurfy039Kx0YqqntmaJt4YfmTRSNi9m2aguFT/Gnlxz2I5Xttl
 679lNBEQh1mJwsxwzHkFpGKxCQ8KXfmE5+Da9rRufz/Fx/bJuNpbAMq4o
 x7Z/PMhOGGwyMQ0EdZzcRu+/oFLAM8NxHmcC9XQsKoZyr2WQ7ZowJ4TyW
 qvhirUDzZF/uhvdElMfFy1kC3WgfyjTPr5QM+zErfGIxutQbK2Xd3jbD3 w==;
X-CSE-ConnectionGUID: XQfnDB8wRN64kZYJkOT2Og==
X-CSE-MsgGUID: P3DdzpS/Rbi+KwK3UW39fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56120614"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56120614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:34:30 -0700
X-CSE-ConnectionGUID: jUK5yczvSyeKfIy2y59dQw==
X-CSE-MsgGUID: sVIwC/kETDya25f3kzKrBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167220644"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.102])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:34:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe/migrate: prevent potential UAF
Date: Wed, 30 Jul 2025 15:33:39 +0100
Message-ID: <20250730143335.174373-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730143335.174373-5-matthew.auld@intel.com>
References: <20250730143335.174373-5-matthew.auld@intel.com>
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

If we hit the error path, the previous fence (if there is one) has
already been put() prior to this, so doing a fence_wait could lead to
UAF. Tweak the flow to do to the put() until after we do the wait.

Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index daca18b5b45f..bd356d9eef27 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2062,9 +2062,6 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			current_bytes = min_t(int, current_bytes, S16_MAX * pitch);
 		}
 
-		if (fence)
-			dma_fence_put(fence);
-
 		__fence = xe_migrate_vram(m, current_bytes,
 					  (unsigned long)buf & ~PAGE_MASK,
 					  dma_addr + current_page,
@@ -2072,11 +2069,15 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 					  XE_MIGRATE_COPY_TO_VRAM :
 					  XE_MIGRATE_COPY_TO_SRAM);
 		if (IS_ERR(__fence)) {
-			if (fence)
+			if (fence) {
 				dma_fence_wait(fence, false);
+				dma_fence_put(fence);
+			}
 			fence = __fence;
 			goto out_err;
 		}
+
+		dma_fence_put(fence);
 		fence = __fence;
 
 		buf += current_bytes;
-- 
2.50.1

