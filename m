Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25440CD129A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600EC112F27;
	Tue,  9 Apr 2024 20:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr36mcgl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BCE10FF70
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693098; x=1744229098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mLW4MTIHQOwQtbcHXjnsgwLAI4CJFm9fX5Ojz8LvpJo=;
 b=Qr36mcglrqq3eRZQbM30pBuHwJ2dzQ1V6OLhyhHCad2AxHzomamcPnjp
 BZsURCbHzLyJJWy4P9JGjUTmW86Rxd/XCoSb3mnIG1ObpY+RakNR9uw9k
 IKCHgFSwAI6ZQjAQBtWV1OATtvBRvQYC4FL5REuHnaWXoapi4NHxGV3/3
 /9L2OTkTPeWmnF8IloU8EgFAltZCxwMjMDQMvCni1CxZ45+2g1N2Groud
 8TWDBgsR/BfaIZLtxzpXh20VKfaL+spsFHKDo0r6B96+Jnc6oNWangkPe
 58heCXBS15ga9M2JJmNBOgyesWJCwFfCqgvo1Ny2wK85di6wXP7NTHJ60 g==;
X-CSE-ConnectionGUID: b4sk2eFzR++BBSLkIEZE5Q==
X-CSE-MsgGUID: YBo3xBfyRrSA9OzHcbCN8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803768"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803768"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: oGJOj4iuTu+7EUHXp0+2yg==
X-CSE-MsgGUID: oOzfug3TR2ej4BwY0Jf9Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773790"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 26/31] drm/xe: Make function lookup_vma public
Date: Tue,  9 Apr 2024 16:17:37 -0400
Message-Id: <20240409201742.3042626-27-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Public this function as it will be used by later patches. Also
rename it to xe_vm_lookup_vma

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 10 ++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 707a3466f36b..668984f0769e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -80,7 +80,13 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 	return true;
 }
 
-static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
+/**
+ * xe_vm_lookup_vma() - look up a vma from address
+ *
+ * @vm: the xe_vm that the vma resides in
+ * @page_address: address to look up
+ */
+struct xe_vma *xe_vm_lookup_vma(struct xe_vm *vm, u64 page_addr)
 {
 	struct xe_vma *vma = NULL;
 
@@ -166,7 +172,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		ret = -ENOENT;
 		goto unlock_vm;
 	}
-	vma = lookup_vma(vm, pf->page_addr);
+	vma = xe_vm_lookup_vma(vm, pf->page_addr);
 	if (!vma) {
 		ret = -EINVAL;
 		goto unlock_vm;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4860747592ad..d55330988e32 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -306,3 +306,4 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+struct xe_vma *xe_vm_lookup_vma(struct xe_vm *vm, u64 page_addr);
-- 
2.26.3

