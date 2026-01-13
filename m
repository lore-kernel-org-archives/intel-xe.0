Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F878D30CF5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C0810E57A;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ejjq7VK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE62110E571
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5yptB256Nx4eLPP2GM8HGPZcPr+3pyGu1dAZBZpY0q8=;
 b=Ejjq7VK80GHg91zea0PjNe2FFAcgMrTsUFq47eVGjQ7PV9XxqShDiBEi
 fa+5Z2ZJ7x41lSmoja2B98a5CCJSNE79orjYoB9j7r/q43bnwfCbfksrC
 JfoK2mfUgNbt5DcC5I6DVw3jmggL7NWSlGmPhbCrkR5bjzeR4bIz6J4kz
 ZPpOp34+ZsQ8uqZcb05wEcyhwT/kx0mm6ItAPgjO4korOhNV3vxhGBzbO
 sluor1R53kNPl+QcfIGBYJRiex1ErYzOoihWZQ1yl9qdjSsmN4zkgAgWg
 Eym+CYyCtWhsjfsc+P4G9JK+lh4rCECpA1SW5fxulCoWYZTWakmTwpowt g==;
X-CSE-ConnectionGUID: 7dso0tIxTt6V5WpOsBnBaA==
X-CSE-MsgGUID: g+SmHAefR4uKli5c8Ogaqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311168"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: wi7NgCZ6TSyPrdwWtOzU8g==
X-CSE-MsgGUID: 1ZAcmFfeSwuhfT4iRdBjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147441"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 61/79] drm/xe: Drop unused header in xe_sriov_vf.c
Date: Tue, 13 Jan 2026 15:04:06 -0800
Message-ID: <20260113230315.3081153-142-matthew.d.roper@intel.com>
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

xe_sriov_vf.c doesn't need anything from xe_gt.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 1b75405b8d02..29894bd081c0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -6,7 +6,6 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
-#include "xe_gt.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_sriov_printk.h"
-- 
2.52.0

