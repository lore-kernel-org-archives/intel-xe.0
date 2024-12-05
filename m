Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E066FE7717A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6624F10EF6C;
	Thu,  5 Dec 2024 18:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zm9fAi0x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FD510EF68
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733422983; x=1764958983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yLRiZeGIFUxGmm5ab3tQT4tQjmm1qgmYLfsg64c6SKc=;
 b=Zm9fAi0x7biOFcGGyZuD1MK197z8jgnOVH1+BVHuWdDRMuPYHxZOADrq
 7wzL2M2YDnQsyq0HqO52K5vRnO45MJuPPgKD+8lsH6mXrXMDbLsoBoTcI
 awBGdPVtKkpWThXVxtt8ckJoqtr2AY8GGq8dwQRjk9Tz8aJjsEgiUhTVX
 wswhC3DPPHB3mpiPtHr0dETw7JZVOg8IP9yuCwaGw15K7U8X6ZeYsvijC
 w/gthzyGnp2GorkNRX4dVpJ85yhwTLId62RkuHODJ2+NT9kvYii77o6mN
 0zsqsHYah/GlnVmZVhi2nq+3hxyDTHCZN4fXvnOZFQMd4M6+kKqORS5NM Q==;
X-CSE-ConnectionGUID: +UGlo56aQM6GnliYQzKgWg==
X-CSE-MsgGUID: cXPnEOQwSDKwjzMBpU4GWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33083529"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33083529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:03 -0800
X-CSE-ConnectionGUID: +kyfYDBAT/+T+sxDz6/7Og==
X-CSE-MsgGUID: KBUp0JlOR6elKZDDVwoBPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94375123"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/5] drmxe/reg_sr: Convert whitelist to gt logging
Date: Thu,  5 Dec 2024 10:22:39 -0800
Message-ID: <20241205182240.3463027-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205182240.3463027-1-lucas.demarchi@intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
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

Part of the whitelist printing was already using gt-logging - convert
the rest.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index f982c1cdb369c..ea958400a15a1 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -196,7 +196,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 {
 	struct xe_reg_sr *sr = &hwe->reg_whitelist;
 	struct xe_gt *gt = hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg_sr_entry *entry;
 	struct drm_printer p;
 	u32 mmio_base = hwe->mmio_base;
@@ -204,13 +203,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	unsigned int slot = 0;
 	unsigned int fw_ref;
 
-	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
+	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		goto err_force_wake;
 
-	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
+	p = xe_gt_dbg_printer(gt);
 	xa_for_each(&sr->xa, reg, entry) {
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
 			xe_gt_err(gt,
@@ -238,7 +237,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	drm_err(&xe->drm, "Failed to apply, err=-ETIMEDOUT\n");
+	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
 /**
-- 
2.47.0

