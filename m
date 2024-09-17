Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B155CAC594
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43DC10E4DC;
	Tue, 17 Sep 2024 17:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkE6AjZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ECB10E4DC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595809; x=1758131809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=28FHeIgzVdflrX/L4BZ7h9gCvlx2utrilW1jR2QmnW4=;
 b=hkE6AjZ5nUIXGWRVkAyl0rJkEDnC4XMkhpxSrQRr3uoDY+AJuwH5oN9/
 Dvyv5peMImwE/O9R68ni7V6bu/L0bmwWT5ZNbzGePiIPVezfs9fjGTBbA
 iIw8jR4WpcmReWGfodPjNjFSW4QqYJpr+zsGDPI0azZ4w7CHS5JqQ0vVl
 ekeqo+ZIfMZtwXKm8FeR9DI6kdKo8VUXeK22metCTDIs8d9fKajK4R4y7
 88IirL6dKRmFc/PcDbSiI85DEICdUUDxhsi9xNSjnvCo5Jrp08pGguFzk
 1xBMql9UKv7AAsW5qjZ5GkCH+HH/+2cbCBHO5s16sgfqG+YVgFI8FGWqs A==;
X-CSE-ConnectionGUID: XJeyxuXxQTWrBsmYG3UXWQ==
X-CSE-MsgGUID: p4oRE9e9RVue5/AqZgXoVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562018"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562018"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:49 -0700
X-CSE-ConnectionGUID: xFq4SmXsQDSsObTuQdpPOQ==
X-CSE-MsgGUID: mp8ShHHLR02hlKtiE6+DQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926519"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:47 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 14/23] drm/xe/huc: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 23:44:16 +0530
Message-Id: <20240917181425.515871-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 77c5830309cf..e002930cbfe8 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -296,19 +296,19 @@ void xe_huc_sanitize(struct xe_huc *huc)
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
-	int err;
+	xe_wakeref_t fw_ref;
 
 	xe_uc_fw_print(&huc->fw, p);
 
 	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		return;
 
 	drm_printf(p, "\nHuC status: 0x%08x\n",
 		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
-- 
2.34.1

