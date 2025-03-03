Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657A5C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 22:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7B410E24B;
	Mon,  3 Mar 2025 22:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jz7uKUH0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDBD10E235;
 Mon,  3 Mar 2025 22:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741039223; x=1772575223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25X1bI0jpmDxxZZD77ZruB8Cpd2GmsaAXiu+gF/RLsQ=;
 b=Jz7uKUH0DVpr588+gVgc3Pjf/Mpc0GQRyS/qQsnwYb992MyOQKD+ggKL
 8UqtH6Sq0eHEGh3XvA5TyfpuWutaEwM+CTqPHNByo1sEp0W7FaEYECr1Y
 oQ3aybinpkf7vizkoACt/GOTwIPKCZ+/0rQ17CcroaGZQzVQymuPYXAI6
 wGgS22NpGKg24qCGytMGvKvAlrtTDhHyXNhXpNl3/T6CwJJf6FoQccn5W
 RVP0SVk5OOMke3fwcVWZP/HTbrexwiPE0SVJ6uuQSI0ONTu5TXGaqWl5X
 0pu326dG7GGOTMMfPuKy98BTkBd6Fk2TWBFKpjTWy4jxn9NwnhnhxCWVd w==;
X-CSE-ConnectionGUID: gZM1iqnVQmumShtHzuH3tQ==
X-CSE-MsgGUID: izL2Ne03TOmX9xWECsK5Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41846104"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41846104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:23 -0800
X-CSE-ConnectionGUID: z8Wb3DkpRr2wEDTypAUbGw==
X-CSE-MsgGUID: dmOCa+67TFS7CvjoFCNYtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118020887"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:22 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/6] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Mon,  3 Mar 2025 22:00:17 +0000
Message-ID: <20250303220022.67200-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303220022.67200-1-jonathan.cavitt@intel.com>
References: <20250303220022.67200-1-jonathan.cavitt@intel.com>
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

The page fault handler should reject write/atomic access to read only
VMAs.  Add code to handle this in handle_pagefault after the VMA lookup.

Fixes: 3d420e9fa848 ("drm/xe: Rework GPU page fault handling")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 17d69039b866..f608a765fa7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -235,6 +235,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
+	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
+		err = -EPERM;
+		goto unlock_vm;
+	}
+
 	err = handle_vma_pagefault(gt, pf, vma);
 
 unlock_vm:
-- 
2.43.0

