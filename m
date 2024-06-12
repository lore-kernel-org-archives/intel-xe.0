Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB1FC27C79
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEA210E763;
	Wed, 12 Jun 2024 02:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgGTKEil";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC8F10E77D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158540; x=1749694540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3TdDq+PRHk+GYviBDsvxBqJbxs16pn78tI5FseqipRk=;
 b=UgGTKEilxiKXLs3RGIbzP5YCt/2soNpIRJPpN0kEPxWIzPKX0TITB07C
 yeQZWWxlyULYmc4abzRcfAf2EWQ4X5pUMCOi0HIR9D+6CsoBku5cx+Ty3
 PL+AP+TxAC4IBJj1WrXLS12OOGoCHgXMibRdlzf8L5D0VNqeK6FvRwjcC
 LMn8JOXYHiPkpzufOFoQyT3Gk+Wt5onjzHR1gGF1T1W8rT0HSBSBg4qR/
 JRjp8rko5UkhroA0S8AhpjVC8g8dqNc1vHyD0YKSMpglNgadtxV1N6C0N
 qIAA+Yp3VQeCu3qmSRa+4IDyHJag2oWiQ6pX4XJQgbdAAJxqKAF2QFagl g==;
X-CSE-ConnectionGUID: 52iCWibDR/CX/jWie/P9Rg==
X-CSE-MsgGUID: r5Oph3qvSbKGbrCI/E7ZEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427819"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: nsGmxELYQSiRfzjdHc3f6g==
X-CSE-MsgGUID: LCKSUuoMSOOc6OqBDJDobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763654"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 35/43] drm/xe/svm: Get page map owner of a memory region
Date: Tue, 11 Jun 2024 22:25:57 -0400
Message-Id: <20240612022605.385062-35-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce function xe_svm_mem_region_to_pagemap_owner to
get a memory region's page map owner.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_svm.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a2c52f205ea0..d2838ce46eaf 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -146,3 +146,11 @@ int xe_svm_alloc_pages(struct drm_mem_region *mr,
 
 	return ret;
 }
+
+void* xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr)
+{
+	struct xe_mem_region *xe_mr = container_of(mr, struct xe_mem_region, drm_mr);
+	struct xe_tile *tile = xe_mem_region_to_tile(xe_mr);
+
+	return tile->xe;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 09fef8ea97f3..b70551d12578 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -12,5 +12,6 @@ struct page;
 int xe_svm_alloc_pages(struct drm_mem_region *mr,
             unsigned long npages, unsigned long *pfn);
 void xe_svm_free_page(struct page *page);
+void* xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr);
 
 #endif
-- 
2.26.3

