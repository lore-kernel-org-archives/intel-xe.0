Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46E606D83B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 20:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nt0FkrZO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427CE10F1D9;
	Mon,  2 Nov 2026 20:06:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C80510F1D3;
 Mon,  2 Nov 2026 20:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793649983; x=1825185983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sqwF5koL8AP3LB0wgv/MTTxH79kNm2LxlGwWOnr2EuY=;
 b=Nt0FkrZOSA+YknhutMWSFr7CQie2npROHg3tYAhNPtc9Pl1jpyF6WVkb
 VxT4trS6eXWOpwwak+hzf9S+/U8AhNXWncfG9sUhTNXoqvrEBQ4aOYDWw
 teP8WSWyJ21Js+MX1WbXc/P5li4LHIHJpkuCmmIjwhH7pqpQuo6p4S5/r
 Sr3DD4zthuDVgUhm8vYQVxLFBuhjP+nxSgRtTuLRYpmDS530TmK778UN/
 e5Vy1ls0HZa5ETUrc9FrvhLpdNH4eCQbxEVAnsI71ZzuJh3M6fCdG8BhN
 oUVzE0NCTWDBwzafgHidsikSDxo7x5xsfVvM0Vv93rUN0M2Qx6M77VMbE A==;
X-CSE-ConnectionGUID: jrYtKiPSQfCCAXpySGSbGA==
X-CSE-MsgGUID: DTpf+KQvRjOjgxK9LPDnfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2371254"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2371254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 12:06:23 -0800
X-CSE-ConnectionGUID: 4ezcMXSYRR+HqedtWMc/Dw==
X-CSE-MsgGUID: TAy6u4EBTqmn4Q3l5gxW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6077427"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 12:06:23 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: jani.saarinen@intel.com
Subject: [drm-intel/topic/core-for-CI] Revert "io_uring/sqpoll: don't attach
 to a thread that is canceling"
Date: Mon,  2 Nov 2026 12:06:04 -0800
Message-ID: <20261102200603.2605130-2-umesh.nerlige.ramappa@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit 22d9db9fd64a493525d692b32c556875b7254665.

This is resulting in igt@runner@aborted on Xe and i915 runs, so
reverting the patch. The actual fix is still in flight on the kernel ML:

[PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit

Until that lands, revert this one.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17747
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

