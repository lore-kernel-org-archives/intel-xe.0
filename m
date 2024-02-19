Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BAAC54764
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 21:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A114110E088;
	Mon, 19 Feb 2024 21:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lohcfoSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CFB10E008
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708377337; x=1739913337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dcUg2+IyzeF893BQV/Cd6+BYaRlwIxovEzZCxgMoBi8=;
 b=lohcfoSdIXPWb4I0k7Xc1ZAiUBz5jGMG4W4NkfF5HHljD95zdc/mLJc7
 0ky/4F3gGRaWjXyPsGeRj1o+b/0ATAOR3zoBqdWVl+p3gH4YYPJPIZEkD
 OSO5NmflReXC0BVwJWQmrQXJ5IGvqYxHeeGfYb1xYgaSvsxegXNWaLnye
 I/CXedQYFDZLjbVkQm+HJzW/kxhpF9A0x82DRs9S1/bK70/jhNxrelGNX
 +tb/G2hDyKWSW/fBWIQYkeSusIdSGa30AERu6noHtRiF+nAPeM53gdaiP
 WdAGuZN803SZi5u2sVoqu/hSIXaiGTtPQ24IS7hWs2GUhCYinBL/WBGso g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2610041"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2610041"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9218682"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [PATCH 3/3] drm/xe: Return 2MB page size for compact 64k PTEs
Date: Mon, 19 Feb 2024 13:16:16 -0800
Message-Id: <20240219211616.3633630-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219211616.3633630-1-matthew.brost@intel.com>
References: <20240219211616.3633630-1-matthew.brost@intel.com>
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

Compact 64k PTEs are only intended to be used within a single VMA which
covers the entire 2MB range of the compact 64k PTEs. Add
XE_VMA_PTE_COMPACT VMA flag to indicate compact 64k PTEs are used and
update xe_vma_max_pte_size to return at least 2MB if set.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/758
Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
Fixes: c47794bdd63d ("drm/xe: Set max pte size when skipping rebinds")
Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 91800ce70845..a603cc2eb56b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -30,6 +30,7 @@ struct xe_vm;
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
+#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
-- 
2.34.1

