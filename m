Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DE6CEE33E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791B910E505;
	Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJZBgduL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C7910E4FB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NFEHXZiNxCkiJdM4eVLu8FEJC8Lui2FxBJLQlkY1UPE=;
 b=KJZBgduLhGgvgmjZkJCGwjOBm6RQnnnSBz6uU0u23IZUhksRPCj2ryQv
 lY6Ftxmhjq9RqQYiVW0AijgSvOizKTa8CiO38Oyptrk59h+y6hcR8ubzu
 C5PPjoTSFwUkRv8xR8+rXQ+6AMi9XmCruqqnLxEfSzW8+MiCEpQkPDmmD
 HdGMbzNQGD9JZyR7fRPtjnLGHIXD6iA/R2d6q4MVlcMf3oHJIEY/Q2aex
 AqQjNZ76NMobzoImhcnvXXLfUXjh4yh9VK2SCFil/ET0jhgFytBhjpa24
 +CP6tzfYy07O5M4DL9As1cjCCqJ3sfCc1RjhiXx8SGmL5tfajXIsmLZrF w==;
X-CSE-ConnectionGUID: 2ko6WgDUSFuDslacv/g7pw==
X-CSE-MsgGUID: y8ocjUz6QDqEJN6Qtl+iWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544781"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: /Q1o8VSrQ7y5g218ME+okA==
X-CSE-MsgGUID: yPW4QiXVQN6DU1Fw/zNrIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952249"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 17/27] drm/xe/huc: Use scope-based forcewake
Date: Tue, 18 Nov 2025 08:43:56 -0800
Message-ID: <20251118164338.3572146-46-matthew.d.roper@intel.com>
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

Use scope-based forcewake in the HuC code for a small simplification and
consistency with other parts of the driver.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 0a70c8924582..4212162913af 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -300,19 +300,16 @@ void xe_huc_sanitize(struct xe_huc *huc)
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
-	unsigned int fw_ref;
 
 	xe_uc_fw_print(&huc->fw, p);
 
 	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return;
 
 	drm_printf(p, "\nHuC status: 0x%08x\n",
 		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
-- 
2.51.1

