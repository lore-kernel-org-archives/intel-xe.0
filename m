Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B44CCCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4302010E80F;
	Wed, 15 Oct 2025 14:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cy8GxnIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC32810E82B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760538025; x=1792074025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mwAhyUSV52VTEe9+SbnkQKa6RMaUCSWW82YCL+JXWUc=;
 b=Cy8GxnIYZREg1tMxaCyx0T1QJck00ef05Ig2APPfutpQdwx2kyn86dA1
 lwjXWg//d/DNx8VTQA0obLVIV9TGCNSWUFa/qVUuxOw+qThK8FdEGf7LA
 LcId+JtcETVIW2r4Tem+Jrw5rfbilOx8/LE0d57ZhkLs3n4wl6nSzBOCe
 8OKiDrepJSmGoavBJ9yv3H7N4FGIHKHcybJYaIBVJqGok0xm6Mwv1bJHg
 zypw5Sr4m6ASvvBfZGYfDWv8/J/7HJ2DRw5pfJHuJJRc3pG/N6uAq0ebT
 K37ULHL9KHmBhKWBDm3cqy6gCda2XczlvZ0+LmAN29DbM5qp4zP0UMhLb Q==;
X-CSE-ConnectionGUID: WOKx5pveQWyZALxf/0JwxA==
X-CSE-MsgGUID: pSh6dS7ES6qNNuimAhitHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="72990279"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="72990279"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:24 -0700
X-CSE-ConnectionGUID: B7bf7rCNSGqNKrdGbFEQNQ==
X-CSE-MsgGUID: UkvDUbc7R+uA9PMDZLHmpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="181740960"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/6] drm/xe/migrate: fix chunk handling for 2M page emit
Date: Wed, 15 Oct 2025 15:19:32 +0100
Message-ID: <20251015141929.123637-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015141929.123637-8-matthew.auld@intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
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

On systems with PAGE_SIZE > 4K the chunk will likely be rounded down to
zero, if say we have single 2M page, so one huge pte, since we also try
to align the chunk to PAGE_SIZE / XE_PAGE_SIZE, which will be 16 on 64K
systems. Make the ALIGN_DOWN conditional for 4K PTEs where we can
encounter gpu_page_size < PAGE_SIZE.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ff8e442bf519..a4861ede6cef 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1804,7 +1804,9 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
-		chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
+		if (!level)
+			chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
+
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = pt_offset;
 		bb->cs[bb->len++] = 0;
-- 
2.51.0

