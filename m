Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8A6E9270D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F2A88784;
	Thu,  5 Oct 2023 15:47:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D208410E02B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696520833; x=1728056833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ebvOZbh6GJRoIkQIqZQL1Rcdbxp0NyIx4gvMvnJta10=;
 b=di/qT41qCfVGZIAoKM2bC0Rr4ufhNxh4c5Wkb/Qi55/MuPyrxMQc27qJ
 SK/9VgP21PHyok0z1fZoYUC+KPsrs2EmukYyWRczG08Ayg3EbTZ9bXNNv
 k1/GLCrDXJ+Mha12EKKAqStxn9Ohj+SiPTNMrnj3v9Ljth1bsW7deISJY
 Wu44QuHOVvuFkh9a+698RGkjQtjtsrorOt+OjhBveQHd4RtQ8yjerjg/J
 j7z1AKxjslarehOhd7K0u66WVMXrilO0J1LuW5g5eJ2Mfa5pSgG0MT/Uk
 o8vbWp0qeQ81HKdjhu73DE7EWPipQRPYI3kF/tR+HP47qjDEETESuIyeL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414500636"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="414500636"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895486826"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="895486826"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:45:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:46:55 +0100
Message-ID: <20231005154653.466804-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005154653.466804-7-matthew.auld@intel.com>
References: <20231005154653.466804-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 1/5] drm/xe/pat: trim the xelp PAT table
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 869aee64641f..36b79d675e54 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -42,10 +42,6 @@ static const u32 xelp_pat_table[] = {
 	[1] = XELP_PAT_WC,
 	[2] = XELP_PAT_WT,
 	[3] = XELP_PAT_UC,
-	[4] = XELP_PAT_WB,
-	[5] = XELP_PAT_WB,
-	[6] = XELP_PAT_WB,
-	[7] = XELP_PAT_WB,
 };
 
 static const u32 xehpc_pat_table[] = {
-- 
2.41.0

