Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2610C369D8
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 14:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017D910E834;
	Thu, 24 Apr 2025 14:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCUrlXd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C2A10E46A;
 Thu, 24 Apr 2025 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505494; x=1777041494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=218sswu6X27ElGYR207lhv7Nlgh4EZjVhtDNJVoGlMg=;
 b=lCUrlXd646iQzXseT5niq3DFF+9YMfDjX6RK2/+yAas94qsxTDyYYJHR
 9tYc/Ob5UQh6fr/tGyw1YK0m6t5L3V7TaiS2tfPJoCaw+TjC51SEsPU8R
 kI4yzWDYOGzsOfGqE5yONnOwXyEijPpxt2c8tQfzaxEjLTOs1VxBBuUYL
 /E+ymcfJnL/2BIeyC5ZhGr/SOb7lLPCNeoo2Z0Ou0XuKnSsILxvNDdsPZ
 f70HtDqJYnCGoG2HSVBrr/VFH/TXBdRHmCt5Fe+JinXUyqZsiHJnsjXAB
 MW1IKCZWeuQp+c+LhQ60UVyIbuES83jWi2M+erwGiSEB8yGmhkwP6r2fu g==;
X-CSE-ConnectionGUID: DWnSp0QdQvioriRlVhpR6w==
X-CSE-MsgGUID: 4OK1z3O0SByjNJo7iaCf5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50952214"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50952214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:38:13 -0700
X-CSE-ConnectionGUID: kC6oLC2qSzSwbSe05GJujA==
X-CSE-MsgGUID: vlSDVXJJQSqYmu79t8t4WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132615111"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4046PTLH.fm.intel.com) ([10.105.8.85])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:38:12 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com, matthew.auld@intel.com
Subject: [PATCH v22 1/5] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Thu, 24 Apr 2025 14:38:06 +0000
Message-ID: <20250424143812.11210-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424143812.11210-1-jonathan.cavitt@intel.com>
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
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
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 10622ca471a2..d4e3b7eb165a 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -237,6 +237,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
+	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
+		err = -EPERM;
+		goto unlock_vm;
+	}
+
 	atomic = access_is_atomic(pf->access_type);
 
 	if (xe_vma_is_cpu_addr_mirror(vma))
-- 
2.43.0

