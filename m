Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C191CFB442
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCCF10E309;
	Mon,  7 Oct 2024 06:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0NHhyL5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C310E309
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283338; x=1759819338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ddTZDctZxQv/d5M/Z8N7CyWfscq6NFhOL2WpvHxoOQg=;
 b=m0NHhyL5Za0zOTRc9Y4egqputrBG1a25JI7/9jMgzglDKrN5sCf7hDmu
 iWAzpkFowjoYuWXHFZEukevDbQE/K/PFbtgjPO0rAAHI7P0eV1c4d+j+K
 ZlOh9RRpof7IwtX8UmPp6E5bouGw/SxCSTtKvGCjuGy/m4giD67c5WX9W
 lwXxTV5EJgyoN1Iy7+b2f4bt4uUNLqG365M5SGBdg6ohheKF/nJO9C593
 9jv23s2IOZnLblj67vFCUtmHJ4ukttVxvynrJcEOwKjef6c07TnWu8LPR
 3izDHFxTySgoVTyWGjOr6YvVD83XNtQXAUo9G1SmiNJ4URefWXRnuuzh7 Q==;
X-CSE-ConnectionGUID: Qmp5xpE5RMWoUz1cU8k/JQ==
X-CSE-MsgGUID: iYvz+YrJRh6G1ZXa8LF3wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548450"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548450"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:18 -0700
X-CSE-ConnectionGUID: 8KkOLe+iTGOjXxFSAjjURQ==
X-CSE-MsgGUID: hd0nDmJsScq0Qpo7/D9MWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842482"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 15/26] drm/xe/xe_gt_debugfs: Update handling of
 xe_force_wake_get return
Date: Mon,  7 Oct 2024 12:30:06 +0530
Message-Id: <20241007070017.1732886-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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
not necessarily indicate success. Use xe_force_wake_ref_has_domain()
determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and
pass the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int for xe_force_wake_get()

v6
- use helper xe_force_wake_ref_has_domain()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index cbc43973ff7e..3e8c351a0eab 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -90,22 +90,21 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
-	int err;
+	unsigned int fw_ref;
 
 	xe_pm_runtime_get(xe);
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err) {
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
 		xe_pm_runtime_put(xe);
-		return err;
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		return -ETIMEDOUT;
 	}
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
-	if (err)
-		return err;
 
 	return 0;
 }
-- 
2.34.1

