Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6010CA0EE4
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 00:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D9010E1F9;
	Tue, 19 Aug 2025 00:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCi4E/IF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905910E1F9
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 00:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755564095; x=1787100095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n+3JkLXJ2XMLuD7P6VAmXkSdIMFKSfi8QixiKBGy0Yo=;
 b=ZCi4E/IFfbX6jahV6R9E6egsyyIp+7DT/Hi3kVNJLNJ4faj240CZAnRR
 KOfy7I4H4Nj8MvqLOXZyVBk2DX5nCgcpayIneYKX6oB2wPxV/zM1xH5X3
 lrFDEKwIURzXIepYUmid/U/3JBNgfLwqeHFfu77DmYklfhLhU5xrwFTVG
 CL8JpDPJgN9DFECf/Yub2UrqAJgpqbAZkAKr/m+YFPh6NelXCPaCE0Eug
 ZMvy2sRE4l+DN5p5chRMuxuOKRU54UphrKiDo5lobxMbwKA43uchmKBBl
 rHodaIhQlUW6fViqUTrSpNllhKodN7KapQc5yMA1mB1bHfubPTdmXT8k7 A==;
X-CSE-ConnectionGUID: zGK/TDtvRqSDPCmfYu5Rqg==
X-CSE-MsgGUID: n5pmVnvcQ7WvIBJMjG1/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75250809"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75250809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 17:41:35 -0700
X-CSE-ConnectionGUID: lM5L1olOR0+w8cBBbhcwEg==
X-CSE-MsgGUID: 3e1bXOlzRiqjpKsbwgsTuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="171951729"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 17:41:34 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe/tile: Release kobject for the failure path
Date: Tue, 19 Aug 2025 00:39:58 +0000
Message-ID: <20250819003957.2868064-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

Call kobject_put() for the failure path to release the kobject

Fixes: e3d0839aa501 ("drm/xe/tile: Abort driver load for sysfs creation failure")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index b804234a6551..99dbf232535a 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -44,16 +44,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
 	kt->tile = tile;
 
 	err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
-	if (err) {
-		kobject_put(&kt->base);
-		return err;
-	}
+	if (err)
+		goto err_object;
 
 	tile->sysfs = &kt->base;
 
 	err = xe_vram_freq_sysfs_init(tile);
 	if (err)
-		return err;
+		goto err_object;
+
 
 	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
+
+err_object:
+	kobject_put(&kt->base);
+	return err;
 }
-- 
2.49.0

