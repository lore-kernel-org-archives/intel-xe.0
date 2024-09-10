Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C503EE0214
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6608610E973;
	Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lnnz7cQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3910E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012050; x=1757548050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OA/Fz48DWJUPV3A4cDyqjUTh0TKIbo5X5WQ0nzFAeiU=;
 b=Lnnz7cQFynEva+K2+tzIAdnVMtc+3LWR5s4kIIY0hOSeafLkfj4TLeaX
 ruP9pFRGf+qHPFfqtmss77009fgHgrwmoBvCnzrrh8sB475JfzvU4pRk4
 PjuAtFmAo5HRQjPCBMwb9/8UuJfHZRIDlRZipfbkPTqWzNIO9xA11o6QP
 vGyzj/emVP1NLburphXbJM6MRWbVQOsHP48CoeD4p/nWFz17UiM2j3fTr
 SKMtRaEft947BjtyyN4QVnHN9u0P/1qTVnN0Jh9VUNbsTeGGnWzsZvorS
 jNMAX/8UGTRrU68U2jGpO5Q6ub1yCIwBJuv1VgeLHdcfyhzlj7fMUFcT0 g==;
X-CSE-ConnectionGUID: ueF2q1gWTSG8VasqVsCynQ==
X-CSE-MsgGUID: y+u9jDE7SXiiISehdN0d0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144335"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144335"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
X-CSE-ConnectionGUID: 6G1AUId1QUaAtELdSDEsQw==
X-CSE-MsgGUID: d/givi0hQwWBqFUWelLXHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989674"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 41/43] drm/xe/ggtt: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:48:01 -0700
Message-ID: <20240910234719.3335472-86-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2895f154654c..f68af56c3f86 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -107,8 +107,10 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 
 static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 {
-	struct xe_gt *gt = XE_WA(ggtt->tile->primary_gt, 22019338487) ? ggtt->tile->primary_gt :
-			   ggtt->tile->media_gt;
+	struct xe_tile *tile = ggtt->tile;
+	struct xe_gt *affected_gt = XE_WA(tile->primary_gt, 22019338487) ?
+		tile->primary_gt : tile->media_gt;
+	struct xe_mmio *mmio = &affected_gt->mmio;
 	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
 	/*
 	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
@@ -118,7 +120,7 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 	lockdep_assert_held(&ggtt->lock);
 
 	if ((++ggtt->access_count % max_gtt_writes) == 0) {
-		xe_mmio_write32(gt, GMD_ID, 0x0);
+		xe_mmio_write32(mmio, GMD_ID, 0x0);
 		ggtt->access_count = 0;
 	}
 }
-- 
2.45.2

