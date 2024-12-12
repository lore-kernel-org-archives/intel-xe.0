Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB6E77183
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B39B10ECA2;
	Thu, 12 Dec 2024 01:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDp8Ls5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A46810ECA1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965325; x=1765501325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sD9Z+S271MmXNfZXa6YwQcB9Dl+E2KB6Qmjw/pLUjbQ=;
 b=NDp8Ls5ef7VPn1445D71mrjpOR9W6EN3bJHiETZM49vi28mtIllt8w6l
 h4Dq5ca4HMktZfvunSTOtnPTFY0kpz7KYETEtSEvuSRbhe890W23Q93H+
 jV4FOv68FCAAp+h/s085wPse/+Oyx+D20/Md6W5IFssV+7qzYQJPtpqJ0
 xXG6OrpDNPe468dbKPvSmgbRtkM9qbpTXYLyc2nFo5hIQhqSwrz6/n++c
 kV5yOtbzAuknu0blbPlKxefunXQ5V24b/QPSMOmc9YEkWIYJq1sR8kRcR
 8NLNqjqq2cJKbHjJDudN5BzYLidLXJSwiUK0F5K9tiaAqZbkVemt/T9PA Q==;
X-CSE-ConnectionGUID: NNwJqXQmRfyg0wkEzyurEw==
X-CSE-MsgGUID: lllfWX9aSa2ptrQ/YO5OuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379795"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:05 -0800
X-CSE-ConnectionGUID: 1YD4ixd/Sv27+b8cgc7xLw==
X-CSE-MsgGUID: g9o47r6ISyCzL9EbywtzCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856537"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:04 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 06/13] drm/xe/sa: Tidy up coding style in init()
Date: Thu, 12 Dec 2024 02:01:34 +0100
Message-Id: <20241212010141.389-7-michal.wajdeczko@intel.com>
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

There is no need to use tile_to_xe() since we already got the xe.
And we should keep all variable declarations together, no need for
separate sa_manager declaration.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 94d22371af84..704332ef795f 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -35,13 +35,12 @@ static void sa_bo_manager_fini_bo(void *arg)
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

