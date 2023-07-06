Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08B7EB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C2610E47B;
	Thu,  6 Jul 2023 16:20:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFC710E480
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660456; x=1720196456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xMRxH6p3gMskUziOF2Yu/fj3NY13H8kBMhGaHz6r7to=;
 b=JYvNgtibA7hWw7kmAIeAEkPsyq0zo4pAd4DkIKX8qXYkE3ZlWZczom7j
 BchXikGxTJA4YAiHOlysySlEdK7zAj8URz9Ly7E1OnUq64MS1WsXrqUui
 Sbq/MW0UL1GIKlLxtJcfbjwe+Jhkq/bqyx4RW400Y9mHiYF2uoV8C4Pkb
 /L+ZiOcnf7LIVwlOCPP0zORTOpdcxGSEm4XnX0CdaZdfQrJP/2071/Fiy
 lyXLLvCuvunI3wG03K/mAW1rTUjta3sPWAFmmv0aj1UZZwx+uNB5+lJMx
 QBJ3ulGSZ8netfCqLwgg7GpxF1zsNmetGvcAW70dqZiOyBhy9uIUNgr++ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409333"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409333"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849978"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849978"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:11 +0100
Message-ID: <20230706162003.427026-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 07/10] drm/xe/gt: tweak placement for
 signalling TLB fences after GT reset
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

Assumption here is that submission is disabled along with CT, and full
GT reset will also nuke TLBs, so should be safe to signal all in-flight
TLB fences, but only after the actual reset so move the placement
slightly.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc76678a8276..a21d44bfe9e8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -519,7 +519,6 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
-	xe_gt_tlb_invalidation_reset(gt);
 
 	err = xe_uc_stop(&gt->uc);
 	if (err)
@@ -529,6 +528,8 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
+	xe_gt_tlb_invalidation_reset(gt);
+
 	err = do_gt_restart(gt);
 	if (err)
 		goto err_out;
-- 
2.41.0

