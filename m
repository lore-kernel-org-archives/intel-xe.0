Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9022CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 15:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E18810E62A;
	Tue, 19 Aug 2025 15:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbWwsLsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAD610E62A
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618109; x=1787154109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MilgAEDmfi8M07tcHLxJmXRqmRnXA02S5klDl64HRv8=;
 b=TbWwsLsqFIW+2fHwJJfeHWhhJA3FambrZvXfrwomruzQrJj2mF9QlJPP
 o6r6pOPSqDeRO6pnZj7qiuQqUGMGvT8n1g0e+JZHRSIqAMHxxuA2PyI8W
 ryM58eezO5jHiD5H+dXQ3RHkfYZQtTeiPGnM41ZbCNvw0wnZ5Pjjfu6yt
 XxM7iQh3mMOQqqyoTCukMviR9gtqFJeXBsV9yq3DoUDF6RtZJEYh2bE96
 toH6aiClAZk7/Bgz/+DvV9vBxAzUlRFHwgkGgRHv6W6u4iC63aM+ymKr4
 1108Mm2VqxNarmU9RzNpZeNf3OlnQ+IJ+s/4bJ1uC/5zSJRf3G9gLDrQ4 w==;
X-CSE-ConnectionGUID: eV6owYT3QeaXfG8SYC0QPw==
X-CSE-MsgGUID: 0p9KEAd5S2Cz+0mfCwjQAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68469057"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68469057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:41:49 -0700
X-CSE-ConnectionGUID: Xv4Ch55tS7agAyWGK1a0tw==
X-CSE-MsgGUID: jQVvE6bWR+G3zWyzg2vgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="191564684"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2025 08:41:48 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/tile: Release kobject for the failure path
Date: Tue, 19 Aug 2025 15:39:51 +0000
Message-ID: <20250819153950.2973344-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250819003957.2868064-2-shuicheng.lin@intel.com>
References: <20250819003957.2868064-2-shuicheng.lin@intel.com>
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

v2: remove extra newline. (Matt)

Fixes: e3d0839aa501 ("drm/xe/tile: Abort driver load for sysfs creation failure")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index b804234a6551..9e1236a9ec67 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -44,16 +44,18 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
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
 
 	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
+
+err_object:
+	kobject_put(&kt->base);
+	return err;
 }
-- 
2.49.0

