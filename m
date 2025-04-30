Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C99C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8529710E744;
	Wed, 30 Apr 2025 11:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CW2pXkdf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DC889304
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014051; x=1777550051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ak5GzWca/vjcRiAm2P4o56QcMmQtDqVsksOPF1yM+ak=;
 b=CW2pXkdfqRUCv1jofqGD96cYrqMySdubP4pxqJRWiwICn9yEvHxGCmvY
 4tIaBxn6A2UoXoYIlhJtItB1BYm9fGO7ji6xmpl/jdUQ4iVnvIJXQ6soo
 Qq7FXfy9SqJX9ebOuWsSG78zUawoqUs4cIQhUFcYKQLSUJvCQrKYfyE8y
 R1+buTiDqR/ucyR6ab3ncD7HVYEkcTUrQKzb/rumW68MFyCLSVdvdYHv8
 3cYlAy8kh91SO23expiy4c79x42VKbI5tpHMg2YZ420kcx8/obEMD3yPd
 ehSjaYqsy7ByeScXmvARGXuT6Nr59aLKRLA1EBHNDM0vMfXoXt2AOhqE/ w==;
X-CSE-ConnectionGUID: 4xdl93PHTLuQ2ctIn6esPg==
X-CSE-MsgGUID: XVSHTy6jToW0nmuT/mlKPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759928"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:11 -0700
X-CSE-ConnectionGUID: PCRj+G+9R56Opw7o4K0bkA==
X-CSE-MsgGUID: 5P5pm8zKQICtksXi8OreDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050615"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 06/20] drm/xe: Introduce xe_vma_op_prefetch_range struct
 for prefetch of ranges
Date: Wed, 30 Apr 2025 17:48:58 +0530
Message-Id: <20250430121912.337601-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
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

Add xe_vma_op_prefetch_range struct for svm ranges prefetching, including
an xarray of SVM range pointers, range count, and target memory region.

-v2: Fix doc

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1662604c4486..0afd0296a57e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -374,6 +374,16 @@ struct xe_vma_op_unmap_range {
 	struct xe_svm_range *range;
 };
 
+/** struct xe_vma_op_prefetch_range - VMA prefetch range operation */
+struct xe_vma_op_prefetch_range {
+	/** @range: xarray for SVM ranges data */
+	struct xarray range;
+	/** @ranges_count: number of svm ranges to map */
+	u32 ranges_count;
+	/** @region: memory region to prefetch to */
+	u32 region;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -416,6 +426,8 @@ struct xe_vma_op {
 		struct xe_vma_op_map_range map_range;
 		/** @unmap_range: VMA unmap range operation specific data */
 		struct xe_vma_op_unmap_range unmap_range;
+		/** @prefetch_range: VMA prefetch range operation specific data */
+		struct xe_vma_op_prefetch_range prefetch_range;
 	};
 };
 
-- 
2.34.1

