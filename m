Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75091E77183
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 11:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3193710EB01;
	Wed, 11 Dec 2024 11:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="No6DeGds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9238F10EB01
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733915859; x=1765451859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5P68Adly9i65CZwggKgKiGsRKnTwcuFJgmy9R93hzY=;
 b=No6DeGdsDSu91q5bFiG25aBLiLs+DL/Y41UxgBy+wPcAGWG89wL6i3db
 jd1USuZ90Vgf5OIBWAbU0fSCrEYGCTeIxHL32jTjRGezxQTApNGQOWSeX
 faRC01Vpiwjbh0bxdQfez1udHkQ4z0amFheoeBeLTG9OMT0dnYfOh1zMO
 Q9lG5rh2yeWxaWY+eKb2VDsP/YCZ6UjW2etevUbC6vwJDTH940PJTKRed
 G3/GGX2yBb8fvowUiRuChoslVR4IsyFtUmrmmXpUdPZE+B+YZ8g2HX23+
 YMrwM19B4ofg3NlOhXsl+SHlkrQabFPY1mcpXZUK4uL7/ezyq6hypQj3u Q==;
X-CSE-ConnectionGUID: xnZEPZS/RQa30pYb85T0Eg==
X-CSE-MsgGUID: G5Tl9sP3SryB2GdHs16oyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34430319"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34430319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:17:39 -0800
X-CSE-ConnectionGUID: pd071M7jRXS2MaRicb4NLg==
X-CSE-MsgGUID: hSwmxS2ERJKFCKhpRV++3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="96237109"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.244.205])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:17:38 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, raag.jadav@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v3 2/2] drm/xe: make change ccs_mode a synchronous action
Date: Wed, 11 Dec 2024 12:17:27 +0100
Message-ID: <20241211111727.1481476-3-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
References: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
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

If ccs_mode is being modified via
   /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
the asynchronous reset is triggered and the write returns immediately.

With that some test receive false information about number of CCS engines
or even fail if they proceed without delay after changing the ccs_mode.

Changing the ccs_mode change from async to sync to prevent failures in
tests.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index b6adfb9f2030..50fffc9ebf62 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -150,7 +150,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs_mode = num_engines;
 		xe_gt_record_user_engines(gt);
-		xe_gt_reset_async(gt);
+		xe_gt_reset(gt);
 	}
 
 	mutex_unlock(&xe->drm.filelist_mutex);
-- 
2.43.0

