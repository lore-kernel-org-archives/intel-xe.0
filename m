Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69431E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3463610EC9F;
	Thu, 12 Dec 2024 01:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eP1Zu3P0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D562D10EC9F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965321; x=1765501321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GOua7QgtIqFVWDr6FTlNl7ot65yqrnQ4h6S1BfBmfME=;
 b=eP1Zu3P09hKzmnreLPI34X7EHmay0eu9BSasW/XxhwbL2avujlMQJqFi
 iZeqCzR5j0hExXtdC1wE1h5TtP0En8JYqrWUdCTAUGLVoUj8qkp/liovw
 g0RTcT+F70IRXrBK4m4di3lvrZvGReH+BNhSK/egoXMIlBp0/A13I2d8W
 5lF5DEUoN6T73FIPmc0cRRbp8yQkjSpjM0ErzuiHiMq3CzylMbVu9A5tx
 W016D4o4mtttLynHLJouOuyIM0QnwXn+CzfbR6UkKejt/RI18POQEI4Dz
 lfHSsJqhrNgU+mcvcHBjxY84kVg9fGiMLBUGMSCY+GqLivz/cloOutFJf A==;
X-CSE-ConnectionGUID: bd+lsONMRJaH7wVhG7vWhw==
X-CSE-MsgGUID: lpFPgd20S/uWPr2XsqSEMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379788"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:00 -0800
X-CSE-ConnectionGUID: RfXegClVRNqq/HUBqyQjrg==
X-CSE-MsgGUID: sG88pIRQROKBSAzTwEhXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856502"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 03/13] drm/xe/sa: Cleanup internal BO data at device removal
Date: Thu, 12 Dec 2024 02:01:31 +0100
Message-Id: <20241212010141.389-4-michal.wajdeczko@intel.com>
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

The underlying buffer object used by the sub-allocator is
device managed and it will be released on device removal.
Thus we should not wait with cleanup of related BO members
until drm cleanup, but do that at the same time as BO.
Add another device action and move there related cleanups.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index eb314ca75355..a5e05237b646 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -16,18 +16,19 @@
 static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_sa_manager *sa_manager = arg;
-	struct xe_bo *bo = sa_manager->bo;
-
-	if (!bo) {
-		drm_err(drm, "no bo for sa manager\n");
-		return;
-	}
 
 	drm_suballoc_manager_fini(&sa_manager->base);
+}
+
+static void sa_bo_manager_fini_bo(void *arg)
+{
+	struct xe_sa_manager *sa_manager = arg;
 
 	if (sa_manager->is_iomem)
 		kvfree(sa_manager->cpu_ptr);
 
+	sa_manager->cpu_ptr = NULL;
+	sa_manager->gpu_addr = 0;
 	sa_manager->bo = NULL;
 }
 
@@ -66,6 +67,10 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
 	}
 
+	ret = devm_add_action_or_reset(xe->drm.dev, sa_bo_manager_fini_bo, sa_manager);
+	if (ret)
+		return ERR_PTR(ret);
+
 	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
 	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
 				       sa_manager);
-- 
2.47.1

