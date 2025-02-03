Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D06C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 23:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A931A10E04A;
	Mon,  3 Feb 2025 23:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKluyF5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9828010E04A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 23:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738626654; x=1770162654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bPOPAmt+JNxSywZ15w7m35gXhqz/A3rVq69ZV1t/+Go=;
 b=iKluyF5bZDttQmmWij2KccR4+LcUsHtP52aXJIv8rYMDDOvSERi0Mkp/
 9NfE/xHTO2fBurXVMTIO4Y/i0yYxvZ738IdRU5RWafki+Bs0pEJDCdy6C
 /QWhVCvB+Mi8l9gv96YI8dU9G6L4AvljS2da5V5nrAbEiRhQjzmF3Bh4u
 oKFoeRHLFOp21TWbpRKP1r5P5Z8VaY62pRAD8ByUPrptxN/BFQBI/rEnm
 /KE7nu4FHaSdCS660ayzY9Ap/7WC76vlBEFeJAQbvdn73dZCAxeujYErv
 BrnUL66/CuycXAzDSAAmy9NRCPMKTRo+9daD4YNoQWJArBKjQJHMJPA31 A==;
X-CSE-ConnectionGUID: 5E0DHIDgR+CnJp1xDq+niA==
X-CSE-MsgGUID: lsdyoW6aRKaGhDcCcdBUtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39018007"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="39018007"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 15:49:06 -0800
X-CSE-ConnectionGUID: ZcF7f8m0Q1SJTnfwaYA3mQ==
X-CSE-MsgGUID: urFusISvTxivy9SbHqE6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115591845"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 15:49:06 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/pxp: Fail the load if PXP fails to initialize
Date: Mon,  3 Feb 2025 15:48:57 -0800
Message-ID: <20250203234857.1419637-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The PXP implementation mimics the i915 approach of allowing the load
to continue even if PXP init has failed. On Xe however we're taking an
harder stance on boot error and only allowing the load to complete if
everything is working, so update the code to fail if anything goes wrong
during PXP init.

While at it, update the return code in case of PXP not supported to be 0
instead of EOPNOTSUPP, to follow the standard of functions called by
xe_device_probe where every non-zero value means failure.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 ++--
 drivers/gpu/drm/xe/xe_pxp.c    | 20 ++++++++++++--------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 90f6bcc03037..36d7ffb3b4d9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -864,8 +864,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	/* A PXP init failure is not fatal */
 	err = xe_pxp_init(xe);
-	if (err && err != -EOPNOTSUPP)
-		drm_err(&xe->drm, "PXP initialization failed: %pe\n", ERR_PTR(err));
+	if (err)
+		goto err_fini_display;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 5e7a1688a771..3cd3f83e86b0 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -372,8 +372,8 @@ static void pxp_fini(void *arg)
  * are performed asynchronously as part of the GSC init. PXP can only be used
  * after both this function and the async worker have completed.
  *
- * Returns -EOPNOTSUPP if PXP is not supported, 0 if PXP initialization is
- * successful, other errno value if there is an error during the init.
+ * Returns 0 if PXP is not supported or if PXP initialization is successful,
+ * other errno value if there is an error during the init.
  */
 int xe_pxp_init(struct xe_device *xe)
 {
@@ -382,26 +382,28 @@ int xe_pxp_init(struct xe_device *xe)
 	int err;
 
 	if (!xe_pxp_is_supported(xe))
-		return -EOPNOTSUPP;
+		return 0;
 
 	/* we only support PXP on single tile devices with a media GT */
 	if (xe->info.tile_count > 1 || !gt)
-		return -EOPNOTSUPP;
+		return 0;
 
 	/* The GSCCS is required for submissions to the GSC FW */
 	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
-		return -EOPNOTSUPP;
+		return 0;
 
 	/* PXP requires both GSC and HuC firmwares to be available */
 	if (!xe_uc_fw_is_loadable(&gt->uc.gsc.fw) ||
 	    !xe_uc_fw_is_loadable(&gt->uc.huc.fw)) {
 		drm_info(&xe->drm, "skipping PXP init due to missing FW dependencies");
-		return -EOPNOTSUPP;
+		return 0;
 	}
 
 	pxp = drmm_kzalloc(&xe->drm, sizeof(struct xe_pxp), GFP_KERNEL);
-	if (!pxp)
-		return -ENOMEM;
+	if (!pxp) {
+		err = -ENOMEM;
+		goto out;
+	}
 
 	INIT_LIST_HEAD(&pxp->queues.list);
 	spin_lock_init(&pxp->queues.lock);
@@ -448,6 +450,8 @@ int xe_pxp_init(struct xe_device *xe)
 	destroy_workqueue(pxp->irq.wq);
 out_free:
 	drmm_kfree(&xe->drm, pxp);
+out:
+	drm_err(&xe->drm, "PXP initialization failed: %pe\n", ERR_PTR(err));
 	return err;
 }
 
-- 
2.43.0

