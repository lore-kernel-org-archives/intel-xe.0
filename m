Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D704C2BA1A
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE5410E1C8;
	Thu, 13 Jun 2024 04:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqEngOUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626CA10E966
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252032; x=1749788032;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3TdDq+PRHk+GYviBDsvxBqJbxs16pn78tI5FseqipRk=;
 b=OqEngOUiVKT9NYujMFryr0nF1QY0WlEQMdih3Wws9SIzKTk6y+KPqxJ5
 vo5tHZPibZacy8eHjewVIGCHEeUgT5l74DFL6LqXVCeoj/+4STF3piSuN
 o5l3/Y8pd0VNB77WVmS2kugWGd10dmP8NXP0zwKRR64yhe+FmQQglp1w0
 ZnfXdKV8YiaPwueUyaHCrX7dTmPR+f1f5fRY/d1gcvknC7ljPEb/0tgdV
 75USDG2DZaVA2INqcPZ2o1CAtpVUXqYtgEfvbHLcj3Fjx5XsaNsaJQsLt
 2TRggGOrgsdhZFQAsKFOI8z7VXd+T1vN9BgqJrMp/1ets1Jl7zWiFnd7Q Q==;
X-CSE-ConnectionGUID: wjTk1N92T9G+rEyug2egug==
X-CSE-MsgGUID: PCkTLOdeSRWo5WtmwC20GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847986"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847986"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: bIDocfCNQ4GVOq5FTKSePw==
X-CSE-MsgGUID: tSnchnVsTke2+84DUEfMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476358"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 34/42] drm/xe/svm: Get page map owner of a memory region
Date: Thu, 13 Jun 2024 00:24:21 -0400
Message-Id: <20240613042429.637281-34-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

