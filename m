Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACED2C001B0
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6843410E478;
	Thu,  6 Jul 2023 16:20:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC6E10E478
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660454; x=1720196454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjrEL6gPZ3WoBAVn33RogJ3+KgCtFGDUEh1y5XzMjfY=;
 b=mOfgxXXA++Vdcnymp5F3gES5m/QWRMkTJ8LGIVuxZPp0457Pn4Z+ZKJA
 qbVAPh5F46jdGsBeVFv9oJmCckvbHZ/UmdeBSZm93BjdlBB4vtjB7ypm0
 JjMl8GQDyJ6eMzxHbC79Pplc4EuVTv0kcVr6U1Ng7/x9NlSNvCiDOYZ7f
 44OgCT0aSb9V/zRk6pyCzobf866sqWuGVmIgksSME3OCelWU0m/+LKNMt
 0sdK6+T+Xi3NNeaJdEKPJcNY7NLLwpg3M5MLXfwjbhVCYHf2WCjGa5WKW
 BERucXmuY6smCsn2TYj/I1+xqqItyjuTKR4jhuIdOzB9krXx9qm0Lcvtk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409317"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409317"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849944"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849944"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:09 +0100
Message-ID: <20230706162003.427026-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 05/10] drm/xe/tlb: increment next seqno after
 successful CT send
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

If we are in the middle of a GT reset or similar the CT might be
disabled, such that the CT send fails. However we already incremented
gt->tlb_invalidation.seqno which might lead to warnings, since we
effectively just skipped a seqno:

    0000:00:02.0: drm_WARN_ON(expected_seqno != msg[0])

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index c67abc67d9fc..de65b0b69679 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -124,10 +124,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		trace_xe_gt_tlb_invalidation_fence_send(fence);
 	}
 	action[1] = seqno;
-	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
-		TLB_INVALIDATION_SEQNO_MAX;
-	if (!gt->tlb_invalidation.seqno)
-		gt->tlb_invalidation.seqno = 1;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret && fence) {
@@ -137,8 +133,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 					   &gt->tlb_invalidation.fence_tdr,
 					   TLB_TIMEOUT);
 	}
-	if (!ret)
+	if (!ret) {
+		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
+			TLB_INVALIDATION_SEQNO_MAX;
+		if (!gt->tlb_invalidation.seqno)
+			gt->tlb_invalidation.seqno = 1;
 		ret = seqno;
+	}
 	if (ret < 0 && fence)
 		invalidation_fence_signal(fence);
 	mutex_unlock(&guc->ct.lock);
-- 
2.41.0

