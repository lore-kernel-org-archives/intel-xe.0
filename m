Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C43CD37BA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7060710E652;
	Wed,  4 Sep 2024 00:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="el8yRdis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78EA10E64E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I510lhEhhbUwTNHhCz2W8YfOCx11t4nrUifDTqsaxM0=;
 b=el8yRdisi2ZwMP0xfATFR5Dwp9Az579VcITnXB4CnxoiyhSlWWG3JgO5
 7OXKcmOQxHAtg03PywZgTtNbW+MNq3CRIZy2I+TKZSmjuLTj8EVf8uMjT
 UAUGC8R6+JJ0Q36GzwrUTx+XiqtWUBniRTbvXuiaL7o6Q1aPVNwDtN4fv
 6rsZpZ//WjdJc5NzNv7gk42z+x+JlhmQE8xYcUq1Q+pT7H0DRdjxBK+EM
 8LPQbJKLGWsZW5FDGb3BMd+BXr2LSDu4VJhOVi8lstKCm5DJ36lX6Y0ND
 27v0CMXQA4Y6Q6ujySFROv9EOAzMxuh7hR8eqOHUnSISPMYqKEL/etOMj w==;
X-CSE-ConnectionGUID: faThzeZQTeSpiqKWrwJe0A==
X-CSE-MsgGUID: c9P2GihiSGG0Wow8RnvpSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904831"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904831"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: indUoAbXTy+Tojxx0xPTyQ==
X-CSE-MsgGUID: pXoz3UOmR+aqgRgpNmcApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944340"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 40/43] drm/xe/forcewake: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:41 -0700
Message-ID: <20240904002100.2023834-85-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index b263fff15273..a64c14757c84 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -100,7 +100,7 @@ static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
-	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
+	xe_mmio_write32(&gt->mmio, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
 }
 
 static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
@@ -111,7 +111,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return 0;
 
-	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
+	ret = xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val, wake ? domain->val : 0,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
 	if (ret)
-- 
2.45.2

