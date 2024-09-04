Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A69CD4844
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B4A10E64C;
	Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oH9y3GYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACDE10E638
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409276; x=1756945276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mrNwhx0y2yd2ci2D7LqeYGDlTFf2Gz2QtBLDIt10to=;
 b=oH9y3GYqKhFbcx7O0xuF4DtdmYKfqu26YisN7/62CeEhgQjr5C/VLz9l
 e1JLb1x0nL+kYHwUv11r8w4uLUf3uQyviaQflWL9xqD+yoVi8u2W09i1+
 m9Ori/PIr3+5UzcVliUzdUlbO9IQrebVd75+LIGTYw2Z/kr1HaWdJLODQ
 NtzsgbZohX+Tqpvv2MvZ8ISFoHtsOrhJUAtiAMAJSp+kZF1hs3gNjWu0w
 0P8OMCehE89t01qvAI4Bx8MmKzptj4IU3bZIT7jwnSIfvdf7xmdAr3ZBj
 ol3O1DG2+EleiCIZKifv8xRHxtsBJyG35tIOMVLaM5CvG2r9dM4dALipC w==;
X-CSE-ConnectionGUID: sFt9TOPdRU66mOKmIkf3Hg==
X-CSE-MsgGUID: kwOb3Wb6TgCN38wcdsa3Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904803"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:16 -0700
X-CSE-ConnectionGUID: rgV0r4wWTl2TP+JANZ9z8A==
X-CSE-MsgGUID: 0Dj0dyO0QDm5ny2AqyQ+FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944246"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 15/43] drm/xe/lmtt: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:16 -0700
Message-ID: <20240904002100.2023834-60-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 8999ac511555..a60ceae4c6dd 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -193,7 +193,7 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
 	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
 	lmtt_assert(lmtt, IS_ALIGNED(offset, SZ_64K));
 
-	xe_mmio_write32(tile->primary_gt,
+	xe_mmio_write32(&tile->mmio,
 			GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
 			LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K));
 }
-- 
2.45.2

