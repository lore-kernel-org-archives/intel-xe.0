Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305E8C61DB9
	for <intel-xe@archiver.kernel.org>; Sun, 30 Aug 2026 06:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5E910E12E;
	Sun, 30 Aug 2026 06:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPwMRGgF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F6910E12E
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Aug 2026 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788072980; x=1819608980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=23XPPx7BLxqO/WjGKudQN8eRJ80Y20VTmmbuqvl+QWM=;
 b=HPwMRGgFJ8AT9mtCmDn9jvv3mjPIVaZYYhPPujnf1RQZjlVKKOCD5BHI
 T2JHouESnU+gJ7FpMtFG+Bg2i7It7a3U+FCdoTT8KwYV/BJmrYRMe9yzu
 NSyjpDRHJUEDCWl9McQ+TAlg79m2mq6Seic1xLc6cWOd4fD0o4SCSHTAy
 I5+EGkoHZ89PBcKTCrV5sm2wua0hppUD/jO14tHnbDmA0ggW5NHbZ6yGC
 mIgdS9zQdUjeEnTRMztXUy/MygAlXOAvvLpmt506LHMaogwte43FgxP58
 eWmkx+pFylJR9U6+PdVQbtm/RC95VikBr+3quYKsdDeWOsFE3lPiNQE5j g==;
X-CSE-ConnectionGUID: ho8SLnm4RyKz79FkBV0VYQ==
X-CSE-MsgGUID: w39RD08sTlWUfxxcimT4Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="105890227"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="105890227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:20 -0700
X-CSE-ConnectionGUID: v44ZDng1Ru+m98Be2f6n8Q==
X-CSE-MsgGUID: h+SpbuxRTdSMnt+HO/xxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="268560034"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com
Subject: [PATCH 1/3] drm/xe/hw_error: Reuse CSC worker for generic error
 handling
Date: Sun, 30 Aug 2026 12:26:05 +0530
Message-ID: <20260830065603.419055-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260830065603.419055-5-riana.tauro@intel.com>
References: <20260830065603.419055-5-riana.tauro@intel.com>
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

From: Raag Jadav <raag.jadav@intel.com>

We have upcoming usecases which require defering work during error
handling. Since we already have CSC worker in place, prepare it to
be reused generically.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c   | 10 +++++-----
 drivers/gpu/drm/xe/xe_tile_types.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 5f2abc9485ff..df6275c3d316 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -165,9 +165,9 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
 						 pvc_master_local_fatal_err_reg : \
 						 pvc_master_local_nonfatal_err_reg)
 
-static void csc_hw_error_work(struct work_struct *work)
+static void hw_error_work(struct work_struct *work)
 {
-	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
+	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
 	xe_survivability_mode_runtime_enable(xe);
@@ -202,7 +202,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 					     hec_uncorrected_fw_errors[err_bit], severity_str,
 					     err_bit);
 
-			schedule_work(&tile->csc_hw_error_work);
+			schedule_work(&tile->hw_error_work);
 		}
 	}
 
@@ -511,7 +511,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 	enum hardware_error hw_err;
 
 	if (xe_fault_csc_hw_error())
-		schedule_work(&tile->csc_hw_error_work);
+		schedule_work(&tile->hw_error_work);
 
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
 		if (master_ctl & ERROR_IRQ(hw_err))
@@ -549,7 +549,7 @@ void xe_hw_error_init(struct xe_device *xe)
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
+	INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index 0048100ccb72..bc6940b08841 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -114,8 +114,8 @@ struct xe_tile {
 	/** @memirq: Memory Based Interrupts. */
 	struct xe_memirq memirq;
 
-	/** @csc_hw_error_work: worker to report CSC HW errors */
-	struct work_struct csc_hw_error_work;
+	/** @hw_error_work: worker to handle HW errors */
+	struct work_struct hw_error_work;
 
 	/** @pcode: tile's PCODE */
 	struct {
-- 
2.47.1

