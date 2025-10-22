Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A04ACCF9E1
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDC110E814;
	Wed, 22 Oct 2025 16:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffBKvJxE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE83A10E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151195; x=1792687195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wMCorzDQm7HmA1ZVx8+rRURJapyKen8xnB3za8jmxSc=;
 b=ffBKvJxEvBgADtt7SfUy56FwbEAvn2bwAqRWHU9xLSsnUeTvzOSB5kOZ
 a0iD14mTjDAfk7U+qxbEkth7tZNW+MuMKhtD+HN88ecufCUjXwsIK1o/l
 /GmMFcbjyhlfIJPmR9Qt7qwlJFSppxBPNA271G7Hsdz7VE0ZepsZ/rdvp
 kbmg9q0S6e0mRLBJ5ZxS0QDNGaYilOX3O466v6BT+pJRVAv0rpVd+5aln
 O8MuatJd3pWBoKEzogGQACTobgJr+bFLKgJub6BsWZOrPzABxDwz6eJCk
 /nIhVgg6e7idwhMoTQn6YRd/6jIWpt2cq2VkKo/1+DGfmb9dov1/+VyTf A==;
X-CSE-ConnectionGUID: JQRJpThBSfCEnjbAk+cr7g==
X-CSE-MsgGUID: PL1OWo5HQLWzBb2neWOLWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911750"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:54 -0700
X-CSE-ConnectionGUID: iwfmne3EQ3CVPM+spsirRg==
X-CSE-MsgGUID: Eigt0NBDQh2xPAnqz/kZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043694"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 4/7] drm/xe/migrate: fix batch buffer sizing
Date: Wed, 22 Oct 2025 17:38:33 +0100
Message-ID: <20251022163836.191405-5-matthew.auld@intel.com>
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

In xe_migrate_vram() the copy can straddle page boundaries, so the len
might look like a single page, but actually accounting for the offset
within the page we will need to emit more than one PTE. Otherwise in
some cases the batch buffer will be undersized leading to warnings
later.  We already have npages so use that instead.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ce5543fa7a52..fa87e0eddd09 100644
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

