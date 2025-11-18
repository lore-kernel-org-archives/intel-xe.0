Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1494FCED247
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66E810E469;
	Tue, 18 Nov 2025 09:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hidCEsAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D4810E45B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456757; x=1794992757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=270SlpWfEU0MYtJ6RBWhQRbsmFaiW8ErDAFYdB87wmg=;
 b=hidCEsAiDa6SW0HDmiLD06YA0+sB/X6dnb2jdcuVeIVQSS0GpZCv1urJ
 TXZIG/NoKmzoXP6+2RnVsde2hyXdSi3CuKFCnAE6CL2oSqJCaTjhuaHeQ
 LzwPWNocVa+lt3Yy6E/JFza3mvpdSWMruHHdiHydLlI/LEO6hrj9vJNOy
 xmZnfrDPlOBD1/biokh9w2Kz9+JH/aPJpH582VySuiMTD8PByd5pWrIXT
 +nIyFV0UmhvTZzXn2lIx/jgHp+Cn0jFYEFO44wZbtZvyJ23jqKHmHV3qF
 PaCEBqlymbTD1dnp0qmC6vJ4uAjeHYdBOwt+HAYLPdykdKZkyTuLb4P59 A==;
X-CSE-ConnectionGUID: y6F4M6G0RNy0Twbp0iqANA==
X-CSE-MsgGUID: Cbx/SbibQPC8ViUTh26XCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097752"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097752"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:05:57 -0800
X-CSE-ConnectionGUID: WzarujrZRy+53ayam95sjA==
X-CSE-MsgGUID: 44o1r4T+ScyGuGkjaJW7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500829"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:05:55 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 01/11] [DO, NOT,
 REVIEW] drm/xe: Do not forward invalid TLB invalidation seqnos to
 upper layers
Date: Tue, 18 Nov 2025 17:05:42 +0800
Message-ID: <20251118090552.246243-2-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

This is a dependent patch for the page reclamation patch series
taken from another patch series by Matthew Brost, currently under
review: https://patchwork.freedesktop.org/series/156874/

Page reclamation takes the same idea of using invalid seqno to indicate
the initial H2G actions of the in progress tlb invalidation.

Review and comments for this patch should be done in the original patch
series.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 3 ++-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index a80175c7c478..f1fd2dd90742 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -236,7 +236,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(len != 1))
 		return -EPROTO;
 
-	xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
+	if (msg[0] != TLB_INVALIDATION_SEQNO_INVALID)
+		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..7a6967ce3b76 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -80,6 +80,7 @@ struct xe_tlb_inval {
 	const struct xe_tlb_inval_ops *ops;
 	/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
+#define TLB_INVALIDATION_SEQNO_INVALID	TLB_INVALIDATION_SEQNO_MAX
 	int seqno;
 	/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
 	struct mutex seqno_lock;
-- 
2.51.2

