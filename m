Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB8E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E3410F04C;
	Fri, 20 Dec 2024 19:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBKQ8xjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E92910F04C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723748; x=1766259748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CcjPh0QbcLq5MJv9A6OnvbnQB83TOzrrPKJTTmscbS0=;
 b=eBKQ8xjIeb2yxcTNQ9ZJJKQ23SEYE34jTBe96EEoeEKQ1w2EgToDJ7St
 k118ci6foYDLFBsKfxB1CaWb/nV5wf9qOhG81QwNTWyF2QpvKmGwgrFav
 aeW2UqnO1CGodpInngWSenHpWN3+HMvIataWT8Tl0BF9t7teWzwztvzzk
 bP/lb2wD5Hkuevk0lJYAPvmvMQ3ZBxQd83fofHWCbalzx4vc6OrAOVhsV
 zX8IN/Dxt32YggpxDaaI1D+pLTk2hqcThPi3jDkC+FaI0pYAGBvitExcF
 YdBorrtmOR1YoDCbZmwpFOa14YYMFrblgd7+gLinpZWOoYnHXAMV2jvDh Q==;
X-CSE-ConnectionGUID: n10r2vGnSDygFjP2i39unw==
X-CSE-MsgGUID: 90zM9lz9TxmeiBeHnyBaKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965221"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:28 -0800
X-CSE-ConnectionGUID: /iHVWsxVTC2z43EFDO9+ew==
X-CSE-MsgGUID: I9yvdH/VTxiH6xMKzSh/Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075485"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:26 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 07/11] drm/xe/sa: Minor header cleanups
Date: Fri, 20 Dec 2024 20:42:00 +0100
Message-Id: <20241220194205.995-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241220194205.995-1-michal.wajdeczko@intel.com>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index de0330eb36d4..1170ee5a81a8 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -10,7 +10,6 @@
 #include "xe_sa_types.h"
 
 struct dma_fence;
-struct xe_bo;
 struct xe_tile;
 
 struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
@@ -36,8 +35,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
-void xe_sa_bo_free(struct drm_suballoc *sa_bo,
-		   struct dma_fence *fence);
+void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
 
 static inline struct xe_sa_manager *
 to_xe_sa_manager(struct drm_suballoc_manager *mng)
-- 
2.47.1

