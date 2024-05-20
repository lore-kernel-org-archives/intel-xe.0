Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1B7C25B7B
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E510810E567;
	Mon, 20 May 2024 15:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaPgYjf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E53B10E567
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219947; x=1747755947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=njI7Pyzb61a5/R/alq+HXn1YrF4MjNk3UwtCoGRmcIQ=;
 b=BaPgYjf+etXGU3KB/B7vpw9N6gwyLPEc80KoZIBTZrtPqiFK95ApGSzO
 fDq2gNMtjvtTiVvJgjL1bVcxfwydKssOGDExQ5BFqywG237dfyvYyu5cB
 MLTXp1RwUhkflyMEWNuzTOLzbVzEcJcujmImJEIuRTolgF4OFcuUwtKDr
 jC51FS4Bylyeh4I9+T/PQoomfdsgXPuxnVSfxPdk+yKdOMg3bMThsYmq5
 O0ynOLfuLmY+PizAyxIDqjkHOgwgcajfcQU8HDo3fLUT2xj0JBHphPZO+
 Vvp55/+OGJq6o+CBQ3Udjm87z+hARgMzkxRYw+weKQcv5XSF7IurwD+PS Q==;
X-CSE-ConnectionGUID: /jYoQqZWRGifGDxjmYOA0w==
X-CSE-MsgGUID: EZBa3KgBRM2nBvV0kP9f7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873192"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:46 -0700
X-CSE-ConnectionGUID: ySIofeMwTJyMSKyX+blRPA==
X-CSE-MsgGUID: KsrAZ19gT62cTUDUCniG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610488"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [CI v2 10/18] drm/xe/device: move xe_device_sanitize over to devm
Date: Mon, 20 May 2024 16:42:59 +0100
Message-ID: <20240520154249.52888-28-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

Disable GuC submission when removing the device.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 861b4f73207e..fd203a446709 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -388,7 +388,7 @@ static void xe_driver_flr_fini(void *arg)
 		xe_driver_flr(xe);
 }
 
-static void xe_device_sanitize(struct drm_device *drm, void *arg)
+static void xe_device_sanitize(void *arg)
 {
 	struct xe_device *xe = arg;
 	struct xe_gt *gt;
@@ -648,7 +648,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
-	return drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
 	xe_display_driver_remove(xe);
-- 
2.45.1

