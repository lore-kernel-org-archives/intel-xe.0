Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F1606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XmIsOmyT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A4610F8F5;
	Wed,  4 Nov 2026 00:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8563410E4C7
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 00:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753557; x=1825289557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48D18ifHFde+TGBfNMlG9YZSkG9B8EZNVIkAXgBc9L4=;
 b=XmIsOmyTBbt8XBRX02Jp4OxmaGw1odmmDtKzSxHM5L3IkBupuSZlmbw6
 pMmy7r/7QBDSgIhKzJMziBgGt94VgDibHKRpanNw8BI7YYhRLBDimWc8p
 OQS2vB6F6TioOjHkxfp7ZOzfsbeOCEhwiuiSKA0SnY+sW/OFnF5PrmsXQ
 1GY8Gu7j5Brau6dWB9OqLirxc/mrvQn107zXuvMZbYc/8zpMnQFvABjsn
 tsg7cAiEHpVe66n9ymDv8EgnSFm1OFaYM+yKZMssu/7GbjcgzSnHjjNJc
 KszpMUhF2mj+a58lEcpjDML9P5vkfA98adP/tVDVRO5mQnQyujIv60R3x w==;
X-CSE-ConnectionGUID: mr4zgO66R/uwi8nsfMsfxA==
X-CSE-MsgGUID: HHnPI+uLSXe1yEA1sjn1Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2529525"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2529525"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:31 -0800
X-CSE-ConnectionGUID: xlQab3x9QcSTFI1/PpvySg==
X-CSE-MsgGUID: ql2Y1FKhRVW/XY8sGtCtJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6649328"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v3 2/5] drm/xe/oa: Split OA stream destroy into HW teardown
 and resource release
Date: Tue,  3 Nov 2026 16:52:24 -0800
Message-ID: <20261104005221.3230003-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
References: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
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

Split the body of xe_oa_stream_destroy() into xe_oa_stream_hw_teardown(),
which puts back the HW state (register whitelist, metric set) and drops
forcewake, and xe_oa_stream_free_resources(), which releases the SW
resources (kernel exec queue, OA buffer, runtime PM reference, configs,
xe file reference).

This lets a following patch release the stream resources without
touching the HW when the device is wedged.

The only change in behavior is that forcewake is now dropped before the
kernel exec queue and the OA buffer are released, neither of which
needs it.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 09043bc90de9..cc10403f51e0 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -875,33 +875,42 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
 }
 
-static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
+static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
 {
-	struct xe_oa_unit *u = stream->oa_unit;
-	struct xe_gt *gt = stream->hwe->gt;
-
-	if (WARN_ON(stream != u->exclusive_stream))
-		return;
-
-	WRITE_ONCE(u->exclusive_stream, NULL);
-
-	mutex_destroy(&stream->stream_lock);
-
 	if (stream->sample)
 		xe_reg_dewhitelist_oa_regs(stream->gt);
 
 	xe_oa_disable_metric_set(stream);
+	xe_force_wake_put(gt_to_fw(stream->hwe->gt), stream->fw_ref);
+}
+
+static void xe_oa_stream_free_resources(struct xe_oa_stream *stream)
+{
 	xe_exec_queue_put(stream->k_exec_q);
 
 	xe_oa_free_oa_buffer(stream);
 
-	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	xe_oa_free_configs(stream);
 	xe_file_put(stream->xef);
 }
 
+static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
+{
+	struct xe_oa_unit *u = stream->oa_unit;
+
+	if (WARN_ON(stream != u->exclusive_stream))
+		return;
+
+	WRITE_ONCE(u->exclusive_stream, NULL);
+
+	mutex_destroy(&stream->stream_lock);
+
+	xe_oa_stream_hw_teardown(stream);
+	xe_oa_stream_free_resources(stream);
+}
+
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
 	u32 vram = mert_wa_14026633728(stream) ?
-- 
2.55.0

