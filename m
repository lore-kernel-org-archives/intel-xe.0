Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83A1E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D2910E4F0;
	Fri, 20 Dec 2024 19:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY5AzH7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8D810E4F0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723744; x=1766259744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UNh5myyN+ce0enRHbe/izdEKba1WUTRpdjLGQD4j20Y=;
 b=YY5AzH7Ym7UKfB4WeeIEfNdqJYfGMnXCy07JSBSjXbxQh9ry6EgbY2fv
 lp+30EUqO10HmEfBevXfNB2I6Vu2JXrm70wFRO/Whce+vBgpMo3BmtzKS
 KKP+AV5oPVc53lJwom//VFqT24MOqSJy2A2XgWH6VgK7GW7qpHDXcaFBp
 ifiSG5C4CC2lkQ9SOb8lbxoRYeXzSnBGazuPFYQZ9lxnE+xdFJwABYEmS
 1H8WozM/HdDeoV0v4IszStMRn7d8d8gXrEwqx5SFu3+8j1F1glb2YRuUB
 RrVlStopoh6za1WIvOiaMAvYYFRwC2m2UhF2oR+AeUbscAd/Og3AhO1C0 Q==;
X-CSE-ConnectionGUID: qrz6fB96RWq5Tan530NnLg==
X-CSE-MsgGUID: 5ReBm2C8SA289sLOslRQtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965217"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:24 -0800
X-CSE-ConnectionGUID: Xt2ziO6mS9yhGnXgSIu4JQ==
X-CSE-MsgGUID: tVRCnLoBTFyHCK7lmG9mJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075457"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:22 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 04/11] drm/xe/sa: Tidy up coding style in init()
Date: Fri, 20 Dec 2024 20:41:57 +0100
Message-Id: <20241220194205.995-5-michal.wajdeczko@intel.com>
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

There is no need to use tile_to_xe() since we already got the xe.
And we should keep all variable declarations together, no need for
separate sa_manager declaration.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 0b87599759d7..0e78ae46667e 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -34,13 +34,12 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
 	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_sa_manager *sa_manager;
 	u32 managed_size = size - SZ_4K;
 	struct xe_bo *bo;
 	int ret;
 
-	struct xe_sa_manager *sa_manager = drmm_kzalloc(&tile_to_xe(tile)->drm,
-							sizeof(*sa_manager),
-							GFP_KERNEL);
+	sa_manager = drmm_kzalloc(&xe->drm, sizeof(*sa_manager), GFP_KERNEL);
 	if (!sa_manager)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.47.1

