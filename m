Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB95606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JEjdUz57
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D865D10E6B7;
	Wed, 28 Oct 2026 18:20:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D777C10E6E4
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793211601; x=1824747601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h06RAMQpql2FLQ1qEI9nSfq4XpmvY1n36w5xAKA0utw=;
 b=JEjdUz57F2Ou9+pLZE3aV4pdYHjFdu8qVrBoJUe/m4zFAgVlLJ16+Ajj
 ovmwtPgyrpAiSc72mQH4ozEc9aJnc2G2SuY6NEbZBw5aw/kpPTGWyjNFH
 crZssXzIABBQukZrSB2gN5pZIaEx8iyfsDGATJ+itCDnLpzMNHjVJ9omp
 Od9Q/e7WNOmyODnduMI9bAEQe7kVqtc4Z1FeJ/G/abrQBPndWI6JWb84x
 qhO5ci7qonyROtnrDpL8mrfd1gY6kVyfpYihA6Yzh+f+QVB3PXDqFkJUa
 vwSvmUuatDU9Q8FlGhbByzVXLjiqcDgEwuoTGFCj1NZ5TQTxzQdK4BXVz g==;
X-CSE-ConnectionGUID: zE4lzS5gRVm/K1fgaKOZDw==
X-CSE-MsgGUID: BXQ+vCwwS2WuVo6v/6VFCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1819240"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1819240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:20:00 -0700
X-CSE-ConnectionGUID: m2EQWCRgRUq4S7WBhCAv1Q==
X-CSE-MsgGUID: fnvYS8luQWu598P9nE0dyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5002977"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:19:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v5 1/5] drm/xe/xe_late_bind_fw: Fix firmware leak on missing
 manifest entry
Date: Wed, 28 Oct 2026 23:49:53 +0530
Message-ID: <20261028181951.1093283-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028181951.1093283-7-badal.nilawar@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release firmware when the "LTES" manifest entry is not found in the
firmware header.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..1bddfaf0fb9f 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -335,19 +335,19 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
 		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
 			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
-		release_firmware(fw);
-		return -ENODATA;
+		ret = -ENODATA;
+		goto release_fw;
 	}
 
 	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
 	if (ret)
-		return ret;
+		goto release_fw;
 
 	lb_fw->payload_size = fw->size;
 	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
 	if (!lb_fw->payload) {
-		release_firmware(fw);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto release_fw;
 	}
 
 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
@@ -356,10 +356,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		 lb_fw->version.hotfix, lb_fw->version.build);
 
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
-	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
 
-	return 0;
+release_fw:
+	release_firmware(fw);
+	return ret;
 }
 
 static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
-- 
2.56.0

