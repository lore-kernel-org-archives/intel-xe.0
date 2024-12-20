Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA3AE7718C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B448810E011;
	Fri, 20 Dec 2024 19:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zm0QhxtR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFF510E011
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723739; x=1766259739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MvLVVCoLQNvNy2Rgq3WgZ5obH/bBQw/3HiNixBxmghs=;
 b=Zm0QhxtRQ6Ga/G1hxH1uDPOTzc9LumcI4D47N8yPaBhCx42W2DYaH5Iq
 18sOKmlz8wbQv77+TvtebNhP2TFhwb17oNItHJz0bK273ZGFpLNu5lZJH
 wVqG7bz/DqNrxgA8EfK+bMyt1j5r7o5XQgK3WaHzd1MwHw5Q5Th3NkQVr
 Bf9iHYAy4KsK4POa20KUHn5fQcCLVzlQK0040iYRej0ewwFJXKpOLFZmW
 tcKvG6hnEOfQ0AF8DfzOlOM6GN6qyyUaGRKQGLjivp7psjv/qFuRz7ePZ
 iDUGuwKrN2g/owgMg8089vF/Nr4a9FovIJEyPrw13vLZmXHCDGllg9KO1 w==;
X-CSE-ConnectionGUID: n8ViykNnQkSNySrfIKkJiQ==
X-CSE-MsgGUID: pfL0dbCBRF6FRg6aytZ5/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965211"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:19 -0800
X-CSE-ConnectionGUID: DMLNzYeRSBKhDKwshUzmYg==
X-CSE-MsgGUID: YkMspOMoS+C2RLacl+TqpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075423"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:17 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 01/11] drm/xe/sa: Always call drm_suballoc_manager_fini()
Date: Fri, 20 Dec 2024 20:41:54 +0100
Message-Id: <20241220194205.995-2-michal.wajdeczko@intel.com>
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

After successful call to drm_suballoc_manager_init() we should
make sure to call drm_suballoc_manager_fini() as it may include
some cleanup code even if we didn't start using it for real.

As we can abort init() early due to kvzalloc() failure, we should
either explicitly call drm_suballoc_manager_fini() or, even better,
postpone drm_suballoc_manager_init() once we finish all other
preparation steps, so we can rely on fini() that will do cleanup.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index e055bed7ae55..4e7aba445ebc 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -57,8 +57,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	}
 	sa_manager->bo = bo;
 	sa_manager->is_iomem = bo->vmap.is_iomem;
-
-	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
 	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
 
 	if (bo->vmap.is_iomem) {
@@ -72,6 +70,7 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
 	}
 
+	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
 	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
 				       sa_manager);
 	if (ret)
-- 
2.47.1

