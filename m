Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C69DC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED2910E75A;
	Wed, 30 Apr 2025 11:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APE+okQs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2D910E748
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014043; x=1777550043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRUJskwSzU6RDw4rLHNZE3XIPWRy1vMISVeR+2fe7Dc=;
 b=APE+okQsk3BesTSB0/AOfc8XDmX/b8gv9hg8ux2QbB5mdGbWnAXkLX9m
 Ui1i3We1cEd6HHf64YRXmjMD2YbnXz/QlWaOCzNA31NZOKHT6lHwQleLg
 VRRjqXJWp5gBOcA5cNTf12v74ZsvyVQalmbYhQecFbivdDqSFe+Bcu0MH
 AUxvKF3nu28cs2ci3QJjekpB3U7EX7WZ1IV7Ptyd6iwSsnPeFclY+fdJq
 mByMOadXFuaHfKhQeHvNZq1zAMX13IbwzOU11ysS0zJUv5b/pv3B3Fcvz
 UVYk5njOfvs9X7ORNZm+lgW5QHUvz3hhB1ANTpB87J9AeV3+KQJoOMS5u A==;
X-CSE-ConnectionGUID: aboZcc85RB6A2KvPj9q++w==
X-CSE-MsgGUID: jqvGEOldSVGz9YT8D894Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759906"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:02 -0700
X-CSE-ConnectionGUID: JK74C0TJTIiHkIN4II7WtA==
X-CSE-MsgGUID: jOwMavoWRoWNn23YL+9d6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050578"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v6 01/20] drm/gpusvm: Introduce devmem_only flag for allocation
Date: Wed, 30 Apr 2025 17:48:53 +0530
Message-Id: <20250430121912.337601-2-himal.prasad.ghimiray@intel.com>
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

