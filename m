Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE9C7EE2A
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7985410E5A2;
	Thu, 11 May 2023 03:47:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A570F10E596
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hzgr/2qcvb07SX8Jr+H1vjYfOD0ABrVNWMO8s7tpm+Y=;
 b=cyA1ySTV11pqZTWALVi8lVm0v+E2I62EectOEzBJBTXK7G/kfYDEqsK2
 YX8xey1FrJXYoMwuVDBoVpnliYvEqmGBn/KZvlvb+WQnJ1KmKYSh+/2Z6
 bFoFws6ZOFLRjxlbjYQ8s/z5HoJ4gv26hJV6HJron3k5YK3exbIuggxhz
 2oGHFzTzOmOXWXejok39wBoTw0u28RbGERlVmOJW/frzVhqQ2mpBhIv/I
 HgWvn3LkWr2TWJdrG7xFK/VAt5Zfm1OWppaglu84pI16OpRnVKY6pKPo/
 O30Gh17iuEgSqG9enHVslTyZtDKq0GWuony492UxAVVQwWQDtrAmCaHwV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850651"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850651"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203245"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203245"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:18 -0700
Message-Id: <20230511034722.1929038-23-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 22/26] drm/xe/tlb: Obtain forcewake when doing
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Updates to the GGTT can happen when there are no in-flight jobs keeping
the hardware awake.  If the GT is powered down when invalidation is
requested, we will not be able to communicate with the GuC (or MMIO) and
the invalidation request will go missing.  Explicitly grab GT forcewake
to ensure the GT and GuC are powered up during the TLB invalidation.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 31f958613c2f..8f8d0f6a82cd 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -193,6 +193,13 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
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
@@ -214,6 +221,8 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 			xe_mmio_write32(gt, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 	}
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
-- 
2.40.0

