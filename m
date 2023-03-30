Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08DEC77B6F
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F96510EF81;
	Thu, 30 Mar 2023 18:24:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B559F10EF73
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200674; x=1711736674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWp6kz9WwvlaSxsvEaqYLQwruDEZs1UFH3ZnUq2h5SU=;
 b=iR7pulHxzAkYwP8rds7iN8c8dWYWG9PNAGunbJBKfVlrkMhVPowmDA73
 hbUXKg0zuN4yrH/w5YPcOyE83g/N11JZcse6htoJwzwtiZIoWeHQJJ56R
 MDBa+63lUNfHnaKkbgfu9HZ1QXLG6a5Ml5pHbjMADeM2Pvm0bqn7SIIZf
 HyajdG7mfsO0U30YYbiEuHBDMdOwVBRrP3D6yXf4BOwizE66m9aTdcjWl
 aWhGNl+AGe8LaIbegAcURhY9Z9dvWEKkaa/nSH/eECqWSEQeynCGNwgGF
 X6jfpUxO+FoLqgAYTO+YcBesWzqED2FOPxUuizlGqUYByGI32TJLAJwpW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641491"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641491"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021826"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021826"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:24:04 -0700
Message-Id: <20230330182405.43993-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/8] drm/xe/irq: Drop commented-out code for
 non-existent media engines
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

Although the hardware team has set aside some register bits for extra
media engines, no platform supported by the Xe driver today has VCS4-7
or VECS2-3.  Drop the corresponding code (which was already commented
out); we can bring it back easily enough if such engines show up on a
future platform.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9fac03b63e7e..02292e60e52c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -143,13 +143,7 @@ static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~dmask);
 	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg, ~dmask);
 	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg, ~dmask);
-	//if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
-	//	intel_uncore_write(uncore, VCS4_VCS5_INTR_MASK, ~dmask);
-	//if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
-	//	intel_uncore_write(uncore, VCS6_VCS7_INTR_MASK, ~dmask);
 	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg, ~dmask);
-	//if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
-	//	intel_uncore_write(uncore, VECS2_VECS3_INTR_MASK, ~dmask);
 	if (ccs_mask & (BIT(0)|BIT(1)))
 		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~dmask);
 	if (ccs_mask & (BIT(2)|BIT(3)))
@@ -424,13 +418,7 @@ static void gt_irq_reset(struct xe_gt *gt)
 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~0);
 	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg,	~0);
 	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg,	~0);
-//	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
-//		xe_mmio_write32(xe, VCS4_VCS5_INTR_MASK.reg,   ~0);
-//	if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
-//		xe_mmio_write32(xe, VCS6_VCS7_INTR_MASK.reg,   ~0);
 	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg,	~0);
-//	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
-//		xe_mmio_write32(xe, VECS2_VECS3_INTR_MASK.reg, ~0);
 	if (ccs_mask & (BIT(0)|BIT(1)))
 		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~0);
 	if (ccs_mask & (BIT(2)|BIT(3)))
-- 
2.39.2

