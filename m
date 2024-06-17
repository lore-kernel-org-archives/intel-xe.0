Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E700AC2BA18
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25D010E3FB;
	Mon, 17 Jun 2024 14:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncdajzbA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06F610E3FF
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718634883; x=1750170883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/qocnjEA7Fk30AvtpodqR2XJfF6qf6yrOTCdUThC4Lk=;
 b=ncdajzbA7eIXRC0DaEDLD7VMTt0MysC1oNmVhmnJqGKoy7JAe/bABjCc
 NR8+Hmidsxyu9jE0cLnyfzBvBlKEjmN7EZ5+W9JZ5bxiKPHiRBWhpdWjN
 QDmHjxgC3gWZmlTun04iZ1ifDyB0EvFsoBGPsij1agqIMv3ChzYSRfH+1
 woKpGfm8Rotjj6ApdRH+/3fBkYL2q5g8j1Lg594GG1haD0zPUCef1nsFz
 uMuftwbfT1Fpf4ELALbsPHfJIsemLeWeEBAws9lu62WP28LB0dY0ySKUn
 GrXKXTcK1v6YiIPXOZsmovuizlxJlRK3lJaAGGSqb0L2C4VupTpgey6KT g==;
X-CSE-ConnectionGUID: 8el2N5WqTsGwwZ+7hDwFaQ==
X-CSE-MsgGUID: 5BbPFkQqTW65BOigr3rnkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19247210"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="19247210"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:43 -0700
X-CSE-ConnectionGUID: Np4Yk8BdTC+IqNeExSTx3A==
X-CSE-MsgGUID: Z4nGdZtbQ+GXiBN9M4RBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45647257"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [RFC 2/3] drm/xe: Use new FW guard in xe_mocs.c
Date: Mon, 17 Jun 2024 16:34:29 +0200
Message-Id: <20240617143430.641-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240617143430.641-1-michal.wajdeczko@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
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

Start using new FW guard to minimize risk of leaking force-wake
references.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index de3f2d3f1b04..f863e149d61d 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -774,7 +774,6 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_mocs_info table;
 	unsigned int flags;
-	u32 ret;
 	struct xe_device *xe = gt_to_xe(gt);
 
 	flags = get_mocs_settings(xe, &table);
@@ -783,17 +782,10 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 		return;
 
 	xe_pm_runtime_get_noresume(xe);
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 
-	if (ret)
-		goto err_fw;
+	scoped_guard(xe_fw, gt_to_fw(gt), XE_FW_GT)
+		table.ops->dump(&table, flags, gt, p);
 
-	table.ops->dump(&table, flags, gt, p);
-
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-
-err_fw:
-	xe_assert(xe, !ret);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.43.0

