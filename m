Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F160C5B552
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 21:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3674210E6D5;
	Wed, 28 May 2025 21:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN/Fcqoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D4310E0C6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469258; x=1780005258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K+iTmziJHqdTHz4EaRQRjMHMDSMdGXdAGTFQZ5r8IJE=;
 b=JN/FcqoqXfn0oT7YFJ8hvYJAGicOCJY41kTfQdTOX6oWyyo4tAkv/2iu
 KkDmq5ahhEuNJU5nqYy6J69jx5qpEg2mWQBPWWqVVk4ZIG3caGUHaKr9M
 aJMdR1fKod1iILpv5qJGnK9lEhW1Lyd/MrLCaxwvCT+51w0MWgrWBDtNl
 w/uNXQCXKSBXofhzNimuGvMKDROGwxnDy7G6R01MTUj9kq+x8aptK9HrS
 KIIrQPWbavJEv9COWcz6HIHn5tpBfT+j/QO3LFvxNCdfSeRRkVQ/ChMhh
 3gUonSplNv29m8IDjB0nmEeekA1qQ8WU8jV+ay1ceJgvTa6AYd0OBvN/k A==;
X-CSE-ConnectionGUID: BVot38iHSAiquJmcrlBQyQ==
X-CSE-MsgGUID: ziJnQENgSWm4MHeKn3sbFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73044759"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="73044759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:17 -0700
X-CSE-ConnectionGUID: CToQTBm+TCKJ9CKgmmfWVg==
X-CSE-MsgGUID: EUYUBI5URS+BdINZgAadzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143201070"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 2/5] drm/xe: Convert "fused off" messages to be gt-based
Date: Wed, 28 May 2025 14:54:05 -0700
Message-ID: <20250528-engine-mask-v4-2-f4636d2a890a@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
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

It's useful to see in the log message what GT was being checked for
disabled/fused-off engines. Especially on multi-tile platforms the
different tiles may be fused differently making it harder to parse
the information.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 93241fd0a4ba3..33681169b8570 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -693,7 +693,7 @@ static void read_media_fuses(struct xe_gt *gt)
 
 		if (!(BIT(j) & vdbox_mask)) {
 			gt->info.engine_mask &= ~BIT(i);
-			drm_info(&xe->drm, "vcs%u fused off\n", j);
+			xe_gt_info(gt, "vcs%u fused off\n", j);
 		}
 	}
 
@@ -703,7 +703,7 @@ static void read_media_fuses(struct xe_gt *gt)
 
 		if (!(BIT(j) & vebox_mask)) {
 			gt->info.engine_mask &= ~BIT(i);
-			drm_info(&xe->drm, "vecs%u fused off\n", j);
+			xe_gt_info(gt, "vecs%u fused off\n", j);
 		}
 	}
 }
@@ -728,15 +728,13 @@ static void read_copy_fuses(struct xe_gt *gt)
 
 		if (!(BIT(j / 2) & bcs_mask)) {
 			gt->info.engine_mask &= ~BIT(i);
-			drm_info(&xe->drm, "bcs%u fused off\n", j);
+			xe_gt_info(gt, "bcs%u fused off\n", j);
 		}
 	}
 }
 
 static void read_compute_fuses_from_dss(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
 	/*
 	 * CCS fusing based on DSS masks only applies to platforms that can
 	 * have more than one CCS.
@@ -755,14 +753,13 @@ static void read_compute_fuses_from_dss(struct xe_gt *gt)
 
 		if (!xe_gt_topology_has_dss_in_quadrant(gt, j)) {
 			gt->info.engine_mask &= ~BIT(i);
-			drm_info(&xe->drm, "ccs%u fused off\n", j);
+			xe_gt_info(gt, "ccs%u fused off\n", j);
 		}
 	}
 }
 
 static void read_compute_fuses_from_reg(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	u32 ccs_mask;
 
 	ccs_mask = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
@@ -774,7 +771,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
 
 		if ((ccs_mask & BIT(j)) == 0) {
 			gt->info.engine_mask &= ~BIT(i);
-			drm_info(&xe->drm, "ccs%u fused off\n", j);
+			xe_gt_info(gt, "ccs%u fused off\n", j);
 		}
 	}
 }
@@ -789,8 +786,6 @@ static void read_compute_fuses(struct xe_gt *gt)
 
 static void check_gsc_availability(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
 	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
 		return;
 
@@ -806,7 +801,7 @@ static void check_gsc_availability(struct xe_gt *gt)
 		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
 		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
 
-		drm_dbg(&xe->drm, "GSC FW not used, disabling gsccs\n");
+		xe_gt_dbg(gt, "GSC FW not used, disabling gsccs\n");
 	}
 }
 

-- 
2.49.0

