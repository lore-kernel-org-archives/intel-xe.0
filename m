Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB1E6FE4B
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E09B10EB29;
	Sat,  7 Sep 2024 00:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+P/am5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E710EB2A
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPJJf01eTSEqjOyKr+phe/vRdnwlmznXJu2w9HDa+Q8=;
 b=m+P/am5/O3oTR28mW5faYDiBXokT1MH9eGguw13YGVEN4fBo8x29kgix
 88qpn7s5MfWKfxyqSoxqe3XEzj7e76yZnGNVXWddWGVGqWqxvoSy+Cq6i
 jrxJkOJgWh7UJ8PiVHpclDXLxKtra9kIzgRObMDxY9/UFt6LNc/pLi0qJ
 cAcjcPQ7SgxyKE83YnY97wyd7GLDnhyqmoPyRLCAua/bc5azspssW5d3e
 aa/M8tqfKAiarSgMFcgXxLhXATQOqk+zwCpKbwr1ebFFLjoQY+/LsdfXg
 OSMKOLGLLwUqH/1qU8dBIYNnOP+fafveXPBScGYImpzup5i2Xn8wEGsjY w==;
X-CSE-ConnectionGUID: TIV74b4mTZqsfCy+IXtZ8w==
X-CSE-MsgGUID: qt5nlB4uSRSO/X3prBZkug==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855305"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855305"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: ZIJyHLiVQjuhQvA+JT/iyA==
X-CSE-MsgGUID: QNU12tcIRJechgFnkxbs6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792660"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 15/43] drm/xe/lmtt: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:04 -0700
Message-ID: <20240907000748.2614020-60-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

