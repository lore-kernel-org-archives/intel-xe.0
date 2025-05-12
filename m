Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C293AC3ABD9
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 13:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BEE10E413;
	Mon, 12 May 2025 13:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Czc+8xRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F02210E412
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747058019; x=1778594019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TI9ylbcboDu9fSD/Lp6Ce1viw8CsfVevTndgPV45Tas=;
 b=Czc+8xRlBXP1G3inp/nLgDkDGdQoD3veZidJA7m9tuFVU+c2heFOuDQs
 dBxvDMBEMDj6yRgSYPXxz16H9m4wBFq4NOxDpV1G3/ADggEi1w0iaiRIe
 gdVWbYEKauUdG8spG1yOaL3QQ6t54T1QS/QpangSl09wuR2nj1B5dFHty
 jX0+T7ezsQ2wNmdxas/MKlT+3JpSwcCfUyOF4E/KD2E4ZxGLNdv3hL4Jv
 Nb+l5kbzzougJiqll2J9Y1pIv/OidVg9NIS6S4qFWV085I1sy9O8VDQQI
 95mi8UfwO+tm+6XLsOJBnGfWdQwL/5PSNhI7OEkEv7v+Lbqmdki5awUmo w==;
X-CSE-ConnectionGUID: mfGDI28vTLKmLYgrIgU/Wg==
X-CSE-MsgGUID: Uo/RqSL9SCKDlgl1P4Qymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48933091"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48933091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 06:53:35 -0700
X-CSE-ConnectionGUID: dexSkUieTJO4PNMD+d0ZPA==
X-CSE-MsgGUID: C0Mv4RBtRGej4fdQQlspMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142320427"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 06:53:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v8 3/5] drm/gpusvm: Add timeslicing support to GPU SVM
Date: Mon, 12 May 2025 06:54:57 -0700
Message-Id: <20250512135500.1405019-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512135500.1405019-1-matthew.brost@intel.com>
References: <20250512135500.1405019-1-matthew.brost@intel.com>
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

Add timeslicing support to GPU SVM which will guarantee the GPU a
minimum execution time on piece of physical memory before migration back
to CPU. Intended to implement strict migration policies which require
memory to be in a certain placement for correct execution.

Required for shared CPU and GPU atomics on certain devices.

Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 9 +++++++++
 include/drm/drm_gpusvm.h     | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 823fe432551e..735bfdf4322f 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1779,6 +1779,8 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
 		goto err_finalize;
 
 	/* Upon success bind devmem allocation to range and zdd */
+	devmem_allocation->timeslice_expiration = get_jiffies_64() +
+		msecs_to_jiffies(ctx->timeslice_ms);
 	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 err_finalize:
@@ -1999,6 +2001,13 @@ static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
+	if (page) {
+		zdd = page->zone_device_data;
+		if (time_before64(get_jiffies_64(),
+				  zdd->devmem_allocation->timeslice_expiration))
+			return 0;
+	}
+
 	start = ALIGN_DOWN(fault_addr, size);
 	end = ALIGN(fault_addr + 1, size);
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 653d48dbe1c1..eaf704d3d05e 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -89,6 +89,7 @@ struct drm_gpusvm_devmem_ops {
  * @ops: Pointer to the operations structure for GPU SVM device memory
  * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
  * @size: Size of device memory allocation
+ * @timeslice_expiration: Timeslice expiration in jiffies
  */
 struct drm_gpusvm_devmem {
 	struct device *dev;
@@ -97,6 +98,7 @@ struct drm_gpusvm_devmem {
 	const struct drm_gpusvm_devmem_ops *ops;
 	struct drm_pagemap *dpagemap;
 	size_t size;
+	u64 timeslice_expiration;
 };
 
 /**
@@ -295,6 +297,8 @@ struct drm_gpusvm {
  * @check_pages_threshold: Check CPU pages for present if chunk is less than or
  *                         equal to threshold. If not present, reduce chunk
  *                         size.
+ * @timeslice_ms: The timeslice MS which in minimum time a piece of memory
+ *		  remains with either exclusive GPU or CPU access.
  * @in_notifier: entering from a MMU notifier
  * @read_only: operating on read-only memory
  * @devmem_possible: possible to use device memory
@@ -304,6 +308,7 @@ struct drm_gpusvm {
  */
 struct drm_gpusvm_ctx {
 	unsigned long check_pages_threshold;
+	unsigned long timeslice_ms;
 	unsigned int in_notifier :1;
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
-- 
2.34.1

