Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D411CAC596
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4714010E4EF;
	Tue, 17 Sep 2024 17:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVglyx4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA7410E4DC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595823; x=1758131823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0lBbV2OhLC4xRNXHcD3Ue6UEqbjJnO+Ng8zjkU59wHM=;
 b=AVglyx4GThZiFc7tGWBhKl7gORXRISrtpVWc4fB/pXp5jab+YvuiCtEA
 ww+Rv9osxp9n+i4G30JLoAiD8LQd5pkvWDFaK0o7pI2tdMGwGsRxZqAWW
 jkfsgNok3SRHqFneZEXWYtDpHXYzpMq114Zj9jmggVoA7ImfiDESlGfjN
 d0H90DMjrSlePwQ25dxcdlAHF/YpG/GEsNvoYy/jHPyWV6HpvVSc51QrJ
 814yjUIciym9c8czDegtmpm9E6xxI4Jkav/Cst7wVEU6o7byHMVKjkw06
 Apjz0qDSvQr9PMyHSBK8AJwYCe8epmK2REY1CpJvmgkKvOkhLzW3Hd8GG Q==;
X-CSE-ConnectionGUID: n7uCMRP6RPmAt3P1LJkiAw==
X-CSE-MsgGUID: g9mwZFzSS9ixz2GWQmxSyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562028"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562028"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:57:02 -0700
X-CSE-ConnectionGUID: gH7jddCSS7qjLMA+Ar/lpQ==
X-CSE-MsgGUID: 5GRfQ9HkSMSF0B2AMP5KEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926545"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:57:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 21/23] drm/xe: forcewake debugfs open fails on
 xe_forcewake_get failure
Date: Tue, 17 Sep 2024 23:44:23 +0530
Message-Id: <20240917181425.515871-22-himal.prasad.ghimiray@intel.com>
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

A failure in xe_force_wake_get() no longer increments the domain's
refcount. Therefore, if xe_force_wake_get() fails during forcewake
debugfs open, return an error. This ensures there are no valid file
descriptors to close via forcewake debugfs, preventing refcount
mismanagement.

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index a64bae36e0e3..242dd8677b27 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -92,13 +92,34 @@ static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
 	struct xe_gt *gt;
-	u8 id;
+	u8 id, last_gt;
+	xe_wakeref_t fw_ref;
 
 	xe_pm_runtime_get(xe);
-	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	for_each_gt(gt, xe, id) {
+		last_gt = id;
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		if (fw_ref != XE_FORCEWAKE_ALL) {
+			xe_gt_WARN_ON(gt, true);
+			goto err_fw_get;
+		}
+	}
 
 	return 0;
+
+err_fw_get:
+	for_each_gt(gt, xe, id) {
+		if (id < last_gt)
+			xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		else if (id == last_gt)
+			xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		else
+			break;
+	}
+
+	xe_pm_runtime_put(xe);
+	return -ETIMEDOUT;
 }
 
 static int forcewake_release(struct inode *inode, struct file *file)
@@ -108,7 +129,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	u8 id;
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(xe);
 
 	return 0;
-- 
2.34.1

