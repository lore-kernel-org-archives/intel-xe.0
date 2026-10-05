Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDA5CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF6D10EC32;
	Mon,  5 Oct 2026 09:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDIYHYhi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8976010EC32
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190946; x=1822726946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TjMAgh1Vr/MSdRfxcpPUZbI8kH1Wx7HQuw+Lf7R89a4=;
 b=MDIYHYhiQR8jbkKvSsHAb3cr5fMLYOHlC07Tq5Q1hjDmfglWiCMIHC3q
 KgCaXUJrphJ8UCmPWm9wGK2wFPSP+D0PN55s1Gn47dVSCxa92gc5ZTX5U
 owwlrZcBVnqgIKShw2gk9ySfhp26dV3c1aAyBdpiCc4/fF+kULrYXOx9M
 G2tQXBFKLGB0s98dM0eQwTdX1l9busYLU98+WkH4j+H0jPYGV4o0knhal
 lAZJm/YDvMf1hQXCkD7O0DPofBVpHRlpqgwKmSAEwFiCiHSoGXp4nnOfF
 u1GpojWE8iuO82+g4uQpvvg2jOHXqzyiSXXNxeEW7W+DLZZLJ9f0PVZ1Y w==;
X-CSE-ConnectionGUID: tNSCvCkLQjeEx2QPZ5czmw==
X-CSE-MsgGUID: RNiEA9SqQ+yNP5gRpGcusA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109346382"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109346382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:02:26 -0700
X-CSE-ConnectionGUID: c4CXRNtoSSmGGv2ZdNzvQQ==
X-CSE-MsgGUID: 9TfzC+kMTzi9X+b33/fy3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="280050197"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:02:24 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v4 5/6] drm/xe/xe_ttm_vram: Report max_pages reported by
 firmware to userspace
Date: Mon,  5 Oct 2026 14:32:01 +0530
Message-ID: <20261005090156.1233748-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261005090156.1233748-8-riana.tauro@intel.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
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

Report the maximum number of pages returned by firmware at probe,
resolving the existing TODO.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
v2: fix commit message (Himal)
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 6 +-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 2 --
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 2c4722a956a0..cc33ba7e23c2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -1012,11 +1012,7 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
 	struct xe_tile *tile;
 	u8 id;
 
-	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
-	if (man)
-		/* TODO Hook with RAS to show max_pages fetched from FW */
-		seq_printf(m, "max_pages: %d\n",
-			   to_xe_ttm_vram_mgr(man)->max_pages);
+	seq_printf(m, "max_pages: %u\n", xe_ras_get_max_pages(xe));
 
 	for_each_tile(tile, xe, id) {
 		struct xe_vram_region *vr = tile->mem.vram;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index efcf3e1d4e80..dc97b0ad0e51 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -37,8 +37,6 @@ struct xe_ttm_vram_mgr {
 	struct mutex lock;
 	/** @mem_type: The TTM memory type */
 	u32 mem_type;
-	/** @max_pages: max pages that can be in offline queue retrieved from FW */
-	u16 max_pages;
 };
 
 /**
-- 
2.47.1

