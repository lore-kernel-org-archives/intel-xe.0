Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B3EC2BA12
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A3C10E2BA;
	Fri, 14 Jun 2024 21:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+062HqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F5810EE7C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401658; x=1749937658;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+y8uuL3vrbTmHvEv9c4qtNWXPfZtGvDrySmTjVW45gs=;
 b=T+062HqYuVaW9o1rh10btUtuqPuL5TtEf6I32kd5kGU+Hhotn7V2qT8i
 7zZoDh0uuNsDiT/bI4u1nGMqA9oZ47rFpFAG4MkA7Au+iDEJm0iCoMrmN
 Q5XggTFVVQIJX9OoblplgU5tF+26M+2pMBtMPXB64lbPT+ndqkzSaLiqz
 tBfADXMX2VM6HhCX5t8j8CgwZDwB9EtNHPeDFDKm5VI0K2EKPSE31mCVA
 O8gWiUq8H8yGEnBOPiuDSarhSsFRSn6MkxAobdmXGB+EzqeZrjbhZvpey
 qvTvkte5N+7eJfxSJ1hpkFX4or4CJmSFMwCzF9tm9Vg1z6RiqRMc48Kr2 Q==;
X-CSE-ConnectionGUID: Sv2vbmrqQK2m++MQHGy6QA==
X-CSE-MsgGUID: NTIuBBSpTfC9htDjw0DdMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886596"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: 3SZOeTkLTu2IeTC3CfFMYA==
X-CSE-MsgGUID: ZPtJiByFQT6xITeMKkaCLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572430"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 36/44] drm/xe/svm: Get page map owner of a memory region
Date: Fri, 14 Jun 2024 17:58:09 -0400
Message-Id: <20240614215817.1097633-36-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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
index a64dbbdff1ae..5ea851ce5083 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -146,3 +146,11 @@ int xe_svm_alloc_pages(struct drm_mem_region *mr,
 
 	return ret;
 }
+
+void *xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr)
+{
+	struct xe_mem_region *xe_mr = container_of(mr, struct xe_mem_region, drm_mr);
+	struct xe_tile *tile = xe_mem_region_to_tile(xe_mr);
+
+	return tile->xe;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 2ed3ba240cb1..4d7dccb97378 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -12,5 +12,6 @@ struct page;
 int xe_svm_alloc_pages(struct drm_mem_region *mr,
 		       unsigned long npages, unsigned long *pfn);
 void xe_svm_free_page(struct page *page);
+void *xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr);
 
 #endif
-- 
2.26.3

