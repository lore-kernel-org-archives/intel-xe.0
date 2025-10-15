Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83321CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4725010E810;
	Wed, 15 Oct 2025 14:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Au3WbGJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724C10E813
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760538026; x=1792074026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+YAb6IH2Y0ZEHR6N0O5NVpKFQX1amMdz7vWe7aR8AXA=;
 b=Au3WbGJpuoei7wuclDrmYdYgBB2N3Q4s9vGbr6Yi8LSW4b8BtX3Bt6r0
 ni0L4xkGcaCP3vqE3Cj/UQhEhY2RZTvCWvuaewxHOL+6I16Blu8in0CD2
 KhJSqp/HutDu7DPFq+TMbgmj067nbC0OPpRiGEio0SySdfItQ6SHv4ZYo
 vZdUpo/FkCWMXWRxxUtPl1WZAI/eitvARQa2w1gC5vTI+h8CeDR+Psfci
 8KR/cIsX9zgoSAbgMBzv6MWwyPLmXwC6etm9vQCTObehvLo18Dgd4QxSI
 cvEzs1YFmGvdBvL+Ym89Qeyj8zTHsgiGUFZHVGnj6Fq9QtGOLA1dpj7QE A==;
X-CSE-ConnectionGUID: nhTYY9t8R4G8mGew+7ZxiQ==
X-CSE-MsgGUID: Xlxrul1LTfeDwUlnu7Jx9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="72990282"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="72990282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:26 -0700
X-CSE-ConnectionGUID: +qQjXjrSRgOW80PqSktjag==
X-CSE-MsgGUID: CqfrGy3ERFW5MhMxU/PvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="181740964"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:25 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/6] drm/xe/migrate: fix batch buffer sizing
Date: Wed, 15 Oct 2025 15:19:33 +0100
Message-ID: <20251015141929.123637-11-matthew.auld@intel.com>
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

In xe_migrate_vram() the copy can straddle page boundaries, so the len
might look like a single page, but actually accounting for the offset
within the page we will need to emit more than one PTE. Otherwise in
some cases the batch buffer will be undersized leading to warnings
later.  We already have npages so use that instead.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a4861ede6cef..6b6caeb5cdc6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1894,7 +1894,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
 
-	batch_size += pte_update_cmd_size(len);
+	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
 	batch_size += EMIT_COPY_DW;
 
 	bb = xe_bb_new(gt, batch_size, use_usm_batch);
-- 
2.51.0

