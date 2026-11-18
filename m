Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749ED60A2603
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSmysAly
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7ED10FF8D;
	Wed, 18 Nov 2026 19:06:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8F410FF8D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 19:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795028768; x=1826564768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=//woerBs10Z+5lrpjXaeWT7UvLfU/TmfkEN7oPRgkC0=;
 b=fSmysAlyG/E6i5v8S7DxWSxOOHCS1U6QYihAEcIIrVppDXbNtSun2UW6
 NLeX0tIrnV7YyFE2v4BUmcXy1+mP8j3/NxB5dbtUbrY+ZhSngG6QQnu0Q
 +kyXOR0wOUPdDawR6ft5FS43b6CLyqUfQt30EUgF1lzjL0oRaO663qtp+
 H0eCKZXk0Df7PPFCBYhzl1xfDjmsB2TYsLFbFULbfY7sT9n/I52GX17M0
 fex+xYUlixo38m7NUQQL/wpz5VpQ/67u4guez8bQQVFSsmMqNIsKmtDgR
 1sWPBxxlaXko2FsCQ3kv4WW6uzMCmeWWJwQXAGNqCeZIpD8UwIrjw7i7R w==;
X-CSE-ConnectionGUID: eoO+BXVqTA2/xpWTsGl/qw==
X-CSE-MsgGUID: OFxpHMGuRkijFFqxByPunQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3740893"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3740893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 11:06:08 -0800
X-CSE-ConnectionGUID: XWSjG/MXTFCmqWX088OyHQ==
X-CSE-MsgGUID: zkGEQuVMTEqjwxGvVe5Y7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10217526"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 11:06:05 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/survivability: Fix infinite loop in aux info traversal
Date: Thu, 19 Nov 2026 00:20:16 +0530
Message-ID: <20261118185015.3164387-2-sk.anirban@intel.com>
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

Stop traversing the aux info linked list when an entry references
itself, preventing an endless loop and soft lockup during probe.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 91a0680e449b..34d39e68ff36 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -172,8 +172,14 @@ static void populate_survivability_info(struct xe_device *xe)
 	if (reg_value & AUXINFO_SUPPORT) {
 		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
 		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
-		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
+		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id])) {
 			set_survivability_info(mmio, info, id);
+			if (REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]) == id) {
+				xe_warn(xe, "survivability: %s points to itself, stopping aux info walk\n",
+					reg_map[id]);
+				break;
+			}
+		}
 	}
 }
 
-- 
2.43.0

