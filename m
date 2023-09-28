Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65DACE7B11
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 09:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6010E5FD;
	Thu, 28 Sep 2023 09:28:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAE210E5FE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695893321; x=1727429321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dv2mLE2EDSKmNfh9BFnKL1wFXS2ts1KFCELbFLdN8Eg=;
 b=JvQ55LqKBSwDa6nmoLTuksJkdn9KVKxqx1H6LcvbAIP8Go81DELMojl4
 FyM0Gj11+DMZm12Wpx8hvRIoCKtQD+0VaEZCjklrqBRDPOclocSmvfR95
 BSUO9/7FoD9MibIUUPnijQnsH3A2YVP5tU8foj5ruDC+KmGalU5gh4iMR
 oMTUp8PUh2mOzqd7qr8OspCRIufEcXoMoL/IZH2ZLu2xvNON+iVei473g
 JPfeIcT5s7Wjp5vsjgDImleF9yMFh5Vmh1bOmR8wYxWf3aJvRlCD/3Fss
 YVtan8rcJldyns2Y8JFfAz3IOfBvFBEHJEgAN/VH1eOh5r7AOE7ntiaQD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448509985"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="448509985"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752900880"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="752900880"
Received: from nlesniak-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:28:18 +0100
Message-ID: <20230928092816.375130-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928092816.375130-7-matthew.auld@intel.com>
References: <20230928092816.375130-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/5] drm/xe/pat: trim the xelp PAT table
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

