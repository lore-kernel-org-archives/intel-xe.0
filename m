Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC9CEACE2
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E5D10EB3B;
	Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpZPuhcc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753E910EB34
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OXJYTMWJO/kOdnCRdbwB1OGfY0Ju7B5XEZ2h+LbC09U=;
 b=YpZPuhccY6DBG+co+LnATgivq3S4S9UQZIqGDE84kd19k+IciO9Y20Ki
 sPpIbkUyDp/BGyXUycTnIqVB15qaip65bvhxR5XwGRxQpwAOOm2v9UVRR
 VuL2KvZvF9RCnIA8pqMFdHfs7Ssr1Q6E85XMMyRrM5l3qrmp+cpQqPjxR
 jALmC650T0BGefh+lNbXq4zNSEY615K/DbptbPZXNYkGRq/66Q00CQUWz
 X1ByfcD/IWz3oBOMSp1lURxv7ohcwCITcjaRfVAFQmGHEbPk0NSKBI2mt
 aTc5OBd+NDyhJfZnqoZZX1A0zOCTv6SDlOJdpBoqEwlGtM4fjlgH49d7O w==;
X-CSE-ConnectionGUID: rI7OyrwHRSeSrgZIgyb7UQ==
X-CSE-MsgGUID: h8UV6x+zTLu+vJrbsrz8WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648323"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: yw9eugvSSZKl9Al23pWh6A==
X-CSE-MsgGUID: mmbKGHg1S6eP5ubAmu0KzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308330"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 19/27] drm/xe/reg_sr: Use scope-based forcewake
Date: Fri, 14 Nov 2025 13:43:55 -0800
Message-ID: <20251114214335.2388972-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Use scope-based forcewake to slightly simplify the reg_sr code.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index fc8447a838c4..1a465385f909 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -168,7 +168,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 {
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
-	unsigned int fw_ref;
 
 	if (xa_empty(&sr->xa))
 		return;
@@ -178,20 +177,14 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_force_wake;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
+		return;
+	}
 
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
 /**
-- 
2.51.1

