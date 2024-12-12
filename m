Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86821E77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CD710E0F4;
	Thu, 12 Dec 2024 01:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPmS7olZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04D810ECA4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965330; x=1765501330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JyIcdr6RwqPrCowmrb7UaAeh2oMCqrWzMFj1H3HiRIQ=;
 b=DPmS7olZgEdbrklqKq+eM+79C8NdIa8Hnxg/uPP6mbbzJJBR96OUFF8Q
 RS2jvHc+w1+NPQ20iNmC/Alp8qRURfMw8fpVT8p5LeYyTZFrJP1lYcCFI
 Tu8i/fdItCpoQ/RXXfMeifTNd/tguCcEVQ+vfas7vEvrjiGNycrRqdqbp
 ZVEcDr7yniZc6Zm3DbT9t4mZBoWDwnyAI6uaCu2C7wvuOmXIfjjgRGq8g
 DqMyAkaN+/4+sN4QhUEtk4uTv2hmAriR+d5GUQergRI8n2C3kGO9IlTt7
 SoYaGqOlbZDjnLdGfymrTffnFZSBsaJsveJqT3BeJJDoQAKr+DxaMyIsg w==;
X-CSE-ConnectionGUID: mN2P1JkMQbOJDOwpQ/O3Eg==
X-CSE-MsgGUID: A8gND1sUR+Wt8gPRPCVb8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379801"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:09 -0800
X-CSE-ConnectionGUID: ITfZY70dTjy+6l7Clwh7kA==
X-CSE-MsgGUID: 7/SSjiu2TQOHiMSDOf0yJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856606"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:09 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 09/13] drm/xe/sa: Minor header cleanups
Date: Thu, 12 Dec 2024 02:01:37 +0100
Message-Id: <20241212010141.389-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

Drop unused struct xe_bo forward declaration and, while around,
fix unnecessary line split in xe_sa_bo_free() declaration.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 9328b38eff6a..83581b427ea6 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -10,7 +10,6 @@
 #include "xe_sa_types.h"
 
 struct dma_fence;
-struct xe_bo;
 struct xe_tile;
 
 struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
@@ -27,8 +26,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
-void xe_sa_bo_free(struct drm_suballoc *sa_bo,
-		   struct dma_fence *fence);
+void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
 
 static inline struct xe_sa_manager *
 to_xe_sa_manager(struct drm_suballoc_manager *mng)
-- 
2.47.1

