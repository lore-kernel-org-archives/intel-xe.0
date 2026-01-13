Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA9BD3188E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C469110E599;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esNXsSn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EEE10E577
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjSzCZCwivG5pgJ5duL4bF5wzyusmWbn92yAZuBDiVY=;
 b=esNXsSn/cW1HP69zqgo+5cKoI4OuN2eZ9cyxVDdmpZCkgP4vEELcg/vp
 9sHX/j+pKx5L3II9W4ng3M5A8FED7jh7EVr0gW5f4E82ynGM29Xds0i2B
 2xKkFhFEUmD1QQIXF1zSVImRdqssyuTtv7Af6W+haIedpoCDuYMNvtCTb
 YcPfjz6cYAveCiM0BFawWwkSVQ2K3E3zFcSHA/NbcXHDFgozbNihIpEel
 pgIuIsQx/xwFAIDVd+rRHlKnu99hSwsj+T26gzThXkvUgjKDCu6/7Rf71
 N9VkGZTIzotHL7i6AubEtrW4DMj7avNCgl7PdELOWE3Lio+tgukggIKve g==;
X-CSE-ConnectionGUID: 5m/WOGuqTrKEA9kzxetu+w==
X-CSE-MsgGUID: S7VMEpvcTBS5mptx4x+47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311173"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311173"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: yz2TAdWZTlOiwFSXqSWpuQ==
X-CSE-MsgGUID: jiI6z8zFSW+NskzQzaZpCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147455"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 67/79] drm/xe: Drop unused header in xe_ttm_sys_mgr.c
Date: Tue, 13 Jan 2026 15:04:12 -0800
Message-ID: <20260113230315.3081153-148-matthew.d.roper@intel.com>
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

xe_ttm_sys_mgr.c doesn't need anything from xe_gt.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e404eb8d098..99fb7e99eb7f 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -13,7 +13,6 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include "xe_bo.h"
-#include "xe_gt.h"
 
 struct xe_ttm_sys_node {
 	struct ttm_buffer_object *tbo;
-- 
2.52.0

