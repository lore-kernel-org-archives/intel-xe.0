Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEACE77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5E10E24A;
	Thu, 12 Dec 2024 01:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMlI+zpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E9E10E24A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965319; x=1765501319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vBxJhF5iyQjtAvzBiinpVSasJtYd9LhfX0/ziz15aBo=;
 b=ZMlI+zpkg6/T4Nnkcntpf9GXG3RnTpinSDJpr55NjN5CRHb6b97DDYyK
 Pew4iLq66B3PKz2MwjhZrw4WmWSWjDAOQoIIeEnruf2EihXzx0nRF3bAR
 36C1UbOKTDX19F7ItHokyHrWSlNRxpYMrNKKaTbujWNuFDpLr5hDASEQd
 aAJ5SkoNRQYUh94ybwReHPQPCH61J2gaxsPoAT7atjc6bwW0hV+Dvdlqi
 jvFAhO8l9kzb85pTuKg8k1daM8DsT45B4AeIWEOwrs3voFjEhpKy4Ej9M
 L4zeAMmJ0xKT12fQoyZ9XhtFmXBMbub0mXMllBAetE0OwdiFoKdMLsWQN Q==;
X-CSE-ConnectionGUID: m1//BkkZSSWSRFLAl/wdDQ==
X-CSE-MsgGUID: I48U++TxTEuXYQMcWvOD9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379786"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379786"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:01:59 -0800
X-CSE-ConnectionGUID: id1nXzFDSx62sJEERKjOtw==
X-CSE-MsgGUID: eHNtpQkRTtq67CE6AMs31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856489"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:01:58 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 02/13] drm/xe/sa: Drop redundant NULL assignments
Date: Thu, 12 Dec 2024 02:01:30 +0100
Message-Id: <20241212010141.389-3-michal.wajdeczko@intel.com>
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

The sa_manager is drmm_kzalloc'ed so all members are already zero.
And in case of kvzalloc() failure we are not returning pointer to
the sa_manager at all, so no point in resetting .bo member.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 4e7aba445ebc..eb314ca75355 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -44,8 +44,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	if (!sa_manager)
 		return ERR_PTR(-ENOMEM);
 
-	sa_manager->bo = NULL;
-
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
@@ -61,10 +59,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 
 	if (bo->vmap.is_iomem) {
 		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
-		if (!sa_manager->cpu_ptr) {
-			sa_manager->bo = NULL;
+		if (!sa_manager->cpu_ptr)
 			return ERR_PTR(-ENOMEM);
-		}
 	} else {
 		sa_manager->cpu_ptr = bo->vmap.vaddr;
 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
-- 
2.47.1

