Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3502D3189F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE4910E5AE;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsE1mYej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7185A10E571
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T2qAREfpdvTn7ugFaGSzCqpA2V45rma4OzrGfKfUWas=;
 b=jsE1mYejnyZD7wcYbGuBMbswpaJR/TURoM9E9tVPQ/YgAfJMUIOg2zLo
 ZRopr+ftlkPyiLZRWXbOjlxtLYdz0FZDuYCjoqMXTMFeGUnhPBBhCBSwB
 otx34nVcrnWDnOftfQqvx4zvDNmDGGkBakOwL6sgifZK0ElrnuGxdMml3
 P+tmecmiZx1CgCES0um+jaCW7rd8KwPHTyGcPAojrBPh421eR0BZbBNt9
 HfCzoE7wVHJjZSFlfC9I81CSmRUuWM9GE+X8sxoIjPSJ39/NThILUYYCJ
 koHT/rk5/jMcAEZZbVHPeyyEJZ4/OW1FgQqWcHXfRR4aUJo0FcEv70kdf Q==;
X-CSE-ConnectionGUID: Dxh3Kou0SbC1cZut1HZOVQ==
X-CSE-MsgGUID: hiS7kyd4ROWv5Pw+xfrXXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311157"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311157"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: NYXseeg0Q4yGHtnr8enjVg==
X-CSE-MsgGUID: JpewtfFHTNiooAtX3iwcVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147416"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 51/79] drm/xe: Drop unused header in xe_pxp.c
Date: Tue, 13 Jan 2026 15:03:56 -0800
Message-ID: <20260113230315.3081153-132-matthew.d.roper@intel.com>
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

xe_pxp.c doesn't use anything from xe_gt.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 508f4c128a48..d61446bf9c19 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -15,7 +15,6 @@
 #include "xe_force_wake.h"
 #include "xe_guc_submit.h"
 #include "xe_gsc_proxy.h"
-#include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_huc.h"
 #include "xe_mmio.h"
-- 
2.52.0

