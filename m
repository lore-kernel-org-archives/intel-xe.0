Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38F5CCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632410E435;
	Mon, 20 Oct 2025 12:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hg44CWeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268C10E430
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964883; x=1792500883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EpJ8jgtmqQohNXKDznfbtRxV/DGslqM+2pBoS2+ajcA=;
 b=Hg44CWeSHpg6041uYfFCL3oOhs2J3asK3PscbdlbDzLc7pEJGoMCSrDP
 +ct6gAnrpNdG5fmOKnM0yZeqlipZUsE6aIZHSydOmMp+mso0K28AVh4A2
 iD3XTGHo7zbsKRkQLeLVNT7Z1CkV7+A7S71UmqN/XlIDZkI/fauNNw4gp
 lhJ7+4fRvc6HNUvUn/5wJjyHDvLeFxDRqOlDNeKKjI5OBOWHm2PP2nZN4
 TbZBrexpXkWJBRKbDzn+5HMDFSwFb1BC99T64CFzXn8jchxVArZ36NXhV
 2qYAABn85NsVSqa2meo651ig8LTT4RpjU+EdwGHSv7ivqL6SbydlWfrDI A==;
X-CSE-ConnectionGUID: EgY07xUZTPuQoMEEvJJ/rg==
X-CSE-MsgGUID: 3W4KlhqBRpSxVOzdyRCF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74422392"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74422392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:43 -0700
X-CSE-ConnectionGUID: hx0E1JNpR8iQpEJveM9LxQ==
X-CSE-MsgGUID: tsBHZHxkTdyDp0uPQIXnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182512883"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/7] drm/xe/migrate: fix chunk handling for 2M page emit
Date: Mon, 20 Oct 2025 13:54:34 +0100
Message-ID: <20251020125431.41153-11-matthew.auld@intel.com>
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

On systems with PAGE_SIZE > 4K the chunk will likely be rounded down to
zero, if say we have single 2M page, so one huge pte, since we also try
to align the chunk to PAGE_SIZE / XE_PAGE_SIZE, which will be 16 on 64K
systems. Make the ALIGN_DOWN conditional for 4K PTEs where we can
encounter gpu_page_size < PAGE_SIZE.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8ff2d3b98e7f..7643715f63cc 100644
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

