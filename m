Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E75D31881
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D6010E58A;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dP2apmym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B77410E56E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeg10YFjNszkjfj0ijRGfIZK+6N2jABsIjLtyTvAa6U=;
 b=dP2apmym8uZg64bGuVEqOcM13n9fMZDEvHTDoX6ogqPTXZMIJmH4A48/
 eY9A39T7QKuOFmgfIC6EEZidn/aVbctl5kz+w5FRYc1sv6M4mm3aWQACh
 FgUGNR3KMkblm7v8M+aYhQcdMrarAK6ebEjaOkcybo5lS0xkORN2PRVfc
 Dqcssl5QiCexrS/FkE+NZwq28a+Sn78fW7LrTxo8xcreoMrWvYRA0byKb
 LGba2FCLvdeMt3d/3W6c1pBXe4Q90ycZr5MiAvXdVFHP4kgwlYEBwQO3i
 sSNfH0k+KwIMjzdJogDTzjWgjOtzv5ZgpJyhnt1WzH2Rxf/wwNoC7tdpf w==;
X-CSE-ConnectionGUID: Ag9gd5vXT0C9NixOPYiVCw==
X-CSE-MsgGUID: ALJ2upwjTCWnOYKm8l+SoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311152"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: 0DRj7e2WTZ27tC71Wwg8SA==
X-CSE-MsgGUID: syhjX6Q2QPqF1h0TmqhOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147407"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 47/79] drm/xe: Drop unused header in xe_nvm.c
Date: Tue, 13 Jan 2026 15:03:52 -0800
Message-ID: <20260113230315.3081153-128-matthew.d.roper@intel.com>
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

xe_nvm.c doesn't use anything from xe_device.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 01510061d4d4..437375046517 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -6,7 +6,6 @@
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/pci.h>
 
-#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_mmio.h"
 #include "xe_nvm.h"
-- 
2.52.0

