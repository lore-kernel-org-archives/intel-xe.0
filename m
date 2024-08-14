Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62DCC52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 09:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B712610E1BD;
	Wed, 14 Aug 2024 09:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jL2giOEI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CB010E1BD
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723629246; x=1755165246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WPfu5YhxiRl3ns1Y00r+GpCOo7wl0KRSC4/PPwrSYLo=;
 b=jL2giOEI0Osxpn7WJL1pstQS++X62RehvWCnK39M50rRX9R6k8rOTzvx
 HbPPBMgSQm6hPe5LSztdAYqXDHEphnhlkkUX+UYPGNh1L/gRYis3k9968
 uzOvuB2ENfXReyYNcOEGpu29RZBHzzKQ8gjVUMHm/uriuvkcRCAS7NDCZ
 SZjOeGZXjVWNXOotxC76Rf1htVuJQV3GA3UWgQQiyeRHkBdyknXbYWPIr
 Tq7BUyTwLQzPR9ByJjIA5aUv/UTOlr/tdIUNSDwm4pi5BhlbK+Q9sgrwF
 RsodC+r0NZnYN6XrMM44CFdK+FwrNTXf5iJ2Pj7Vlf5ObGv2RACcnwxri Q==;
X-CSE-ConnectionGUID: yrBmvkz7R9K7AFvhyX52YA==
X-CSE-MsgGUID: OtVhmiF3Sd2eYs4KSeTh2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32510052"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="32510052"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:54:06 -0700
X-CSE-ConnectionGUID: WAa91I7xSQqP11a7ooIV/g==
X-CSE-MsgGUID: nRs2uSIsR7uoDfW+qWkjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="63624175"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2024 02:54:03 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 1/3] drm/xe: Move enable host l2 VRAM post MCR init
Date: Wed, 14 Aug 2024 15:26:12 +0530
Message-Id: <20240814095614.909774-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814095614.909774-1-tejas.upadhyay@intel.com>
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
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

enable host l2 VRAM is reading MCR register thus
should be moved after MCR init is done.

V2(Matt):
 - Reword commit message
V1(Lucas):
 - Reorder patch and reorder flow of L2 VRAM enable

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58895ed22f6e..238c7d1053f0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -557,7 +557,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
-	xe_gt_enable_host_l2_vram(gt);
 
 	err = xe_uc_init(&gt->uc);
 	if (err)
@@ -569,6 +568,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
+	xe_gt_enable_host_l2_vram(gt);
 
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-- 
2.25.1

