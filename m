Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B4C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4783810E7CF;
	Tue, 13 Feb 2024 15:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jE2uOKBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12E810E7F8
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839053; x=1739375053;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GPqRVAjxqKGUh63kn2VIXsI8bmmbrQ/KTQsrmLh9dXc=;
 b=jE2uOKBDlUCB2CkE6DVg/dC5xsAkE0jmnct503A6hS55tU/q8oaLurb5
 cHLolMJe8id1ThlU1UPXxeNN5WfTdvbCzLsZhaW8gMlsBokLfrDoyKbmU
 8lYo4vwWYAnqh7wdA5SrRJ6vdIztzG7M3+2U+PSz7uE/t8X2gNfbCRAJ9
 HYzi0e63NQOESa7w/f6vcWDiUWE5Pfz8xpR1Jq9dyD/3ftTFNAbrhXXXx
 5e/LO7EjQMKnuvyZAkyqRJB2kz3b0DtBqpjpvAVs/vk8d2NjTv/kksjme
 9hdpg/tiJNGmr1IhbhhJtP16ryNePKW9NTqgVuwIA6xS3r9LSOZcwgrS/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262917"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564495"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:11 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/8] drm/xe/vf: Assume fixed GSM size if VF
Date: Tue, 13 Feb 2024 16:43:48 +0100
Message-Id: <20240213154355.1221-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

VFs can't use size mirrored from PCI config, but it should be
safe to assume it covers full 4GiB GGTT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 6fdf830678b3..ab96edb058d6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 #include "xe_wopcm.h"
 
 #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
@@ -144,7 +145,11 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
 
-	gsm_size = probe_gsm_size(pdev);
+	if (IS_SRIOV_VF(xe))
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
 	if (gsm_size == 0) {
 		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
 		return -ENOMEM;
-- 
2.43.0

