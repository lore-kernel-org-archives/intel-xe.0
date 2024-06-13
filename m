Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F30C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD5B10EAD8;
	Thu, 13 Jun 2024 15:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrxuy4zo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50910EAE3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292046; x=1749828046;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3TdDq+PRHk+GYviBDsvxBqJbxs16pn78tI5FseqipRk=;
 b=hrxuy4zobRBRqQbVhYeuRJnn0PwqLHZnjR7jOYdYxZu7Q6NtdC9t+kDe
 B+Vd9XA3vYnfBUP+kp42itOh810RNSEuRki8RwYhl/2kYaInAtJ6u/b+5
 unVma9E9jUW0e4uPkr8NFNQ2xzPyEiQdVaqFU8okHtRcMN9rD5LrZCgxv
 6sHYZgrSyXq2s5XviiU3JIyA7WR+u/kYZnAiiUcrno3OT1EXLBoZrApCQ
 RnspsRdJ+oT6bHLsD+xBBJJxgWNN2UbO+sa89L43shichb4RqB7AlIAVb
 FR28whUnyPe2Nmv0T/9lHizM8zOvDmcJdXFsGAz4C9J3BzbZYWiYDrDol g==;
X-CSE-ConnectionGUID: G8R76dHdQT+KVgvSee+l4g==
X-CSE-MsgGUID: 8bCkpO/oScCFtFZ3mXBtjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348667"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:43 -0700
X-CSE-ConnectionGUID: D/YPqotATuO3p+37pdHedw==
X-CSE-MsgGUID: ibgFHrJZQ/aLp04vcbWamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135123"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:43 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 34/42] drm/xe/svm: Get page map owner of a memory region
Date: Thu, 13 Jun 2024 11:31:20 -0400
Message-Id: <20240613153128.681864-34-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

