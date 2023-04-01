Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C66C761A6
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA9B10F35F;
	Sat,  1 Apr 2023 00:21:16 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C13710E337
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308472; x=1711844472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Q1RO/+++VEZha8F918vjMt75mYodocQKUZDDJYO2GM=;
 b=UbVioE26/DAogWL3R4m8kGXZhTaTZ9NXISvEwIaHDDzupudlWtILBWjy
 Q8f4l8lqR4I/UGN3wL6kNqhepUfjFnNj0LgKTo8YwT3RBOlen6cC6QZwy
 2tX5E+tNPy/9ZGuGgFGrkUgr9n4r8Zq+m6ZnJ4nbb4mGh7uQlKakGMVqm
 XZcoZf2WpNUmVY2bdi44zbGDU6dJXsB/DL0V9MPCaL/071p+/X1DOfCSX
 Rc4ox5OrvD5Si7UJCu6me1XuD8EJ1dIrxBRi3uhouqeFozl/pYDlXBj5I
 OGYWIl26ayWC3vro3tGSqbRVx/GdQycx4eaXc+5xa/8wMK1lFGAFfaX2k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624215"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624215"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520551"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520551"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:21:05 -0700
Message-Id: <20230401002106.588656-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401002106.588656-1-matthew.d.roper@intel.com>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/8] drm/xe/irq: Drop commented-out code for
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although the hardware team has set aside some register bits for extra
media engines, no platform supported by the Xe driver today has VCS4-7
or VECS2-3.  Drop the corresponding code (which was already commented
out); we can bring it back easily enough if such engines show up on a
future platform.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index d8f5985b1868..9a119aa95cbb 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -151,13 +151,7 @@ static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
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
@@ -432,13 +426,7 @@ static void gt_irq_reset(struct xe_gt *gt)
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

