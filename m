Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1306CF9C6F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A388210E899;
	Tue, 24 Sep 2024 11:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i29ajZvP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F9F10E8A3
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179128; x=1758715128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Klq1/3hO/hwZRmDyssMw9EY6mT+2qmy7LMkplmOqpUw=;
 b=i29ajZvP9N/svYD8L07Gs4++ch9I5JWI3mm7zTJjwpskyAklNj3x1vVX
 ecZWWG2L3i3WJlUjoLlSuNInKU4rG3iTBhW2nt2TpvjKcJx3KZycyDzuk
 qj3Ycd/NkeeYnVqAsgti+ZLVA5sTPbnhWVNTnIqr8pllMxVMWfT/Q75ne
 uIFUyjL+T5vOyOj8qMkpdICc89WuVenVAcZEYP8tidHYUH4GsJqE92VjW
 UIKtlNicE/e01Qvr2AR7GJk/aR4V12lCzomzB2dJKRjRLd6nfa7K2wu0S
 evwDO9c4A8u3TFpbR/hn353z+fpYSJWmrNufA4PoVZ8WPcVGMc3NjP+rV w==;
X-CSE-ConnectionGUID: gl51M5K/SVutrgPErCweig==
X-CSE-MsgGUID: SV5xRAEJSWWbbbx0uog5Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957020"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957020"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:58:48 -0700
X-CSE-ConnectionGUID: KNZGRivVTLCCA95DobLaYw==
X-CSE-MsgGUID: ibOzWD0uSbCLjURUYj1liw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319166"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:58:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 10/23] drm/xe/mocs: Update handling of xe_force_wake_get
 return
Date: Tue, 24 Sep 2024 17:46:28 +0530
Message-Id: <20240924121641.1045763-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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
- don't use xe_assert() to report HW errors (Michal)

v5
- return unsigned int from xe_force_wake_get()
- Remove redundant warn

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 8df41cd12d51..9b673d7bf4b9 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -773,25 +773,21 @@ void xe_mocs_init(struct xe_gt *gt)
 
 void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_mocs_info table;
-	unsigned int flags;
-	u32 ret;
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_mocs_info table;
+	unsigned int fw_ref, flags;
 
 	flags = get_mocs_settings(xe, &table);
 
 	xe_pm_runtime_get_noresume(xe);
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-
-	if (ret)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		goto err_fw;
 
 	table.ops->dump(&table, flags, gt, p);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, !ret);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

