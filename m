Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759BDE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 23:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA6110E58B;
	Mon,  9 Dec 2024 23:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxFlkK2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDD110E58F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733786882; x=1765322882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mVjMe/BUQ77iJGsqqxbH/oiShQx3fXE+fZOIgWoMHU=;
 b=AxFlkK2YaJiJi7ru33P6sFcFqrW4J5iVaRMWTUVr+CzAsJ0NExpd/8iO
 MOvwLUcGrShsSw3FtVWDNh2uBFIpSqD1O34+JI8u5tWAlSG34HsHELu2d
 Lw4UNDnicA9aBz7KD8OLjEjU2H8R21nuQdj2wJlWxp3uehN5CZXQvTyn5
 mRw+oe+ZizmT0qO5GPUhI8raUZgzGBC4YXvK7NUaFbK/m5rS6A6zgj3oD
 e1HGQ4PLnmH7qmbqczXfBOkmIaVJh1X5Q8qGWwH7TdqW2l0QpcmA53abE
 Qh/ySW6Ow0FTrFhfCujjdNobfx1swYXrh1UNNj7NdJh536A9QdJsFMtB8 w==;
X-CSE-ConnectionGUID: ZfP5tjzrRGWJXdmgiyOpSg==
X-CSE-MsgGUID: RirWrCUuQa+E4JTn4SQNIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44581852"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="44581852"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:01 -0800
X-CSE-ConnectionGUID: 4erfclSNT1+K+2jaBlmKmQ==
X-CSE-MsgGUID: wAKnAqi8StismhVQqElUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="100268957"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/5] drm/xe/reg_sr: Convert whitelist to gt logging
Date: Mon,  9 Dec 2024 15:27:37 -0800
Message-ID: <20241209232739.147417-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209232739.147417-1-lucas.demarchi@intel.com>
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index c13123008e903..080229e0fc15a 100644
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
@@ -207,13 +206,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	if (xa_empty(&sr->xa))
 		return;
 
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
@@ -241,7 +240,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	drm_err(&xe->drm, "Failed to apply, err=-ETIMEDOUT\n");
+	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
 /**
-- 
2.47.0

