Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD95BEE4992
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8716510E0E8;
	Fri, 18 Aug 2023 22:08:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25CA10E57A
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhhFKyjt/NmTADUxem2V/iHVu7WA272+IqwLFInpiAE=;
 b=MLoeI7B+3YTAiadtg0bWlcljVKRheFxQY59Q0qkCQAPpSyv3z7j9j71L
 Pcku5NHE+y0FmMl5kJtg50rhtVDu9x5OQHQze8WC6LynNwTtYhPm0/iwa
 6vum0yKBXHuul+pMC5UJ43iySfSz5sqG5xnr3jZdg8YOa7mra+BYV3joH
 eqwf7NnsKXMfggx9TU3Z/q2EJIQG0HvTJKglSs2CGPRmQQJd4cNMSAhCG
 MDb0rHA34OJEhHr6rlAb8qJNuaQfmb3h1HDQJsIp6WN5ttGWzFWBcolGb
 FBw81XN5UJ+2YsMzOzwdfWrXSnb6vUe3JUVvMZdpHsKxL4CRglK5BAEh2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592994"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592994"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758209"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758209"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:21 -0700
Message-Id: <20230818220824.700519-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/15] drm/xe/xe2: Program GuC's MOCS on Xe2
 and beyond
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
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
index fcb747201bc1..ba375fc51a87 100644
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
index 2493c5859948..e102637c0695 100644
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

