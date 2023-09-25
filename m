Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF04CE7A94
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 13:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705D110E258;
	Mon, 25 Sep 2023 13:21:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAA310E1C3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695648090; x=1727184090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/rkMY+NSOphito0OU/HWKD2oRdNP/Pn7Ij3Pkax59tQ=;
 b=JWZgJiF0hT7SOSZU28mAON5KOJ0SQKdUmmyHQ9Rb6/raIAYYJIhYf0i2
 9mbexTisFOKrerSc+jPHYTPjAdM2DAQ8EKiCIMCtDMMdRQZ+A3L9qhGsH
 ShsiId9YKJLzkUHaumYYxmH3sqp1ECUB7DqXHmQQrBKj80pDZuVN/rIKw
 U1rhWwnFH6SVIMR8RjEj1F77wMyZavRj4Nm/myHwfTayVlrjy3cYI2VO4
 Go0Zj3O897RvXu7D2C9etx4Z3ssV33/O9nbdTOd0ykNeTu7NzFEDOFX37
 5a4hH6/QbsBKBcRG/gWGjsZ7whzcsuqjc1m8YNY0+iYbx7tjvwkhAX2zd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378521511"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="378521511"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751679117"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="751679117"
Received: from ngorb-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.27.97])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 14:21:16 +0100
Message-ID: <20230925132113.59900-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925132113.59900-9-matthew.auld@intel.com>
References: <20230925132113.59900-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/7] drm/xe/pat: trim the tgl PAT table
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We don't seem to use the 4-7 pat indexes, even though they are defined
by the HW. In the next patch userspace will be able to directly set the
pat_index as part of vm_bind and we don't want to allow setting 4-7.
Simplest is to just ignore them here.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index aa2c5eb88266..fb490982fd99 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -38,10 +38,6 @@ static const u32 tgl_pat_table[] = {
 	[1] = TGL_PAT_WC,
 	[2] = TGL_PAT_WT,
 	[3] = TGL_PAT_UC,
-	[4] = TGL_PAT_WB,
-	[5] = TGL_PAT_WB,
-	[6] = TGL_PAT_WB,
-	[7] = TGL_PAT_WB,
 };
 
 static const u32 pvc_pat_table[] = {
-- 
2.41.0

