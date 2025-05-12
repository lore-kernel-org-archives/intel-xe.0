Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389E6C3ABCC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957B10E452;
	Mon, 12 May 2025 16:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5WXFdIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A114510E43B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066938; x=1778602938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=31SUYSjAre9YyLoszXy4uNoKRPqB95ZMcryjSVmBdcQ=;
 b=F5WXFdIxQ7IRbxhapMEBwQvv8wJyyej0pyLRmHW7nAyZjrhg9WLnSmD8
 EMN4QsDcORB38Os3f6psFuOC7RtucNBi2mb7xjfpUKn6OqYI69kB/c+RO
 RklWFym9NNKsP+bEvU7HSXNZ4RSdJzRiGtylGVIHKyNFA0k8pm4xvnQtT
 F+qcUKzFb0BbPVb8Z8Rz44ZE4CHJILDxivVpwuADKMJNbMSMUEOTtoPff
 MwW4mmQ1Zjp1Uv54jD9Tl9ffZ82Nd64PcoGVzp0OilWTGjNAS2AMiCJD4
 GdN+bM2U7nb9x/g8wU0/iVy8HA26SQxAeeu9muhCm4LpIcaNE0o7nxRkQ Q==;
X-CSE-ConnectionGUID: NlgIE7HcREOPn1pf+W+ySg==
X-CSE-MsgGUID: KGueupdORU26suVJ4dF+0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508071"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508071"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:18 -0700
X-CSE-ConnectionGUID: fOQwS9tvSlOiJAWCB0axmA==
X-CSE-MsgGUID: d+2ahvD8SC2Qcw2V47ebHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532610"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v8 01/20] drm/gpusvm: Introduce devmem_only flag for allocation
Date: Mon, 12 May 2025 22:17:21 +0530
Message-Id: <20250512164740.466852-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

This commit adds a new flag, devmem_only, to the drm_gpusvm structure. The
purpose of this flag is to ensure that the get_pages function allocates
memory exclusively from the device's memory. If the allocation from
device memory fails, the function will return an -EFAULT error.

Required for shared CPU and GPU atomics on certain devices.

v3:
 - s/vram_only/devmem_only/

Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 5 +++++
 include/drm/drm_gpusvm.h     | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index de424e670995..a58d03e6cac2 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1454,6 +1454,11 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
+			if (ctx->devmem_only) {
+				err = -EFAULT;
+				goto err_unmap;
+			}
+
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index df120b4d1f83..9fd25fc880a4 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -286,6 +286,7 @@ struct drm_gpusvm {
  * @in_notifier: entering from a MMU notifier
  * @read_only: operating on read-only memory
  * @devmem_possible: possible to use device memory
+ * @devmem_only: use only device memory
  *
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
@@ -294,6 +295,7 @@ struct drm_gpusvm_ctx {
 	unsigned int in_notifier :1;
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
+	unsigned int devmem_only :1;
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-- 
2.34.1

