Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B204606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNgSpWZU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335A610E0D0;
	Thu,  5 Nov 2026 23:32:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355A4112A2B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921555; x=1825457555;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=vOlswKwvsFBvcI+OGzfpQVP/oQ65a8hlalwh+gNhSj8=;
 b=RNgSpWZUUg3+F/uPyiBEY/eKF4Lz8rCIzvQEsxXripwxVsv5o+ldAKpx
 dMRQGQ2vdiBUtV7IiGS6uVKaj4wY8K6ZJ38TeolhbF7vo3iPY5NlTLBnB
 DW/seD7MFUg7YbAdPj6jPaApVA4wagdxV9XYKa2W/YrujMbK3/qqK4Bfr
 YaSDGz/kT/15WThU1XrIrfzAuYY2hfRi79KxLSN9uxCKpBKlMae92R7+B
 nVJ/f4iiMq2+gO55g+LffTzCG18AGU/nOk4sOLl2X4ofEPpFAcOvX0iBM
 MmRevokj+1K5lgt4cDwCwriHO8XqJUDXlUqRLx0NkPglhA+ovE46O+P8E Q==;
X-CSE-ConnectionGUID: 37Pl+gIESCu3JAR5VmZkOw==
X-CSE-MsgGUID: uZ9fplXjTVChsqDbsCOzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769911"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769911"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:31 -0800
X-CSE-ConnectionGUID: gM81+dTLQXy+e5STc4qeJg==
X-CSE-MsgGUID: TUUoJKabTRO1P5F7CpsAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7187000"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:30 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Nov 2026 20:31:54 -0300
Subject: [PATCH v3 07/10] drm/xe: Replace MAXCNT comment with a comment on
 adjust_idledly()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-wa_16031259911-v3-7-da6ec790aa29@intel.com>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
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

The adjust_idledly() function does more than what the comment on the
call site says.  Drop that outdated comment and document
adjust_idledly() at its definition instead.

v2:
  - Add a comment above adjust_idledly() instead of just dropping the
    call-site comment. (Matt)

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 08bd8754ad09..7950e118ee1d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -596,6 +596,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_whitelist_process_engine(hwe);
 }
 
+/*
+ * Apply workarounds that require adjustments to RING_IDLEDLY.
+ */
 static void adjust_idledly(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -719,7 +722,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			xe_hw_engine_enable_ring(hwe);
 	}
 
-	/* Ensure IDLEDLY is lower than MAXCNT */
 	adjust_idledly(hwe);
 
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);

-- 
2.56.0

