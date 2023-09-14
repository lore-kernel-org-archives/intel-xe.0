Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856A1EEAA51
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1E610E57E;
	Thu, 14 Sep 2023 15:37:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6171610E577
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705871; x=1726241871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79GPnM5XI+7FE1mDb26bfxX5dM7VoKqXFlhJMVrjlw4=;
 b=XJMdU4KaYymWfAvrZt5/bQHAlf4p1nACj77W4+vX4u7nesvy9jRNf+0V
 ddZEaBu/iI2SQC3IQ9poWQQFBAXHZm5pXt6GJ+dt9rjcCsoBPJ12q/M4U
 M8WsXslWx1302EXy7gpDmto1h9uSSg6dbWHxOeGQhna0f075XkvK9SSDq
 v8/JphYB+7TeZAXjX28kmi7dV8L2OwLtt+Z8BxZ4NpyOVDTcTfDgB2UMY
 qzAJp7Gx2lgyy1E7BNb/5Papll4xT6hInU7+O8cfq2YegV8K9E9ih61n+
 CB/EjZZ85xA0FzMBvwVs890oUllKygHSOdZUFeiMD274DyM1dhLmETEV6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376327331"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="376327331"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779686204"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779686204"
Received: from ohararox-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.126])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:32:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 16:31:16 +0100
Message-ID: <20230914153112.455547-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914153112.455547-8-matthew.auld@intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/6] drm/xe/pat: trim the tgl PAT table
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

