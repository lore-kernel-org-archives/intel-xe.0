Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68482C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1557F10EE6E;
	Wed, 22 May 2024 10:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mhuli3BV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221910EBFE
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373333; x=1747909333;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=njI7Pyzb61a5/R/alq+HXn1YrF4MjNk3UwtCoGRmcIQ=;
 b=Mhuli3BVaP5JQZ81WFeWsMfueNZp9dFm/7I5uqcz98SNvWmpONeuBb6C
 PGPm47+HJJqQWhkeX7eAeaXdnr6HqUJc98iRSU3bqgK3Aj9kGGzDEp6bK
 ZIY/HHIFILYJ0tYKNm6KS6o4+b6KhQch3CeWSh25/YkBF8Wqqm3vPwNhy
 JJNtZqUmQXBw+KovO+bO9C3PHI4ZpOMJqDz1evz8Pg4ky93lPZ7LmDdud
 uBj6ZlEdEdaJhU4hrXU408EkBG/J9i2u8FGSdTtvw9D7ilAPrfg4aLlqY
 cetvgft68uUfdQWbXHeyZhHHHydX7402pz9MQU8IDSemZc48h4RFjezEp Q==;
X-CSE-ConnectionGUID: 4dAaxhcnQ5q8Qlrs50dgYw==
X-CSE-MsgGUID: cMyaevLqSyOdg9A1HSKCqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562692"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:13 -0700
X-CSE-ConnectionGUID: dZtqhFX3TYmJX/Ecx09QKA==
X-CSE-MsgGUID: 8JYa0mqjSaGK02rH13SSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195299"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 10/18] drm/xe/device: move xe_device_sanitize over to devm
Date: Wed, 22 May 2024 11:21:53 +0100
Message-ID: <20240522102143.128069-28-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

