Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D4C98328
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7257110E797;
	Mon, 28 Sep 2026 06:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIr77/jr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CF310E79C
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 06:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790576347; x=1822112347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OAMeSR5azfe+moPUgSaTUXy7Q8VE9UxHLaUZH9UnBCA=;
 b=bIr77/jrUzA5YbIPvynp2YQ+yYzZBDqO0O7wBkCzrWWeAkxF/L5RJ0Ro
 HWm7E5G4TyADNbLUJUKU0Zih/mM/EGLI9JKZH5KKAYgL7RDk0aDMpCMdF
 /yj/abMuNMSx2F8Clj2JjnZrMljQO83/2QG5xq/g4AAkg0Et4c0Tl9Xis
 c+tuWM4lBTupM7sTQqD/BW3wozlyXBdYtHQFBfvNaQMAEP01Yc/pXRfe2
 LVmORqeaKEq2VKeJVlEnctqKZUNL9mkF8LIHldgY9v2QfbMccwZiBEZY3
 NZvQ38MQ44IQsLTL7KBynI6GJEcHe4dSdbkLNZ0MhGusqnsplDjeB5piR A==;
X-CSE-ConnectionGUID: E9DRGys/QzOcAKEZ0H7oGw==
X-CSE-MsgGUID: gz4IA+OgTfO4sdkmy81EUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100598637"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="100598637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 23:19:07 -0700
X-CSE-ConnectionGUID: bRDwb2KdR22MP6I30o6ydw==
X-CSE-MsgGUID: RU5/nL7HRYCoanoJtf1UGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="302901244"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 23:19:03 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 5/6] drm/xe/xe_ttm_vram: Report max_pages reported by
 firmware to userspace
Date: Mon, 28 Sep 2026 11:48:35 +0530
Message-ID: <20260928061830.417395-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260928061830.417395-8-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
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

