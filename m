Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46BF606A331
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h9HrbPQ0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6310E6DA;
	Mon,  2 Nov 2026 20:30:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B28810E6DA
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 20:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793651398; x=1825187398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jELaEnEXewB2iDn74exfign1dXkCuvH/oOgMi+5ielI=;
 b=h9HrbPQ0TcRXXnqdzzSMXknBNsxBpw0tf2OJg4+JwUxGKZsGUCUvrJc8
 RbMX5tf4xz2eKVMc/8X6H6iiafTg4OO1v52hNBBTxgvn+jXmerveogvDc
 GW87J8KJVabKCCy2fImzIPer/IHZhwy36oL47RgcS3Et3fhqnsgLiZbHJ
 +AECGZoaTZzB0kx3pkVgtZCSh1esKcs1BCs79z1buXdbXJUb1j4FVKDv0
 g14VFiZmDNaWo8ZzOVrBe7aOp22fa16JjzxeL1V5V3BNujp044OEAgdnN
 fZFjGklKtU7zRcY2uyoc6pz3WQYXBEHQoeqNEOdp4nfaZmANvy4AfvGnP g==;
X-CSE-ConnectionGUID: Ag7CLB/nSd6yMndwRnGHJw==
X-CSE-MsgGUID: fcmvEZTdRziKgNRybJUxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2377661"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2377661"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 12:29:57 -0800
X-CSE-ConnectionGUID: EzrSVN9VQv+OktLzZ5n3QA==
X-CSE-MsgGUID: QaTfPtQoSzqst9uJNESQDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6127207"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 12:29:57 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: rodrigo.vivi@intel.com,
	intel-xe@lists.freedesktop.org
Cc: jani.saarinen@intel.com
Subject: [drm-intel/topic/core-for-CI v2] Revert "io_uring/sqpoll: don't
 attach to a thread that is canceling"
Date: Mon,  2 Nov 2026 12:29:48 -0800
Message-ID: <20261102202947.2811726-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

This reverts commit 22d9db9fd64a493525d692b32c556875b7254665.

This is resulting in igt@runner@aborted on Xe and i915 runs, so
reverting the patch. The actual fix is still in flight on the kernel ML:

[PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit

Until that lands, revert this one.

References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17748
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9717
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17747
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 io_uring/sqpoll.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index c833e776320d..49c52284ecdd 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -433,12 +433,6 @@ static int io_sq_thread(void *data)
 	if (io_sq_tw_pending())
 		io_sq_tw(UINT_MAX);
 
-	/*
-	 * Cancelation drops sqd->lock while it waits, and a ring could attach
-	 * to a thread that is on its way out. A fatal signal doesn't set the
-	 * bit, so set it here for io_sq_offload_create() to see.
-	 */
-	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
 	io_uring_cancel_generic(true, sqd);
 	rcu_assign_pointer(sqd->thread, NULL);
 	put_task_struct(current);
@@ -508,10 +502,7 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
 		list_add(&ctx->sqd_list, &sqd->ctx_list);
 		io_sqd_update_thread_idle(sqd);
 		/* don't attach to a dying SQPOLL thread, would be racy */
-		ret = 0;
-		if (attached && (!sqd->thread ||
-		    test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)))
-			ret = -ENXIO;
+		ret = (attached && !sqd->thread) ? -ENXIO : 0;
 		io_sq_thread_unpark(sqd);
 
 		if (ret < 0)
-- 
2.55.0

