Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A350C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3739F10E6B8;
	Fri, 11 Aug 2023 16:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77BD10E6AD
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJoPFno7MgQNyHuM0aJPYVo1VgpXz/HM112mGczRmj0=;
 b=AwhNVad+MNOkQkBqJ3ZAC4E6VE1mAMibADHizEt8vS+A6z5AaKL7oGfG
 M3qAdj517iBpR9KtjZ7rIg1TRnfZNx8NCTPBnQbo4MTRtgMnjiNEGrfiK
 Bk99m0M+8wZbJL9taI/aeVWBBCa8EkVGXR73YODAj4cOpY7NEzesmmNVp
 Ozk4lLHX286Ax9H+hwygkqFEWbFSHFFUaF95hEnYKef6FC0muPK8ABKuV
 FDT9NL2zX/ktpYmQcTqhhgJKV3o4JCHS6UDUUSvSXxCEfCB6cEZALzlji
 i//Anb5JbMyLmiU32B4OlYWGO4BzYB2zsRZbn7x7b7qF7ZwJvDROFoDKF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044338"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044338"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300475"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300475"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:15 -0700
Message-Id: <20230811160618.477297-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/15] drm/xe/xe2: Program GuC's MOCS on Xe2 and
 beyond
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

As with PVC, Xe2 platforms require that the index of an uncached MOCS
entry be programmed into the GUC_SHIM_CONTROL register.  This will
likely be needed on future platforms as well.

Xe2 also extends the size of the MOCS index register field from two bits
to four bits.  Since these extra bits were unused on PVC, it should be
safe to just increase the size of the mask.

Bspec: 60592
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_guc.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index fcb747201bc1c..ba375fc51a87a 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -45,7 +45,7 @@
 #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
 
 #define GUC_SHIM_CONTROL			XE_REG(0xc064)
-#define   GUC_MOCS_INDEX_MASK			REG_GENMASK(25, 24)
+#define   GUC_MOCS_INDEX_MASK			REG_GENMASK(27, 24)
 #define   GUC_SHIM_WC_ENABLE			REG_BIT(21)
 #define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
 #define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2493c58599488..e102637c06953 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -326,7 +326,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
 		shim_flags |= GUC_DISABLE_SRAM_INIT_TO_ZEROES |
 				GUC_ENABLE_MIA_CACHING;
 
-	if (xe->info.platform == XE_PVC)
+	if (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC)
 		shim_flags |= REG_FIELD_PREP(GUC_MOCS_INDEX_MASK, gt->mocs.uc_index);
 
 	/* Must program this register before loading the ucode with DMA */
-- 
2.40.1

