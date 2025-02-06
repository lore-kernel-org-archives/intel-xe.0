Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ED7C021A0
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC1310E9C4;
	Thu,  6 Feb 2025 23:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEt+uwoG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E1510E9BD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884237; x=1770420237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=89T8tZbFpxTvtjB9d5dPVN0+xZEeYTpGsqiwkAn6Tyk=;
 b=WEt+uwoGYsm4DPyMvEu78hNc6Td0kkzJ58NubEuS3VJF1T/eKb7JU9R1
 ujNFq/lnAy+CTlGYMHVNlAVSsKy82QYzi34snQcnK56NCDnjGPAULIJCl
 642QtzDqNLOW52YKInM5brbme/Xpy+ErmfXYxJA+EKSy4iM+tEqMZB7VF
 ktsu0obM50hpw4uO5eOPyJ0Wrkehi71qkP+Zjc8Io4jE8J/KV6+dMrDQj
 Q57jL3jkbdLGAy5DAUH9Tp5OdKEyV8B9z9DxBBLZJpyrR8bavPhG1wDiK
 QoPiPHrc9ZL5YQGUZx13NMe+TEbCntANOLXQUnttWkyhyv8tR4zPUuGf4 A==;
X-CSE-ConnectionGUID: 5xK8zlJLR4mQ0OSjpYvmow==
X-CSE-MsgGUID: 5LuOJ5bvQg+9L7pws+XcGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993733"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:57 -0800
X-CSE-ConnectionGUID: ETVqmZM8TfuGitoF0eSPfA==
X-CSE-MsgGUID: cvVtTxRdTjG7uUiD+DNqXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594820"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 13/14] drm/xe/hwmon: Fix mutex destroy
Date: Thu,  6 Feb 2025 15:23:31 -0800
Message-ID: <20250206232333.2660325-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

Since the mutex is used if userspace kept the fd open, it can't be
released together with the dev cleanup and needs to be delayed. Also,
there's no need to add an action just to release the mutex: use the
specific drmm_mutex_init() that should be smarter if mutex_destroy() is
actually a nop.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7f327e3342123..0fc91c184570d 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -869,13 +869,6 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 			xe_hwmon_energy_get(hwmon, channel, &energy);
 }
 
-static void xe_hwmon_mutex_destroy(void *arg)
-{
-	struct xe_hwmon *hwmon = arg;
-
-	mutex_destroy(&hwmon->hwmon_lock);
-}
-
 void xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -895,8 +888,7 @@ void xe_hwmon_register(struct xe_device *xe)
 
 	xe->hwmon = hwmon;
 
-	mutex_init(&hwmon->hwmon_lock);
-	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
+	if (drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock))
 		return;
 
 	/* There's only one instance of hwmon per device */
-- 
2.48.1

