Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879C8D31880
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066E510E588;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gj5DP1ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213E910E57F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upS7Ax5LTuL25gxnyzPfs0b9K1gi2x4PNHy69o1XdfI=;
 b=gj5DP1ier/Yu194gjK3wkSI2NLT/jwEwmWfFHTc7DOanZZK4oGclxIjG
 KKzSCB4V9cP7ajIEZVg+kpInHGVZz71Gx+g0BD1FPoZ5HGRXXr54Q8B6V
 EECAu4sTnljLEp3IhRERpn5xxq14lSOVKT9fkTCZ8xTuDZxeoAdtk9TJP
 rj9Q750oYvru/xGsndJ9ixr0/f69L9axpWebrML6xmDuOZuMX6k0kx1IP
 3rUylbc4ufQU9bDMZfRvY1N/cip2/Q6FUlsgS9vcbpB9rY4oSl1xkhqzg
 kPe4oQU52GBISokGcRLfKXXbkQgjjyGA8TlK/zyFpgPGki+jDVvVQsCMw Q==;
X-CSE-ConnectionGUID: saISqHDnR/OZZHOyLdlNMQ==
X-CSE-MsgGUID: 3EbXCk/PQOuGoejtnlEJJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311179"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311179"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: hruPNkc7THCR8VtVMJfUNw==
X-CSE-MsgGUID: nwWBALVfQVqjRInhPEMB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147473"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 73/79] drm/xe: Drop unused header in xe_vm.c
Date: Tue, 13 Jan 2026 15:04:18 -0800
Message-ID: <20260113230315.3081153-154-matthew.d.roper@intel.com>
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

xe_vm.c doesn't use anything from xe_res_cursor.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 694f592a0f01..4a316bd49135 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -33,7 +33,6 @@
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
 #include "xe_pxp.h"
-#include "xe_res_cursor.h"
 #include "xe_sriov_vf.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
-- 
2.52.0

