Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D86C04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB17F112BFD;
	Mon, 29 Apr 2024 12:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVRcKRwY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C514112BFD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392956; x=1745928956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5VWLQwrjKnlOYTUDx28r61YOJm0tmY4RpXLQl3H4NE=;
 b=AVRcKRwYYj9f4x0POuheZZnKWyrnC5F3w/lqvVQwrd3wHNSm0HoYA3CH
 lWYOV+4+fN8YVDKHgKy10+uRsyacYSsh1eHO/9bZYhsvh0TxtvsqcpG9e
 oM9+Po3OfaFM+YcWzRwNe9rrFhGhOm1fQCdO60Sl+PR+YYXn/70+7bZVI
 q8w4rNzE5dcDhR5D4Z4ZzGDwJzce1Pu8ya0B3+Xei1DukiWMme4ZeW5Yr
 36pZaN5RVyJ/Sj32lj0ToQMWjWfamsjj4VW5dlBNCvK8ccsFj7JBu/+sv
 Xjkka8hQu426m8KdeXzqWZ6UNXr/l5ILwG+c/8gc6EQIWmsIiF3O8Iko1 g==;
X-CSE-ConnectionGUID: 4L7uK35KRMSC85I00JGadw==
X-CSE-MsgGUID: vFMtnTn/Q2u7TVwyrwrtsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9878413"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9878413"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:56 -0700
X-CSE-ConnectionGUID: I4erQh7PT9WlAnKapZmq1g==
X-CSE-MsgGUID: 7Q+G2QbhScK8frFrTCuIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49303421"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 8/8] drm/xe/device: move xe_device_sanitize over to devm
Date: Mon, 29 Apr 2024 13:14:44 +0100
Message-ID: <20240429121436.33013-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ba917e383f8f..8c3415d7635a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -395,7 +395,7 @@ static void xe_driver_flr_fini(void *arg)
 		xe_driver_flr(xe);
 }
 
-static void xe_device_sanitize(struct drm_device *drm, void *arg)
+static void xe_device_sanitize(void *arg)
 {
 	struct xe_device *xe = arg;
 	struct xe_gt *gt;
@@ -661,7 +661,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
-	return drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
 	xe_display_driver_remove(xe);
-- 
2.44.0

