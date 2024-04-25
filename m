Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB21EC10F1A
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 14:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5917D11A4CE;
	Thu, 25 Apr 2024 14:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAwGcfx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DCA11A4D2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055996; x=1745591996;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QxmrXhH+o1ZO0fK0RrCMv1a8VeqWymUunrDoREkyJMc=;
 b=NAwGcfx2NZnS5uUbjONjkIHlY8ffB2V5PTiPK/eXY6835324LWbahIVt
 GOti21ybcT2RPihj5UqrCXTAik+OFleW+WlDZPUfZKEfSMCvkK09r46pU
 M4zGWfkHERsOnev0/fcZ71Y11/6UAj0Cn9Vd+T8/9WWfQT5TaU8mL+BUu
 ClrUvegRUgiyTRzIA+VDXt6cLvWSmmZKfNQ2UqKHJVY0042XHGIjWyLEJ
 1vH7InNV0F0j92MTN+FWR0We3VYTC5Q4aiTVJ5bvDgJGYGwZbqdrzXVtI
 hVdhrGKE459mO6CXes8bzMAXjmwYChddaQleYOEzfvPlIocFDDia3yu2q Q==;
X-CSE-ConnectionGUID: MjuLXoDXSey5Jyph/a6wQA==
X-CSE-MsgGUID: lp6iV4r9SJ6nZvAIfWnBtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9596157"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9596157"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:55 -0700
X-CSE-ConnectionGUID: nb7pQ8szQWKTqN2oZP/dFA==
X-CSE-MsgGUID: tI7k5z7rRe6Esd4B8LNZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25511782"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.254.134])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/pf: Initialize and update PF services on driver
 init
Date: Thu, 25 Apr 2024 16:39:27 +0200
Message-Id: <20240425143927.2265-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240425143927.2265-1-michal.wajdeczko@intel.com>
References: <20240425143927.2265-1-michal.wajdeczko@intel.com>
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

The xe_gt_sriov_pf_init_early() and xe_gt_sriov_pf_init_hw() are
ideal places to call per-GT PF service init and update functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 687ea81931d1..7decf71c2b7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -9,6 +9,7 @@
 
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_service.h"
 #include "xe_mmio.h"
 
 /*
@@ -51,6 +52,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_gt_sriov_pf_service_init(gt);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -74,4 +79,6 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 {
 	if (pf_needs_enable_ggtt_guest_update(gt_to_xe(gt)))
 		pf_enable_ggtt_guest_update(gt);
+
+	xe_gt_sriov_pf_service_update(gt);
 }
-- 
2.43.0

