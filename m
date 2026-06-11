Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640F3CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 23:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF4410E07B;
	Thu, 11 Jun 2026 23:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bukPHK++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0454210E07B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 23:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781222333; x=1812758333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KxA7v3i52ndOtI5QKsHaDRldsjjES18wv1aaT+0prdc=;
 b=bukPHK++tsg6e8h+IATFpyKC59iNKK86C7RvwDILa6Ro/REHWqf4UbMG
 MJYKMOz1kTU3IPGH0Db+0SlBgvxj1+ps/UFjWeC/NpJYHeNva2rtswGlC
 9aY5Wn8nEuTIuDvl9m/CuS6pypm51UPL7gY1qS7XPcXe/vFwT96UoQLds
 PDduW1WsAEKQQbQVePoQwG4Pul+6kd7b2ngNBBO0XRoziivMj+XJ7j1bp
 U8kIry9wuzx+dqq9XVbqj3AYmEoZt7HcJzhieGQlGYKLCJmTeFVBprqe7
 VKmuRO1LCX1gxM/5g2wSDAOQlENWg6XqFCRyienMuqKXnazdVvKz3BVgJ g==;
X-CSE-ConnectionGUID: F2jS3dFVTfqyrrqttObENQ==
X-CSE-MsgGUID: 7cZfiL53Se66oVBMvwlJAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99471015"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="99471015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 16:58:52 -0700
X-CSE-ConnectionGUID: fJIBGkFXTVSy6Iyupsm3NQ==
X-CSE-MsgGUID: OeYgwivWQNSeRfvXOh+VlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="248547766"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 16:58:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Set TTM device beneficial_order to 9 (2M)
Date: Thu, 11 Jun 2026 16:58:44 -0700
Message-Id: <20260611235844.3725147-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Set the TTM device beneficial_order to 9 (2M), which is the sweet
spot for Xe when attempting reclaim on system memory BOs, as it matches
the large GPU page size. This ensures reclaim is attempted at the most
effective order for the driver.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..b60a651a3c9b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -526,7 +526,8 @@ int xe_device_init_early(struct xe_device *xe)
 
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
-			      xe->drm.vma_offset_manager, 0);
+			      xe->drm.vma_offset_manager,
+			      TTM_ALLOCATION_POOL_BENEFICIAL_ORDER(get_order(SZ_2M)));
 	if (err)
 		return err;
 
-- 
2.34.1

