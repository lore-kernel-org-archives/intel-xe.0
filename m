Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712F7606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cl0NAJJI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1597D112096;
	Fri, 20 Nov 2026 05:47:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7587010FF2B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153648; x=1826689648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RqBLCYTPKOhh6aFKxyeBauLDaVTwRCXSpq8isnePYMs=;
 b=cl0NAJJI2beLvVPlcaLYKibTnOGcO7QjsK6V3Rlab8EgPnfjvL7RHynt
 tk/804BYkzSqNhsX41qpPj57cotzQA4kzr1UjxFsydNVg0uEAzLWc1hnb
 0MmWM9evyvYu+d9ivYoj9IvzceU9tHuGR8DBMJ2GyBU7QSu6/srETsVV9
 yV2Q89xsm7m1MebxMeM6+nKSd9F/9ReClFYViu3XqExjdiiHN1/ZZhbSy
 9sg8NJc7gdrUmLmobDn2rPZe6IbXaOKfXBO8nwe5byQIdmQm8cB3TGYJs
 P/I4Xv7XwQi0VYXKcNtlPeQH18lkfESpO/R1TAFZ9Gj4SnYDheg9XxuFo g==;
X-CSE-ConnectionGUID: 3dnootsHTsS+34W5rtreUQ==
X-CSE-MsgGUID: 5q8Cxb2DSBq9dNpADKGNxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4018529"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4018529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:17 -0800
X-CSE-ConnectionGUID: 9BSY0NvlSV6V+gthD/CdSw==
X-CSE-MsgGUID: u1nST+rFSayQwZ+2zrylWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10617142"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:16 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 08/16] drm/xe: Guard per-tile primary GT accesses
Date: Fri, 20 Nov 2026 05:47:19 +0000
Message-ID: <20261120054712.377573-26-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120054712.377573-18-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
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

