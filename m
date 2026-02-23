Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867C0EC1112
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 17:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254BC10E416;
	Mon, 23 Feb 2026 17:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdKZxb0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFFD10E41C;
 Mon, 23 Feb 2026 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771867283; x=1803403283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uZ07heVApOLl/yI9uyK4cy2X1pAKnsq0+/YkCxI6E0g=;
 b=RdKZxb0ADzI3/q0X8h0qwcnPqROoCBi2EKBGOggXtUj6aVx7sSpF8uEE
 +xNqKyNeT6vJGGYYhofv2yKgPw+rqpOUoef4DKwpTpWtdeeIkAFYdUPru
 d0Bee1HpRpJtAo5NBsnx45c5TGJ5JepXDjEnRw8TNEsX9ghgTefyH/+b6
 cZQDn9NdPTAOHkbWHMIRjM3mHi1U4xPTtVr7vbEVilnEVTw7C5pfG3gpT
 L08wkiOM71tRPAWJjzjubBvSZ+JLEhJ7X57Ax1VWo1ECSRZAv3Gv0ndCP
 dcPjj62xxg4pPeYLYR2kOGTnsDdoHjVX1kh2mn0XUWiJdPldWdcSLMFZh w==;
X-CSE-ConnectionGUID: wOiyaNOxS42w8Krlo4AqBA==
X-CSE-MsgGUID: chImacevSaCgWIl834l+tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83189013"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83189013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:21:22 -0800
X-CSE-ConnectionGUID: o2Xgvnv+Tu6H8QBKkZJaUw==
X-CSE-MsgGUID: JgGrZxG7TOq34c1USOPs4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220622797"
Received: from dut4086lnl.fm.intel.com ([10.105.10.85])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:21:21 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v35 1/4] drm/xe/xe_pagefault: Disallow writes to read-only VMAs
Date: Mon, 23 Feb 2026 17:21:21 +0000
Message-ID: <20260223172120.98961-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223172120.98961-6-jonathan.cavitt@intel.com>
References: <20260223172120.98961-6-jonathan.cavitt@intel.com>
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
VMAs.  Add code to handle this in xe_pagefault_service after the VMA
lookup.

v2:
- Apply max line length (Matthew)

Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 72f589fd2b64..0281b5b6d4ab 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -187,6 +187,12 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 		goto unlock_vm;
 	}
 
+	if (xe_vma_read_only(vma) &&
+	    pf->consumer.access_type != XE_PAGEFAULT_ACCESS_TYPE_READ) {
+		err = -EPERM;
+		goto unlock_vm;
+	}
+
 	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
 
 	if (xe_vma_is_cpu_addr_mirror(vma))
-- 
2.43.0

