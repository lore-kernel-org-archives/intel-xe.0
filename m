Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AAEC001B0
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCABA10E474;
	Thu,  6 Jul 2023 16:20:52 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD4E10E474
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660450; x=1720196450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+iXmgsF60gvpRdRHjzdUJwsVemL4u5YhPMoGeJQmWH4=;
 b=HJxPUQnWbIb2NlTx+HaAP7fETYtjLCoUREfq1lmQrIr5cqVTgl2O4RwM
 zh6/djmroW75WN1HOQTJrNsUkSOUgRrYM1J6Tw0N3NN5+6z4zLmX4AfxT
 g3Ohd9XnvI5Kov9D3B6VbB4TKaFOg2m5FWolSPZlN2V3d8gu967Kzc4wn
 tBdI6G/o3ZySnLGP1ZyiRZkxVm9m3otgqfyUtIDoYwU3avauZm/k6R0+M
 tC/DZYmDoYlyw33tOoZ9UZDo5dl05+TuZqreGQNIRwYyIvms9mJovWiIh
 OULhL9Faxh3YGU6CCjppJPe+l3mQzMVqFeoVuLQbw8oEpfaM0A1eSkbee Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409303"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409303"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849888"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849888"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:06 +0100
Message-ID: <20230706162003.427026-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 02/10] drm/xe/tlb: ensure we access seqno_recv
 once
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

Ensure we load gt->tlb_invalidation.seqno_recv once, and use that for
our seqno checking. The gt->tlb_invalidation_seqno_past is a shared
global variable and can potentially change at any point here.  However
the checks here need to operate on a stable version of seqno_recv for
this to make any sense.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 08432f472e2d..c67abc67d9fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -257,15 +257,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 {
-	if (seqno - gt->tlb_invalidation.seqno_recv <
-	    -(TLB_INVALIDATION_SEQNO_MAX / 2))
+	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
+
+	if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX / 2))
 		return false;
 
-	if (seqno - gt->tlb_invalidation.seqno_recv >
-	    (TLB_INVALIDATION_SEQNO_MAX / 2))
+	if (seqno - seqno_recv > (TLB_INVALIDATION_SEQNO_MAX / 2))
 		return true;
 
-	return gt->tlb_invalidation.seqno_recv >= seqno;
+	return seqno_recv >= seqno;
 }
 
 /**
@@ -337,7 +337,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * wake_up_all() and wait_event_timeout() already have the correct
 	 * barriers.
 	 */
-	gt->tlb_invalidation.seqno_recv = msg[0];
+	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, msg[0]);
 	wake_up_all(&guc->ct.wq);
 
 	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
-- 
2.41.0

