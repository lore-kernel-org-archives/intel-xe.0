Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F5C41513
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 17:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297A210E532;
	Thu, 19 Oct 2023 17:45:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFED10E535
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 17:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697737535; x=1729273535;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V2WUM1SQFE/WIE7PYFBdwgAuOQxPovdhJYIjHPmPuLM=;
 b=YSltg4STk/gkbD4HC6Xw9a0JHz/0HglebI8VOonLQkqZPf4BwtZPFtdk
 8RM9H8uXYX4ww6OJuVs+wz8oEUXevfSxftbul6oxEgnRf5WgOZcAx/bqm
 LEYDXtwcoszMurIr3PCZZHfErRCRGKcwPILeYK5DSY/aLxoWWs0v4oHK+
 xgvL401K5Ok9tDEXoNxxwtVLyVuXYwlDw0fWhh128na5Sn3DHsIOXzwW7
 NjY8fU9M/ioEkrk7ST50gTViPI/ZPhC9l4rCrqmslP4l94yFYj5C1B67U
 4JiP0qrUhe6rZ1rvS4X+yA7ymg+UQ+/IvQAOSqPqa6y3cfawHlYb6YLuL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417440100"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="417440100"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5067281"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:45:36 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 10:45:34 -0700
Message-Id: <20231019174534.20542-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Simplify xe_res_get_buddy()
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

We can remove the unnecessary indirection thru xe->tiles[] to get
the TTM VRAM manager.  This code can be common for VRAM and STOLEN.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 5cb4b66a5d74..006fc1361967 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -50,14 +50,9 @@ struct xe_res_cursor {
 
 static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
 {
-	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
 
-	if (res->mem_type != XE_PL_STOLEN)
-		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
-
-	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
-
+	mgr = ttm_manager_type(res->bo->bdev, res->mem_type);
 	return &to_xe_ttm_vram_mgr(mgr)->mm;
 }
 
-- 
2.38.0

