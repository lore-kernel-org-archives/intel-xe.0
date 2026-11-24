Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55443606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A6lLUGdq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1303410E8C1;
	Tue, 24 Nov 2026 20:36:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419A510E8C1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795552576; x=1827088576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ubuhNjS2cUpHHR/Q+qOopnmUsoEvEh5MC0XtivgkZ4=;
 b=A6lLUGdqTuY3u1N54rM5q+c+09B2W/DmSpdFKoFYHf6O1AUfQQourCMs
 3DXGmTFIj+jvXwY9IYLZQqm7LPRxMrj+gsYtT8vj7lFsrFejcylpv77VO
 U4a6nihwj9p/bje2QfnB0JrrDHWMDaEWM//ItmwXyyyZ7Q5yfQTQY92d5
 8R1Em+RIDtrPkDFxwL9FZGOOTh3lbmSNvujEezY7iUe0BKCNf4v0E70OJ
 GmboUUWK/m9IOS4KMsKm2tGYnhRL4EENnR6sgMM+LGnxnmzK0haLkXKQn
 ZN0OYqRd5cQw/CluCLZnu8WDEyYIkUYw0dpxiZjmO74Wou2r2Ucztj9cj A==;
X-CSE-ConnectionGUID: 5sC/LNWcRYyIS7NpdZsU+g==
X-CSE-MsgGUID: aqNNjX5aS5uzjho2GbdbQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4414823"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4414823"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:36:16 -0800
X-CSE-ConnectionGUID: unCN1LNWT0Kp7HE6DULmlQ==
X-CSE-MsgGUID: vPHyLq5jRfSnLsbFeW54iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="13450027"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:36:14 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v2 1/2] drm/xe/guc: Tear down exec queues on VF FLR prepare
Date: Tue, 24 Nov 2026 21:36:03 +0100
Message-ID: <20261124203604.467922-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124203604.467922-1-lukasz.laguna@intel.com>
References: <20261124203604.467922-1-lukasz.laguna@intel.com>
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

xe_guc_flr_prepare() returns early if the GuC firmware is not loadable.
This check excludes VFs, where the GuC firmware is preloaded by the PF,
so their exec queues would not be torn down during FLR preparation.
Check whether GuC submission is enabled instead. This is done only for
consistency, as it's currently always true.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f91b9ee75308..5df3bdd4f2c9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1761,7 +1761,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
  */
 void xe_guc_flr_prepare(struct xe_guc *guc)
 {
-	if (!xe_uc_fw_is_loadable(&guc->fw))
+	if (!xe_device_uc_enabled(guc_to_xe(guc)))
 		return;
 
 	xe_guc_submit_stop(guc);
-- 
2.43.0

