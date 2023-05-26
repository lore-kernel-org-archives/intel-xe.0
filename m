Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551E2C77B73
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 14:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C6A10E803;
	Fri, 26 May 2023 14:37:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EAA10E7FC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685111832; x=1716647832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4rBr8XH57z23keTviQqStCq0xprVTxW5AvGW3RG72bw=;
 b=KTP9npX+UM+s6PkGZqSjkJdhq0+Ru8MBSigUUZcTbsF+dHRAh4kq4ryi
 sUJXC1Fgl/2LjigRsRvdcLX89AblUlWzfQa1VWvZUBLa0Bw8PvAuzKo3k
 AuOzIHAqidVmTBehZkXQVWGS19jn9gVj1BBorXUpbGKD2DZoh9d+0rjW7
 2Qnjk56W6GbCmQVFpMh1rSJ7Vz68hrjQSK5qHqh1WpXPhAP2IWx5fXLrm
 D83KNtlRjcPRMBFFmxWzfUXldNCsUN1d7oygpSVqKuwVwYTMUSEuWqF51
 yQDnSMJcWp7t1CTk0HPdO/rHbmmAcjwiB8o1+BIw6HW8EQXsJ2f7GosQt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333839107"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="333839107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 07:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="770362696"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="770362696"
Received: from djustese-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 07:37:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 16:36:56 +0200
Message-Id: <20230526143657.226637-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526143657.226637-1-thomas.hellstrom@linux.intel.com>
References: <20230526143657.226637-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Fix the migrate selftest for
 integrated GPUs
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The TTM resource cursor was set up incorrectly.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0f4371ad1fd9..f8ee9b9fca99 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -303,9 +303,14 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	expected = gen8_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0, 0);
 	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
 		expected |= XE_PTE_PS64;
-	xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
+	if (xe_bo_is_vram(pt))
+		xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
+	else
+		xe_res_first_sg(xe_bo_get_sg(pt), 0, pt->size, &src_it);
+
 	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
 		 &src_it, XE_PAGE_SIZE, pt);
+
 	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
 
 	retval = xe_map_rd(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
-- 
2.39.2

