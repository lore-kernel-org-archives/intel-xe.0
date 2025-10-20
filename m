Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B0ECCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EBB10E32F;
	Mon, 20 Oct 2025 12:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnvfyjcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E3910E432
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964885; x=1792500885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLWGCo9bxBn3ZbHqqLOZy2C8A+xAcyxSI0cXvZqxt2U=;
 b=WnvfyjcUzBH1PK7OXtyLKqVVzSJ5G9ELcxCFcWAHMMeVCZs73Jop7VWU
 sLsCzhnSjoHjMbaJX1IMzNj9IC1namtXJs7LFjhopu/bz4tMF9fZn638T
 jHEdnf/b2G7OmgxyHH3UDWwuSrt6p791cJ2XKFxl3r1WUrWFtlWrPZYp6
 GD0HXRaBjG9tVPmXbne4yDzwR7otZgQDqFk6kgODLCa52SDKEIU20oA5d
 0S4IFIajED3F2YqlLUJ0lhLf7btCNd3jZqu85ScuZZ7w3hm+C34LEY/rw
 G3i/yQyrniSt2nW0a4KTtyiCnL55CYmfPeBzrmt3c2pIQAs8tEjapW9ZN A==;
X-CSE-ConnectionGUID: dWdPJCBrQU6BO8ijSX91dg==
X-CSE-MsgGUID: xDSZ9GwLQgaGs4QN6xUblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74422396"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74422396"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:45 -0700
X-CSE-ConnectionGUID: U/1e/9TmSqyAIQOSEzuoQQ==
X-CSE-MsgGUID: DWc7pd9uQcCQTmFp5kORrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182512893"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/7] drm/xe/migrate: trim batch buffer sizing
Date: Mon, 20 Oct 2025 13:54:36 +0100
Message-ID: <20251020125431.41153-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020125431.41153-9-matthew.auld@intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
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

We have an extra two dwords, but it looks like we should only need one
for the extra bb_end. Likely this is just leftover from back when the
arb handling was moved into the ring programming.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 665ab38b39f1..c966b6bad930 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -847,7 +847,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				&ccs_it);
 
 	while (size) {
-		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		u32 batch_size = 1; /* MI_BATCH_BUFFER_END */
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
 		u32 flush_flags = 0;
@@ -1312,7 +1312,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Calculate final sizes and batch size.. */
 		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
-		batch_size = 2 +
+		batch_size = 1 +
 			pte_update_size(m, pte_flags, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
 					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
@@ -1876,7 +1876,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	struct xe_device *xe = gt_to_xe(gt);
 	bool use_usm_batch = xe->info.has_usm;
 	struct dma_fence *fence = NULL;
-	u32 batch_size = 2;
+	u32 batch_size = 1;
 	u64 src_L0_ofs, dst_L0_ofs;
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
-- 
2.51.0

