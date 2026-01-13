Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51820D30CFE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8318910E57F;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nq11myGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CA210E568
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345420; x=1799881420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=safRL2h+iEBfW3gg1tVMT1tf61j/u/wMelrSM02GJDQ=;
 b=Nq11myGrZMpMxaMLheEfk090LdZoyPtTds55R+IPa3lP0/GkD4wh1Upm
 7Q8Rh4AFZ8YdDCyWuGm90bxfjxaOFDL5h9dITXBgku9C8xs+QsbT/bxdv
 akXOqNVLiIT675ebj6f0u7qeG1z6XALVe/ntb7BxsqoCvVgNX/sAuTvZR
 66B6uOp/QkhaKnE7HBjQllSuTur/IZkG9DeKfqw8il4f3o3K5qHeQcOih
 xQxd+WC4a2yOOPGTfUfpmetFCpx3WAtf9vILb+pHLNlorTxS3b6np3Olm
 2CZOtaA/Fnae4Nvp0vTGGU+JoKtREX8G8tGuB43eIoDIWfCe1fVInwpb0 A==;
X-CSE-ConnectionGUID: AV3l8vbwTA6LiOXkeKSE5w==
X-CSE-MsgGUID: vem5qv1HT6+gele8ZA/KdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311112"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311112"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: fvmyne28TiO3syaoEC/b0g==
X-CSE-MsgGUID: mMqmErF6T1q2p2lDc5UtLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147268"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 06/79] drm/xe: Cleanup headers in xe_execlist.c
Date: Tue, 13 Jan 2026 15:03:11 -0800
Message-ID: <20260113230315.3081153-87-matthew.d.roper@intel.com>
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

xe_execlist.c only needs the GT type header, not the full GT header.
Also, nothing from xe_hw_fence.h is used.  Dropreplace the unnecessary
includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 46c17a18a3f4..8bf330aeaec0 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -15,8 +15,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
-#include "xe_gt.h"
-#include "xe_hw_fence.h"
+#include "xe_gt_types.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
-- 
2.52.0

