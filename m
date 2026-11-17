Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB55606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 00:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PcPZUmO1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E347A10E4E9;
	Tue, 17 Nov 2026 00:28:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEB110EAB8
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 00:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794875312; x=1826411312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oSS1/8MfTcoAblUcziWotPhaazU0ZcNOtq0XOOjRjwI=;
 b=PcPZUmO1vaSDXubxL7fjle+UDb77WAd3AJ+2bHhzOIR4g8uJmzcW2eU0
 ZjALiWZE87jF3616gBiYPLmuyRcqKHBPnsSL2Mt8hNalIfxeVQf6KBVtf
 wbxquZlVFceyTXKgmtMqhe1VsvNuNqoGaK6nanGvtFDgqYIegh+h0+hYK
 xTzRslk62QYx/WO0nvs3x6kmNMufFWQKRxgTZHxLva6uruWdSwxTvMtG/
 ZTyb1pwv6gqpUyKpKuqiEtppmTX3y4t2S70+q6vQkonl9gmxvF5fs9uaW
 gik0m7CEgbUlRwsH69+dv56IlAPXekgnvXmmWAcvobZosnOZ81q1m94/G A==;
X-CSE-ConnectionGUID: PWAZAamlQPuqJhIqYMtVEQ==
X-CSE-MsgGUID: T7qhaqFEQaaH0EvCcSswQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3532377"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3532377"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:28:21 -0800
X-CSE-ConnectionGUID: FKF09ffuQK21kwVYJeB1tQ==
X-CSE-MsgGUID: yrGQyMLJSR6l2/6bWcTSFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; d="scan'208";a="10078972"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2026 16:28:21 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3 3/3] drm/xe/query: use delayed forcewake release for
 engine-cycle queries
Date: Tue, 17 Nov 2026 00:28:19 +0000
Message-ID: <20261117002819.535438-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117002819.535438-1-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261117002819.535438-1-zongyao.bai@intel.com>
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

Engine-cycle queries are issued repeatedly by profilers such as VTune and
PTI to correlate CPU and GPU timestamps, for example through Level Zero
zeDeviceGetGlobalTimestamps(). Each query wakes the engine forcewake
domain and puts it to sleep again, and waiting for both acknowledgments
dominates the latency.

Release the domain with xe_force_wake_put_delay() so that a burst of
queries reuses the awake domain instead of waking it again. Other forcewake
users keep releasing immediately.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..86c4e1dfc101 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -157,7 +157,7 @@ query_engine_cycles(struct xe_device *xe,
 
 	fw_domain = xe_hw_engine_to_fw_domain(hwe);
 
-	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
+	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
 		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
 			return -EIO;
 
-- 
2.43.0

