Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06CCCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B58A10E80A;
	Wed, 22 Oct 2025 16:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmPoFCsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FDB10E80E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151196; x=1792687196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SqB3WQQ9kkxpWFd17N8tG+XT3ACnb2cByknRFVhLmIA=;
 b=KmPoFCsrr2K82kFii4qoJLrOWjLFBLvLbdhsG57HNZHpD/q9zXjdonaG
 IG0e0cEAYB/C1FqdYZkM1PbZKLBPlokA+HXPiAVJjQt6XpujGwM6wE+1z
 V3hxtRrldSX1uwWYEVuiDLighTy81ua2GYQThn7oagShqG2pp0BwVzPUI
 +QU+6KFBfJTFSaQZoSy2/2UAftPIWFTz/6nGm8ww0oBXxFwDuwpk1+Zoi
 +36ni22uEfZKEYu5XtpfbgfTBQkRuUEkK6kxS574DJ8vX1LhP3TrRtQNH
 KrF+VgjYvu2smp0hiJMZKy2RXMI2FpZir6t999mmhruCSxrUu4OtFp6iY g==;
X-CSE-ConnectionGUID: VqvxyQ6TSAWGwL4OEICOUA==
X-CSE-MsgGUID: Z65YMtWuT06OOWYrTW/Scw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911753"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:55 -0700
X-CSE-ConnectionGUID: LUdnARNdTo6ZYsLXcM+TyA==
X-CSE-MsgGUID: Znz2KFYjRxapzxsjf8shRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043698"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 5/7] drm/xe/migrate: trim batch buffer sizing
Date: Wed, 22 Oct 2025 17:38:34 +0100
Message-ID: <20251022163836.191405-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163836.191405-1-matthew.auld@intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
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
index fa87e0eddd09..95aefe2e71f5 100644
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

