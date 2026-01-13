Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C50D31885
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F4D10E58D;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUUElvyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C910E57A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BrvOmashEfhfH/k122ONogw7YyXz4XxAHHI3czVaMXs=;
 b=jUUElvyJOGaJVhirnjHXg8I1Y3wzWuKG2zMprRFcs5fVo2zDxY6Ymeqe
 RcR2dWgjN7KAGAyH4bEQn2zJchy7bKYNO31q+XI8xO7F2b+jLDmR4IvXf
 wIX1mVC5bZEtXDjx3+KwpdYMZAp2uIeuy7F8bvSzwWy61cMiPtE4VBN4H
 JBZDpzzX1s2G6owpbag+Bwlp/270jRdYQ90Fza/BZA9fMEB/jIqla46XS
 H6vvYE+OuSxnYMPnIrFDE05EhUwVGp9iwKSmmqSk7VwY2MHEs8yd1yEba
 opGTaXS3+sSH4jknda/2SNngNc8UHDP4OOFuaHH/fnSGgq9CD4gcaVT0Z w==;
X-CSE-ConnectionGUID: hnDhkk5fSAKwjlBtUCP59A==
X-CSE-MsgGUID: oA5g2r2zQO2efneCv4dlkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311180"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311180"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: 8NtEnCpiRGGsQEsYaJ1rkQ==
X-CSE-MsgGUID: jKBdvsXOSy2e3vZOy5foAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147476"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 74/79] drm/xe: Drop unused headers in xe_vram.c
Date: Tue, 13 Jan 2026 15:04:19 -0800
Message-ID: <20260113230315.3081153-155-matthew.d.roper@intel.com>
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

xe_vram.c doesn't use anything from xe_bo.h or xe_module.h.  Drop the
unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index c64d98bf1723..77a06418892d 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,12 +13,10 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
-#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
-#include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_ttm_vram_mgr.h"
-- 
2.52.0

