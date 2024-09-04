Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D77CD37B5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA4210E665;
	Wed,  4 Sep 2024 00:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3DNs6TF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2247D10E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zepRPI++dAkh20y8tOw/+Q+0vsOszSiZgmoG79ykOeM=;
 b=E3DNs6TFUDeauOqQuyoTrNcREw/mByrOGNPcAOM7ahnKUPUMupCqMJ2Y
 TAV/dNWfNz7VIOdcg1g5dhleNXcBQVgjbdF3/VF9Ld0Iqe1uDLvVL+5in
 Dxd1Eg0Ufl33FYm1JQIhkDm5qPrGuLEZMMfSRl1w50TBamt03GRf4tvUH
 eYwz0qC34qTEreTy5Mv2EtbZe9bG8v6vUFPu8ALeII/UntHcKatKDYhDD
 4XLEyyvNWibQCo8QFW7cGWlX2+vONbmG3c4JEIvRvdAjlK3plRb/EmfTo
 /iGutKJN8Ly9YytbDKW1zbGId35M9RXkZwXdjO4YTFM1oShg8oJ4DediI g==;
X-CSE-ConnectionGUID: GGbvUoncRp+8sLXRlWSFYw==
X-CSE-MsgGUID: SP+8xGitSW+gqSsSRLF5xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904825"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: CTnJT+biRUu12Cx88ePpDA==
X-CSE-MsgGUID: LHc9YQygQxacaPj+EHv1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944319"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 35/43] drm/xe/reg_sr: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:36 -0700
Message-ID: <20240904002100.2023834-80-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_reg_sr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index fb209f1e0f1e..191cb4121acd 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -165,7 +165,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
 	else if (entry->clr_bits + 1)
 		val = (reg.mcr ?
 		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
-		       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
+		       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
 	else
 		val = 0;
 
@@ -181,7 +181,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
 	if (entry->reg.mcr)
 		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
 	else
-		xe_mmio_write32(gt, reg, val);
+		xe_mmio_write32(&gt->mmio, reg, val);
 }
 
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
@@ -242,7 +242,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		}
 
 		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
-		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot),
+		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
 				reg | entry->set_bits);
 		slot++;
 	}
@@ -251,7 +251,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
 		u32 addr = RING_NOPID(mmio_base).addr;
 
-		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
+		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-- 
2.45.2

