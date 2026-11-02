Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE058606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EOaMwxgM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A73110EC38;
	Mon,  2 Nov 2026 09:05:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC9E10EC38
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793610335; x=1825146335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tGg4UAbM6s40e3OihVtpz7ZwpIuryKSpXEIEvhB0E+4=;
 b=EOaMwxgMM3MvInGrZUW9upHLWbJEgrA2ta2dWgpYH7koZFdTHU/yZFZr
 Cwo0HKihTeE/gYtmQYqlaEaD/0uMbmi69RObM+k1bMbbvK3biR5kireQd
 353fGtLp4ZHwMuVhT68bJxbACgnf7z5D7nwLX6A/8U1O4QhlhQbhxzeqC
 E5c8O+b6l29MrDzICA+GCbRUqsXcBrJajYlDi8XHLssrk9IgwlCeJ/Wjr
 nGS2sVjOfLrXVWT6CjzB1IZXFBP6soigQnebUTSWLKqYKAnO4FdLg2vyz
 xd7rxBCvA/WOgZ9vzYnVfm1YmjMpYJdjjWv0tXY+BurHuJ6vca81gYJtA w==;
X-CSE-ConnectionGUID: aeTStZU4R/WD8yDz3KMRew==
X-CSE-MsgGUID: MVE0LOypRwa4rqEa4uGXqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2172783"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2172783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:05:35 -0800
X-CSE-ConnectionGUID: Hfbu+XfURc216xaChGioJQ==
X-CSE-MsgGUID: VQG+EPCMQlmb5PDMzYwy1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5922600"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 02 Nov 2026 01:05:34 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/ras: Distinguish between detailed and aggregate
 counters
Date: Mon,  2 Nov 2026 14:34:23 +0530
Message-ID: <20261102090424.987843-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_ras_get_counter_response() only logs counter value, severity and
component. Also log the type of counter for easier debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..381ea19a8b4a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -772,7 +772,9 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
 {
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
+	const struct xe_ras_error_product product = {0};
 	struct xe_ras_error_common *common;
+	bool detailed;
 	size_t rlen;
 	int ret;
 
@@ -798,8 +800,11 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
 
 	common = &response->counter.common;
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
-	       comp_to_str(common->component), sev_to_str(common->severity));
+	BUILD_BUG_ON(sizeof(*counter) != sizeof(counter->common) + sizeof(counter->product));
+	detailed = memcmp(&response->counter.product, &product, sizeof(product));
+
+	xe_dbg(xe, "[RAS]: get %s counter %u for %s %s\n", detailed ? "detailed" : "aggregate",
+	       response->value, comp_to_str(common->component), sev_to_str(common->severity));
 
 	return 0;
 }
-- 
2.43.0

