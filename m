Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909A4D31882
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F35310E589;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/tnlfMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F8C10E577
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T1DK2Wpzarksd0IqBX9jtQd8tfIT0DCQ2gRAtVO/+jw=;
 b=I/tnlfMzfddr47xxRb//oVs3cj5zuPN316pWGjYQhYXxKfHm236C9Fc8
 uzCjH8zv3sE707OmbY0DI+TTSNt32LKbp263Iaj/c/DWC+HwvrkEMaFG5
 GZnKtZSyuUWu9Bo8kP+onHyzNT0gFzS6Nn2Rx8KVQiyWsb2rD19Cr7E2w
 M9dCllQcdJGOId9H6PnlOdaTk75kCpWOTyWfl2mh1w7SC7LXn5eI5/h/G
 oHVKOUMYMZf1qdNL6cvMWqHGrpK1Fm5JM+m+T5YOskf3QP2l1EARuMFDQ
 o4MCNq/2CAl8eo8yY3KrnwBBIhfUe1op50pKd09DPdnEZnHgu2N/LPGy9 w==;
X-CSE-ConnectionGUID: EgCKUWDyQ0+evnQw76E38g==
X-CSE-MsgGUID: ZubApuARRWiPnvZhk8Q1mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311158"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: y8kjH1GNSfSNe1VJCtEGzA==
X-CSE-MsgGUID: VA7jBRxIRKuKadMzZ4aePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147420"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 52/79] drm/xe: Simplify header in xe_pxp_debugfs.c
Date: Tue, 13 Jan 2026 15:03:57 -0800
Message-ID: <20260113230315.3081153-133-matthew.d.roper@intel.com>
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

xe_pxp_debugfs.c only needs the device type header rather than the full
device header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
index 525a2f6bb076..d6e2e41bc88c 100644
--- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
@@ -11,7 +11,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_pxp.h"
 #include "xe_pxp_types.h"
 #include "regs/xe_irq_regs.h"
-- 
2.52.0

