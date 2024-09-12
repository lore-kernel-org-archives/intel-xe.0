Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E76EEE245
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CC710EC2A;
	Thu, 12 Sep 2024 18:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjnjJUYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1162210EC2A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167515; x=1757703515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+74Sr0EP7dB3xBB1fB7swvJ37Z0fNyhXjUn1ebGYlFY=;
 b=WjnjJUYtGU8+ExLjNH0TuZGv3fx6nP1p97tA0IKz/LAUNH79Tktb3iYE
 /1+CE+joc/l5tjT99ClzPNHbpTZFTsCpeISf4sS3i3rpLO0lcTgnrggM6
 rcrXoTfLUZqdoTJoST6tHQ8ttxHhmGfMh/Ehe5HganIBTJEVMuNHFwTcN
 IKnbZXvbUQcc6ssAf4b6Z1EKWeQMzMJxrMq192Dm+o6cTDwGfqAne06vJ
 58610kspPdSFL3e46K0Ct5GtwN7z1+sfwc0bQjsObcm5QDyOXEUEKCxrM
 1hTdxMPXZfntT6askeb2hF+gvvlhO8SNsPfCe/byH9EX5CTtPWLe3ApPo Q==;
X-CSE-ConnectionGUID: jxXgqe9DT6Sb6kIL0zuwuA==
X-CSE-MsgGUID: ZIB1NSZQTJCJGYwNii8YSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25203001"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25203001"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:34 -0700
X-CSE-ConnectionGUID: /cEZ83a8SJuskCXgn5xQ/g==
X-CSE-MsgGUID: gDz/0Q9VRV2wtnNOV6tOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910219"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 18/23] drm/xe/xe_reg_sr: Update handling of
 xe_force_wake_get return
Date: Fri, 13 Sep 2024 00:45:58 +0530
Message-Id: <20240912191603.194964-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 191cb4121acd..6ab6a48b1d29 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -188,26 +188,28 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 {
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
-	int err;
+	int fw_ref, err;
 
 	if (xa_empty(&sr->xa))
 		return;
 
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		goto err_force_wake;
 
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(err);
 
 	return;
 
 err_force_wake:
+	err = -ETIMEDOUT;
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
 }
 
@@ -221,15 +223,15 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	u32 mmio_base = hwe->mmio_base;
 	unsigned long reg;
 	unsigned int slot = 0;
-	int err;
+	int fw_ref, err;
 
 	if (xa_empty(&sr->xa))
 		return;
 
 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		goto err_force_wake;
 
 	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
@@ -254,12 +256,14 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(err);
 
 	return;
 
 err_force_wake:
+	err = -ETIMEDOUT;
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
 }
 
-- 
2.34.1

