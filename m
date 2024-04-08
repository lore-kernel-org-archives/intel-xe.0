Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE993C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 14:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F9A11269B;
	Mon,  8 Apr 2024 14:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nP9C5yur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185F7112696
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712586972; x=1744122972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pnqq4d68YcCVtniJyZ2BKhGDXLHMGhVseAY4f8nKGJA=;
 b=nP9C5yurFmygVOosu3Bxs/OTXBuHJzhl6WbyJX9hH6qsK03Ye8wFO88A
 5uO72PhYfYlz7nz0w5JmFIpgryY0tAq5xYee2mXGcQftO7vsIpMUkMC2z
 3WaoD4XQ1/hm9ldMj64kEPBw6+eKd6A99ye++WW/eMVqyzyeE3Cq+KgUi
 nLSHZKkCXU7t/L8t0HnPzJTWYPUz4fGxyqgEBLpXWst16TqWc8rHRYTd+
 DZ86rPoEoveOYXEgSO6xk3tdYB8I1P+hNIO94iTOTNEBrB0OC1DcxO2yM
 s4/sZ9afSZzGixJE3EW7Wsp+z9a6l9mksRXc24GoHVWJ71/XGzY1FUucL w==;
X-CSE-ConnectionGUID: OytvghtsSYqZ4wqGCA8e0A==
X-CSE-MsgGUID: imRNGpwXTJe6Y6BGvVlZ1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33264158"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="33264158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 07:36:12 -0700
X-CSE-ConnectionGUID: S+mUtjGBSmyfEChNAoyM8g==
X-CSE-MsgGUID: 458wuTDkRQ6W3XPXBvwoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24673155"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 08 Apr 2024 07:36:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 4/4] drm/xe: Return NULL incase of drmm_add_action_or_reset
 failure
Date: Mon,  8 Apr 2024 20:19:44 +0530
Message-Id: <20240408144944.604448-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
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

Incase of drmm_add_action_or_reset failure return NULL and no need
to print warning messages as they will be printed implictly.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index c5084d94c442..daab970f8be8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -520,9 +520,8 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
 	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
 				       &keclass->base);
 	if (err)
-		drm_warn(&xe->drm,
-			 "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+		return NULL;
+
 	return keclass;
 }
 
@@ -553,13 +552,8 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
 	if (err)
 		goto err_object;
 
-	err = drmm_add_action_or_reset(&xe->drm, hw_engine_class_defaults_fini,
-				       kobj);
-	if (err)
-		drm_warn(&xe->drm,
-			 "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
-	return err;
+	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_defaults_fini, kobj);
+
 err_object:
 	kobject_put(kobj);
 	return err;
@@ -708,14 +702,8 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 			goto err_object;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini,
-				       kobj);
-	if (err)
-		drm_warn(&xe->drm,
-			 "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini, kobj);
 
-	return err;
 err_object:
 	kobject_put(kobj);
 	return err;
-- 
2.25.1

