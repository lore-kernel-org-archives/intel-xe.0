Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6306D2D114
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20CF10E582;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNUM1s/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD9F10E576
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tYdVGcHP2bMrWhzhEIRaE21hd3BcYf4E71x8ctKdWzk=;
 b=VNUM1s/iq+O7lM0ofC09tBbFdmSgcgsMXLim5CDAoHaKZ0aZUy8FFZTf
 CpIaV/krge6AUIxbFRaORbTaePuCNWFz38HdAYRqhd6rU0vigK14TlDNh
 fK2gFkCUqyB4F5AwZ9Rs5MDSAm7EYId7Eu0leHKmFfBk5uR1nX+6evp4P
 omcV4V8tVMgBIZ+ElXmTxm8sdGGwqBdNZweGf9f8zHiqQTJ7+N9J5piA8
 xdFD/UcIwqhuhn97depKBjvsvS8iMZoh7m3u0YvOxz+VvNYbVWJHELtGd
 R3nIzvuYED/sj4oTiPyk0B6hkC40Da+CULAQVYUoN5/GwFHRSbUDq3DJM A==;
X-CSE-ConnectionGUID: RD3bLRgBT1Gc4TYb2vpyiQ==
X-CSE-MsgGUID: 92X17CM+So2b7Cw7TXwu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311156"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311156"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: 54gomMyVRpOceehMUK04ZQ==
X-CSE-MsgGUID: VebAX34YSiOhA0XdNAQ48g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147415"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 50/79] drm/xe: Simplify include in xe_psmi.c
Date: Tue, 13 Jan 2026 15:03:55 -0800
Message-ID: <20260113230315.3081153-131-matthew.d.roper@intel.com>
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

xe_psmi.c only needs the device type header, not the full xe_device.c.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_psmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
index 6a54e38b81ba..899b01f72ba3 100644
--- a/drivers/gpu/drm/xe/xe_psmi.c
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -6,7 +6,7 @@
 #include <linux/debugfs.h>
 
 #include "xe_bo.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_configfs.h"
 #include "xe_psmi.h"
 
-- 
2.52.0

