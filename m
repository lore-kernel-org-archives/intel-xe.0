Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76A2C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CE010E0BD;
	Mon, 27 Nov 2023 19:59:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8083110E0BD
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701115155; x=1732651155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tW9NgMexVplnXIBAk/Da1EiSqMQnTrRhWUX/VTcFpJc=;
 b=FOB2A6AqLVzf9b4dKet13Sj/gU0x42M6HZMZdr50PTlMwLU3kHD5l9lh
 cjoVzKAFtFdVZOEE/m/loEYPlrPcwe3sM5vaGjShKhC31p4luon7/3rKo
 1LdsvdWCzzm/tDrN/53aSVJ76MLucZw6m6c/Y4AZqgW6QLYMKeQzwFaxv
 bLbz1t4GSGIBCWpjXPB9ZPy0y0aJQLv7PBsH6EmrxyN69TtNRxoAmSTxk
 cMgrmIViZjKzPXzp8/BcSvbpWls99S5VVzqBQ2y1t91MCTsNSHU3DHV8E
 G6XHNdHnR3LYfXL7mnc+3HNgEkOmMCNC8tiDAyj3Xe79No7FGU4vth53n A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383163992"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="383163992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="16705612"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2023 11:59:15 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 11:58:55 -0800
Message-Id: <20231127195856.4183070-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
References: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

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

