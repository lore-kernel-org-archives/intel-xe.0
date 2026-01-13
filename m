Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366C7D318A1
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D9310E5B7;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3Ccy9XU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92AD10E56B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ev5OJKIONj0Zbz+1WFfvXPVOKySBFrf4eJCpq6la/Lo=;
 b=f3Ccy9XUWuAVlpaXrzGBimnnBEn5vUufFGv+KPYuhtz3iQf3oRJgY2zO
 DLaq9WLQae3K3fskK5Bz6x+JprZp0KJWUsPosTubVPwQQdKKgARlKsfZ8
 JWbD7oN4anml6Ks7FnoX/NAtpydfDU6gIFxkMCYMk5kW5HsMNhTEidNpu
 c0G2uGV2H3ORLmo22qgn3p1gbOAEFHjjhnKo1Bbnboe7eI9UqhspP5S89
 h2QBFFM0oZnv8u5sMBXlZm3QyAA/ZY0RvPCS1/PbKJuNDZ2CAs/kJPuAo
 BBJaCMGOKTGOIWcvsgCtRImU9uUipoJYJNgY855wL3gnzFH+j8tj5Kut+ w==;
X-CSE-ConnectionGUID: EL8WTmcLTfmEvOKnNbSUVg==
X-CSE-MsgGUID: P25uRXnWTtCOJR/WK/qp0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311141"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311141"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: 9IX+xk/HSC6t7WIMG+s5Ng==
X-CSE-MsgGUID: S7scKKm5T+CBAXyTR9pVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147382"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 35/79] drm/xe: Drop unused header in xe_huc.c
Date: Tue, 13 Jan 2026 15:03:40 -0800
Message-ID: <20260113230315.3081153-116-matthew.d.roper@intel.com>
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

xe_huc.c doesn't use anything from xe_assert.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 4212162913af..57afe21444b1 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -12,7 +12,6 @@
 #include "abi/gsc_pxp_commands_abi.h"
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_guc_regs.h"
-#include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
-- 
2.52.0

