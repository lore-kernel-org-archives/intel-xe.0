Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC77B606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrHXCRX/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEAD10E394;
	Tue, 10 Nov 2026 23:15:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466A110F519
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352497; x=1825888497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ycIIR0aos+cYvNc4YxfHIMCnI2FjPNHniDVwPVzjyM=;
 b=QrHXCRX/7v0cJfKvptS7nXm4kWxi1wf3G819AnnvyqFq6EBOWaYWC43e
 Oxsh3vQ9fWZGiIqPBa0ZbUGG/hiBjiUPDuEFSrb+JajYsfpwGS0BYjgUs
 9Sp/ALBmbWRqBayY2O4FwlQLALhyVqxBaeNGh/nmGcaU3bb9GO0yjfDpD
 gQcEMw/xpJjNBZVAT52+DpmDIlTmWvcLjTmd94N1ZEsSyaahW+mF1ZaC3
 bh4XOrlHkaZ0glTT1ZMyDTV++gdRfyMcyJKnkeIEgXj9TOFZ5jkHWwv7w
 /3xi9gQt50sjNLInH9mUOyn0l+93gSEGSeaIAFgBKZayMEexjo5iYsqGY w==;
X-CSE-ConnectionGUID: gsSA/a53QLmDBOT0AwTi2g==
X-CSE-MsgGUID: wW9qTgxyQFOjCkU6+tenJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120826"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
X-CSE-ConnectionGUID: JU4ar2+sRbax8hEB+NM9zQ==
X-CSE-MsgGUID: 5daUA6SNQXy4bXHwSWANDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133957"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 04/11] drm/xe: Guard per-tile primary GT accesses
Date: Tue, 10 Nov 2026 23:14:46 +0000
Message-ID: <20261110231442.218721-17-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
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
 drivers/gpu/drm/xe/xe_memirq.c    |  9 +++----
 drivers/gpu/drm/xe/xe_tlb_inval.c | 41 ++++++++++++++++---------------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3433518cc095..315f28661c63 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -578,16 +578,15 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 
 	/* GuC and media GuC (if present) must be checked separately */
 
-	if (memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
+	if (tile->primary_gt &&
+	    memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
 		map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
 					    XE_MEMIRQ_VECTOR_OFFSET(0, ilog2(INTR_GUC)));
 		memirq_dispatch_guc(memirq, &map, &tile->primary_gt->uc.guc);
 	}
 
-	if (!tile->media_gt)
-		return;
-
-	if (memirq_received(memirq, &memirq->source, ilog2(INTR_MGUC), "SRC")) {
+	if (tile->media_gt &&
+	    memirq_received(memirq, &memirq->source, ilog2(INTR_MGUC), "SRC")) {
 		map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
 					    XE_MEMIRQ_VECTOR_OFFSET(0, ilog2(INTR_MGUC)));
 		memirq_dispatch_guc(memirq, &map, &tile->media_gt->uc.guc);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index c9cc5842d65b..32b62b76e6b0 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -624,28 +624,29 @@ int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
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
-
-		if (!tile->media_gt)
-			continue;
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
 
-		xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
-					&fence[fence_id], true);
+		if (tile->media_gt) {
+			xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
+						&fence[fence_id], true);
 
-		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
-					 &fence[fence_id], start, end,
-					 asid, NULL);
-		if (err)
-			goto wait;
-		++fence_id;
+			err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
+						 &fence[fence_id], start, end,
+						 asid, NULL);
+			if (err)
+				goto wait;
+			++fence_id;
+		}
 	}
 
 wait:
-- 
2.43.0

