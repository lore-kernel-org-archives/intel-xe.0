Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73D606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E+Qe8nJN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B4310EA2A;
	Sat, 21 Nov 2026 18:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC510E9F4
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285416; x=1826821416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RqBLCYTPKOhh6aFKxyeBauLDaVTwRCXSpq8isnePYMs=;
 b=E+Qe8nJNMU5mvE+32vPXjHYgrTEfQwDhQ1zTx1IkSt1raz5DIswCIWyZ
 RnR0YMdyPhm1XW71YYjItIFSnMXmeBY7XxdAj9ViTeepLmX8OCwHgKU+y
 PbLbJcm7cVnn7p6WjV5cTAxoNU/RK0wfTOkbP/CgxXDMgvdJorulzFRTl
 cn/qmH4M8homDciLlAJ4AXMgs2h95l/pz3bht3bsu0lZ8lmefeLRsUERC
 K9V/3wXgqEIxM9T8LBhgpBAGDznWjETFqyAll9ZqYq609blwqOSBXFwRh
 rR8MxVmiX3sIUOSgyDkc85PIQWs6p9oYvMKPsZ5E/I37Hizo62RgrsJJ9 g==;
X-CSE-ConnectionGUID: TBSK3f2NQ0mWyavoMCUeXw==
X-CSE-MsgGUID: 7zL9kDwSRHSWHCRRKA+VFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034063"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: SjnDA3ogS7ywZK2bdKtrWg==
X-CSE-MsgGUID: Rjl3SJj0RHSXZX+CA9jyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934425"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 08/17] drm/xe: Guard per-tile primary GT accesses
Date: Sat, 21 Nov 2026 18:23:24 +0000
Message-ID: <20261121182317.48981-27-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A tile's primary GT is now optional, just like its media GT already was.
The TLB invalidation and memory interrupt paths walk both GTs of a tile
but only test the media one for presence, so they would dereference NULL
on a device whose graphics IP is absent.  Mirror the existing media
checks for the primary GT.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c    |  3 ++-
 drivers/gpu/drm/xe/xe_tlb_inval.c | 20 +++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3433518cc095..0ef3df10ac49 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -578,7 +578,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 
 	/* GuC and media GuC (if present) must be checked separately */
 
-	if (memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
+	if (tile->primary_gt &&
+	    memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
 		map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
 					    XE_MEMIRQ_VECTOR_OFFSET(0, ilog2(INTR_GUC)));
 		memirq_dispatch_guc(memirq, &map, &tile->primary_gt->uc.guc);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 1fd39434dc0e..6ef7860c7ff3 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -624,15 +624,17 @@ int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
 		if (!(tile_mask & BIT(id)))
 			continue;
 
-		xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
-					&fence[fence_id], true);
-
-		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
-					 &fence[fence_id], start, end,
-					 asid, NULL);
-		if (err)
-			goto wait;
-		++fence_id;
+		if (tile->primary_gt) {
+			xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
+						&fence[fence_id], true);
+
+			err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
+						 &fence[fence_id], start, end,
+						 asid, NULL);
+			if (err)
+				goto wait;
+			++fence_id;
+		}
 
 		if (!tile->media_gt)
 			continue;
-- 
2.43.0

