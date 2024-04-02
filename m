Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5088FCD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EB610EAA7;
	Tue,  2 Apr 2024 12:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGoCFo5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F7310EFF7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062061; x=1743598061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jr6fXpTCU3pG+gqkDutgPeOstdncKByjA7piEJiY8os=;
 b=SGoCFo5zOFSAC5s1jrSENVxdwgQOroSAF2da021lcEqLV/+kbOvOKZRO
 pgyQMQFIOzkGSdCQVC6P83KXCXW/de3v0P+cEFLzlAAMDsy3Evt1Glldm
 4s7uF7jBUiqlHvuOtDlA67/syQSzEvBUmHFIsnESDFYpST8tsdj0fBW5j
 Cf5xWM+7wdAy/kcPR2GNwnQLoQqDzo88EmbnbwEip7lcQjBtddZfS+HGK
 gKzRZz+3nhX3fuLohpxB5ux0QHvgD13y3gouSQwvE/0KLRcLNMAyD2nZh
 muc0R98fyBaOljwZ9fUeAYI8q7KRzsvsHRsv5nP8NZNSReQQ+l8N5Pbeg Q==;
X-CSE-ConnectionGUID: cTUCGfEhQAS6Cy1yDX543Q==
X-CSE-MsgGUID: c6lGsVyhR3ydnW1j2sd9kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098090"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7098090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:31 -0700
X-CSE-ConnectionGUID: BNFMQphNTPq4ryw4nVfX/g==
X-CSE-MsgGUID: hm/nphQORmen1Taso4aflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18111213"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:29 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 07/11] drm/xe/xe2hpg: Remove extra allocation of CCS pages for
 dgfx
Date: Tue,  2 Apr 2024 18:17:20 +0530
Message-Id: <20240402124724.1238122-8-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
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

From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

In case of discrete platforms of Xe2_HPG, we don't need to handle
copying flat ccs metadata during eviction and restore.  So, remove the
extra allocation of ccs_pages.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9298546909b5..f710caf5cc79 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2201,6 +2201,9 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
+	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))
+		return false;
+
 	if (!xe_device_has_flat_ccs(xe) || bo->ttm.type != ttm_bo_type_device)
 		return false;
 
-- 
2.25.1

