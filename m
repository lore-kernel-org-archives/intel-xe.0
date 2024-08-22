Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B2FC5320E
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 08:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D0610E5E7;
	Thu, 22 Aug 2024 08:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0AHNXTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6461910E814
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724316107; x=1755852107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L4ovHQ0Y61H2lN4ZjciaFRqcmxO9dAV8Qrp7svWa7yc=;
 b=n0AHNXTCzSRSfv4cBwzAdhYwS+uKOcwWhbDJNL5GHAg/23u+ZQq/ISM3
 sltbb4umLMfyK2IBeKUxmqLseSa6lVLQeCPst4J8tCIOdKn2fE6cTTG2O
 C3otXYxKmLThtLK8l/kqpTA2HRFqtvvp7ytr+w9jB5Ov3irfiXx9A4O9y
 H/d//deExZETQM2rZNy4DuIWWGv1W9rSI0uwkWfWKWwcT+FqysuvXu45/
 Of22PUmOI5k1joN2cDrJwr2xFXtT0ZsvUy9wKsNdw8nlWXaHKIDkgn6so
 3+NTUUBm1SHh67xBwvU1HSgfSk2LBAYVVkZYNhdM7l1uphInL2aKkWpi3 g==;
X-CSE-ConnectionGUID: R5LjA5AHSLuvguUPaC6CFA==
X-CSE-MsgGUID: HSO4g2hxQ76a87W3sCwr0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33869178"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="33869178"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:41:47 -0700
X-CSE-ConnectionGUID: Ho6GPQEzRXWur2z/HGS5Pw==
X-CSE-MsgGUID: w4lL10SJRZaIOk79Wjq5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61369627"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:41:44 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Fix memory leak on xe_alloc_pf_queue failure
Date: Thu, 22 Aug 2024 10:13:25 +0200
Message-ID: <20240822081325.1549-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Free up previously allocated pf_queue[i].data on error.

Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 0be4687bfc20..c19944eed5bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -437,9 +437,13 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 
 	for (i = 0; i < NUM_PF_QUEUE; ++i) {
 		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
-		if (ret)
+		if (ret) {
+			while (i-- > 0)
+				kfree(gt->usm.pf_queue[i].data);
 			return ret;
+		}
 	}
+
 	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
 		gt->usm.acc_queue[i].gt = gt;
 		spin_lock_init(&gt->usm.acc_queue[i].lock);
-- 
2.42.0

