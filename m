Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE065C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 23:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9101310E130;
	Fri,  2 Jun 2023 23:52:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CDB10E64A
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685749937; x=1717285937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A10GZ48Sq3NB9JSjBOrFLGv3vZ3NpgdHhPZoB9CrJfs=;
 b=H3a2V6cZhpp7EAW23POU/9BhELtavzqhgWigSWCOKyHNiCCJPzX9BW83
 42OBRNGFcHXpCF9cK8hVHep6BJCw3ysENsmHR5szQkEEflW9s37gk2tOP
 o6ytPvLumjUQqavj/SiGIrZOAahI5hoAlE8yxBhL/lNTSwDiUeNzX2l65
 rfme6PjYVc2lU2a8R7QMO7W3ddzlnUdhRkpk+bXYFT6s0GDdX7etyoxb8
 0XNJKjQTgrANKYy7s3T7Ty0bEr+cZ871Eg4USUjaa04RdwcnYNXmwrAMj
 m+eyHXP80JJ+Pz5aat5v5cT4lE5kdXKrM6GNnb+oDhWYPguu5nO3tJfMX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354849611"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="354849611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658430474"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="658430474"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:52:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 16:52:10 -0700
Message-Id: <20230602235210.1314028-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602235210.1314028-1-matthew.d.roper@intel.com>
References: <20230602235210.1314028-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Don't hardcode GuC's MOCS index in
 register header
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

Although PVC is currently the only platform that needs us to program a
GuC register with the index of an uncached MOCS entry, it's likely other
platforms will need this in the future.  Rather than hardcoding PVC's
index into the register header, we should just pull the appropriate
index from gt->mocs.uc_index to future-proof the code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 5 +----
 drivers/gpu/drm/xe/xe_guc.c           | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index ea8118f16722..fcb747201bc1 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -45,10 +45,7 @@
 #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
 
 #define GUC_SHIM_CONTROL			XE_REG(0xc064)
-#define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
-#define   PVC_GUC_MOCS_UC_INDEX			1
-#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK, \
-							       index)
+#define   GUC_MOCS_INDEX_MASK			REG_GENMASK(25, 24)
 #define   GUC_SHIM_WC_ENABLE			REG_BIT(21)
 #define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
 #define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 04a57af85d9e..e51d8fb4a354 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -328,7 +328,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
 				GUC_ENABLE_MIA_CACHING;
 
 	if (xe->info.platform == XE_PVC)
-		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_GUC_MOCS_UC_INDEX);
+		shim_flags |= REG_FIELD_PREP(GUC_MOCS_INDEX_MASK, gt->mocs.uc_index);
 
 	/* Must program this register before loading the ucode with DMA */
 	xe_mmio_write32(gt, GUC_SHIM_CONTROL, shim_flags);
-- 
2.40.1

