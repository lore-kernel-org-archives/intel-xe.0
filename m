Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76307606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjgwaUpz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DE310EF48;
	Mon, 16 Nov 2026 10:55:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D29F10EF39;
 Mon, 16 Nov 2026 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794826512; x=1826362512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gS8fa8SzCKny6H2jHEmwDUORphjeH9xs9Eih+8nHGlg=;
 b=NjgwaUpz+iayZgerTDHENbqh+B0+n/QO38qLYgN9Uf+I2b3zkiSnFz0K
 YLXTYlCvLnJ7jmYe+uapIrPGVizDJXLEGUbBO4GL5sbaaIN6KQjctSSq9
 Yy3i9mlTKmfgmsXo8UshSd565fyPJlEWGXDHCcIqlIPOfXi0MpRTVhuxK
 PRb5RtQTmuNQOmUgn52uWkYmnzZ3sj5zOBdNb5TH/16sXef0TznfNCyt8
 OIvNXncMwtYTEtosf0u6ia+3m9B7DTxE51+mAXYER71dGFTEXfXKNd3Pg
 cg87Q67ptlSG6SZQPpAkcd6d72Eft6KeRtmeYR6+UV6my2k0KOnVfQdwH w==;
X-CSE-ConnectionGUID: 82ofzbboSWaDwgubG4Uqyg==
X-CSE-MsgGUID: kCjR8ZheRX+S3bka53z5CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3461461"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3461461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 02:55:12 -0800
X-CSE-ConnectionGUID: 8mZ1swzRSCSSd1O4wpLVbA==
X-CSE-MsgGUID: owSYk4TcTWmLW+w8PcbK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9654399"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 02:55:09 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH] drm/xe/display: Use the GGTT PTE to find the initial FB in
 stolen
Date: Mon, 16 Nov 2026 18:53:03 +0800
Message-ID: <20261116105303.1374969-1-xiaolu.xie@intel.com>
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
stolen, similarly to what is done for the dGPU case. Keep using the
GGTT address if the PTE doesn't point into stolen.

Tested on a Nova Lake platform: the BIOS FB is now taken over as the
initial FB.

Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b7303..f69532b3a 100644
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
@@ -100,7 +100,23 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
+		/*
+		 * The plane surface is a GGTT address, which equals the offset
+		 * into stolen only if the BIOS maps stolen 1:1 into the GGTT.
+		 * Get the offset from the PTE instead, and fall back to the
+		 * GGTT address if the PTE doesn't point into stolen.
+		 */
 		phys_base = base;
+		stolen_base = xe_ttm_stolen_gpu_offset(xe);
+		pte_addr = pte & XE_PAGE_ADDR_MASK(XE_PTE_SHIFT);
+		if (pte_addr >= stolen_base &&
+		    pte_addr - stolen_base < (u64)stolen->size << PAGE_SHIFT)
+			phys_base = pte_addr - stolen_base;
+
+		drm_dbg_kms(&xe->drm,
+			    "Initial plane GGTT address 0x%x, PTE 0x%llx -> stolen offset %pa\n",
+			    base, pte, &phys_base);
+
 		flags |= XE_BO_FLAG_STOLEN;
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-- 
2.43.0

