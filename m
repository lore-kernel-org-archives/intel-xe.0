Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD22C47422
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 04:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1D110E00F;
	Wed, 17 Jan 2024 04:16:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4938A10E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 04:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705465013; x=1737001013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pChcgAPZYWc3kN2AmM8jovTJ+S5Kgyoz5rkfLwaTM6E=;
 b=UbXZpvpWcQhsDpRr4jt8/eFFiY9NelukKYVlPcYyMMGGw/o1XUmEuLSV
 hpK90QwFbUcF+fC/fhyCm0ILTm0eFGx2woTe8kaS6eZB7z9Rrr6pasw8/
 iHuEpqG6xyYatcSpqHiO0mXG/bmm7MUKiBL61sL4tsRvrebCeBgQ0H8yu
 +VuniaRVHuPoVCvwSifL7dUxGkXQH9eu6CseHdE7kXuTRo3NUjgOgk0fX
 Gjsf/CtGqNOMpFgMb7NEFSG0rsWMFjWKTJ9SksOgxqB5OL66lH2hUFgAu
 kX5m3oI97N3ZaHSW+8O3l3y2DWMZ73ycgsjENXZz/Dhc0zMPUz8TbVZMu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397223521"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="397223521"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 20:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="784375054"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="784375054"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga002.jf.intel.com with ESMTP; 16 Jan 2024 20:16:49 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [v2] drm/xe: Fix typo in vram frequency sysfs documentation
Date: Wed, 17 Jan 2024 10:02:15 +0530
Message-Id: <20240117043215.2598677-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix function naming and description for xe_vram_freq_sysfs_init
function.

v2: Add fixes tag (Riana)
    Fix review comments (Lucas)

Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")
Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_freq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 733146293307..079cc283a186 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -95,13 +95,12 @@ static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(kobj);
 }
 
-/*
- * xe_vram_freq_init - Initialize vram frequency component
+/**
+ * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
  * @tile: Xe Tile object
  *
  * It needs to be initialized after the main tile component is ready
  */
-
 void xe_vram_freq_sysfs_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-- 
2.25.1

