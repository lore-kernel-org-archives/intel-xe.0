Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE34CD37B7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B0410E666;
	Wed,  4 Sep 2024 00:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8L0MLTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB1610E641
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9h2qwSgYd4KXRq7eYXTDYQzGCBIRGQuIvUFlxK7b5c=;
 b=k8L0MLTWVy4YlL/4HDApOQIF8UUMdLxPCTxd2picTGyG7Z41cYlWiVxb
 5H8ppsJjviLiAXvNFVjWzP4KmL5zPAuZhMQBe0DYtl3gl/l3wRFlRL+h2
 0Vr4S26Nzm1gGwP1asynhqN0oeR+b0kQN/NYgEorOp6svXcvwBWZrp3xO
 SzrtE9V3ZSN2FKh2E6p98DeFtMTHhlMFRsYqCxzRmHnhj8IZL4szWWRSQ
 EbtKVTNYyihYdhOdJ4LiMko2gaRnTZrnkNymzL9WDsib2UZnJX5g1yD87
 A0Yf6p0p28OnRYFi6ZCgXZs+HvPq/xWMMFv4UqPqWgyQoW61xlD0XBiiT w==;
X-CSE-ConnectionGUID: 9kQV/LqRRF+uCUuxfi9ZRA==
X-CSE-MsgGUID: 8aUoia+5S+6CcJRRzswXCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904833"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904833"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: m6nb5hrDRb20yzH5f+bXug==
X-CSE-MsgGUID: dZtPTKo5T6a0PIDCbBhRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944347"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 42/43] drm/xe/ccs_mode: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:43 -0700
Message-ID: <20240904002100.2023834-87-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index d2e4dc3aaf61..9360ac4de489 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -68,7 +68,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 		}
 	}
 
-	xe_mmio_write32(gt, CCS_MODE, mode);
+	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
 
 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
 		  mode, config, num_engines, num_slices);
-- 
2.45.2

