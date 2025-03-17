Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A94C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 15:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC6510E429;
	Mon, 17 Mar 2025 15:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adE20ts6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6710B10E429
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742225218; x=1773761218;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lyBvTFsdkT885JycOd01OWmQ5lBlnH3dIZmy0lJxi4A=;
 b=adE20ts6TKpmkQyzujVyDSZnFxa8Wo6/N2mZhYP7aa714R4Fqohr0/Xo
 lW0vnWsuSKgkDSDKT66h0UpwiqvUJ4bWgZp/dg89nB4AgiT+tOBVeMKyE
 /Q6iUyfYaKcMBTx3+Th6zQMWzhp2NT8vkQt22IscuiB/+rviAT1aP5Lfe
 aAzpIfqhhU98N5iMPUMHsTreTpsBKtozVngNbuRtsrUGZdA9GZbmyCzOW
 Ru0jnyzDAKfsZHEXbw6XKhTtqLIZiITi1jPwQzCLxCRqowXHMCO5dn59s
 K091NX6V6ogIy+aa7XGK9jdBkKIL/y7KWceMZIF2qlUQSGnpvxGd9/JyI w==;
X-CSE-ConnectionGUID: V8J+XM42QG2/eAlLZpGQ4A==
X-CSE-MsgGUID: optMLYznTcWwXdlPpuimKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43058873"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="43058873"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 08:26:58 -0700
X-CSE-ConnectionGUID: trbA/U7GTpGkfgEDNNXaVQ==
X-CSE-MsgGUID: IQOexWWFRhafvFphU7geMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="121989663"
Received: from dut4419lnl.fm.intel.com ([10.105.10.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 08:26:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 Michal.Wajdeczko@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe/xe_gt_pagefault: Remove pagefault vfid
Date: Mon, 17 Mar 2025 15:26:56 +0000
Message-ID: <20250317152656.66069-1-jonathan.cavitt@intel.com>
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

The VFID will always be zero according to the GuC ABI, at least with
respect to pagefault reporting.  So, stop storing and reporting it.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Matt Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9fa11e837dd1..debc260cd679 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -27,7 +27,6 @@ struct pagefault {
 	u64 page_addr;
 	u32 asid;
 	u16 pdata;
-	u8 vfid;
 	u8 access_type;
 	u8 fault_type;
 	u8 fault_level;
@@ -269,7 +268,6 @@ static int send_pagefault_reply(struct xe_guc *guc,
 static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 {
 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
-		 "\tVFID: %d\n"
 		 "\tPDATA: 0x%04x\n"
 		 "\tFaulted Address: 0x%08x%08x\n"
 		 "\tFaultType: %d\n"
@@ -277,7 +275,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 		 "\tFaultLevel: %d\n"
 		 "\tEngineClass: %d %s\n"
 		 "\tEngineInstance: %d\n",
-		 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
+		 pf->asid, pf->pdata, upper_32_bits(pf->page_addr),
 		 lower_32_bits(pf->page_addr),
 		 pf->fault_type, pf->access_type, pf->fault_level,
 		 pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
@@ -304,7 +302,6 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 			PFD_PDATA_HI_SHIFT;
 		pf->pdata |= FIELD_GET(PFD_PDATA_LO, desc->dw0);
 		pf->asid = FIELD_GET(PFD_ASID, desc->dw1);
-		pf->vfid = FIELD_GET(PFD_VFID, desc->dw2);
 		pf->access_type = FIELD_GET(PFD_ACCESS_TYPE, desc->dw2);
 		pf->fault_type = FIELD_GET(PFD_FAULT_TYPE, desc->dw2);
 		pf->page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, desc->dw3)) <<
@@ -393,8 +390,7 @@ static void pf_queue_work_func(struct work_struct *w)
 			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
 			FIELD_PREP(PFR_ASID, pf.asid);
 
-		reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
-			FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
+		reply.dw1 = FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
 			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-- 
2.43.0

