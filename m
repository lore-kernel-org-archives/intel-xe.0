Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36052EE0206
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E5B10E960;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moJLrQAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09B610E93F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012049; x=1757548049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HK/xE+4sWbM6mV4XwVN16uScTxQu0N3Q6MR8EPcgmJY=;
 b=moJLrQAt4Ig1fzCUSe23bjtK2DG6H1TdAH4v7A4T3kMXmZszdld9yNhQ
 9DhRC6xqsKPWdmXX965egxt01A98SIvdXjebqeCBDVkqTbQx9RHx2fxjV
 Kunh94GdU+9vC6PxSe3GibAV0g+prvRLWexGNXJGD2eGtmVmu3/oNj7pN
 h41UjJpwEB9xgbgErokGy7ldHnel73LY9vgQnV4i4dPIR7jvuuhu8EYFm
 HOtgsQVZvF/6LBzq5mADid3B2xbPu2VPt3KkI308fExQitx8+uqrt1RSB
 +6HpI+tLCOUGgFZDYkpKlB89n4PhTjizoozIoBcc9pUHr46gWvbVLF3o1 A==;
X-CSE-ConnectionGUID: bcmp75kiSnW/3B3oQ9VlNQ==
X-CSE-MsgGUID: TTBslPoAS1eGJMa4r86zhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144333"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
X-CSE-ConnectionGUID: dLbRI8nGRjeUyspRUL4OPw==
X-CSE-MsgGUID: Axo6smX5RuGtT2op30jsfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989668"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 39/43] drm/xe/gt_idle: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:47:59 -0700
Message-ID: <20240910234719.3335472-84-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_idle.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 85a35ed153a3..531924b6c0a1 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -104,6 +104,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_idle *gtidle = &gt->gtidle;
+	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
 	int i, j;
 
@@ -137,11 +138,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 		 * GuC sets the hysteresis value when GuC PC is enabled
 		 * else set it to 25 (25 * 1.28us)
 		 */
-		xe_mmio_write32(gt, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
-		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
+		xe_mmio_write32(mmio, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
+		xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
 	}
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
+	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
@@ -156,7 +157,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	gtidle->powergate_enable = 0;
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
-	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
+	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
@@ -216,8 +217,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		if (err)
 			return err;
 
-		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
-		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
+		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
+		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
 
 		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 	}
@@ -361,9 +362,9 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 		return;
 
 	/* Units of 1280 ns for a total of 5s */
-	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
+	xe_mmio_write32(&gt->mmio, RC_IDLE_HYSTERSIS, 0x3B9ACA);
 	/* Enable RC6 */
-	xe_mmio_write32(gt, RC_CONTROL,
+	xe_mmio_write32(&gt->mmio, RC_CONTROL,
 			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
 }
 
@@ -375,6 +376,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
-	xe_mmio_write32(gt, RC_CONTROL, 0);
-	xe_mmio_write32(gt, RC_STATE, 0);
+	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
+	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
 }
-- 
2.45.2

