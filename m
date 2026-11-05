Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2BC606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 00:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncgnlMdl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640AA10E8E2;
	Thu,  5 Nov 2026 00:16:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636A510E8E2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 00:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793837783; x=1825373783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2DXalGQ2wFTo6QHYhIzOlmwb68MCQeL6IcOaOVi3tE=;
 b=ncgnlMdlfbyWqFkfbJx+VXPnOOFaq3EmveevN0cCKY1kVZq/56QTkbcT
 Iz8s8yIedNygbQM1Vezxr5W52PW+0jmRXf+t57Wtdytc1h743Zc/8aJ8I
 EzcpsoiVDWA/rO1oODqzZFWr2nSxkiM/5IGDMUf1wIEXz+Tmiz2Ui8mAa
 PXcv7qzxt97rCowM6FwpqUi+4zm4s8PaBYC9h3tSDIuFoMdsXE+oKEHKY
 BO6ToEE+xdVpOKd8ZQgeBLiPaDJEIpj2Fzg+DNWk4rvjzaqXxXzQkza7f
 trVqqk2NEgM7m/1itMCTQBGxshw8cZDBOIbepmDxzC3ksSf30JAQ9cHhC A==;
X-CSE-ConnectionGUID: 3RRY98bwTWSZU5x+ikCpoQ==
X-CSE-MsgGUID: R3u6NkAfRP6I8S4Twk7Tmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2605967"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2605967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 16:16:11 -0800
X-CSE-ConnectionGUID: lYknd+cPTA+XrwLUDF53bw==
X-CSE-MsgGUID: tYQwEevpQbStgnmh1S2BUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6761942"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 16:16:11 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v4 4/7] drm/xe/oa: Skip OA HW teardown on a wedged device
Date: Wed,  4 Nov 2026 16:16:04 -0800
Message-ID: <20261105001559.3288915-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Closing a stream on a wedged device still disables the OA unit and
restores the OA HW state, including MMIO waits and batch submissions to
a device that may be unresponsive or, on a PCI error, disabled.

Skip that HW access when the device is wedged. This also skips the
forcewake put, which accesses the HW as well, leaking the forcewake
reference. That is fine, the device needs a reset or rebind to recover,
which reinitializes forcewake.
---
 drivers/gpu/drm/xe/xe_oa.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fabbbcf16f4e..7552ace821ca 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -43,6 +43,7 @@
 #include "xe_sriov.h"
 #include "xe_sync.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -875,6 +876,11 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
 }
 
+/*
+ * Also drops forcewake, which accesses the HW too. On a wedged device this is skipped and
+ * the forcewake reference leaks, which is fine: the device needs a reset or rebind to
+ * recover, which reinitializes forcewake.
+ */
 static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
 {
 	if (stream->sample)
@@ -907,7 +913,8 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	mutex_destroy(&stream->stream_lock);
 
-	xe_oa_stream_hw_teardown(stream);
+	if (!xe_wedged(stream->oa->xe))
+		xe_oa_stream_hw_teardown(stream);
 	xe_oa_stream_free_resources(stream);
 }
 
@@ -1705,7 +1712,8 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
 	xe_pm_runtime_get(gt_to_xe(stream->gt));
 
-	if (stream->enabled)
+	/* A wedged device may be unresponsive, skip HW access */
+	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
 		xe_oa_disable_locked(stream);
 
 	xe_oa_stream_destroy(stream);
-- 
2.55.0

