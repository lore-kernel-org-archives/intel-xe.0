Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0044606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LPqk+E8r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D8910E3C7;
	Thu, 22 Oct 2026 12:41:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276B1125D2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672870; x=1824208870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7fGlJkgPrP3DrduyqV2MlzU5DKEi9SjvCbgR99++MIA=;
 b=LPqk+E8r7E7pphXQ23JfMW0ONWowTGcqYfs9iUItXaIdZa23aE+933Iz
 Eq2wuWWZdboo+3IpQuftsA5e6ui6Cm+K8LpWUTh7O45vp8Hrw5DDmr0Fd
 Na44fNzHWh8tCLlejwjk4VnrqnndSCgPdEIDdNLtm6ATkMAew7Bc8AeVi
 hgxykMqEwemQCbAGaFyu7taivHmGWuJLlqglDY43L7//N8+CLRRDnNQHV
 ZzxZ92oexRq5zZOUHC1RZG7a0GK7rxzk/aUzGytaELlk5xRzMtktcM45+
 4Z64h+BAkIfbz+hTuBLvIxRHVKFyTdGkgFvzyhZ/86GPtxFxfM53nIe6d Q==;
X-CSE-ConnectionGUID: MUOwQ5EtQYm7YaIcrm7WeQ==
X-CSE-MsgGUID: FzkTzg1PRRWkuiDrvjqAmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1431139"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1431139"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:41:09 -0700
X-CSE-ConnectionGUID: oaVyJb5RQqGcdN/V5WPSuw==
X-CSE-MsgGUID: E/srr/zGSZa14bMn7IyrCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="5117700"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:41:07 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe: Enable CSC fault injection on CRI
Date: Thu, 22 Oct 2026 17:57:09 +0530
Message-ID: <20261022122708.625136-2-sk.anirban@intel.com>
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

Enable CSC fault-injection debugfs on CRI, in addition to Battlemage.
Preserve the SR-IOV VF exclusion.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 926020c7526e..31b71b34eade 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -50,7 +50,9 @@ DECLARE_FAULT_ATTR(inject_mempage_offline);
 
 static bool csc_hw_error_available(struct xe_device *xe)
 {
-	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
+	return !IS_SRIOV_VF(xe) &&
+		(xe->info.platform == XE_BATTLEMAGE ||
+		 xe->info.platform == XE_CRESCENTISLAND);
 }
 
 static bool is_crescent_island_pf(struct xe_device *xe)
-- 
2.43.0

