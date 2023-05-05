Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7A0C77B7F
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 13:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF5310E5FD;
	Fri,  5 May 2023 13:34:42 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E0310E5FD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683293681; x=1714829681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omHwMYO69Kz0PM/MD6/TelihAhRPAbTF1BCBeKfhoSk=;
 b=J3AkmR9O18lxSbvKl/V1uRw+RjgJVrELI2abZk0KiCIAz2zCmlYzq7q1
 cvibWQ7V8nKDo6e6ux6WvDIySmhv14AwN+E11lryvOSQ3URrx7cgr5+7E
 0jf9hhNjNGrRJDtfcEeSqom6wrsA9tOeXqcaqJDg0e/YecENofsTFVKG1
 vKFmBE3Cpb7onFJasIiofmquMa+FFmnVwtGW/2VNlE5N4aRrkst4q0Ksl
 g2KgvTYAGJf29p5ZWqjREEKuFOVfBTo12LIekS78SV6NyQcfeACpjM6Gl
 wcbg7+s/tiLcutB9BlF/02sgUna0SChHITb9YbFYBwUxdnJFqbvjZe0Fi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="377285418"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="377285418"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 06:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700435658"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="700435658"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 06:34:40 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 15:34:33 +0200
Message-Id: <20230505133433.9642-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Print GT info on TLB inv failure
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Print GT info on TLB inv failure for better debugbility.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 604f189dbd70..9e7fe8d9bca4 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -34,8 +34,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
-		drm_err(&gt_to_xe(gt)->drm, "TLB invalidation fence timeout, seqno=%d",
-			fence->seqno);
+		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d",
+			gt->info.id, fence->seqno);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -285,8 +285,8 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 				 tlb_invalidation_seqno_past(gt, seqno),
 				 TLB_TIMEOUT);
 	if (!ret) {
-		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			seqno, gt->tlb_invalidation.seqno_recv);
+		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
+			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
 		return -ETIME;
 	}
 
-- 
2.39.0

