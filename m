Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98B606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPLrCwSe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4417210EF30;
	Mon, 23 Nov 2026 15:18:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAD310EF07
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795447061; x=1826983061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1lLNLNLDRxrtEHAX/SEIYh5Qy9FD9WJimfHGwpC9nW4=;
 b=mPLrCwSeePUZ5iPwgE5BVRnkjpjwToeaaFQAM4+w3cLZAP16EEnje84z
 SW9Fh+Kaun8PWrA9CSrcg2mZhl8YK32RnVal3cJDAyoGqYXRY16RKLsLm
 KPGvw163t6DznCX5P1ZyAk8JNvqNAK5nKSqAqDbFa2G1/irUp92sgHDpW
 ut1RreCAWKV31+T2Vs24l6LzoeYjywiFx+zXy0ozmswXF3foyA0+ohSAs
 2bBepQu1IXI6BQDp01AarOiClCtdSt3zkDaECY9oiMduw/IiVPVKLcFn1
 rcDIbbQcNSBJvVhDJhrjBwIxmMQnoFfoD6Ycnw9b5z97FboH6MaEUmfzE Q==;
X-CSE-ConnectionGUID: M4NMy2LVTkutb0ESZk3gwg==
X-CSE-MsgGUID: e60PG3q8T46X6qEWhCJFaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4283874"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4283874"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 07:17:41 -0800
X-CSE-ConnectionGUID: QjQqTATTRK2/q00T1KoJlA==
X-CSE-MsgGUID: n7xbxRGtQrCEzVU2ksz1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11580616"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 23 Nov 2026 07:17:40 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/ras: Distinguish between detailed and aggregate
 counters
Date: Mon, 23 Nov 2026 20:47:27 +0530
Message-ID: <20261123151727.2115677-1-raag.jadav@intel.com>
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
component. Also log the type of counter and info queue support for
easier debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Drop BUILD_BUG_ON() (Riana)
    Log info queue support
---
 drivers/gpu/drm/xe/xe_ras.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index b35c77caeaae..d5c15e17007a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -782,7 +782,9 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
 {
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
+	const struct xe_ras_error_product product = {0};
 	struct xe_ras_error_common *common;
+	bool detailed;
 	size_t rlen;
 	int ret;
 
@@ -807,9 +809,11 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
 		return -EBADMSG;
 
 	common = &response->counter.common;
+	detailed = memcmp(&response->counter.product, &product, sizeof(product));
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
-	       comp_to_str(common->component), sev_to_str(common->severity));
+	xe_dbg(xe, "[RAS]: get %s counter %u for %s %s %s info queue\n",
+	       detailed ? "detailed" : "aggregate", response->value, comp_to_str(common->component),
+	       sev_to_str(common->severity), response->has_info_queue ? "with" : "without");
 
 	return 0;
 }
-- 
2.43.0

