Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6EF606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FpEz2rEr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98D210EF60;
	Mon, 16 Nov 2026 11:33:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B8D10E0A9;
 Mon, 16 Nov 2026 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794828769; x=1826364769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dIu/otYGab5E/fPQD+KvKv4MMTgU908HQ9KicslB2+Q=;
 b=FpEz2rEr4aGkcQZCUjoLr+I1g0u7iNqTuI2b4Hc/BwzGDvLOETZmWod5
 wb8JwVY4+yrY+Yqze92Nf+8vtdHthkTb3r35d5fL/UP+jROObg9pGf+0k
 aHs2x2kJAow3m09XdowNFy5IC6srz6SGrAnlfWy2fI8M8XSgunhh1Liyv
 +/mAe/Gii7+LB2Kz7lyX2T2zp5cpU+CCeQJWSsyn2CEdLQraeCnYHvpTR
 9YQWan9NCQ+W6I0FUYADNHpXWKHjClzoURLomdTnNcJQXhxwYJBTlRbnP
 9Vwhx2Teu+M2I4XFEvAJcwzCS1A4WxHYMQqzRV68RmzzFcE3Mst8mF8Go A==;
X-CSE-ConnectionGUID: nEdED19ZTVSJZ0RrA6bN7w==
X-CSE-MsgGUID: XZwE/tNySNWcCDJquppMvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3435255"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3435255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 03:32:49 -0800
X-CSE-ConnectionGUID: EBV6J3ohTB60noryv/9W1Q==
X-CSE-MsgGUID: ZZPz2GWxQXCCmNOlJr9D0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9443796"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa007.jf.intel.com with ESMTP; 16 Nov 2026 03:32:47 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH v2] drm/xe/display: Use the GGTT PTE to find the initial FB in
 stolen
Date: Mon, 16 Nov 2026 19:30:40 +0800
Message-ID: <20261116113040.1480201-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On integrated platforms initial_plane_bo() passes the GGTT address of
the initial plane as is to xe_bo_create_pin_map_at_novm() as the offset
into stolen. That is only correct if the BIOS maps stolen 1:1 into the
GGTT.

On Nova Lake the BIOS puts the initial FB at GGTT address 0xff800000
instead. Its PTE (0x800003) points to the start of stolen memory (the
stolen base is 0x800000), but using the GGTT address as the stolen
offset is far beyond the 120 MiB of stolen, so the BO creation fails and
the driver can't take over the BIOS FB:

 xe 0000:00:02.0: [drm:xe_alloc_initial_plane_obj [xe]] Failed to create bo phys_base=0x00000000ff800000 size 8294400 with flags 430: -12

Get the physical address from the PTE and convert it to an offset into
stolen, like i915 does in initial_plane_phys(). Discard the initial FB
if the PTE doesn't point into stolen, as done for the dGPU case and by
i915, since the FB can't be wrapped by a stolen BO then.

Tested on a Nova Lake platform: the BIOS FB is now taken over as the
initial FB.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
v2:
 - Discard the initial FB if the PTE doesn't point into stolen, instead of
   falling back to using the GGTT address as the stolen offset
 - Add the Fixes: tag
 - Both as suggested by the automated review of v1

 drivers/gpu/drm/xe/display/xe_initial_plane.c | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b7303..990806b80 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -85,7 +85,7 @@ initial_plane_bo(struct xe_device *xe,
 			    &phys_base);
 	} else {
 		struct ttm_resource_manager *stolen;
-		u64 pte;
+		u64 pte, pte_addr, stolen_base;
 
 		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 		if (!stolen) {
@@ -100,7 +100,28 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
-		phys_base = base;
+		/*
+		 * The plane surface is a GGTT address, which equals the offset
+		 * into stolen only if the BIOS maps stolen 1:1 into the GGTT.
+		 * Get the offset from the PTE instead, and discard the FB if
+		 * it isn't in stolen.
+		 */
+		stolen_base = xe_ttm_stolen_gpu_offset(xe);
+		pte_addr = pte & XE_PAGE_ADDR_MASK(XE_PTE_SHIFT);
+		if (pte_addr < stolen_base ||
+		    pte_addr - stolen_base >= (u64)stolen->size << PAGE_SHIFT) {
+			drm_dbg_kms(&xe->drm,
+				    "Initial plane programming using invalid range, PTE address=0x%llx\n",
+				    pte_addr);
+			return NULL;
+		}
+
+		phys_base = pte_addr - stolen_base;
+
+		drm_dbg_kms(&xe->drm,
+			    "Initial plane GGTT address 0x%x, PTE 0x%llx -> stolen offset %pa\n",
+			    base, pte, &phys_base);
+
 		flags |= XE_BO_FLAG_STOLEN;
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-- 
2.43.0

