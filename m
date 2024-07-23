Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3436DC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 19:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF00F10E0B5;
	Tue, 23 Jul 2024 19:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ytu0YO9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE6C10E0B5
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 19:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721761597; x=1753297597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1FydRTFfynu2aLEJYd/HkdbwJS2QrWLuLmYzYtB5vJM=;
 b=Ytu0YO9dFtSZVeXiiBFhJoxa8t4cCXetnah2n+72wtYpdVF4yUxrwnDu
 FO8uXMMfrusesvOWRJgGy/G/82BFfDhM9Klw2cBLiPpsm3YOh9PseNGEU
 o2cLD22ciwuYvjhMWpiZayomICPWKp/yFkohcNFfu0ORtXBkPtiOvDJkA
 2LzKnmbBRkEj3kCezWOQol3T1401dIPhCodS+xeAapkJZFYxPnZHb1zFW
 KAGojuFKqChVuTnZr9ZU3M1Qi+0bEhFLR+KAGzopwrwAMb0koRn1eccOl
 GNn0zRevBw7HuTgUEpyUx+mzxebHDNxk/iFhyLoNDbrbsuX7j/vmGAyOu A==;
X-CSE-ConnectionGUID: 3gI7d8w7RnaV/T1rlyAL7Q==
X-CSE-MsgGUID: aH/KTLODQ2iL5Mcdn3m4xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23215698"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="23215698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 12:06:36 -0700
X-CSE-ConnectionGUID: jTlRadHFQw69sL9PyNSVZg==
X-CSE-MsgGUID: mqkkjf7vTSGAhEowYc320g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="52050992"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 12:06:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dan.carpenter@linaro.org
Subject: [PATCH] drm/xe: Remove fence check from send_tlb_invalidation
Date: Tue, 23 Jul 2024 12:07:14 -0700
Message-Id: <20240723190714.1744653-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

'fence' argument in send_tlb_invalidation cannot be NULL, remove
non-NULL check from send_tlb_invalidation.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202407231049.esig0Fkb-lkp@intel.com/
Fixes: 61ac035361ae ("drm/xe: Drop xe_gt_tlb_invalidation_wait")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 481d83d07367..87cb76a8718c 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -182,7 +182,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	action[1] = seqno;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
-	if (!ret && fence) {
+	if (!ret) {
 		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 		/*
 		 * We haven't actually published the TLB fence as per
@@ -203,7 +203,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 						   tlb_timeout_jiffies(gt));
 		}
 		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	} else if (ret < 0 && fence) {
+	} else if (ret < 0) {
 		__invalidation_fence_signal(xe, fence);
 	}
 	if (!ret) {
-- 
2.34.1

