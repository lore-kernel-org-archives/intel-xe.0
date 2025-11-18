Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB14CEE34B
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBDB10E517;
	Tue, 18 Nov 2025 16:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjJZJfqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0308510E4F9
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OXJYTMWJO/kOdnCRdbwB1OGfY0Ju7B5XEZ2h+LbC09U=;
 b=DjJZJfqSB0seR7g/dkDpELCiFJ45Z5D3XBD0f9e/wZC1XFYi0w3JqsQv
 EoyaYCdJtmZHkqo7Y7qSlmC3MCsVQIt63muyFApq73L3mgK/gjOH108KJ
 G1EMexDNbyp7XFCUhvNpyltxFpHdm7bfojAYxeUlAqJDLXPpwrHquvN35
 /jzc4P+VzzCCpG3CauxY8YjNbu+jQR44lByP4OP6WZR/DHijewGmefTbb
 +rHTLHaG+f8AZ4ts4wSTOkwmigd1EArPLM/qwxMcWQeTuuslrDZRkxAGL
 g6SLGnD4eFChnY/oSYAVXHVLiN3ZwjU6TTW7pxsqxdG9jURid+mFCYY7n A==;
X-CSE-ConnectionGUID: GDUZfRgQRiOp9xi3WC851A==
X-CSE-MsgGUID: Nf4SibjzQcqmwpkZwr1cXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544783"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544783"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: QatUbK9jQXK1fIx8RPLtdw==
X-CSE-MsgGUID: DJEBHNo1RuOcMuBe9VCfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952255"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 19/27] drm/xe/reg_sr: Use scope-based forcewake
Date: Tue, 18 Nov 2025 08:43:58 -0800
Message-ID: <20251118164338.3572146-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

