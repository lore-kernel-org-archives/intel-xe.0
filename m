Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6ABD3188C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5E510E597;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/L7XZ2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B819610E57B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YgW+olF2ll33Fbg6KMSTo0N8ixwzGIJTKj78+WG/nk=;
 b=a/L7XZ2MxpN+azZp6gkvVGDRPTd3h/8vWgD38bIhDaBUTPH0pvtp85Fz
 WD6KoXZa3khErNyYcHjgDBe+GjGydiaXRglPWrXd10IagD6UKnH9SVWDl
 8I8vLp97YKRs+XSExo3YCs9WActL80iAvxoejG0rDi0CMmF+Rjj9DiNPj
 yZK3iCk+yEx53zzYEe50Ya1PVekZJHZBx0ze9r4eB+wBGXkJ3wHNltEWZ
 M+QJDK3Zl9avSFfWw9b6kAYy8rXW6gIBZS9NbIDmkNqC+Kt1BoGtc997V
 lQdARWdjdlO9DYxesoKCIHtixkvr+FYU2ere+pwOzBLXBgETUt4yVDeR/ Q==;
X-CSE-ConnectionGUID: 7NNVqI2nSI6Dj9W1FbrAjw==
X-CSE-MsgGUID: j/Z1cNUSQVywQ8sm0jzuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311167"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: pm60Ul1YQ9KPnv4lthj1sg==
X-CSE-MsgGUID: hZ3lgKZQR7K6VkTe/5Gcog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147442"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 62/79] drm/xe: Cleanup headers in xe_step.c
Date: Tue, 13 Jan 2026 15:04:07 -0800
Message-ID: <20260113230315.3081153-143-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_step.c only needs the device types header, not the full device
header.  Drop the unnecessary include.  However it does require
drm_print.h, which was being indirectly included via the device header
so also add an explicit include of drm_print.h.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 10e88f2c9615..2860986f82f7 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -5,10 +5,11 @@
 
 #include "xe_step.h"
 
+#include <drm/drm_print.h>
 #include <kunit/visibility.h>
 #include <linux/bitfield.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_platform_types.h"
 
 /*
-- 
2.52.0

