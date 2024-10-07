Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3094CFB443
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BCA10E30B;
	Mon,  7 Oct 2024 06:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tzvyarqt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E7310E30D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283357; x=1759819357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dJTbtdlPRQyRZLcTP9TNR+5PTY7uocrKa4n083t9dm0=;
 b=TzvyarqtGmvlVsG+TXrMyud3BScYPB9cArg8XVUNAQ6B/S8xfw78fc4a
 t1Z5T7i8z6ewVd9lz5UX0vur7X4wSQsaaeZgRjHvE28cz3l8Hp5Ry8iE7
 lEtBfieaAJC3NkMwoLInxr+hPzaeCYD5CG7YH2RiG67RClAArZw0e3PsV
 7ySzBYN3SEx5tHc7eBp2cTsXE4g5mEnB/4b6KzI8BTSNusTN3VabcXdHm
 dhWO60ABUwzAnnLRpeq0rq5eQ0AUF7/V+jeRsQ6q/ZIViUquzrl9R/XFu
 zZ3zMpATXVcpvXmZdR1RceId24AFkUvl8w1u8OTptBcWBxg2hKlK5Hyeu A==;
X-CSE-ConnectionGUID: OJsfF06SRe+5onyrsCUCnQ==
X-CSE-MsgGUID: i9l6FU11ReCznlA/Imfz1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548479"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:36 -0700
X-CSE-ConnectionGUID: 3xZ3pSYAStS2/Q9473Qd8g==
X-CSE-MsgGUID: RZXzSFj2RtewbFsVP9zC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842604"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 24/26] drm/xe: forcewake debugfs open fails on
 xe_forcewake_get failure
Date: Mon,  7 Oct 2024 12:30:15 +0530
Message-Id: <20241007070017.1732886-25-himal.prasad.ghimiray@intel.com>
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

A failure in xe_force_wake_get() no longer increments the domain's
refcount. Therefore, if xe_force_wake_get() fails during forcewake
debugfs open, return an error. This ensures there are no valid file
descriptors to close via forcewake debugfs, preventing refcount
mismanagement.

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

v5
- return unsigned int from xe_force_wake_get()

v6
- Use helper xe_force_wake_ref_has_domain()
to determine the status of the call.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index fe4319eb13fd..492b4877433f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -90,13 +90,32 @@ static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
 	struct xe_gt *gt;
-	u8 id;
+	u8 id, last_gt;
+	unsigned int fw_ref;
 
 	xe_pm_runtime_get(xe);
-	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	for_each_gt(gt, xe, id) {
+		last_gt = id;
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+			goto err_fw_get;
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
@@ -106,7 +125,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	u8 id;
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(xe);
 
 	return 0;
-- 
2.34.1

