Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31E9C83003
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EEA10E5F2;
	Thu,  1 Jun 2023 21:53:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3E410E5FB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656370; x=1717192370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EBISDRX8XYI3XgoYNkc5OaTnOSGV3hQLMOlVlqmuXLE=;
 b=NR8KA0yds5H5iWYRF1rtCWam5gBuumpL5xtQCs6vX0299jSAPp+6oA2f
 GkJXIP03CfIgoViMDfK38FSYbHVbVy7sIHvP8K4XmWYw4U0dRkpvgwpF8
 MN4Jq62A77Pwl0RMfhmJXxwNFiV7BgYJIOe/IYnlfIXHltUfFiPmYuMgb
 pPSHFmZv4jkf+ccpoSUrCi9iW0rwubEH+KLmOO3wwH/zDTAyuLCzAVCCy
 +S6sGQzWB+bog92rMA5WVcESJGwKNiJJD1PNQqtxLucd5Eb5VxpAeSUdT
 cjDMrl73pSKPGM67sUH15hMp4nTV69AsHaSVrAcYGgR9mRfYImHLmA69x g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313639"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313639"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563634"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563634"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:40 -0700
Message-Id: <20230601215244.678611-28-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 27/31] drm/xe/tlb: Obtain forcewake when doing
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
Cc: matthew.d.roper@intel.com
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

