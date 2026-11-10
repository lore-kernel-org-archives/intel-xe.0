Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F36606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U7D70hoj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E3910EE7C;
	Tue, 10 Nov 2026 19:01:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABB710E952
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794337268; x=1825873268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ejPmAUsUImIuyyIdPLsvqLv6Kn9DqImqhFtZGTOBM4=;
 b=U7D70hojDgyG3qqYCBDUYlpljYSzW6TV9VOlzqiAyzl3zeaJ685o+6fi
 I1IBgOo2mtSxn9FwKGpUGNhBMvRoeriaYu/PgFLyEmSehnTHeSogmT8Nu
 BmCNKpkYIpQzqDgQ17h/OTCM//iKZGzRBXTCWUF/bwPDqQIZLwsrqaDEm
 asgWVktJ9DmU/+4X2aAgPlLrVBL/cNvBgmsJl+ZSeSs4qieh4gTBjyX/o
 e2tEwBelXJnp3FfnT4K4zEEtSEAoaSOc9ymoQzmCu1FTeeAwfaY0ortL5
 tEjMdVQNtz3CscwtRX6wnLlwVCzC78mVGw6v8iWzC2mIxhkTqHM9YTTGz Q==;
X-CSE-ConnectionGUID: es8ZoZlzSQ+PZ5ohVHnOdA==
X-CSE-MsgGUID: DOWwZe7GS2mtDmTNCAWvBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3116716"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3116716"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 11:01:00 -0800
X-CSE-ConnectionGUID: KD0fbKrmToKSicEyV+B7sg==
X-CSE-MsgGUID: U+U+4xTASFSPjnvwJMmxUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8300615"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 11:01:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v5 4/7] drm/xe/oa: Skip OA HW teardown on a wedged device
Date: Tue, 10 Nov 2026 11:00:57 -0800
Message-ID: <20261110190052.3514226-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
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

Closing a stream on a wedged device still disables the OA unit and
restores the OA HW state, including MMIO waits and batch submissions to
a device that may be unresponsive or, on a PCI error, disabled.

Skip that HW access when the device is wedged. The OA disable also
cancels the poll timer, so cancel it when destroying the stream instead,
so that it's never left armed on a freed stream.

Skipping the HW teardown also skips the forcewake put, which accesses
the HW as well, leaking the forcewake reference. That is fine, the
device needs a reset or rebind to recover, which reinitializes
forcewake.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3ddccc7e6f90..8a3e1ac2a068 100644
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
@@ -905,7 +911,12 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	mutex_destroy(&stream->stream_lock);
 
-	xe_oa_stream_hw_teardown(stream);
+	/* The poll timer may still be armed if the OA disable was skipped */
+	hrtimer_cancel(&stream->poll_check_timer);
+
+	if (!xe_wedged(stream->oa->xe))
+		xe_oa_stream_hw_teardown(stream);
+
 	xe_oa_free_oa_buffer(stream);
 	xe_oa_stream_free_resources(stream);
 }
@@ -1704,7 +1715,8 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
 	xe_pm_runtime_get(gt_to_xe(stream->gt));
 
-	if (stream->enabled)
+	/* A wedged device may be unresponsive, skip HW access */
+	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
 		xe_oa_disable_locked(stream);
 
 	xe_oa_stream_destroy(stream);
-- 
2.55.0

