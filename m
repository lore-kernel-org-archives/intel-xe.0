Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E5C3ABBC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43AE10E359;
	Tue,  6 May 2025 23:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/n2wheL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6951010E359
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746572411; x=1778108411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYpTspCi8FGlsJ1MCtl8Danczed39eZd3kWc6/qQuMs=;
 b=m/n2wheLW7vfaA5gY0ynYVt4QUqz0VW3I7sHDe/Ltltt+ryxG2O726uZ
 w/8X0vfcrfgnfTyyB+EFefaIOIAqSwRa1KUWRMYGJMGQ3AOYBapzLJZr7
 2Z4oRuOAmIi+Sqk4FiwILYk4gbjehVicrY5UbQ0YNm7NZ2BeFQzLG8Cvj
 IU4G76zebPR6LqU01EYKLpr0njPykIAnc30asc+7f9zatRSZi9L8JmDlB
 3Bn9r4FFvRZKhI4ekaNu+EuyY3VgSvEhVTpXOTaXJAcLFXYPstMMf6Kzc
 bhDXc6fsXBifFhItLiL/GEQ31f2kohKQ3vA/7wYlh21aPuwr1LlwfqXYS w==;
X-CSE-ConnectionGUID: SIFyURtCQyu8BF+0YLOoGA==
X-CSE-MsgGUID: x5Oo7fF7S8ef26Nc8KtNew==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48353963"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="48353963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:00:10 -0700
X-CSE-ConnectionGUID: YIUbMPh1RVioUr3cCBJPIA==
X-CSE-MsgGUID: sbup6CZtQzKeXz34OXiTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="166690647"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:00:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v6 3/5] drm/gpusvm: Add timeslicing support to GPU SVM
Date: Tue,  6 May 2025 16:01:30 -0700
Message-Id: <20250506230132.1188732-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506230132.1188732-1-matthew.brost@intel.com>
References: <20250506230132.1188732-1-matthew.brost@intel.com>
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
index 41f6616bcf76..4b2f32889f00 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1783,6 +1783,8 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
 		goto err_finalize;
 
 	/* Upon success bind devmem allocation to range and zdd */
+	devmem_allocation->timeslice_expiration = get_jiffies_64() +
+		msecs_to_jiffies(ctx->timeslice_ms);
 	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 err_finalize:
@@ -2003,6 +2005,13 @@ static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
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

