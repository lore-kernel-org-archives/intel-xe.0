Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6099EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A6C10E443;
	Thu,  6 Jul 2023 16:20:51 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206210E46E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660449; x=1720196449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DprBw7QI6PBw48d83Y/tUZU50TpoGezfOoOcIUMNnGg=;
 b=ZiesndOtncfJU4NY6HPn4C1svPjbekUrTfRHXKJNQkeSCWSci5Fcjy0w
 1WKC1/wGTw2MR4sohg7yEyIx2x3n2ZDeVkwrp1InmpjVmFGtUbVA3nswI
 aCsrTXPmA3y0elvbGw2cWMDs2PlMKD6SoVRE/d0TmiBIikRCY2IityaEU
 kfiu8AFMd3ZcBvcCuwncOQDWon3uUxtdWrWJUvRlLfeUKCPVJNTjEYS1/
 VQ0JB0f2HqsiYK6aFSsN0dZ/0OeBwZmbATHv4+3gjgs/1n7w7QoWZ67yP
 uwEZ1DscHxh252mJapd865bIjPUsIelSQdCbFD/PMRkI42kHNXYCskY3x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409299"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409299"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849870"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849870"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:05 +0100
Message-ID: <20230706162003.427026-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 01/10] drm/xe/tlb: drop unnecessary smp_wmb()
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

wake_up_all() and wait_event_timeout() already have the correct barriers
as per https://www.kernel.org/doc/Documentation/memory-barriers.txt.
This should ensure that the seqno_recv write can't be re-ordered wrt to
the actual wake_up_all() i.e we get woken up but there is no write.  The
reader side with wait_event_timeout() also has the correct barriers.
With that drop the hand rolled smp_wmb(), which is anyway missing some
kind of matching barrier on the reader side.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 2fcb477604e2..08432f472e2d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -333,8 +333,11 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 			expected_seqno, msg[0]);
 	}
 
+	/*
+	 * wake_up_all() and wait_event_timeout() already have the correct
+	 * barriers.
+	 */
 	gt->tlb_invalidation.seqno_recv = msg[0];
-	smp_wmb();
 	wake_up_all(&guc->ct.wq);
 
 	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
-- 
2.41.0

