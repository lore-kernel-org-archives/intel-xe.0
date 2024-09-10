Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16812EE01F7
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CA010E944;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXppHBcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9F710E93F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012049; x=1757548049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ViqH9bt5cJdyez+OGlxUUPviz/7OHKIpWU7TpebQJ0=;
 b=JXppHBcVit0gpaA3Li+HGmNQOYWzQM+VmKFfTYUY+xgjxxE3xZqtozFV
 kslT5EXc1WvZ9VJxZy2AfcI1gB1M0RAXiDPfgiockEASmPQYlO4CfDM17
 O2VkxGMXTOw0XS7YAk+e/3vE0EEuyikxRSk3wVFZZbuPiteUtfRbBd4NK
 rLxJTrFNpfR0KctdNH3nh6iqM1+sUngobdPGecKdG3MQZ90aAnwiGZm8t
 Bdq7hY61Szoc4exBRF5awiwGv2jihY+brrZUQNFCtxpFN/ekXxx3PcgAH
 gUoTFKaIhQCaKk0Zd8uS/ZcB5gCzDT4qzkxsX85wpsobvvbXEWBYA6tvy g==;
X-CSE-ConnectionGUID: KT/9IhtQQkmiVh7ug5w57w==
X-CSE-MsgGUID: jOG6hGS/QD+SkfshWiT54w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144328"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144328"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
X-CSE-ConnectionGUID: BfwX0qGBRei4myc6xNWXBA==
X-CSE-MsgGUID: 2xfsdil9RQSMJKJcpO0M0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989658"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 36/43] drm/xe/gt: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:56 -0700
Message-ID: <20240910234719.3335472-81-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dd96dec95b19..4a768b5f9542 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -110,7 +110,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 		return;
 
 	if (!xe_gt_is_media_type(gt)) {
-		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
+		xe_mmio_write32(&gt->mmio, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
 		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 		reg |= CG_DIS_CNTLBUS;
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
@@ -247,7 +247,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 			else if (entry->clr_bits + 1)
 				val = (reg.mcr ?
 				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
-				       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
+				       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
 			else
 				val = 0;
 
@@ -442,7 +442,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	 * Stash hardware-reported version.  Since this register does not exist
 	 * on pre-MTL platforms, reading it there will (correctly) return 0.
 	 */
-	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
+	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
@@ -652,8 +652,8 @@ static int do_gt_reset(struct xe_gt *gt)
 
 	xe_gsc_wa_14015076503(gt, true);
 
-	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
-	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
+	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
+	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
 		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
 			  ERR_PTR(err));
-- 
2.45.2

