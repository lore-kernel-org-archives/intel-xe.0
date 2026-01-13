Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D68D318A6
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725F910E5BE;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ixzl5GB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D889710E569
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnpDswT8+XUWljM6WWiiAyWEnNREtG/Q9OOAJX1AAQ8=;
 b=Ixzl5GB16JIGPIIH6pmhqvHJ+oMPuLRmDzZwZ81Lgk0lJW1oaoO7f1Vw
 jL8lDHZjriyBUqKFz1x354/gxh8U8GFa6pf9YVTuKaVMkYTyQ9DmayFoJ
 yihBV3tsswyYHHXOL5kzerLm1QydyavwSu/9Ap+vUo9eYNhwqjl54KOKd
 chAOuDYoicZwej0LveEjJe7NVGyc7hdtbxP7e83At62AKFgV7ueEixGW4
 YdPSyZ4Jqi/gOV8cC9R+Nl8R9w3fuPKxznwln4K2mrmpbdLlVjZ4ISmAo
 0vOXbSnSXGdd/O6EPU0djYrCglMWEjV5FvatZgKlUO2RvMZC0SMlWWPzc A==;
X-CSE-ConnectionGUID: s3BrgrAeSPekgOUqXE2Mzw==
X-CSE-MsgGUID: wlAu3sBBRPix25c/u2MBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311143"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311143"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: KdhPNxeoTBSxseq70sSDeQ==
X-CSE-MsgGUID: FoqsX/bzTe6gLRbLCcIdXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147388"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 38/79] drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
Date: Tue, 13 Jan 2026 15:03:43 -0800
Message-ID: <20260113230315.3081153-119-matthew.d.roper@intel.com>
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

xe_hw_engine_class_sysfs.c only needs the device type header, not
xe_device.h.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index cb45cdceef67..3c65becb39ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -7,7 +7,7 @@
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_pm.h"
-- 
2.52.0

