Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3732C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 18:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FCE10E3CA;
	Mon, 27 Nov 2023 18:55:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB5010E3CA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701111316; x=1732647316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3JH9fMhj6XJb10+LmM/OzdKmFjo50OM9FsYcDkTvjI8=;
 b=AdVBbDmjVduozCW+ng6Rq1Pc8wDoIpHcSvle9Wveg5/tXvvn3vYWfPGi
 MbrMhsXpPfg38FYG/ndgnGfl4okYLGh+JnXN07sWXqdc8Nz2OGf/1XZZr
 cVxEtSlmxyPvG6tUMQXtrCzVuyz/90Lheki1JhPz95XEJkLOJySraaHS8
 xjOrdENLukBEWvw522/5miUpJDJgwCDUheFHFbSTH7cLfv6a1BSYhGYyp
 OMq4/Oq5DB9TG506sYAt/dm+nYo5dUj4RaN158WfHjRoX2V0Sx47nEF+y
 8XRgCtlVLQU516ezas74pet6R4npPz3UuZxK1R6I0zI0pZYGxRNv1TkXX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="5959568"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="5959568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:55:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="718128209"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="718128209"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 27 Nov 2023 10:55:15 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 10:54:44 -0800
Message-Id: <20231127185445.4156792-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231127185445.4156792-1-vinay.belgaumkar@intel.com>
References: <20231127185445.4156792-1-vinay.belgaumkar@intel.com>
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
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index be11cadccbd4..dd10beb3133a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -261,6 +261,8 @@ struct xe_device {
 		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @skip_guc_pc: Skip GuC based PM feature init */
+		u8 skip_guc_pc:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682ba188e456..2bd00394015d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -62,6 +62,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 bypass_mtcfg:1;
 	u8 supports_mmio_ext:1;
+	u8 skip_guc_pc:1;
 };
 
 __diag_push();
@@ -590,6 +591,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
+	xe->info.skip_guc_pc = desc->skip_guc_pc;
 
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  enable_display &&
-- 
2.38.1

