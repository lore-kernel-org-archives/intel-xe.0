Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2225EEB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0143B10E482;
	Thu,  6 Jul 2023 16:21:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C119710E438
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660460; x=1720196460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/WZjDNmjMJd6TZR17uQ+1ztb3Q6rMZbUb7OzETdZKQ0=;
 b=AT2cvGMhCZ+6chQF2SqpgiH4KLx27wB+pmNzm4UF35LmeXWaPNNOvtyS
 VeGHKBFVx0cIDEIZ8ciLpmO4CekqzCadMNAGyHDkXqveWzItoiYxtZIAl
 wbfAsoH+6JxF0kwzFFNNxDGa3ILXzAo8VQ2r+NqZzpOhSlkC5UfedCPqv
 5GGVmh3m1rgmq/F58Rvd2+YEvo5LQ9X6var1C8emXhbVe0Jb6Xf++s4m2
 IwoqO3TGHxFLvTpM/iODXPkr7M8CbQ4Mbo1gbSRjdoWmG0eBXrZ4A96Ud
 0RdLQoBfvfsDE+A2oR1m9/Mv8kGZkwmi9enSVgtE5QD1GYct/jnRnpeUv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409347"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722850033"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722850033"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:14 +0100
Message-ID: <20230706162003.427026-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 10/10] drm/xe/tlb: print seqno_recv on fence
 TLB timeout
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

To help debugging, sample the current seqno_recv and dump it out if we
encounter a TLB timeout for the fences path.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 94fa24f360f5..94040a4defb3 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -35,8 +35,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
-		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d",
-			gt->info.id, fence->seqno);
+		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
+			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
-- 
2.41.0

