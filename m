Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A247CD129A
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A53112772;
	Mon,  8 Apr 2024 16:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwDCCryU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F7B112774
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593769; x=1744129769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6WGdwOlspgi+kVN01Piu3EGpbq0ktydWmViwiS4XzeU=;
 b=GwDCCryUeUsQduvRbjKmPd2qR36D1O3mQxM/iRuGig1rGuijc/5BnX4/
 1k08+8HP5dFJoifAcmRsy0KP44T9qYiND6Gfnjwrbekv4rjKjn5W7Q2ms
 vPfAtnEjgHAENt0UKbI3h2mg6OFW4xBJQIxa97F9bMhqxhE1Bb4BoWkCS
 lX6+cNo2IxjonVI86agGDz/EZsCrV2Nki2VhO6q2o3j3mg5Cc+A+UH4r+
 TQ5OV4irT42Ii0pnq2zAzPvWlEiOfO1tmGG/bHvW5rWomz/lmmxvHRcOr
 wx9n+Yy0aX3SP8Tx7YjzbxCO7WAAMt4GFtDInwWAJpWCEJXRCNKBj9WOh g==;
X-CSE-ConnectionGUID: 9HWlSXUsR4Wlt9Q04ftQ7Q==
X-CSE-MsgGUID: ZEJEeMhYSjKSv1niMt6iAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024991"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19024991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:29 -0700
X-CSE-ConnectionGUID: 2obBybskT12vBKJaguHuVQ==
X-CSE-MsgGUID: /0cjLsmwThSOrnSXVy/u8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24683540"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:27 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 08/11] drm/xe/xe2hpg: Remove extra allocation of CCS pages
 for dgfx
Date: Mon,  8 Apr 2024 21:59:13 +0530
Message-Id: <20240408162916.3767771-17-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
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

On Xe2 dGPU, compression is only supported with VRAM. When copying from
VRAM -> system memory the KMD uses mapping with uncompressed PAT
so the copy in system memory is guaranteed to be uncompressed.
When restoring such buffers from system memory -> VRAM the KMD can't
easily know which pages were originally compressed, so we always use
uncompressed -> uncompressed here.
so this means that there's no need for extra CCS storage on such
platforms.

v2: More description added to commit message

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6166bc715656..fdeb3691d3f6 100644
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

