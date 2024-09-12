Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50E4EED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E13E10EC23;
	Thu, 12 Sep 2024 18:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxASmSnO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D1E10EC1F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167500; x=1757703500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uMiWJcK1TtEmuiw0eXLEJYh20KD5AgQpkRrFxpt+IXY=;
 b=RxASmSnOvxzVdrCCly5zb2smwMhYE5a/E9KhW5GgORIYl6gINT1yVE6p
 i8hTFILUvTUYpGcj9QDMEmZDm3KHvpoU4oJY4FCsp+nI2vcvkC2buMItX
 74sNG9NXgEPRmtPIrYN2tgO/q2J97b+W00S3UeLOamA7Ynp/I8DErnna7
 fVTshZQC6DTT4FD/QokbaYalbHbPIoMaE93x9lXrfJygahTvu+0xvuiYM
 YCryBbqWMHXtuZTvZWqgxvOwf+m0IOi63Tqqv+5udc5MJVqG3GNyDcSsM
 7uFMvJNsKYc1Dxtu1fs0NQqhzYmNg/potAW6RmStuZL1RamcuLqabh8/1 g==;
X-CSE-ConnectionGUID: mJSJ7hGzR+mec3Vub68OAg==
X-CSE-MsgGUID: QNbubKXWR4GKLhMnqX7tQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202958"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202958"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:19 -0700
X-CSE-ConnectionGUID: fvW6i/WJSLO2E42zNM+7Zg==
X-CSE-MsgGUID: 4KIj1fQ7SS2wwKVd+5ieSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910150"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 10/23] drm/xe/mocs: Update handling of xe_force_wake_get
 return
Date: Fri, 13 Sep 2024 00:45:50 +0530
Message-Id: <20240912191603.194964-11-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 8df41cd12d51..4f1e0fba0e31 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -775,23 +775,23 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_mocs_info table;
 	unsigned int flags;
-	u32 ret;
+	int fw_ref;
 	struct xe_device *xe = gt_to_xe(gt);
 
 	flags = get_mocs_settings(xe, &table);
 
 	xe_pm_runtime_get_noresume(xe);
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 
-	if (ret)
+	if (!fw_ref)
 		goto err_fw;
 
 	table.ops->dump(&table, flags, gt, p);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 err_fw:
-	xe_assert(xe, !ret);
+	xe_assert(xe, fw_ref);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

