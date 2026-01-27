Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE97CD2FEDD
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B5410E5B8;
	Tue, 27 Jan 2026 19:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCRVTfwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75B910E5B7
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769542662; x=1801078662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRMBxVNj1gpl2FwTqI3Gyv+4f3W0Kyj2QnzRjq8JBwI=;
 b=FCRVTfwXtvjut+2iW3ZTWMItryx9IEbPKkACk8W+sER7EWb1EHi4YyPM
 ucXnhsq/348RyPzmOMGeNL3HbFJ1HDpW+4PcjG5C4JddVjEaHTLaXnqBE
 LJzVgEUmgkz3HId3RtYKw4cMLt1klg5nPRVYEecVyH9aj6F5YnIwmBTim
 qcfxVwymdUxTfAHJryyZ1gIcws67Ph0xFARjnCz3F7niUx/V2dStrhU9V
 a9o0aO3gH52Jix5kl2Oh7AXsv3zMe/LIBKOR27hgjvs8RpWFEEj+YJtNE
 VZ8RRRyTprDPBtXJV+Ss5CaDINb6YmJZQy23t5ez5EYYAvAFB0aYEe/IT Q==;
X-CSE-ConnectionGUID: 3q1Z+t5SS9u0EHUs7rwS4Q==
X-CSE-MsgGUID: e+KeLVBKSf+5BKpgwVm1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69764783"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69764783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:42 -0800
X-CSE-ConnectionGUID: xP4KVDXUQSiCZ28D1olE9Q==
X-CSE-MsgGUID: Im4DV1DFQD2zZOoRFRrjhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207958951"
Received: from mahadzix-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 5/6] drm/xe/guc: Wait before retrying sending H2G
Date: Tue, 27 Jan 2026 20:37:25 +0100
Message-ID: <20260127193727.601-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127193727.601-1-michal.wajdeczko@intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
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

We shall resend H2G message after receiving NO_RESPONSE_RETRY reply,
but since GuC dropped that H2G due to some interim state, we should
give it a little time to stabilize. Wait before sending the same H2G
again, start with 1ms delay, then increase exponentially to 256ms.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
v2: use xe_sleep_exponential_ms helper (Michal)
    don't wait full 1s (Matt)
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2a3b057fc828..231844bce1e0 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -40,6 +40,7 @@
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_sleep.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_uc.h"
@@ -1397,6 +1398,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
 	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
+	unsigned int sleep_period_ms = 1;
 	bool lost = false;
 	u32 header;
 	int ret;
@@ -1479,6 +1481,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 		xe_gt_dbg(gt, "GuC mmio request %#x: retrying, reason %#x\n",
 			  request[0], reason);
+
+		xe_sleep_exponential_ms(&sleep_period_ms, 256);
 		goto retry;
 	}
 
-- 
2.47.1

