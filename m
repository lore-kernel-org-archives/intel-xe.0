Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7ECC36018
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA1910E464;
	Tue, 17 Sep 2024 12:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mH/5aXgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E549410E211
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574636; x=1758110636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NRNaPm8BxaojcTeWShYqrpEO6SqV7lpiIWC7fLzABjA=;
 b=mH/5aXggUcJzeR69ZzCRiVL4NgM9Jc4AP2duBuoz/+frHC3tjgyb/zIm
 96Prxxnl1glh999WPVBGLfk1l3cLnSRtharTEKsqqBDwA0SJel+Y/1byv
 uA8X/KSpTf5xBFHqA+QTvsAUT15zDE7e8iEPSCmRsJ3wcgq7B1kq3gee+
 fmrViUik10mSAu2AvpNi6LNCUCfJIGDUG/2Xv9sFSaGm2SGzb5+HUSTaw
 boLGlQqsa60xQWE22TrXmKiqTfB2pe5cndn/ePsMa/PvIDANuTUem3gCY
 dWGvJHvTHq8jqZqmzskaqwsJZtGyAn9v1zMtCWAPBJwdWBF/5SGDDKiqC Q==;
X-CSE-ConnectionGUID: tGmY0XLHSqSA0EIRUeUDhQ==
X-CSE-MsgGUID: dju41v2iRCWcRPRIQ876RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210687"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:55 -0700
X-CSE-ConnectionGUID: JSSXLAhwTlingNAO+Lbb8A==
X-CSE-MsgGUID: 7y9eLLrQSH6r0b2ZSXF3Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388591"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:53 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 18/23] drm/xe/xe_reg_sr: Update handling of
 xe_force_wake_get return
Date: Tue, 17 Sep 2024 17:51:21 +0530
Message-Id: <20240917122126.438448-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented
domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does
not necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and
pass the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 191cb4121acd..6bfa270a89d8 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -188,27 +188,27 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 {
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
-	int err;
+	xe_wakeref_t fw_ref;
 
 	if (xa_empty(&sr->xa))
 		return;
 
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		goto err_force_wake;
 
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return;
 
 err_force_wake:
-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -221,15 +221,15 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	u32 mmio_base = hwe->mmio_base;
 	unsigned long reg;
 	unsigned int slot = 0;
-	int err;
+	xe_wakeref_t fw_ref;
 
 	if (xa_empty(&sr->xa))
 		return;
 
 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		goto err_force_wake;
 
 	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
@@ -254,13 +254,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return;
 
 err_force_wake:
-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	drm_err(&xe->drm, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
 /**
-- 
2.34.1

