Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404B4C36002
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F025C10E198;
	Fri, 21 Mar 2025 16:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuZ8HiMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68F510E195
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742574878; x=1774110878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mq+zpe3KyoXWsJ2xYSObywQzysDm8jVpFloVYTapzJ0=;
 b=kuZ8HiMYqJf4rlh9DmgOJSDAbQKvIzjqPLw1z0v6mcADYOpDSXGawd/j
 UBban6ki1TENoWYvs76tHY6OI7Dyo5N8pBtJUIysGXmj6dJGZfvSgxZmj
 FtKOyFtC28IBaVQ4VyPdVeUMtsc9kp90keyamZJtTY1p0yWElQjnRFqav
 yzdiVfkY8zEnQPyI7SGm2WDw6xT4R3jlUC3GRtohMT2hKEoxhhyU5rykB
 w4M5tDaERP9P1rbWNaxRzWtljEp93NCYgGFGv9y0T7bauJpQ7Whlk2JBV
 zo/XPTq/4qaW2TZFi03v0wCMoPQWJJ49TWncAqRne6weiJeM82S7ifzSY w==;
X-CSE-ConnectionGUID: aYktUFl+SbKXn8cAVscfng==
X-CSE-MsgGUID: rijeYcqnQqa2dMtCXuTAcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43725631"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43725631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:38 -0700
X-CSE-ConnectionGUID: S3rZcSWCSdCrdFRGfzepbQ==
X-CSE-MsgGUID: n1pZyIsZQ8WVO7FPTKWZfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128665389"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, himal.prasad.ghimiray@intel.com,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 4/5] drm/xe/migrate: Allow xe_migrate_vram() also on
 non-pagefault capable devices
Date: Fri, 21 Mar 2025 17:34:15 +0100
Message-ID: <20250321163416.45217-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The drm_pagemap functionality does not depend on the device having
recoverable pagefaults available. So allow xe_migrate_vram() also for
such devices. Even if this will have little use in practice, it's
beneficial for testin multi-device SVM, since a memory provider could
be a non-pagefault capable gpu.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d364c9f458e7..f17234533504 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1609,6 +1609,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 {
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
+	bool use_usm_batch = xe->info.has_usm;
 	struct dma_fence *fence = NULL;
 	u32 batch_size = 2;
 	u64 src_L0_ofs, dst_L0_ofs;
@@ -1625,7 +1626,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	batch_size += pte_update_cmd_size(round_update_size);
 	batch_size += EMIT_COPY_DW;
 
-	bb = xe_bb_new(gt, batch_size, true);
+	bb = xe_bb_new(gt, batch_size, use_usm_batch);
 	if (IS_ERR(bb)) {
 		err = PTR_ERR(bb);
 		return ERR_PTR(err);
@@ -1650,7 +1651,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		  XE_PAGE_SIZE);
 
 	job = xe_bb_create_migration_job(m->q, bb,
-					 xe_migrate_batch_base(m, true),
+					 xe_migrate_batch_base(m, use_usm_batch),
 					 update_idx);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
-- 
2.48.1

