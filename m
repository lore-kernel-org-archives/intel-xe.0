Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F55CFA445
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 15:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C9410E052;
	Wed, 23 Oct 2024 15:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Np8e5i0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD6A10E052
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729698946; x=1761234946;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3IZQHkMzQJKDLBjfFwW4wFunnt4gWSYRJlam0nKNaPs=;
 b=Np8e5i0dg04j/R9TRZwRvVP5dwAT4nkOwYWMi54B/RgFj3ToKVam8qQO
 VAd6yhr5bupMHCqcHJs1gGSQzJmcqN0n7GPM/o2Rc+UPByP61JBxVHKxM
 rOSliv34m9/7SjtviDtEm66+GBmJpQDPmVGaQMvkFc9lLOPRLbzECRCnm
 nXoqBOu4+7TYdDt72xtaVExoFt+coXqHg6hI2SyCkiqoQjl+qsKFksU2h
 1YQnN1BM5AHY85+EVZSUPsFYXOheq8UzYg9B7ZEXYVtW6UEo8JD9YM04z
 YQWHVYPendup+OJd4niRm9AiKJggzz4sSoGyZBi8qSf+dZGJsi48cx4Ju w==;
X-CSE-ConnectionGUID: F2Cx7vfKSSu5meOusBgHZA==
X-CSE-MsgGUID: qsSZ3vLESFada4vmlaMxwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29403303"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="29403303"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 08:55:45 -0700
X-CSE-ConnectionGUID: lVh9/PxvTj68pfBMmt/DdA==
X-CSE-MsgGUID: dddDhEigTCqEsGaD5FvnzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="80285863"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 08:55:43 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
Date: Wed, 23 Oct 2024 17:13:43 +0200
Message-ID: <20241023151343.3463640-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Flush the g2h worker explicitly if TLB timeout happens which is
observed on LNL and that points recent scheduling issue with E-cores.
This is similar to the recent fix:
commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
response timeout") and should be removed once there is E core
scheduling fix.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 773de1f08db9..2c327dccbd74 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
+	/*
+	 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
+	 * in case of g2h response timeout")
+	 *
+	 * TODO: Drop this change once workqueue scheduling delay issue is
+	 * fixed on LNL Hybrid CPU.
+	 */
+	flush_work(&gt->uc.guc.ct.g2h_worker);
+
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
-- 
2.46.0

