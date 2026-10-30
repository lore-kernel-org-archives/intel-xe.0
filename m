Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC86606A324
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iFlcLiau
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E20611277C;
	Fri, 30 Oct 2026 11:50:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4F911277E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361012; x=1824897012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e2FUwlCfLVszVb/GLnuIgymh/l3fz1bbhhm0GVYpJRg=;
 b=iFlcLiau++Z3b2X9YKt1rGcxXZQaU0D9M/Q63n9dVE4rm7byPBWjGyq9
 AzPznHTDnakekTElEQuKaaQ1xXtI8y7s+SeW0QabjCegVaXkrxIGvNFye
 fYq2s5kqlKL/8UGzXREXSIyNXTI0lUNdipKkWx1ERzQ8W5Ih5gYUvBBUh
 UIXFhGUxQZP7BZ3xYSVcduSThNzJTrcVytDk0CwqcKRWBk9tp8sieieay
 /ICeiKBbDcEu0wteJJRu24WHFmglqLo26rd0mWkTiJZQFor+vqzP9sq7h
 pTcTCbJNglUJJJJoWXAkeIK2pvAPhYeE7vZW4K3lCB3hEsnuQc4YjfALa g==;
X-CSE-ConnectionGUID: SP2EbDQQQCGbr04FJt1X8A==
X-CSE-MsgGUID: iKAlGDM3QaCtja/C1ZMVog==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135394"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:09 -0700
X-CSE-ConnectionGUID: zD6JwD73SbaRS5iuQx9deg==
X-CSE-MsgGUID: QdaCtLg6SluZuI/11NGBuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5441169"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 6/6] drm/xe/migrate: avoid interruptible waits once passes are
 in flight
Date: Fri, 30 Oct 2026 11:49:56 +0000
Message-ID: <20261030-migrate-bb-optimise-v1-6-b8d01649cfe9@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Once at least one pass has been submitted in xe_migrate_clear() or
__xe_migrate_copy() (fence != NULL), aborting a later pass with
-ERESTARTSYS when the bb pool is full still has to wait uninterruptibly
in err_sync for all in-flight passes to complete, only to discard that
work and restart the entire transfer from scratch.

Only wait interruptibly on the first pass (!fence && intr).

Assisted-by: LLM
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index dd326bcd12b1..881ff933c736 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1316,7 +1316,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
 			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
 
-		bb = __xe_bb_new(gt, batch_size, usm, intr);
+		bb = __xe_bb_new(gt, batch_size, usm, !fence && intr);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;
@@ -1992,7 +1992,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (WARN_ON_ONCE(!clear_L0))
 			break;
 
-		bb = __xe_bb_new(gt, batch_size, usm, intr);
+		bb = __xe_bb_new(gt, batch_size, usm, !fence && intr);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;

-- 
2.56.0
