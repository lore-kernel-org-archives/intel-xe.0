Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532E5EC8743
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 15:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FB310E841;
	Thu,  7 Sep 2023 15:40:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7090810E7FF;
 Thu,  7 Sep 2023 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694101204; x=1725637204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0IvrU6G3MbD7LutKWjGiaAlR8TMQPtdz6/qjdb8DGpM=;
 b=h8qtS7Tvf+Wy9KKGDdik6gV+c8maQQe/HfR111MDNskoA+QFtpqhtX5w
 8esG3cOkVPmtr422bLNyGYAXcm/82/NLjkLQq5mg/C+9BwZJFoPmEXYHM
 esCc+C0XxwWcCKzftaWz2cbgAVGTzk8dh18VCETGPgdOMjWstK4AxT+Df
 uh/c4cakLb+1Ri/r1wjX08bxRq/b+SA/zOPKyPFRPwYYb37jClBChy7xz
 S5p8JQpXLa9QSgbayKbZym109zE8aQhyHSUHu2Hg3+RjtLNKDRti3/2yj
 IkkOwfKUCraE/rq87bU2d4snPQa/n84Ft9UTooU3XlmC2kV5AgnBQxw7q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362445753"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="362445753"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 08:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="1072930232"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="1072930232"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 08:38:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Thu,  7 Sep 2023 08:37:34 -0700
Message-Id: <20230907153757.2249452-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230907153757.2249452-1-lucas.demarchi@intel.com>
References: <20230907153757.2249452-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/27] drm/i915: Re-order if/else ladder in
 intel_detect_pch()
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Follow the convention of checking the last platform first and reword the
comment to convey there are more platforms than just DG1.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/soc/intel_pch.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/soc/intel_pch.c b/drivers/gpu/drm/i915/soc/intel_pch.c
index 19a8f27c404e..dfffdfa50b97 100644
--- a/drivers/gpu/drm/i915/soc/intel_pch.c
+++ b/drivers/gpu/drm/i915/soc/intel_pch.c
@@ -218,13 +218,16 @@ void intel_detect_pch(struct drm_i915_private *dev_priv)
 	unsigned short id;
 	enum intel_pch pch_type;
 
-	/* DG1 has south engine display on the same PCI device */
-	if (IS_DG1(dev_priv)) {
-		dev_priv->pch_type = PCH_DG1;
-		return;
-	} else if (IS_DG2(dev_priv)) {
+	/*
+	 * South display engine on the same PCI device: just assign the fake
+	 * PCH.
+	 */
+	if (IS_DG2(dev_priv)) {
 		dev_priv->pch_type = PCH_DG2;
 		return;
+	} else if (IS_DG1(dev_priv)) {
+		dev_priv->pch_type = PCH_DG1;
+		return;
 	}
 
 	/*
-- 
2.40.1

