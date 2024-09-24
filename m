Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C700DCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA0C10E898;
	Tue, 24 Sep 2024 11:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IS6dSMm/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F59F10E898
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179132; x=1758715132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6/cf4+xvM1gDrW6jRrqCQGHdD4vrBS9BTQVipeVnIY=;
 b=IS6dSMm/FdKj9XnLsWwo0uXioXPk5HnLfukoGnxFZV/f3oWEGLzfjA7R
 maQxSbX3UOvzAZT9evsKBuyVb2ouIYZG1orX97LAIbNTYlCCQ7r+AJraJ
 gGgdinSeW9u9XwGJOCu4iIf2UXMc9XllsLs/qbHtYTKVMxrKNft4oP3XR
 cAlfvv7tHYwSwxWEJewwmKljUx5WBYUteZtLUwK7ObHgBxB8yFo0JMymj
 w01LDUQJd+5c7ErN1rdk0JUnGZmLFmgC4UwVeqshdp3I7oW4qmT8qKi6i
 mppMjhFvmmdrSPQhJU/crsaehjTgAElptwY3agTE/vH52EsYCleEnweML w==;
X-CSE-ConnectionGUID: IAmXo5v9QgSjhsPVO0wL5A==
X-CSE-MsgGUID: KWaA6HuvRFCwXVu3MrO7OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957023"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957023"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:58:52 -0700
X-CSE-ConnectionGUID: SLv6Isq9QC2VR7S3ufBtYw==
X-CSE-MsgGUID: CR714s7CSl2QiYxcDy6PtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319180"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:58:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 12/23] drm/xe/xe_gt_debugfs: Update handling of
 xe_force_wake_get return
Date: Tue, 24 Sep 2024 17:46:30 +0530
Message-Id: <20240924121641.1045763-13-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented
domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does
not necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and
pass the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int for xe_force_wake_get()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index cbc43973ff7e..5794856efec3 100644
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
+	if (fw_ref != XE_FORCEWAKE_ALL) {
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

