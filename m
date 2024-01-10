Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6382FC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 07:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FB310E0E2;
	Wed, 10 Jan 2024 07:26:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B304F10E0E2
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704871606; x=1736407606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1FEatFb61qVe8Ww/d9YqZxzvLfcWUQSyBh6O9Sk90Ss=;
 b=e1YDwEyY5ILWW8zW/iPurzyGIw+t7QXyz2ZtEp1W9M0+7TJ3Fm6ZS0Xr
 MCl8jLvVfbJHlqx/DhEEfcnt2kImos5LIyfQ7eFMcs9iiTfwIpMVjae/v
 0T9Wd4cocfV2OmStI4LojZvLBIyZji4e5rFTHhdcLCF0t2GdszjMvITZ6
 2Vg1qEaKQzuPDzPAQ15TQwPZCojRvY3eWx4NNzVQjQfGD77H7W04U4jf0
 /amyJMYNmyziFwaZOlhmWlZL3JB/bhq3aHBNCR+G2ggn/OJmM3QXae+d+
 GVVR4gTox1Y8eyBRUiteyXl3OnVLk/l/AghHaKQQRmgsKxXsUww39jWn5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5185455"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5185455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 23:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="16544760"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2024 23:26:45 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix typo in vram frequency sysfs documentation
Date: Wed, 10 Jan 2024 13:12:03 +0530
Message-Id: <20240110074203.2169233-1-sujaritha.sundaresan@intel.com>
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

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_freq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 733146293307..838f582e5632 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -96,7 +96,7 @@ static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
 }
 
 /*
- * xe_vram_freq_init - Initialize vram frequency component
+ * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
  * @tile: Xe Tile object
  *
  * It needs to be initialized after the main tile component is ready
-- 
2.25.1

