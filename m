Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75549CA0EE1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3087510E7CE;
	Fri, 30 Aug 2024 05:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNbP2b8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4310E7CC
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 05:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994360; x=1756530360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q+8g4UdrwH0nwAcVl3YP+XZbASQJhQuEK4yj/sClCQY=;
 b=mNbP2b8QiEff4WjCzL0MhUkKnkel7iSA6RAH59yvzKUcFFFXzU+zCaxO
 NW6qxtxMA6IYh7FpBrcbxPDPnRD/JZiQMb/HqaoH6ZBQNmxHLRd35MLqi
 e+yPPBlhRJsX6VYGCeI2onsUZEeNXmiWKULSxQgbFX9s65NSbs3cHfF8p
 n8A1x2va/falBzcth3PLnGO7+WlrrOtY1MlyZNxYh7NgWdIcHsHKyspb2
 MCoWXcBpK7/1Uk6A1MjpXW2aE2/8V1PxyR0NFwe+6VPc4/nUJblOVLcwa
 luKnwqfscCTr3OZkDcHN3XqnagGUyQad3b4zxfVum5TpO/2T2JtH5SC0r g==;
X-CSE-ConnectionGUID: dDrUV7SASWusf+3M+azaMA==
X-CSE-MsgGUID: Gike3wk9TT6GnL8wKFXtxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49006509"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="49006509"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:06:00 -0700
X-CSE-ConnectionGUID: CyL5rb1PTz+WfFakleYGew==
X-CSE-MsgGUID: bbQ7YEXGQS2wS+xzIeumjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101302022"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 22:05:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 9/9] drm/xe: forcewake debugfs open fails on xe_forcewake_get
 failure
Date: Fri, 30 Aug 2024 10:53:26 +0530
Message-Id: <20240830052326.3707019-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 78537bbfe2a4..2788a6b2dea2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -93,13 +93,33 @@ static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
 	struct xe_gt *gt;
-	u8 id;
+	u8 id, last_gt;
+	int ret;
 
 	xe_pm_runtime_get(xe);
-	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	for_each_gt(gt, xe, id) {
+		last_gt = id;
+
+		ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+		if (ret) {
+			XE_WARN_ON(1);
+			goto err_fw_get;
+		}
+	}
 
 	return 0;
+
+err_fw_get:
+	for_each_gt(gt, xe, id) {
+		if (id < last_gt)
+			xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		else
+			break;
+	}
+
+	xe_pm_runtime_put(xe);
+	return ret;
 }
 
 static int forcewake_release(struct inode *inode, struct file *file)
-- 
2.34.1

