Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3AC606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PueUJ1aX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632D010E67A;
	Wed, 18 Nov 2026 02:52:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B5210E086
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 02:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794970317; x=1826506317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D6NWVdUEeZNM3gvGL0D6834oaCWVPfl53wCOEHgMNBU=;
 b=PueUJ1aXTinA0dQVTSb8JUWhaDp6pXsPdmNZS8Rlp/JtIiV3gOLJrmPd
 yniAOCt/tBXUrSwnxcsccVue7BYPN2cXPvEiwAUibHK/ClkCPEdulPFmW
 tgsE0aAYuXbN+6FoV4eY/AcyS6HfLcMXO5MTHXre8p7X+/hQr7FIghOoB
 UGAWiuX7NcZCwKzOFew7bPhRrkuFzFKvxAwFtVK89LxnH0ATt8utfsvkZ
 DbNiq3LIIq/MKJx92J1m8r3WV1EQPk6tzGKhLHekP0NbNp1HU9PfRco1b
 0XSYg32+f2tMTNOBeeHcp2W86PYRIRk4CgzHlXHV8vWZm6vrcDIfatqpI A==;
X-CSE-ConnectionGUID: 3vhclpZ7SnuVpnJXS1q/Qw==
X-CSE-MsgGUID: 0ZpgYVbkSECm5hPB/dRyAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3614553"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3614553"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:51 -0800
X-CSE-ConnectionGUID: yMnA7OGMSxCPPkCNrZPpOQ==
X-CSE-MsgGUID: UKa33S4oQkSfAAZJjC3enA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9888996"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:51 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: shekhar.chauhan@intel.com, harish.chegondi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v7 2/7] drm/xe/oa: Split OA stream destroy into HW teardown
 and resource release
Date: Tue, 17 Nov 2026 18:51:43 -0800
Message-ID: <20261118025140.3782678-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
References: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
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
resources (kernel exec queue, runtime PM reference, configs, xe file
reference). The OA buffer is released on its own, ahead of the other
resources.

This lets a following patch release the stream resources without
touching the HW when the device is wedged, and another one keep the OA
buffer until the stream fd is released.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7e3ebba0300d..b527c6258cd5 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -875,10 +875,28 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
 }
 
+static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
+{
+	if (stream->sample)
+		xe_reg_dewhitelist_oa_regs(stream->gt);
+
+	xe_oa_disable_metric_set(stream);
+	xe_force_wake_put(gt_to_fw(stream->hwe->gt), stream->fw_ref);
+}
+
+static void xe_oa_stream_free_resources(struct xe_oa_stream *stream)
+{
+	xe_exec_queue_put(stream->k_exec_q);
+
+	xe_pm_runtime_put(stream->oa->xe);
+
+	xe_oa_free_configs(stream);
+	xe_file_put(stream->xef);
+}
+
 static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 {
 	struct xe_oa_unit *u = stream->oa_unit;
-	struct xe_gt *gt = stream->hwe->gt;
 
 	if (WARN_ON(stream != u->exclusive_stream))
 		return;
@@ -887,19 +905,9 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	mutex_destroy(&stream->stream_lock);
 
-	if (stream->sample)
-		xe_reg_dewhitelist_oa_regs(stream->gt);
-
-	xe_oa_disable_metric_set(stream);
-	xe_exec_queue_put(stream->k_exec_q);
-
+	xe_oa_stream_hw_teardown(stream);
 	xe_oa_free_oa_buffer(stream);
-
-	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
-	xe_pm_runtime_put(stream->oa->xe);
-
-	xe_oa_free_configs(stream);
-	xe_file_put(stream->xef);
+	xe_oa_stream_free_resources(stream);
 }
 
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
-- 
2.55.0

