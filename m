Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E10C87FF2
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257F10E44D;
	Tue, 30 May 2023 21:16:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DBA10E439
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481372; x=1717017372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EBISDRX8XYI3XgoYNkc5OaTnOSGV3hQLMOlVlqmuXLE=;
 b=PEkZ1C3L/3Zv402QKzhTOEydDF9Z8J6G9ccdL0qKH/3hE23h23V7Ui0P
 Oqrh6SebtAaSPiC0WmgH3siMUueSNfI3yd5x+uqt7YGPDdHFauBhwnayx
 HIayrut3qUQozXnWomRMADf7mpr/1IrjsSTpTq0Ky/E2ab8rxFdGfiY5U
 UUd4tfsaBu9Rpwg2BPjWw6Oe9eOG/J+SRnC+sjnSjATBvClSl0oyzeKmy
 bnvHYHbZfoWuM9FwbFWXOX3vaby9yOn2zXvWC6pOkNIZbAWCpVMJG7SNq
 FIfSSIU84JZvqo9Z407A+YwErrgpDjkEezjYs9azCScu/RHCyezhHn7TU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311966"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311966"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139487"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139487"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:45 -0700
Message-Id: <20230530211549.2632538-28-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 27/31] drm/xe/tlb: Obtain forcewake when doing
 GGTT TLB invalidations
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Updates to the GGTT can happen when there are no in-flight jobs keeping
the hardware awake.  If the GT is powered down when invalidation is
requested, we will not be able to communicate with the GuC (or MMIO) and
the invalidation request will go missing.  Explicitly grab GT forcewake
to ensure the GT and GuC are powered up during the TLB invalidation.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 9a3edead3948..bae9f66a33cb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -195,6 +195,13 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	if (!gt)
 		return;
 
+	/*
+	 * Invalidation can happen when there's no in-flight work keeping the
+	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
+	 * and GuC are accessible.
+	 */
+	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+
 	/* TODO: vfunc for GuC vs. non-GuC */
 
 	if (gt->uc.guc.submission_state.enabled) {
@@ -216,6 +223,8 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 			xe_mmio_write32(gt, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 	}
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
-- 
2.40.1

