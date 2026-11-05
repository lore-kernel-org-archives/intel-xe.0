Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC132606A332
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyI1B1SJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780D111228F;
	Thu,  5 Nov 2026 09:17:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4FE11228A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793870256; x=1825406256;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mzTpLkHIjZrngrPLXcMGMr8HXcsArCMyUG+x78V+OAI=;
 b=EyI1B1SJQZlr5FaIWesZiJBL5NYkfR5tTSjL0MNu2hshNHXqFZwQ1sIs
 5RgKnBzZ5m7JTN+wq9mkBjK9ugeCBcrK1rq5fPmF13qvexjDhsRqsfA7g
 TI+3iie4A/Zd+GE8w1PcXsCLBTXU/wv+FJY9A1WuGV78HsTXKdra13aFq
 fg9RPCw2dJkkGDXH/2Xs2D6t6Nv+rgtXcu5irs/THfTJcS5QSG+jh5bIy
 5VtZC2sMpt0akl2JGikT1WfSOVONNwOpH8xU2sMwant3irbmtLj+Dkd7t
 /D/yHVWGG5CdqyEV/esBHj+BU753UwaLe7lpntlu9nn5WCsy8khiGdElh g==;
X-CSE-ConnectionGUID: 2rtD10U7ROabtCrwk/6Y7A==
X-CSE-MsgGUID: CHhNcNf9SN+W+DM4W639Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2534741"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2534741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 01:17:35 -0800
X-CSE-ConnectionGUID: GpvQQTOqQ/C7PLduHmjgNg==
X-CSE-MsgGUID: vde+gtT7SZyPT9CPDucv8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6972142"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 01:17:34 -0800
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3p_LPD DMC v2.44
Date: Thu,  5 Nov 2026 14:45:59 +0530
Message-ID: <20261105091559.1784255-1-dibin.moolakadan.subrahmanian@intel.com>
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

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 56e831b2a..864b41909 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -126,7 +126,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
+#define XE3P_LPD_DMC_PATH		"i915/xe3p_lpd_dmc_ver2_44.bin"
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
 #define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
-- 
2.43.0

