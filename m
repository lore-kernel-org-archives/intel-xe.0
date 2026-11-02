Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63487606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgcoQg2K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA3910E06A;
	Mon,  2 Nov 2026 09:53:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5AE10E06A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613194; x=1825149194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AV3vrdDhM7WPc36BqYCIQNU81o84TJLOF0iF1u4Ufmw=;
 b=KgcoQg2KSiNbQjHKVDXyo+C5I8G9V/BBIagJIYzPS2H53GDDatCslJi4
 8PKATwzSVzf7RCv84V5Z6IRyDCsh29kBHMhKdS2f2PStgye6LbYm2IDl2
 9vQVg2vW3cpPCThxt8yX1cPxV1CQS+hGesCfPJ3h0tNsKlNwhLfqBqSA6
 83fsC8o6fDQwLIKKHa8qoXqdhIoupOAwrcVRFrK0IMM0ZuZMKJc9x2tx3
 s/TyZjzGHg1dd21oqKs3njv25zdOxAuS4gheuoRuOufLBvAiE0ZqsIyNM
 pd/lcH+O6ek1YW+ZaNu6R4iWbXbcZ0dt5fEm8UOfdRfl8uWJfwPrK2lWb g==;
X-CSE-ConnectionGUID: Te95V5myQe6x63OKR/cbAg==
X-CSE-MsgGUID: xTr/Bl8WS+aDLkVKPbwXCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2177090"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2177090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:53:13 -0800
X-CSE-ConnectionGUID: MmO5VOZpQA+v3G3aJDYe2A==
X-CSE-MsgGUID: c57EqIi3T4yQReSmDoSbrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5994079"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:53:11 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aleksander Czerwionka <aleksander.czerwionka@intel.com>
Subject: [PATCH] drm/xe/query: Use ordered clock reads for engine cycles
 cpu_delta
Date: Mon,  2 Nov 2026 15:15:58 +0530
Message-ID: <20261102094557.2321150-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

cpu_delta is meant to bound the time taken to read the engine timestamp
register, but it is measured with local_clock(), which on x86 is a plain
RDTSC that is not ordered against loads. Either end of the window can
thus be sampled while an earlier MMIO read is still in flight.

A reproducer looping on DRM_XE_DEVICE_QUERY_ENGINE_CYCLES on BMG reports
cpu_delta as low as 18 ns, while the MMIO read alone takes > 1.5 us.

Use ktime_get_raw_ns() at both ends instead. Its clocksource read is
ordered (rdtsc_ordered() on x86).
With this, the reproducer reports min/median cpu_delta of 1567/1745 ns
and no short values.

Fixes: 7793d00d1bf5 ("drm/xe: Correlate engine and cpu timestamps with better accuracy")
Cc: <stable@vger.kernel.org> # v6.8+
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Aleksander Czerwionka <aleksander.czerwionka@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..9cc35fc83954 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -6,7 +6,6 @@
 #include "xe_query.h"
 
 #include <linux/nospec.h>
-#include <linux/sched/clock.h>
 
 #include <drm/ttm/ttm_placement.h>
 #include <generated/xe_wa_oob.h>
@@ -97,13 +96,14 @@ hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
 	u32 upper, lower, old_upper, loop = 0;
 	struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
 		      lower_reg = RING_TIMESTAMP(hwe->mmio_base);
+	u64 delta_start;
 
 	upper = xe_mmio_read32(mmio, upper_reg);
 	do {
-		*cpu_delta = local_clock();
+		delta_start = ktime_get_raw_ns();
 		*cpu_ts = cpu_clock();
 		lower = xe_mmio_read32(mmio, lower_reg);
-		*cpu_delta = local_clock() - *cpu_delta;
+		*cpu_delta = ktime_get_raw_ns() - delta_start;
 		old_upper = upper;
 		upper = xe_mmio_read32(mmio, upper_reg);
 	} while (upper != old_upper && loop++ < 2);
-- 
2.52.0

