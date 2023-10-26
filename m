Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACCBC25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 18:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE49D10E85B;
	Thu, 26 Oct 2023 18:43:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E86410E85B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698345795; x=1729881795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SrZXijEj4GnyW4w3kdLAmTdGbSv5H4tDngYM7N2+P4o=;
 b=EK6Orf9AiE9gBUU5tyuRu5nbrPUimEP4AeIL14VZoabJfcZMYOL0BnMS
 mlJ2SbjIrMtGUXNNnd22E5AVseIy6h5GO1rt+y6myVnRygfxhLvo6eoCP
 bm39b7adeEURvp3AcYM8Xa7jdVUIEWhv6pBNxrFJuOlgGBwqvP74CoBbC
 wlMX0fDAYWzY4F7BsyMkWncogDp+0MnPwh1gNUqjtUklMGMssVP0Zot99
 WzJHoNd4ym5eo5wOAt4siLc6G/Qv6Uediy9r5Gtv7ltJL1n3Hjf/JEj4N
 nfD2CgGg5Jo+i6tuAGS3dIgruRXUJ+cag2PirqNmfBcwGCBsvROV5E+19 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384827942"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="384827942"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 11:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876062782"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="876062782"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2023 11:43:13 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 00:18:52 +0530
Message-Id: <20231026184852.2750479-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Dump CTB during TLB timeout
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Print CTB info during TLB invalidation
timeout event.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bd6005b9d498..b5c39c55e1fa 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -319,6 +319,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc *guc = &gt->uc.guc;
+	struct drm_printer p = drm_err_printer(__func__);
 	int ret;
 
 	/*
@@ -331,6 +332,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	if (!ret) {
 		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
 			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+		xe_guc_ct_print(&guc->ct, &p, true);
 		return -ETIME;
 	}
 
-- 
2.25.1

