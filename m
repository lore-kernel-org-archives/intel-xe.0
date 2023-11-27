Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12B3C10DAA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 22:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B8210E406;
	Mon, 27 Nov 2023 22:22:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CB910E406
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 22:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701123774; x=1732659774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZgheORBHV31mPnFtzfJBRtc9QREKE0FGyr6LlEvrXA=;
 b=ME2yf9fqwlttLjgx32eqLjUeroRn5etsEwxPSrIvetpBTkcmIpBEDu68
 pg0fiBAJXBpRr5n/Dqvn0X12EhJGtNyrU/h+WFnoAD8QxyS3gR5bfRb7L
 IuM0bk/+VII6N9xJsaxhvqBhfHqakwhRbPtPyZKAtMHE7oasHwcjlrq3L
 mMUv/NH+cbr+1Vka3yltYomQRMkZxpaa9FdlEdLjg4E2DLRkWy/dpvdeU
 /gK5EPxgoDNX+WY1xS8BcpqJSBdMxaEkA3XAF0ULmoyW6+p4akm0VKGpa
 7hMdjrZwqqmtD2dMs1STs0WqryUmpMJK/1n6buboEJsC6SpHjd/LMGMu9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="6052827"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="6052827"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 14:22:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="802774766"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; d="scan'208";a="802774766"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 27 Nov 2023 14:22:53 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 14:22:35 -0800
Message-Id: <20231127222236.68999-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231127222236.68999-1-vinay.belgaumkar@intel.com>
References: <20231127222236.68999-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add skip_guc_pc flag
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

This flag can be used to disable GuC based power management. This
could be used for debug or comparison to host based C6.

v2: Fix missing definition

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2712905c7a91..b1877270960a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -264,6 +264,8 @@ struct xe_device {
 		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @skip_guc_pc: Skip GuC based PM feature init */
+		u8 skip_guc_pc:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cb762c11dd0f..d54cae326e1a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -64,6 +64,7 @@ struct xe_device_desc {
 	u8 has_sriov:1;
 	u8 bypass_mtcfg:1;
 	u8 supports_mmio_ext:1;
+	u8 skip_guc_pc:1;
 };
 
 __diag_push();
@@ -592,6 +593,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
+	xe->info.skip_guc_pc = desc->skip_guc_pc;
 
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  enable_display &&
-- 
2.38.1

