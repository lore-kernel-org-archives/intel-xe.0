Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7CC606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 22:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d89efz+I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D289910E97B;
	Tue, 10 Nov 2026 22:06:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B81010E97B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794348356; x=1825884356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oSS1/8MfTcoAblUcziWotPhaazU0ZcNOtq0XOOjRjwI=;
 b=d89efz+II+VOKBpVbnHflUPzUhymX38XeXznK/djc8uaXnvRJmaMnvd2
 puUa80iDXUPNbhxKBXuAG6/W2Plyp0yC1x3bTtldiZnf3I+AXmXSlBM7T
 8ezv5qOERl/jKutf3fkbaqRZFYQkwQNjKTJuA5XIPHMBDut5x1I+S+dB2
 7jmy1fECUhF8Z1X4pDzSm+Pia5+e2Ft30xJQZn3LHYSTrkWKVn+m1jMJ+
 Z3Obejrpl8pf7SM0SCSoo01YKGRO5Jt0nQZCGeX5Pq58s83+RFZMe1ftA
 du3sQwqv1k5vYgSNvp5UdKpf317pHyZG8mifaNoDSDAF4cx5YfNY/n1Ic A==;
X-CSE-ConnectionGUID: u7vc3XjYRR2ghCq2lMfEtA==
X-CSE-MsgGUID: ntPkT7qsQaaB8q5/4iyTvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3136978"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3136978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 14:05:45 -0800
X-CSE-ConnectionGUID: lo4+AkkzQK6ZRVsDcddTMg==
X-CSE-MsgGUID: DyHS2graRjOab1gQiqi0eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8692280"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2026 14:05:44 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, rodrigo.vivi@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v2 3/3] drm/xe/query: use delayed forcewake release for
 engine-cycle queries
Date: Tue, 10 Nov 2026 22:05:42 +0000
Message-ID: <20261110220542.432595-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110220542.432595-1-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261110220542.432595-1-zongyao.bai@intel.com>
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

