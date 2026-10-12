Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73512CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3050910E41E;
	Mon, 12 Oct 2026 05:41:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635F510E41E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791783689; x=1823319689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ipNRWTF0serDGQzy7jIEwMxZbP1JFGzNNoZJF9XM0Lc=;
 b=CRp0+jt7cr54L66EdyzYhGzqWz/cHFqSQSmCmACcyo8kbLoMPgZf8J5A
 gDbKe6UlVVlpYpFOHwuaF9o+TNLjCp0OTV9NfTzolMX+Iwjk4G/27srse
 76IIYRaO+zL7zOZ9xbalTcIVvVCKOCfzutbQgzeTCdOl1rDVOu2Ysyd2O
 ezBaY/6U+o9M1EX3L/9Wy0XX90e3zuKX3XqXO88wE1L4PksPykv273xY3
 9f3gKPr07qpHSs+JWnR1VtkDRp+De2K79Qdba8BfTrjNQM009YCMkGmHu
 FVXfQquqLA2Z/XZeILZeCFKYUKDwO9VoFNtmlExtVQphdUgV0yZn2iims g==;
X-CSE-ConnectionGUID: zHv/KRVKRSCOZoD1truCGQ==
X-CSE-MsgGUID: 7U5WC82KT5qKuj2bTYxbSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="367840"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="367840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:29 -0700
X-CSE-ConnectionGUID: 3PW2N3O2SpSjZlfcWxamtQ==
X-CSE-MsgGUID: 1zwQNW0ATu6+l0Dm8g7dDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="787140"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 5/6] drm/xe/xe_ttm_vram: Report max_pages reported by
 firmware to userspace
Date: Mon, 12 Oct 2026 11:11:01 +0530
Message-ID: <20261012054056.2272869-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261012054056.2272869-8-riana.tauro@intel.com>
References: <20261012054056.2272869-8-riana.tauro@intel.com>
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
index dd03b1fe8423..36d47de8b11b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -1033,11 +1033,7 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
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
index ef7e4c87a7bb..4a2cd27a5b61 100644
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

