Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E05EC36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 08:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BE810E3BB;
	Mon, 28 Apr 2025 08:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnwVRfIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB68A10E3BB
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745828143; x=1777364143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EN9Kf5jN0jvDNzlr0mPnjhPjKDxcXWH6tyK1FhFDOkU=;
 b=fnwVRfItPh5cvYedTgll2ewMyiFRttZmygc1COKXG0L5yGBNSCk2H2k8
 YIt9ZfPHmf3NQ0/jqkX7d8SyzJEdlmYjwfvBRzodmdMz5x7El3el7OLnH
 SsaUh79402//9trXLWz2MbFQveZOVlJ/GMigAqXNySJnFF13v6VOupkrG
 /bAVz6K+UHFjcyIETc8rDbz8sZ0m76L8CUsLRYPIm+4+Lwh6+pRARC4m4
 SI3Z3mLFFefacjxs34We+xpF2jBK92im2/XrBylT4NipbxILRIIBVWMhr
 s+1nVm8FS066hTGYUmKyREO3cFg6x8FaKIUp7mUFvDHelujVBI9uJtCPz w==;
X-CSE-ConnectionGUID: iybwz3xoTI68J/vQfhsmgg==
X-CSE-MsgGUID: QuJk5gfFStS90pCzEm6pGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58391620"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="58391620"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 01:15:42 -0700
X-CSE-ConnectionGUID: ifaP8iK3TLuRChp8RBE18w==
X-CSE-MsgGUID: M1gyYnllRUOC050pjhXOCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="170671345"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 01:15:41 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
Date: Mon, 28 Apr 2025 13:53:57 +0530
Message-Id: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

LNCF registers report wrong values when XE_FORCEWAKE_GT
only is held. Holding XE_FORCEWAKE_ALL ensures correct
operations on LNCF regs.

V2(Himal):
 - Use xe_force_wake_ref_has_domain

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1999
Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index ef1e5256c56a..0e502feaca81 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -46,8 +46,11 @@ static void read_l3cc_table(struct xe_gt *gt,
 	unsigned int fw_ref, i;
 	u32 reg_val;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
+	}
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (!(i & 1)) {
-- 
2.34.1

