Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447F6C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F241910E0B5;
	Tue, 15 Jul 2025 18:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSZa6f8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A529E10E0B5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603267; x=1784139267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+W+88RdYB5cD0GU2BHpDvSLezRVX7HWvwts/HibgD7A=;
 b=mSZa6f8FZoEj/0cO0UvjQxeVtrSSozzgkHl5WrkQbpyHjsDsTRg6rqtt
 GST0Fo2OCHfzVFOuT0euO2WoVVP75YvhYAjOUtb8ZWHyMXj6dy4DtGmBN
 xjszeWyvZS0A92xe3Ys7YG38Ji7NJikdy6obZjjZgzutiLOu1dsvCX1nd
 mdm5VLw8TzMHuiC3ynLXVZVvxOfnMXSl+/N5QR4RUeKdUviKyvE7roSxI
 JMJmtjaYE/iRo/KVKA14DWyzJXYQ3Fkiy5qeKV+NWLawgwg6AXGiDBVJP
 PrioJa5Wm7+eJFA+e8cIMjWdkhrWRE+Nc269zm1pcBLkED7LPBsfU3EE5 Q==;
X-CSE-ConnectionGUID: sAe8MoRxTfK349npaT8Owg==
X-CSE-MsgGUID: kGyZ4fy1TJCNS6Zl1pgb/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54542241"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54542241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:26 -0700
X-CSE-ConnectionGUID: 3Ce7S30DRp6Cr0kuz7eM8w==
X-CSE-MsgGUID: 0+6J27C5RdaoVUOlpY6IDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="188274108"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:27 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Fix static checker warning about null gt
Date: Tue, 15 Jul 2025 11:14:22 -0700
Message-ID: <20250715181422.2807624-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There is a static checker warning that gt returned by xe_device_get_gt can
be NULL and that is being dereferenced. Use xe_root_mmio_gt instead, which
is equivalent and cannot return a NULL gt 0.

Fixes: 10d42ef34bce ("drm/xe/oa: Assign hwe for OAM_SAG")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d991fbd90f201..5729e7d3e3356 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1941,7 +1941,7 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 
 	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
 	if (!param->oa_unit)
-		param->oa_unit = &xe_device_get_gt(oa->xe, 0)->oa.oa_unit[0];
+		param->oa_unit = &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];
 
 	/* When we have an exec_q, get hwe from the exec_q */
 	if (param->exec_q) {
-- 
2.48.1

