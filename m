Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4088CC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52AA89FCE;
	Wed, 26 Jun 2024 21:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czNv435U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF2110E1CC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719436386; x=1750972386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0oWH/ekH+7O+4As9TPlGj2FgXij4lsZ8AsuzXzI7zdM=;
 b=czNv435UxD2YIYSB5mGU5EcVQPEVMa1vyGfkM1fLy4wvZm0FBXPNegxt
 TEWod4qYenL1224+Pq0JOyI3wpro0Pqp+txemrLPOXd2NFQmoAxWXcB5g
 TZwvQ2Hu4P9xdVkCGExaa6b2i8pQcZ3gFxodgiBQiwed7+5Ru6rPPK/Za
 VD61ILzdRcNdR+JV4cc1ix3/GNKxoQZ2HfKoiFd0f1jcNvhYYNjmoyt1C
 83FS64m9nJrNFsOnRwu9xXhcD6LfW5Oii4U2u0XPKB9//ne2WNsTn8j0f
 MT6yCq4oolGSG9rAVwh4djfDrvTvFCvqYa2SCL5TYJRqPZOBXhJvCLM8x g==;
X-CSE-ConnectionGUID: h/bB6M36Rt2bLwrBwHAEyQ==
X-CSE-MsgGUID: uclHBOcXQCSpY70fSnmgcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34065970"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="34065970"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:13:05 -0700
X-CSE-ConnectionGUID: gcFGkTIuSTGVSvPV+Jsz1w==
X-CSE-MsgGUID: 2PrFK0cVQ9C5hzOoO70zNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="48590100"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:13:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/mocs: Check that MOCS table.ops is assigned
Date: Wed, 26 Jun 2024 14:12:57 -0700
Message-ID: <20240626211256.1620889-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.0
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

When MOCS debugfs dumping was added in commit 9fbd0adbcbe8
("drm/xe/mocs: Add debugfs node to dump mocs"), a sanity check was added
to xe_mocs_dump() to ensure table.ops->dump is not a NULL pointer.  The
more common programmer mistake when adding MOCS enablement for new
platforms is to simply forget to assign anything to table.ops
altogether.  Extend the check to also cover a NULL table.ops and add a
WARN() so that CI will help us catch these mistakes when new platforms
are enabled in the future.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index de3f2d3f1b04..d43900d351f1 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -779,7 +779,7 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	flags = get_mocs_settings(xe, &table);
 
-	if (!table.ops->dump)
+	if (xe_gt_WARN_ON(gt, !table.ops || !table.ops->dump))
 		return;
 
 	xe_pm_runtime_get_noresume(xe);
-- 
2.45.0

