Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E8FCD128A
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1141510E9FB;
	Mon,  8 Apr 2024 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqSJOuTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41B11252F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712579700; x=1744115700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pnqq4d68YcCVtniJyZ2BKhGDXLHMGhVseAY4f8nKGJA=;
 b=UqSJOuTfWwH1YxfmJJLDDuwNd4RoacmMAmJCxju014j7wGSbKZWkwsu/
 fo1oUlyK7uAHZRolpM8vpPN8uAzO+z2ApiXLLpHk8SR0VAdO/IcSHEI4v
 x73ebfE2YHDRIKTep1dWo2DLtVZ4YxtQ8GSk+nY1HLfRwaEygd4fUcnbm
 v7bM4456rpu80KB4WFVMEarrg/M5UHrmzuGjMJqoaC6sLhHdj+bjEAvrK
 Tk/LYTLtY4ZnpKbYDq7BHXDhdHXn+qtHEiUR8cHeBcJ7lv4EXJDv1VMzp
 XPKLSTbmBrkekeetGt351AQjCXm4tgGo6aGfGp0jcHUkx+OPIphyiQ1rC Q==;
X-CSE-ConnectionGUID: 0C57KgNZReGZVOd3USRIRA==
X-CSE-MsgGUID: RRZN3lGJQmmH/cwwWSbYzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25301554"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25301554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:35:00 -0700
X-CSE-ConnectionGUID: zZa2dljXQ9iaNB4X2zSIbg==
X-CSE-MsgGUID: LGYxOpAEQaCOaRHS8dBAgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19828712"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2024 05:34:58 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/4] drm/xe: Return NULL incase of drmm_add_action_or_reset
 failure
Date: Mon,  8 Apr 2024 18:18:30 +0530
Message-Id: <20240408124830.591903-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408124830.591903-1-himal.prasad.ghimiray@intel.com>
References: <20240408124830.591903-1-himal.prasad.ghimiray@intel.com>
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

