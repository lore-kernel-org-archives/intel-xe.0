Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8C606A334
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YsNFwOj3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B9210E3C0;
	Fri, 27 Nov 2026 12:15:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBF510E84C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795781698; x=1827317698;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Dd7czyNz0ivoFqsr9jeTfhf+qZX2qQcgw731/BAzq0k=;
 b=YsNFwOj3uk9iQb2aEIfAoijPI4sDjcXPUmuYaQ2SiKAaP6JtlOTHg/6L
 cWqylAYK2R5lnPpVBBAr/ctyKQ6CczoIdK6nUfA1MX2hnGpo6vswZplGt
 q5kEDc50j1ALvnQ6LKYrDDwzG74BPjOI0qCfRRdQDjfsCREehb/yonYy8
 7TetBdJBrqIpbcqL1JZVPJtEOqrfwe9g1j5+pk3JHT0jrMQalOiRq6W4n
 7ALe7/NrkAn7VrT+97v4U7Evylff7FsFamP1EIoSf56xJUeN7/TPxiFP1
 fdckrIlVMXkO1Fq9CxEmH6lPsAa40FA2THMNV7LjAWh/tVe7I2Oh+ihYF Q==;
X-CSE-ConnectionGUID: qAF9XNpuRBabO56IF6t9kQ==
X-CSE-MsgGUID: 6WUbQTHWQWGKc2lBsUg0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4599400"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4599400"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:56 -0800
X-CSE-ConnectionGUID: 1SJFwM8JTMqlJuw22RuYqQ==
X-CSE-MsgGUID: NouWB4f0RyeTBsOMkmHY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14404703"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:55 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 27 Nov 2026 12:14:13 +0000
Subject: [PATCH v2 3/6] drm/xe/migrate: avoid interruptible waits once
 passes are in flight
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-migrate-bb-optimise-v2-3-808d0d520ddb@intel.com>
References: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
In-Reply-To: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
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

v2:
  - Add Fixes/stable tags (Thomas)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.12+
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cab2a26921e4..31392e7957ea 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1401,7 +1401,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
 			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
 
-		bb = __xe_bb_new(gt, batch_size, usm, intr);
+		bb = __xe_bb_new(gt, batch_size, usm, !fence && intr);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;
@@ -2070,7 +2070,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (WARN_ON_ONCE(!clear_L0))
 			break;
 
-		bb = __xe_bb_new(gt, batch_size, usm, intr);
+		bb = __xe_bb_new(gt, batch_size, usm, !fence && intr);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;

-- 
2.56.1

