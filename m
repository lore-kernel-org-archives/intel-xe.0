Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FAAC369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 20:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2371210E127;
	Tue, 29 Apr 2025 20:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACBKOUI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E177610E1B2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745957879; x=1777493879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVbp0hWSS6M3lTu+KeROgmj6ZW0SbdB+lhsbMuGkXb0=;
 b=ACBKOUI3y8NmWpqiKjTvwBpIgwlMy82SKbIf48Rqhi3SGdpQap0lMQir
 85upSrDyN+juPpzDsvtedPWWgP/a5s0edWjWl+haiNR6xKd6nsp1k4rEA
 ZHlxi1nzzmmTl2RV5LRr8Dwr5l9jDBieMFn2An+ZA3KlMUJVoSWymKi6E
 miBGPkBp6p6RBkKsNpauVGaYut6xzZqAH/9ycSaFAzpNkoHbO8Gvfv5W+
 At565vSMWbjaWuLzDtx1tW1ciQj3XrwEeqjWa2r5XS9EdnBlz+Bm563O6
 YHhzlXXWAe3w12JqWJYuyFa6oTa5nfEMdWGGKA32dUDyVCtnghuBmq1Ao g==;
X-CSE-ConnectionGUID: wRWNVek9RLa0jWuX0Kg2wQ==
X-CSE-MsgGUID: N584q0vbSii/St1tB7uqEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47481920"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47481920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:17:56 -0700
X-CSE-ConnectionGUID: wnjDhQI4SlK1d+1SndhWWQ==
X-CSE-MsgGUID: vpaAiz1SQvSTmctN3G89OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="134876629"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:17:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 1/5] drm/gpusvm: Introduce devmem_only flag for allocation
Date: Tue, 29 Apr 2025 13:19:11 -0700
Message-Id: <20250429201915.1025600-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429201915.1025600-1-matthew.brost@intel.com>
References: <20250429201915.1025600-1-matthew.brost@intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

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

