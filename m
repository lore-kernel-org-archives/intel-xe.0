Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C2606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlVJE74L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FED810E9AE;
	Thu, 26 Nov 2026 13:58:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ED510E9AE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795701483; x=1827237483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mgGdUu8Jsor7p2qcdkI9bkf3t6Qdl3J/D/guQ/cBln4=;
 b=jlVJE74LLqOMSfP/oEctzYDjGjkC0DUCtXh5+xCteAUjYuqnhpVaELnr
 y9WkNFOCkvBRtebNF6EGAuEDmDuv0zZS0MFeq1bwFViD7K3g6XwHhu0xw
 VTJKWNoyfKRBVI33Y+xTIgbV2uvrcprmldU+Akk2Jcmmd74EIccgO0dz9
 yt2q3v+od7tmd6IbcOylofmTkHWAJp6Wdm+pWTuyF64PemK6HffpMLStU
 rdBN4I3DUGLIjMCvub+RGr93Vt48hNkDcytfkgv5HpWUZsmgNyHJYzXz8
 xLDWkfRuX0UjIQaJRlC4pHvrugpq4O+/73wY7EMH8WzgXTRYcAosSuNuv g==;
X-CSE-ConnectionGUID: uAt4/842SFqJFex5R99Jgw==
X-CSE-MsgGUID: XrvCYH1eT7iuzrGRicvAtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4520612"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4520612"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:58:02 -0800
X-CSE-ConnectionGUID: 1d1oyae6St2rj7zQyQ09bA==
X-CSE-MsgGUID: T4QqM4KnSvG0u755C4jWVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12684411"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 05:57:59 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v1 5/6] drm/xe/pagefault: Use xe_log_err_atomic() for
 queue full errors
Date: Thu, 26 Nov 2026 19:27:37 +0530
Message-ID: <20261126135732.2169939-13-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
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

xe_pagefault_queue_add() runs in atomic context with
pf_queue->lock held under spin_lock_irq(). Then
use xe_log_err_atomic() instead of xe_log_err().

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 6c4e5e77e1c6..f1de496c9903 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -369,7 +369,7 @@ xe_pagefault_queue_add(struct xe_pagefault_queue *pf_queue,
 	do {
 		/* Not possible, warn on and drop page fault */
 		if (WARN_ON_ONCE(xe_pagefault_queue_full(pf_queue))) {
-			xe_log_err(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");
+			xe_log_err_atomic(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");
 			return NULL;
 		}
 
-- 
2.48.1

