Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EDFC0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91A110E893;
	Thu, 23 Jan 2025 18:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d140w2kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AEE10E890
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737655423; x=1769191423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FGdWlyViYfBeyrEe4ErFbnc5OOaxH3mtQPx/d9bCkXM=;
 b=d140w2knz75SHdJ7WWUmvfzFzYvdgFQkqyCKVFuJ8IXYh46w6Vpk972L
 bJPngbes7KwDyJC+wPALTC/nk+6JUU1aXP3OS5+nrQLhtH/RhmHl+xaZK
 hT2JfmVVIsW5q8h38e1PRUZcbuh03sRLMnAzl/nIlC9jzExrgSbZmip48
 3FqEDfeQEi/l4/qPsgPGPi8R5QV1xMYVOIrYUe1nwmIXrFGP0t1P655WD
 /H/m5dveCeCLTt0rnc7ciFarng4+2u89kQtPXbK7S7On/nHHtFGkUcUfw
 ym9n+tVbk9rZRf/nZcZFcj9qOXbW4CcZ5ga5nALAcNiZpvndJGqcka//A w==;
X-CSE-ConnectionGUID: IBbkoQQVQaurMrCfm7bVDQ==
X-CSE-MsgGUID: tCWUu9j8StqRDDqP7FLVlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49162875"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="49162875"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:03:43 -0800
X-CSE-ConnectionGUID: 47tqSbvkQh2rw5EXxjQOeQ==
X-CSE-MsgGUID: luHscZlqST2JIi9UNNbI1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107964052"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:03:42 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/3] drm/xe: Make GUC binaries dump consistent with other
 binaries in devcoredump
Date: Thu, 23 Jan 2025 09:59:42 -0800
Message-ID: <20250123180320.66198-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123180320.66198-1-jose.souza@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
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

All other binaries follow this format:
[name].length: 0x1000
[name].data: xxxxxxx
[name].error: errno

The error ones is just in case by some reason was not able to capture
binary.

So this GuC binaries should follow the same patern.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c  | 6 ++++--
 drivers/gpu/drm/xe/xe_guc_log.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 50c8076b51585..497036675a38c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1723,9 +1723,11 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
 
-		if (snapshot->ctb)
-			xe_print_blob_ascii85(p, "CTB data", '\n',
+		if (snapshot->ctb) {
+			drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
+			xe_print_blob_ascii85(p, "[CTB].data", '\n',
 					      snapshot->ctb, 0, snapshot->ctb_size);
+		}
 	} else {
 		drm_puts(p, "CT disabled\n");
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 44482ea919924..462ec4bb98bb9 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -204,10 +204,11 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
 	drm_printf(p, "Log level: %u\n", snapshot->level);
 
+	drm_printf(p, "[GUC].length: 0x%lx\n", snapshot->size);
 	remain = snapshot->size;
 	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
-		const char *prefix = i ? NULL : "Log data";
+		const char *prefix = i ? NULL : "[GUC].data";
 		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
 
 		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
-- 
2.48.1

