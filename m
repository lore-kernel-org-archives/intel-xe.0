Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B131FD318A9
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0FC10E568;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2lnYEKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C2C10E56F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f+Bz8pKMWsrnSJEjPfS87bsLzuw25tC669DbO40Nj+o=;
 b=f2lnYEKkfofEkKs1OyOfr4j5gRmMIYahbuF1u/dYfaKLR802aoqYuAs5
 eP4nzQm2C3MO3plub53NMsI4O3Zhl/zPLKQY/Q9dnZLV3nr3UWLcmrYDN
 7vku1qi/ySPGVHuwxjQMgjae7bmYLYxuCcphLg+TyQeHik/TmXrBhakiG
 2MhUCrkUfpnwkpOs7/5DYMR0N+c+rIuqW9YVGKNzkJnIvNudxTjH5ergW
 ra1BXpstEq6qj4Ji/A+g2DcXWU59/6kWbkgEb+quqC8y2ulBVzZg6Dq3d
 FPlLcofTn8a2+03A0pbGB1szVe6sUXR6liwojKNN/cWF8QsTWY/nMaU3T g==;
X-CSE-ConnectionGUID: JxQaTaBuTAOSMJnzBs3bsQ==
X-CSE-MsgGUID: 8ZrKnF3dRNushl/WjCbDNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311162"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: dR5rhg31SOi/pIN65l2drg==
X-CSE-MsgGUID: VhV354AOSRmfAWynBfOVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147429"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 57/79] drm/xe: Simplify header in xe_sa.c
Date: Tue, 13 Jan 2026 15:04:02 -0800
Message-ID: <20260113230315.3081153-138-matthew.d.roper@intel.com>
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

xe_sa.c only needs the device type header rather than the full device
header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index a87c1436c7c1..b738102575d4 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -10,7 +10,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_map.h"
 
 static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
-- 
2.52.0

