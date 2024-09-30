Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0A8CF64A1
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F310E2CE;
	Mon, 30 Sep 2024 05:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKP3NtEf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7511210E2C7
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673251; x=1759209251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZrApQTTjTGxg3HqVrzG//viUfAEPvDgvGHWHLZElQtA=;
 b=HKP3NtEf2u8EvuUf9Tr24A+nBP0tLgx/3aLE+2DFBA+T3ve9TJd8A4+Y
 x+U+RYk5N4G4aANEwmItzuZLOPx+E7KU89hzSp3FlGJi6hXpoRw4IhF71
 8qXpmeApdS7Yll1fV33eNjoOaJx300vebYlxk7M048V0yovkGEn7Y5RIg
 WbUk8OPi3R9l7n4Gm9jCN4UeCmg/z4lIVliF181XO4/HOjQF6NZwsbwIC
 Dg5HUDPQNSopvRmuonfXTbIlqa9c3QxxNTYPetSNgReodMmAoyLdkKDET
 1SFWvPCipxUvQlqLdTSVmFvbWffdIez+dhT9pu7iwMYcVtHdXWYlDDOoU A==;
X-CSE-ConnectionGUID: nKaY/amNQ2S8SaxoMsn5Ng==
X-CSE-MsgGUID: cloIKG/2QHW/JFYvOAux2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14368002"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14368002"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:14:10 -0700
X-CSE-ConnectionGUID: W3nuXZ88Rx+dzynkgfmlzA==
X-CSE-MsgGUID: eyE/G6dJSgSBaXTb+OhnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752279"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:14:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 23/25] drm/xe: forcewake debugfs open fails on
 xe_forcewake_get failure
Date: Mon, 30 Sep 2024 11:01:47 +0530
Message-Id: <20240930053149.1246339-24-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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
index a64bae36e0e3..6bbe1ba8240c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -92,13 +92,32 @@ static int forcewake_open(struct inode *inode, struct file *file)
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
@@ -108,7 +127,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	u8 id;
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(xe);
 
 	return 0;
-- 
2.34.1

