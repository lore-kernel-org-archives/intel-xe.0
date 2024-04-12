Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBABC04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA29310F77A;
	Fri, 12 Apr 2024 17:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlZEiHZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE6010F698
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712944713; x=1744480713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tP5BqYDqUg7y5l6cFVebyelpdqHr2W+OTibF7iaUsks=;
 b=YlZEiHZTYJaGP9O2D/r9IpUGoIEsP2cKFHgRW5a/ItGWczZ0tEjKS/V7
 /1IkEh8DxlVBZwWlJMcjyjk49ODh7E3c3wg9/2vqGx50AZLVTZXRQB8He
 61C0x/AHgJwxcWMvo/1YCjjvPRMgNo6wdzmzn14oXpoB50xnrX5XkCQc6
 Cxpl8nB89L8Au3lkCh5ldMQ1N6eMlnW7iHtGfJUYrZ7CyGwfGY4T+TBM8
 BBtofEfTOwopqOgfc91uSGhQICtcQO7xZdDRQxoVIVsrSwwslsyWjI+qS
 /Hb9OScfBKl2d4gD6TldTy5e214DYYPeSmtUgLNj62YM2UV5s52XhNM2a g==;
X-CSE-ConnectionGUID: cDEqVInSTtSI/NzFPITCBQ==
X-CSE-MsgGUID: KTFNlS5gR+a/oHdt39rZ7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8628130"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8628130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:58:33 -0700
X-CSE-ConnectionGUID: eWklBMIeSmuRDpQKGQkgLg==
X-CSE-MsgGUID: RuwipamrSYmeYsXgMmLq/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21369102"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2024 10:58:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 3/7] drm/xe: call free_gsc_pkt only once on action add
 failure
Date: Fri, 12 Apr 2024 23:42:07 +0530
Message-Id: <20240412181211.1155732-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

The drmm_add_action_or_reset function automatically invokes the
action (free_gsc_pkt) in the event of a failure; therefore, there's no
necessity to call it within the return check.

-v2
Fix commit message. (Lucas)

Fixes: d8b1571312b7 ("drm/xe/huc: HuC authentication via GSC")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 78318d73e4cf..39a484a57585 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -53,7 +53,6 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 	struct xe_gt *gt = huc_to_gt(huc);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
-	int err;
 
 	/* we use a single object for both input and output */
 	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
@@ -66,13 +65,7 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 
 	huc->gsc_pkt = bo;
 
-	err = drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
-	if (err) {
-		free_gsc_pkt(&xe->drm, huc);
-		return err;
-	}
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
 }
 
 int xe_huc_init(struct xe_huc *huc)
-- 
2.25.1

